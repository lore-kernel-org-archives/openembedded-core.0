Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6436A59D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 03:58:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2013 20:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,805,1367996400"; d="scan'208";a="380506572"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2013 20:58:47 -0700
Message-ID: <51FC7FF7.1090304@linux.intel.com>
Date: Fri, 02 Aug 2013 20:58:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ionut Radu <ionutx.radu@intel.com>
References: <cover.1375457879.git.ionutx.radu@intel.com>
	<c9a41bb004c2b313f8dc4067b431da6f3c18f689.1375457879.git.ionutx.radu@intel.com>
In-Reply-To: <c9a41bb004c2b313f8dc4067b431da6f3c18f689.1375457879.git.ionutx.radu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] freetype: upgrade to 2.5.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Aug 2013 03:58:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2013 08:40 AM, Ionut Radu wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
> ---
>   .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb}         |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>   rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb} (90%)
>
> diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
> similarity index 90%
> rename from meta/recipes-graphics/freetype/freetype_2.4.12.bb
> rename to meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
> index 8cf79d3..d9f53ab 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
> @@ -13,13 +13,11 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
>
>   SECTION = "libs"
>
> -PR = "r0"
> -
>   SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>   "
>
> -SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
> -SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
> +SRC_URI[md5sum] = "c72e9010b1d986d556fc0b2b5fcbf31a"
> +SRC_URI[sha256sum] = "57bce5b37989577aa8b4a588426839f6bf39bcc3869748cb18f6827df251f4e5"
>
>   S = "${WORKDIR}/freetype-${PV}"
>
>
This seems to have a problem with the creation of the libfreetype.la, it 
includes the full sysroot path to the libpng16.la file in, instead of 
the short root relative path.

> | make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-poky-linux/directfb/1.6.1-r0.2/build/tools'
> | ../x86_64-poky-linux-libtool  --tag=CC   --mode=link x86_64-poky-linux-gcc  -m64 --sysroot=/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64 -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/freetype2  -I/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/libpng16  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-strict-aliasing -Werror-implicit-function-declaration -O2 -g2 -ffast-math -pipe -O2 -pipe -g -feliminate-unused-debug-types -D_GNU_SOURCE  -std=gnu99 -Werror-implicit-function-declaration  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lts -lm -o mkdgiff mkdgiff.o -lfreetype  ../lib/direct/libdirect.la -ldl -lrt -lpthread
> | x86_64-poky-linux-libtool: link: cannot find the library `/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libpng16.la' or unhandled argument `=/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libpng16.la'
> | make[2]: *** [mkdgiff] Error 1

This library should be with out the extra 
"srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux"

These three recipes have the same issue.

>   /srv/ssd/sgw/poky/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb, do_compile
>   /srv/ssd/sgw/poky/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb, do_compile
>   /srv/ssd/sgw/poky/meta/recipes-graphics/directfb/directfb_1.6.1.bb, do_compile

It may be due to the libtool.

Sau!


