Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFSn-0003gY-Fp
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:17:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 12:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57382388"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 12:09:22 -0800
Message-ID: <4F15D572.5070907@linux.intel.com>
Date: Tue, 17 Jan 2012 12:09:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326445287-20422-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1326445287-20422-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] cairo 1.10.2: enable tee backend
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
X-List-Received-Date: Tue, 17 Jan 2012 20:17:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 01:01 AM, Koen Kooi wrote:
> This is needed for firefox:
>
> | checking CAIRO_LIBS... -lcairo -lpixman-1 -lfreetype -lfontconfig
> | checking for cairo-tee>= 1.10... Package cairo-tee was not found in the pkg-config search path. Perhaps you should add the directory containing `cairo-tee.pc' to the PKG_CONFIG_PATH environment variable No package 'cairo-tee' found
> | configure: error: Library requirements (cairo-tee>= 1.10) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-graphics/cairo/cairo.inc       |    4 +++-
>   meta/recipes-graphics/cairo/cairo_1.10.2.bb |    2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 5f8f7b6..31e2ec9 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -19,7 +19,9 @@ PACKAGECONFIG[gtk-directfb] = "--enable-directfb=yes,,directfb"
>
>   #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>   require cairo-fpu.inc
> -EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} "
> +EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
> +                 --enable-tee \
> +                "
>
>
>   inherit autotools pkgconfig
> diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> index 8202860..826681f 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
> @@ -2,7 +2,7 @@ require cairo.inc
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
>

Merged into OE-Core

Thanks
	Sau!


