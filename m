Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBrf-0005iy-Ir
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:38:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2012 15:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="225108903"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2012 15:25:42 -0700
Message-ID: <505CE965.7030609@linux.intel.com>
Date: Fri, 21 Sep 2012 15:25:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Opkg patch upstreaming and SIGSEGV fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 22:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 10:16 AM, Martin Jansa wrote:
> This depends on
> http://patchwork.openembedded.org/patch/36893/
> otherwise warning about missing SRC_URI entries will be shown
>
> The following changes since commit f06097f4581e4c728c2950a86e025384e4bdcdf0:
>
>    eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu (2012-09-18 07:44:13 -0700)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib jansa/opkg
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/opkg
>
> Martin Jansa (3):
>    opkg: replace local patches with git patches submitted upstream
>    opkg: add patch to fix SIGSEGV when printing status file
>    opkg-nogpg: drop SRCREV
>
>   meta/recipes-devtools/opkg/opkg-nogpg_svn.bb       |  2 -
>   .../0001-add-opkg_compare_versions-function.patch  | 51 ++++++++++++++
>   ...e-the-uname-gname-fields-when-extracting.patch} | 30 +++++---
>   ...ix-dependency-issues-for-preinst-scripts.patch} | 65 ++++++++++--------
>   ...nst-script-is-not-fatal-with-conf-offlin.patch} | 75 +++++++++++---------
>   ...ot-read-etc-opkg-.conf-if-f-is-specified.patch} | 11 ++-
>   ...tch => 0006-detect-circular-dependencies.patch} | 79 +++++++++++++---------
>   ...g-provides-even-when-oldpkg-provides-exis.patch | 46 +++++++++++++
>   meta/recipes-devtools/opkg/opkg/add_vercmp.patch   | 36 ----------
>   meta/recipes-devtools/opkg/opkg_svn.bb             | 15 ++--
>   10 files changed, 258 insertions(+), 152 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
>   rename meta/recipes-devtools/opkg/opkg/{add_uname_support.patch => 0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch} (71%)
>   rename meta/recipes-devtools/opkg/opkg/{fix_installorder.patch => 0003-Fix-dependency-issues-for-preinst-scripts.patch} (82%)
>   rename meta/recipes-devtools/opkg/opkg/{offline_postinstall.patch => 0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch} (52%)
>   rename meta/recipes-devtools/opkg/opkg/{conf_override.patch => 0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch} (91%)
>   rename meta/recipes-devtools/opkg/opkg/{track_parents.patch => 0006-detect-circular-dependencies.patch} (59%)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
>   delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch
>

Merged into OE-Core with v2 of 2/3

Thanks
	Sau!



