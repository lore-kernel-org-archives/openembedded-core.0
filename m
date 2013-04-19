Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UTDkE-0000ey-Qn
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 18:01:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2013 08:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,510,1363158000"; d="scan'208";a="321756835"
Received: from unknown (HELO [10.255.14.2]) ([10.255.14.2])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2013 08:43:26 -0700
Message-ID: <5171661E.7000805@linux.intel.com>
Date: Fri, 19 Apr 2013 08:43:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
References: <1366373271-19152-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <1366373271-19152-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: Upgrade to 1.6.1
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
X-List-Received-Date: Fri, 19 Apr 2013 16:01:14 -0000
X-List-Received-Date: Fri, 19 Apr 2013 16:01:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2013 05:07 AM, Emilia Ciobanu wrote:
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>

This update has already been offered up by Koen, I will be taking his 
version once we clear 1.4 from the table.

Very soon now.

Sau!

> ---
>   ...0001-configure-lower-automake-requirement.patch |   29 ++++++++++++++++++++
>   meta/recipes-multimedia/libpng/libpng_1.6.0.bb     |   20 --------------
>   meta/recipes-multimedia/libpng/libpng_1.6.1.bb     |   24 ++++++++++++++++
>   3 files changed, 53 insertions(+), 20 deletions(-)
>   create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
>   delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.0.bb
>   create mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.1.bb
>
> diff --git a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
> new file mode 100644
> index 0000000..34363dc
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
> @@ -0,0 +1,29 @@
> +From a4fd84bdc69e9929a1040f20ea291ee3115bf5b2 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Mon, 15 Apr 2013 11:16:20 +0200
> +Subject: [PATCH] configure: lower automake requirement
> +
> +We're not using parallel tests in OE-core yet
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +
> +Upstream-status: Inapropriate [OE specific build hack]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1745d31..7f015fe 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -27,7 +27,7 @@ AC_CONFIG_MACRO_DIR([scripts])
> + # dist-xz requires automake 1.11 or later
> + # 1.12.2 fixes a security issue in 1.11.2 and 1.12.1
> + # 1.13 is required for parallel tests
> +-AM_INIT_AUTOMAKE([1.13 foreign dist-xz color-tests silent-rules])
> ++AM_INIT_AUTOMAKE([1.12.2 foreign dist-xz color-tests silent-rules])
> + # The following line causes --disable-maintainer-mode to be the default to
> + # configure, this is necessary because libpng distributions cannot rely on the
> + # time stamps of the autotools generated files being correct
> +--
> +1.8.1.4
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> deleted file mode 100644
> index 951e34a..0000000
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "PNG Library"
> -DESCRIPTION = "PNG Library"
> -HOMEPAGE = "http://www.libpng.org/"
> -SECTION = "libs"
> -LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=03b8ec701cb796c0ec84af22f884edef \
> -                    file://png.h;beginline=207;endline=321;md5=e829cebefd08488ba5142ea5faea6821"
> -DEPENDS = "zlib"
> -PR = "r0"
> -LIBV = "16"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
> -          "
> -
> -SRC_URI[md5sum] = "3ee623b9a4d33bda7310a5124080b14d"
> -SRC_URI[sha256sum] = "5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
> -
> -inherit autotools binconfig pkgconfig
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.1.bb b/meta/recipes-multimedia/libpng/libpng_1.6.1.bb
> new file mode 100644
> index 0000000..a05e380
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "PNG Library"
> +DESCRIPTION = "PNG Library"
> +HOMEPAGE = "http://www.libpng.org/"
> +SECTION = "libs"
> +LICENSE = "Libpng"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8273188b2e21c831f5a09fd9285db62f \
> +                    file://png.h;beginline=207;endline=321;md5=de107fb61766e9d826943f3b6a354fc9 \
> +                   "
> +DEPENDS = "zlib"
> +PR = "r0"
> +LIBV = "16"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
> +           file://0001-configure-lower-automake-requirement.patch \
> +          "
> +
> +SRC_URI[md5sum] = "93fc0b0841ce2db0e6756673e22dafc3"
> +SRC_URI[sha256sum] = "5ef57f8b9ef591c8504e2a8f78d31779f0c8f2b34b34d01d533360d2483c8946"
> +
> +inherit autotools binconfig pkgconfig
> +
> +EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> +
> +BBCLASSEXTEND = "native nativesdk"
>


