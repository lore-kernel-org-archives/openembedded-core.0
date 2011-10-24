Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIKlu-0007mt-Jy for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:40:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODYxRq029037
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:34:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28282-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:34:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9ODYnWA029031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 14:34:50 +0100
Message-ID: <1319463290.25011.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 14:34:50 +0100
In-Reply-To: <d546fdc94cb627040c657facc23f00406967c838.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<d546fdc94cb627040c657facc23f00406967c838.1319394187.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 20/27] libtool: Upgrade from 2.4 -> 2.4.2
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
X-List-Received-Date: Mon, 24 Oct 2011 13:40:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Adjust prefix.patch and delete resolve-sysroot.patch
> since its already applied upstream
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 +++++++++---
>  meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ------
>  ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
>  ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
>  ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
>  meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++++++++++----------
>  .../libtool/libtool/resolve-sysroot.patch          |   42 ------------------
>  .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
>  8 files changed, 47 insertions(+), 88 deletions(-)
>  rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
>  rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
>  rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
>  rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
>  rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/libtool/libtool.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> similarity index 57%
> rename from meta/recipes-devtools/libtool/libtool.inc
> rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index ef9095b..1f652ef 100644
> --- a/meta/recipes-devtools/libtool/libtool.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -1,4 +1,3 @@
> -SUMMARY = "Generic library support script"

Why drop the SUMMARY field?

>  DESCRIPTION = "This is GNU libtool, a generic library support script. \
>  Libtool hides the complexity of generating special library types \
>  (such as shared libraries) behind a consistent interface."
> @@ -8,21 +7,36 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>      file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>  
> +INC_PR = "r0"
> +
>  SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://trailingslash.patch \
>             file://prefix-manpage-fix.patch \
>             file://rename-with-sysroot.patch \
> -           file://resolve-sysroot.patch \
>             file://use-sysroot-in-libpath.patch \
>             file://fix-final-rpath.patch \
>             file://avoid_absolute_paths_for_general_utils.patch \
> -           file://fix-rpath.patch "
> +           file://fix-rpath.patch \
> +          "
> +
> +SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
> +SRC_URI[sha256sum] = "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93648febf9afc38918"
>  
>  do_compile_prepend () {
> -	# Sometimes this file doesn't get rebuilt, force the issue
> -	rm -f ${S}/libltdl/config/ltmain.sh
> -	make libltdl/config/ltmain.sh
> +        # Sometimes this file doesn't get rebuilt, force the issue
> +        rm -f ${S}/libltdl/config/ltmain.sh
> +        make libltdl/config/ltmain.sh
>  }

Unintended indentation changes?

>  inherit autotools
>  EXTRA_AUTORECONF = "--exclude=libtoolize"
> +
> +DEPENDS = "libtool-native"
> +
> +PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
> +FILES_${PN} += "${datadir}/aclocal*"
> +FILES_libltdl = "${libdir}/libltdl.so.*"
> +FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
> +FILES_libltdl-dbg = "${libdir}/.debug/"
> +
> +EXTRA_OECONF = "--with-sysroot"
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.inc b/meta/recipes-devtools/libtool/libtool-2.4.inc
> deleted file mode 100644
> index e3d17b7..0000000
> --- a/meta/recipes-devtools/libtool/libtool-2.4.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require libtool.inc
> -DEPENDS = "libtool-native"
> -
> -PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
> -FILES_${PN} += "${datadir}/aclocal*"
> -FILES_libltdl = "${libdir}/libltdl.so.*"
> -FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
> -FILES_libltdl-dbg = "${libdir}/.debug/"
> -
> -SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
> -SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
> -
> -EXTRA_OECONF = "--with-sysroot"
> \ No newline at end of file
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> similarity index 98%
> rename from meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> rename to meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> index 6d512b1..b7fe851 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> @@ -1,6 +1,6 @@
>  require libtool-${PV}.inc
>  
> -PR = "r4"
> +PR = "${INC_PR}.0"
>  PACKAGES = ""
>  SRC_URI += "file://prefix.patch"

No mention of conversion to INC_PR in the commit message. I'm not sure
this is worth doing at this point considering the need to find a better
way to automate PR bumping.

Cheers,

Richard



