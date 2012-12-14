Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TjNZi-00087J-W0
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 06:12:48 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 20:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,277,1355126400"; d="scan'208";a="180760590"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.3])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2012 20:58:03 -0800
Message-ID: <50CAB1DB.3080001@linux.intel.com>
Date: Thu, 13 Dec 2012 20:58:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1355448493-18006-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1355448493-18006-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb: update to upstream version 7.5.1
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
X-List-Received-Date: Fri, 14 Dec 2012 05:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2012 05:28 PM, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc           |    4 ++--
>   ...canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} |    0
>   .../gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb}   |    0
>   .../gdb/{gdb_7.5.bb => gdb_7.5.1.bb}               |    0
>   meta/recipes-multimedia/libpng/libpng_1.2.50.bb    |   23 -------------------
>   meta/recipes-multimedia/libpng/libpng_1.5.13.bb    |   24 ++++++++++++++++++++
>   6 files changed, 26 insertions(+), 25 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.5.bb => gdb-cross-canadian_7.5.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.5.bb => gdb-cross_7.5.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb_7.5.bb => gdb_7.5.1.bb} (100%)
>   delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>   create mode 100644 meta/recipes-multimedia/libpng/libpng_1.5.13.bb
>
This patch includes libpng also, please seperate them out.

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index ea4098c..9eb6b60 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -22,8 +22,8 @@ inherit autotools
>
>   SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>             "
> -SRC_URI[md5sum] = "c9f5ed81008194f8f667f131234f3ef0"
> -SRC_URI[sha256sum] = "8dcf38dd04f7f031b51d0672050d6b14626302ddc24d74e486b4666335de2df3"
> +SRC_URI[md5sum] = "b1519bf899890d21d4774845a6e602fe"
> +SRC_URI[sha256sum] = "f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
>
>   export CC_FOR_BUILD = "${BUILD_CC}"
>   export CXX_FOR_BUILD = "${BUILD_CXX}"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.5.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.5.bb b/meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_7.5.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_7.5.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_7.5.bb b/meta/recipes-devtools/gdb/gdb_7.5.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_7.5.bb
> rename to meta/recipes-devtools/gdb/gdb_7.5.1.bb
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> deleted file mode 100644
> index 7015538..0000000
> --- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "PNG Library"
> -DESCRIPTION = "PNG Library"
> -HOMEPAGE = "http://www.libpng.org/"
> -SECTION = "libs"
> -LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
> -                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
> -DEPENDS = "zlib"
> -PR = "r0"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
> -
> -SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
> -SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
> -
> -inherit autotools binconfig pkgconfig
> -
> -PACKAGES =+ "${PN}12"
> -
> -FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
> -RPROVIDES_${PN}-dev += "${PN}12-dev"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
> new file mode 100644
> index 0000000..28220ad
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "PNG Library"
> +DESCRIPTION = "PNG Library"
> +HOMEPAGE = "http://www.libpng.org/"
> +SECTION = "libs"
> +LICENSE = "Libpng"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=00b5b35853278d508806c2e5860e82cb \
> +                    file://png.h;beginline=207;endline=321;md5=50e583fb60bb36f37ab5023b2a3715d1"
> +DEPENDS = "zlib"
> +PR = "r0"
> +LIBV = "15"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "0b607a685da977f1bfc96e1c47055183"
> +SRC_URI[sha256sum] = "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41588004b271257aee"
> +
> +inherit autotools binconfig pkgconfig
> +
> +PACKAGES =+ "${PN}${LIBV}"
> +
> +FILES_${PN}${LIBV} = "${libdir}/libpng${LIBV}${SOLIBS}"
> +RPROVIDES_${PN}-dev += "${PN}${LIBV}-dev"
> +
> +BBCLASSEXTEND = "native nativesdk"
>


