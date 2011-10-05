Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBJOu-0002Aq-Te
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:48:13 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:42:37 -0700
Received: by eyb6 with SMTP id 6so1204554eyb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:42:35 -0700 (PDT)
Received: by 10.223.65.78 with SMTP id h14mr2893185fai.97.1317789755124;
	Tue, 04 Oct 2011 21:42:35 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id a7sm556422fam.22.2011.10.04.21.42.28
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:42:29 -0700 (PDT)
Message-ID: <4E8BE032.5050809@intel.com>
Date: Tue, 04 Oct 2011 21:42:26 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1317344910.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/4] Recipes upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 04:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2011 06:27 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 9d1db6cc928199f8ac4960e8d4648563ef141427:
>
>    python: fix sqlite RPATH issue (2011-09-29 16:57:30 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/upgrades
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
>
> Nitin A Kamble (4):
>    gdb: upgrade from 7.3a to 7.3.1
>    byacc: upgrade from 20101229 to 20110908
It appears that the above two upgrades were merged into OE-Core

>    python-dbus: upgrade from 0.83.2 to 0.84.0
>    python, python-native: upgrade from 2.6.6 to 2.7.2
>
Please respin the python* patches set and ensure you look at the other 
recipes depending on python, ensure a clean build on multiple arches works.

Thanks
	Sau!


>   meta/conf/distro/include/default-versions.inc      |    6 +-
>   meta/recipes-devtools/gdb/gdb-common.inc           |    4 +-
>   ...anadian_7.3a.bb =>  gdb-cross-canadian_7.3.1.bb} |    2 +-
>   .../gdb/{gdb-cross_7.3a.bb =>  gdb-cross_7.3.1.bb}  |    2 +-
>   .../gdb/{gdb_7.3a.bb =>  gdb_7.3.1.bb}              |    2 +-
>   ...on-2.6-manifest.inc =>  python-2.7-manifest.inc} |    0
>   ...python-dbus_0.83.2.bb =>  python-dbus_0.84.0.bb} |    4 +-
>   .../python/python-native/multilib.patch            |  240 ++++++++++++++++++++
>   .../python/python-native/nohostlibs.patch          |   36 ++-
>   ...thon-native_2.6.6.bb =>  python-native_2.7.2.bb} |   13 +-
>   meta/recipes-devtools/python/python.inc            |   16 +-
>   .../01-use-proper-tools-for-cross-build.patch      |  118 +++++++---
>   .../python/python/02-remove-test-for-cross.patch   |  108 ---------
>   .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
>   .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
>   meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
>   .../python/python/security_issue_2254_fix.patch    |  184 ---------------
>   .../python/{python_2.6.6.bb =>  python_2.7.2.bb}    |   10 +-
>   .../byacc/{byacc_20101229.bb =>  byacc_20110908.bb} |    4 +-
>   meta/site/arm-common                               |    3 +
>   meta/site/mips-common                              |    3 +
>   21 files changed, 476 insertions(+), 463 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.3a.bb =>  gdb-cross-canadian_7.3.1.bb} (83%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.3a.bb =>  gdb-cross_7.3.1.bb} (78%)
>   rename meta/recipes-devtools/gdb/{gdb_7.3a.bb =>  gdb_7.3.1.bb} (91%)
>   rename meta/recipes-devtools/python/{python-2.6-manifest.inc =>  python-2.7-manifest.inc} (100%)
>   rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb =>  python-dbus_0.84.0.bb} (83%)
>   create mode 100644 meta/recipes-devtools/python/python-native/multilib.patch
>   rename meta/recipes-devtools/python/{python-native_2.6.6.bb =>  python-native_2.7.2.bb} (74%)
>   delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
>   delete mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch
>   rename meta/recipes-devtools/python/{python_2.6.6.bb =>  python_2.7.2.bb} (92%)
>   rename meta/recipes-extended/byacc/{byacc_20101229.bb =>  byacc_20110908.bb} (49%)
>



