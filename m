Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWEQ3-0007us-1h
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 22:43:51 +0100
Received: by iahk25 with SMTP id k25so3068260iah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HmplU9muWMrPhPqFH0c03GyQAG2NigJ0BNOx9JiOR1Q=;
	b=AyZDiglkeLyx6j7L6ZLI9EVA+bkEjnpusXauUj8jx6CjkQjTv/IDn3FiWmTiOns8BI
	hjiThHuKY3/akAvgIsDyo87s96EaBtHQUvTa8ndJLFJ8vPffdcGTiJHf5Dto+9Yz79/n
	Ko+6bBvS/rLdai1iUg1IfZmFuJfCxoznYF9e8=
Received: by 10.43.132.201 with SMTP id hv9mr10165512icc.42.1322775428641;
	Thu, 01 Dec 2011 13:37:08 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wo4sm13925033igc.5.2011.12.01.13.37.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 13:37:06 -0800 (PST)
Date: Thu, 1 Dec 2011 13:45:13 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201214513.GA9685@sakrah.homelinux.org>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/4] binutils: upgrade from 2.21.1a to 2.22
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
X-List-Received-Date: Thu, 01 Dec 2011 21:43:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/11/11 16:36), nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> And rebase the patches to the newer source code
> 
> This patch is upstream hence deleting it from the recipe.
> 	binutils/110-arm-eabi-conf.patch
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  ..._2.21.1a.bb => binutils-cross-canadian_2.22.bb} |    2 +-
>  ...ils-cross_2.21.1a.bb => binutils-cross_2.22.bb} |    0
>  ...osssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} |    2 +-
>  .../binutils/binutils/110-arm-eabi-conf.patch      |   24 -
>  .../binutils/binutils-2.19.1-ld-sysroot.patch      |   10 +-
>  .../binutils/binutils/binutils-poison.patch        |   84 ++-
>  .../binutils/binutils/binutils-powerpc-e5500.patch |   52 +-
>  .../binutils/binutils-uclibc-100-uclibc-conf.patch |   40 +-
>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |   16 +-
>  ...binutils-uclibc-300-006_better_file_error.patch |    9 +-
>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |   12 +-
>  .../binutils/binutils-uclibc-gas-needs-libm.patch  |   11 +-
>  .../binutils/binutils-x86_64_i386_biarch.patch     |   10 +-
>  .../binutils/binutils/clone-shadow.patch           |   18 +-
>  .../binutils/binutils/libiberty_path_fix.patch     |    8 +-
>  .../binutils/binutils/libtool-2.4-update.patch     |  803 ++++++++++----------
>  .../binutils/binutils/libtool-rpath-fix.patch      |   11 +-
>  .../{binutils_2.21.1a.bb => binutils_2.22.bb}      |    7 +-
>  19 files changed, 543 insertions(+), 578 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1a.bb => binutils-cross-canadian_2.22.bb} (86%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1a.bb => binutils-cross_2.22.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} (96%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.21.1a.bb => binutils_2.22.bb} (84%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index ed722be..c22e7dc 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  
>  GCCVERSION ?= "4.6%"
>  SDKGCCVERSION ?= "4.6%"
> -BINUVERSION ?= "2.21.1a"
> +BINUVERSION ?= "2.22"
>  EGLIBCVERSION ?= "2.13"
>  UCLIBCVERSION ?= "0.9.32"
>  LINUXLIBCVERSION ?= "3.1"


What changes does 2.22 bring in, it would be nice to have a little
summary e.g.

http://cygwin.com/ml/binutils/2011-08/msg00129.html

changes default behaviour of linker which needs some mention in such
upgrades since it will bite many packages which dont have proper
dependencies specified.

And I think it would be better to leave the older release recipes in for a while
for at least toolchain components while the new versions gets soaked
in. Given now we have layers its better that way to give some time for
other layers also to test the new version

Thanks

-Khem



