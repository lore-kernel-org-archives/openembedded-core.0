Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TsjUD-0007C1-5J
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 01:25:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Jan 2013 16:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,433,1355126400"; d="scan'208";a="189071403"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2013 16:10:16 -0800
Message-ID: <50ECB568.8060604@linux.intel.com>
Date: Tue, 08 Jan 2013 16:10:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1357504491-2878-1-git-send-email-cazfi74@gmail.com>
	<1357504491-2878-2-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357504491-2878-2-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] harfbuzz: add recipe, version 0.9.9
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
X-List-Received-Date: Wed, 09 Jan 2013 00:25:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2013 12:34 PM, Marko Lindqvist wrote:
> OpenType text shaping engine HarfBuzz is dependency of pango >= 1.32
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb |   27 ++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
> new file mode 100644
> index 0000000..da09be6
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.9.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Text shaping library"
> +DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
> +BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
> +
> +LICENSE = "Old-MIT | UCDN | ICU | HarfBuzz-old"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
> +                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
> +                    file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
> +                    file://src/hb-icu-le/license.html;md5=9136737088bbfbbf86d9a714da49fb89 \
> +                    file://src/hb-old/COPYING;md5=6e8442c12d498ce55cfe39fc60f97981 \
> +"
> +
> +SECTION = "libs"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "e901ffe556d706b7d43b272f83be7f09"
> +SRC_URI[sha256sum] = "3d8dd4ebbc38da011485ef181f8ff072b4b0d7e305bbda19b355f217d25169cf"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "icu glib-2.0"
We we also need libx11?  I am seeing a failure:
> | x86_64-linux-libtool: link: cannot find the library `/intel/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libX11.la' or unhandled argument `/intel/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libX11.la'
> | make[2]: *** [hb-view] Error 1

Notice this was the native version that failed.

Thanks
	Sau!





> +
> +BBCLASSEXTEND = "native"
>


