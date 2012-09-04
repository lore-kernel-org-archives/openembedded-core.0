Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8ua9-0003Kq-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 16:58:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2012 07:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217917221"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2012 07:46:02 -0700
Message-ID: <5046142A.6060607@linux.intel.com>
Date: Tue, 04 Sep 2012 07:46:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Tue, 04 Sep 2012 14:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 08:53 AM, Ross Burton wrote:
> EXA is used by some Xorg video drivers, it doesn't need to be shipped unless
> it's being used.  Note that it's dynamically loaded so the automatic library
> dependencies won't catch this, but as far as I'm aware nothing on oe-core or
> meta-oe is using EXA.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    2 +-
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 017ac91..b588c11 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r4"
> +PR = "r5"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 98f3d14..738ccb3 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -29,6 +29,7 @@ DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
>   # Split out some modules and extensions from the main package
>   # These aren't needed for basic operations and only take up space:
>   #  32.0k   libdri.soOn 08/29/2012 08:53 AM, Ross Burton wrote:> EXA is used by some Xorg video drivers, it doesn't need to be shipped unless
> it's being used.  Note that it's dynamically loaded so the automatic library
> dependencies won't catch this, but as far as I'm aware nothing on oe-core or
> meta-oe is using EXA.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    2 +-
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 017ac91..b588c11 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r4"
> +PR = "r5"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 98f3d14..738ccb3 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -29,6 +29,7 @@ DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
>   # Split out some modules and extensions from the main package
>   # These aren't needed for basic operations and only take up space:
>   #  32.0k   libdri.so
> +#  91.0k   libexa.so
>   #  336.0k  libglx.so
>   #  1360k   libint10.so
>   #  180.0k  libwfb.so
> @@ -58,6 +59,7 @@ PACKAGES =+ "${PN}-security-policy \
>                ${PN}-module-libwfb  \
>                ${PN}-module-libmfb \
>                ${PN}-module-libcfb \
> +             ${PN}-module-exa \
>                ${PN}-module-xaa \
>                ${PN}-module-libxf1bpp \
>                ${PN}-module-libxf4bpp"
> @@ -91,6 +93,7 @@ FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
>   FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
>   FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
>   FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
> +FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
>   FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
>   FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>   FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
>
> +#  91.0k   libexa.so
>   #  336.0k  libglx.so
>   #  1360k   libint10.so
>   #  180.0k  libwfb.so
> @@ -58,6 +59,7 @@ PACKAGES =+ "${PN}-security-policy \
>                ${PN}-module-libwfb  \On 08/29/2012 08:53 AM, Ross Burton wrote:> EXA is used by some Xorg video drivers, it doesn't need to be shipped unless
> it's being used.  Note that it's dynamically loaded so the automatic library
> dependencies won't catch this, but as far as I'm aware nothing on oe-core or
> meta-oe is using EXA.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    2 +-
>   meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc |    3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 017ac91..b588c11 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r4"
> +PR = "r5"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> index 98f3d14..738ccb3 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
> @@ -29,6 +29,7 @@ DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
>   # Split out some modules and extensions from the main package
>   # These aren't needed for basic operations and only take up space:
>   #  32.0k   libdri.so
> +#  91.0k   libexa.so
>   #  336.0k  libglx.so
>   #  1360k   libint10.so
>   #  180.0k  libwfb.so
> @@ -58,6 +59,7 @@ PACKAGES =+ "${PN}-security-policy \
>                ${PN}-module-libwfb  \
>                ${PN}-module-libmfb \
>                ${PN}-module-libcfb \
> +             ${PN}-module-exa \
>                ${PN}-module-xaa \
>                ${PN}-module-libxf1bpp \
>                ${PN}-module-libxf4bpp"
> @@ -91,6 +93,7 @@ FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
>   FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
>   FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
>   FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
> +FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
>   FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
>   FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>   FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
>
>                ${PN}-module-libmfb \
>                ${PN}-module-libcfb \
> +             ${PN}-module-exa \
>                ${PN}-module-xaa \
>                ${PN}-module-libxf1bpp \
>                ${PN}-module-libxf4bpp"
> @@ -91,6 +93,7 @@ FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
>   FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
>   FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
>   FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
> +FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
>   FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
>   FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>   FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
>
Merged into OE-Core

Thanks
	Sau!



