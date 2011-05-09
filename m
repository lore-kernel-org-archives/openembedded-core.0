Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJTB4-00008I-Bh
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:19:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2011 09:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="433042999"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 09:16:36 -0700
Message-ID: <4DC81364.1080604@linux.intel.com>
Date: Mon, 09 May 2011 09:16:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 00/10] gcc-4.6.0 related fixes & patch upstream status updates
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
X-List-Received-Date: Mon, 09 May 2011 16:19:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2011 08:36 PM, Nitin A Kamble wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> These are few commits for gcc 4.6.0&  patch upstream status.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: nitin/misc
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Thanks,
>      Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>
>
> Khem Raj (2):
>    gcc-4.6.0: Apply linaro patches
>    linux-yocto_git.bb: Backport upstream fix for gcc 4.6 compilation
>
> Nitin A Kamble (8):
>    libpcre: update upstream status for patches
>    patch-2.6.1: update patch upstream status
>    patch: update upstream status for patches
>    python-imaging: update upstream status for patches
>    subversion: update upstream status for patches
>    sat-solver: fix compilation issue with gcc 4.6.0
>    gcc-4.5.1: update upstream status of patches
>    binutils: update upstream status of patches
>
>   .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    2 +
>   .../binutils-2.21/binutils-2.19.1-ld-sysroot.patch |    2 +
>   .../binutils/binutils-2.21/binutils-poison.patch   |    2 +
>   .../binutils-uclibc-100-uclibc-conf.patch          |    2 +
>   .../gcc/gcc-4.5.1/100-uclibc-conf.patch            |    2 +
>   .../gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch |    2 +
>   .../gcc/gcc-4.5.1/200-uclibc-locale.patch          |    2 +
>   .../gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch    |    2 +
>   .../gcc-4.5.1/204-uclibc-locale-wchar_fix.patch    |    2 +
>   .../gcc/gcc-4.5.1/205-uclibc-locale-update.patch   |    2 +
>   .../gcc/gcc-4.5.1/301-missing-execinfo_h.patch     |    2 +
>   .../gcc/gcc-4.5.1/302-c99-snprintf.patch           |    2 +
>   .../gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch  |    2 +
>   .../gcc/gcc-4.5.1/304-index_macro.patch            |    2 +
>   .../gcc-4.5.1/305-libmudflap-susv3-legacy.patch    |    2 +
>   .../gcc/gcc-4.5.1/306-libstdc++-namespace.patch    |    2 +
>   .../gcc/gcc-4.5.1/307-locale_facets.patch          |    2 +
>   .../gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch |    2 +
>   .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |    2 +
>   .../gcc/gcc-4.5.1/740-sh-pr24836.patch             |    2 +
>   .../gcc/gcc-4.5.1/800-arm-bigendian.patch          |    2 +
>   .../gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch |    2 +
>   .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +
>   .../gcc/gcc-4.5.1/arm-nolibfloat.patch             |    2 +
>   .../gcc/gcc-4.5.1/arm-softfloat.patch              |    2 +
>   meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   51 ++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   63 ++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   32 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   28 +
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  653 ++++++++++++++++++++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  126 ++++
>   .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  177 ++++++
>   .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
>   .../patch/patch-2.6.1/global-reject-file.diff      |    2 +
>   meta/recipes-devtools/patch/patch/debian.patch     |    2 +
>   .../patch/patch/global-reject-file.diff            |    2 +
>   meta/recipes-devtools/patch/patch/install.patch    |    2 +
>   .../patch/patch/unified-reject-files.diff          |    2 +
>   .../python/python-imaging/path.patch               |    2 +
>   .../subversion/disable-revision-install.patch      |    2 +
>   .../subversion/subversion/libtool2.patch           |    2 +
>   .../subversion/subversion/neon-detection.patch     |    2 +
>   .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |  115 ++++
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |    5 +-
>   .../perf-tool-Fix-gcc-4.6.0-issues.patch           |  266 ++++++++
>   meta/recipes-kernel/linux/linux-yocto_git.bb       |    4 +-
>   .../libpcre/files/fix-pcre-name-collision.patch    |    1 +
>   .../recipes-support/libpcre/files/pcre-cross.patch |    2 +
>   49 files changed, 1602 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
>   create mode 100644 meta/recipes-extended/sat-solver/sat-solver/fix_gcc-4.6.0_compile_issue.patch
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
>
Merged in oe-core and Master

Thanks
	Sau!


