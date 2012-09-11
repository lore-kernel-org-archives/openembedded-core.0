Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBTNa-0002dk-Ey
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:32:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Sep 2012 09:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="191662255"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2012 09:19:15 -0700
Message-ID: <504F6482.8090701@linux.intel.com>
Date: Tue, 11 Sep 2012 09:19:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1347379806.git.sgw@linux.intel.com>
In-Reply-To: <cover.1347379806.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/13] Misc Fixes (cover only)
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
X-List-Received-Date: Tue, 11 Sep 2012 16:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 09:14 AM, Saul Wold wrote:
>
> The following changes since commit 48169c6bc44c546cecaa06207b6c36da558b81f7:
>
>    classes/packageinfo: use better method to check if package exists (2012-09-10 21:52:37 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
>
> Khem Raj (2):
>    gcc-4.7: Fix build for armv4/EABI and ppc/Os
>    gcc-4.7: Backport libgcc fixes to appease the new build sequence
>
> Mark Asselstine (1):
>    base-files: provide a mechanism to skip creation of the hostname file
>
> Mark Hatle (3):
>    image.bbclass: Enable the complementary install to be called w/
>      globbing params
>    package_rpm.bbclass: Avoid unnecessary installs in complementary pass
>    qt4: Update qt4.inc to remove staticdev deps in -dbg packages
>
> Matthew McClintock (1):
>    sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we
>      have items to check
>
Scratch this one, I missed the v2 posted while I was heads down prepping 
this!

Sau!

> Phil Blundell (3):
>    perl-native: PROVIDE libmodule-build-perl-native for consistency with
>      non-native perl
>    shadow: Fix various invalid assumptions about directory layout
>    shadow-native: Ensure that ${sbindir} and ${base_sbindir} are
>      respected
>
> Ross Burton (2):
>    webkit-gtk: work around Make bug by re-running make
>    telepathy-idle: fix parallel build
>
>   meta/classes/image.bbclass                         |    4 +-
>   meta/classes/package_rpm.bbclass                   |    9 ++-
>   .../build-fix-for-make-j-safety.patch              |   39 ++++++++
>   .../fix-svc-gtk-doc.h-target.patch                 |   24 +-----
>   .../telepathy/telepathy-idle_0.1.12.bb             |    5 +-
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |   14 ++--
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    6 +-
>   ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
>   ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 ++++++++++
>   .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 +++++++
>   .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72 +++++++++++++++
>   meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    3 +
>   .../shadow/shadow-native_4.1.4.3.bb                |   11 ++-
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   17 +++-
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++--
>   meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>   meta/recipes-qt/qt4/qt4.inc                        |    2 +-
>   meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb       |   22 +++++
>   21 files changed, 380 insertions(+), 55 deletions(-)
>   create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
>


