Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id B9BA57D486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:50:30 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id d24so12972617otl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GwfcUlzguj3RWXoYfRJIt0aoDMJl1gqH3cwmUYoK5L0=;
	b=fJXgN9qm4fuVpf1omQjzNGudgZ97NmB2jWoMsO2iB/eA2wuL8EqeRjqz4fxv78RFB+
	Np/J0w/mTfXUjRtc1aQTV5JcRxlf5tOp1uol2DqfJ3DDVcVm8OCNbooOM3YQ3siiLo2q
	sScbs+rHJxkea067xYjmgh5UCQC3oOxuDBHTIGcG+e8HonjdU5ts3oM6VvjQVTJvPo3b
	xZWZEHjmlC0KbPB1qw0sqHEIHLmwW4GgSCOEVPCUAZTXnZE9+RXmjMqbeoAFcnUQq0EB
	8OkV/BeiajBQtMBgTNYkL9vU1u/y6H1XSG4yV+d7N3DZnMkYHe9lqKM6Kb5R/ZY67ff5
	LnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GwfcUlzguj3RWXoYfRJIt0aoDMJl1gqH3cwmUYoK5L0=;
	b=aR4Agg3BXqa8KIbfWDZGi9zYmN6t5v+ctTVcC28efiyd0JoHoRfGn4EBBhcT53zwNI
	uOW7edwy2IyrrMCVCiJ4IPrnYJjfBhrAs03ROrIXEJ66hHuJMvBIWVl779nbblsH2amG
	SzoSn+ZrKdeEAwhaWPBMZ3PHRgiyg2tVvAYOWwRy/ybka//TjyOXEuEwMv53cVkdOjQc
	xt9Z0Ky9M+jtCI+pSqLz6KCLbnNTc6u2W3CCQxpx7Q2gujineuM7eRjLXWL2szLnC0dL
	yUnjOTLjSSbfUmjsleR1K+XbjtxdQknT+klVG8tpBviE925CAy2lP9ZM4F7nXB9DHw0P
	+3+A==
X-Gm-Message-State: APjAAAUJT3wgqtjuJ+onK4bPsToUKWnK2de3wrj7PNZn4VvSKlSiyyVA
	ipecj7Qh2R15w2FZz0h0mEMXpc226DFnJgCDPQSHDj3u
X-Google-Smtp-Source: APXvYqw5NLJ97/VVZm1ILQSTQZAJ4PvgNQrPxKrewlygXqml/XebMtqQeaJnGCFiDogREe1gPYgRz3WC4bs31/YpExc=
X-Received: by 2002:a05:6830:109:: with SMTP id
	i9mr19420647otp.96.1556103031692; 
	Wed, 24 Apr 2019 03:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 12:50:20 +0200
Message-ID: <CANNYZj-zezAQi6_NeVx0K5r=s7vLTn5q17SBkeSwQCHW8e8cNA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	Fabio Berton <fabio.berton@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 24 Apr 2019 10:50:31 -0000
Content-Type: text/plain; charset="UTF-8"

Fabio, can you bring back your meson migration patch please? Now is
the time to merge it.

Alex

On Wed, 24 Apr 2019 at 09:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
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

