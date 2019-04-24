Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0547D58A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:06:51 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id r18so14594311ioh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 04:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S7D8vD9DA9BxzcJDpR/9yDaSILqu5UJWZeY1L9MobwM=;
	b=s8tiCvpBKZW4VmvO8WSbaQTG+fzrMHB69w50zlfm3mGNC09QyvmaekUBGIDg4zzTup
	JqIG0rbWd5MQXDI08N1XHAEmAN7eA2HUIeUDKb0zskGG8ibnfglckHj6yr4eUI3wx0LX
	1ghQWmbfBWvac+eUIJPjygRKDDlV2RHdaeZLYgf5zvnqSCfww5tWpEOAxKYeHbBkvaz8
	eXGCg2sjbSUPxJAhlwSAHuDWI0BMje5oGvimVcOVEEGIZ8NpCBwjB6gkzNLoHBSYwDIu
	XIXjmktihgmQ0IRqUfn9wrScjrswM2w/rC2T98ULVosKxAINabXhx0T0DIKSYR3AxVfO
	rI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S7D8vD9DA9BxzcJDpR/9yDaSILqu5UJWZeY1L9MobwM=;
	b=umSlZQ/NTPWyLc7W70fDw1WJgCbSzJI3y2OsfShchZw9zGIlGMpybgBw7G5ezEl7uH
	y6HhKcGLn6gBM2K1SPmC48x3x4wcYBmEwa1S9siYVWYS5nv35Exqwd2van/jtdl2Huv2
	fK7ZmhUr3UyUTfAvijsXVDnvH1rkUcwSgdIJNiY6SbJh6DaFZ+Pktq169+c7GVF9kCdg
	dBMIGv2eA2OMoTL5SDTio7I9nJe6mP4xwfNXpQBamhFrBqbPx9ZrYD5bFynKQiIg85Eo
	QaarZ0UkrjM9NolF1XfdHayeRI6fGNYs8QfyCDP5jliZI6UofN9jcI/ipGzSnWn5e6G4
	B9EA==
X-Gm-Message-State: APjAAAUQlxP1/jpJQrUR2TD4tFYJav5+/aYfRe9deB4PyUWfBhffBti2
	iLwe79ICTgontquVJ/NDgGlGprIPY/trQ2r+iIk7+DfLNxc=
X-Google-Smtp-Source: APXvYqwhj9ky1/RjykEoVCJOqe1QImiACnIPN0n0/FHC/Wn6caXiIa3Q8uR/dtCTPd5i4VNRrQE2P9R3UAwQkYvgSmA=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr12465682iot.201.1556104012602; 
	Wed, 24 Apr 2019 04:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2019 12:06:40 +0100
Message-ID: <CAJTo0LZJFLLtO7ZEX7SBUpo4T-=pSE++gKFdAAaTsd5iTZYefg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa:upgrade 19.0.1 -> 19.0.2
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
X-List-Received-Date: Wed, 24 Apr 2019 11:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

How did you even test this?

ERROR: ParseError at
/home/ross/Yocto/poky/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb:1:
Could not include required file mesa_19.0.1.bb

Ross

On Wed, 24 Apr 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -Upgrade from mesa_19.0.1.bb to mesa_19.0.2.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} (85%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> similarity index 85%
> rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_19.0.2.bb
> index d90be8a074..e6646e8503 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
>  "
>
> -SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> -SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
> +SRC_URI[md5sum] = "7f84af1c3fe2078c35a7a991d1469921"
> +SRC_URI[sha256sum] = "1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

