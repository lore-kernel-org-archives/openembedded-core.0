Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 940ED6025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:17:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6GGHBP3014672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 16 Jul 2018 17:17:12 +0100
Message-ID: <f44db656ae844fca53fedd6d2a10a503bf94d853.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:17:11 +0100
In-Reply-To: <20180716153005.16552-1-ross.burton@intel.com>
References: <20180716153005.16552-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] atk: add explicit gettext-native dependency
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
X-List-Received-Date: Mon, 16 Jul 2018 16:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-16 at 16:30 +0100, Ross Burton wrote:
> In native builds we attempt to turn off i18n but this doesn't work in
> Meson
> yet[1] but as the gettext class reduces dependencies in native builds
> we need to
> add gettext-native to DEPENDS explicitly.
> 
> [1] https://github.com/mesonbuild/meson/issues/821
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-
> support/atk/atk_2.28.1.bb
> index a051247d8ff..d64df37f5de 100644
> --- a/meta/recipes-support/atk/atk_2.28.1.bb
> +++ b/meta/recipes-support/atk/atk_2.28.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd00
> 2f49e7bb854063f7e7 \
>                      file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9
> b30f619ca8d819bc12d3 \
>                      file://atk/atk.h;endline=18;md5=fcd7710187e0eae4
> 85e356c30d1b0c3b"
>  
> -DEPENDS = "glib-2.0"
> +DEPENDS = "gettext-native glib-2.0"
>  
>  GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-
> introspection

Can you at least comment this in the hope we can eventually drop this
again please?

gettext-native is a huge pain dependency wise and slows down builds
significantly. Is there a way we could tweak meson to avoid this?

Cheers,

Richard


