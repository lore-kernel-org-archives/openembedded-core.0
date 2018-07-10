Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2E78A7455E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 00:47:34 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id b14-v6so11489846vke.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yuzg4wBhdJbzWdHiwyxibp5YaU4YlgNK7jIQjePOMyo=;
	b=A8PmUMMbXZ92Efk+05J5Eiec1j9esbURFT3gOIOx2ixhANuNzOmjFXqsOryR0OizRe
	hvOzjVue93d2ChArAziGxgo3+cDBa63BeIvVGVyeroSsAT9j3rHok6NVE8mB9VI6eiH6
	jmqxz+widhl0Jugj3xZCunuKy3VyVdwFWv/mZA5paCzY5VV0/N2SOk/fME2kmlvV8QRm
	SURnWZVdsPQQkJ34GKm1xHwOFilRr6z9CZ2ZtYy8BeDNjrNwNd0Zgt7JvbEYbzvHEQpN
	QvMT9mo0pFgtO87i4wtPJRsRlduiepwku+1XtQbLNmAQNxmO+5e8QATIl8zBq0yH+FXj
	Lnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yuzg4wBhdJbzWdHiwyxibp5YaU4YlgNK7jIQjePOMyo=;
	b=kdsapGq4QJa1Vct5UBNaFWC36hcS0q+hWLA7mORgTFiY8HNiyTJ43oEOF+be2dcjfv
	tx9JBzwDcO/6TELYUIEeGwgJKFGLUPONot/CalBN9Ip5IhhG5vfB3kCh96ghCa9f26NW
	TbiWCuhCmbRcCLqr+OpEAl7fSz2inGkUOxXw5UTOIYhNxcjZ03heBrN0pKkkgVI5RxA1
	fSaI8OPxY0GMIxC13VNxTzcxoOEReuh4SDU3eYCEjq5Ou/xP3WMe4pP67PePSckgxZGP
	xn1sCa/sZLqSyZ1RXpZwZ/rT+XW0JsHEEdUPp/y3gFMkol+PubVRBzicFV7aCLWEPlJI
	T1vA==
X-Gm-Message-State: APt69E1KCa7kX0ddjQKDcOjxr9+L7fTkD+a8q9atbibxC/jbXIFcAKIT
	kVnqdw7jYjs9mv8ZKbUL2Vn1vx4RP7S+czQVliw=
X-Google-Smtp-Source: AAOMgpfy5onvwKAFHtlbIeWn8fIo9ZQeX4Wcvrgtqb6ZHkg7JZosEvRCxiXnk0yJhgcBYpbUoncxKAowf463HNptl/c=
X-Received: by 2002:a1f:3b43:: with SMTP id
	i64-v6mr12840791vka.2.1531183655021; 
	Mon, 09 Jul 2018 17:47:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 17:47:34 -0700 (PDT)
In-Reply-To: <20180710000608.18878-1-alistair.francis@wdc.com>
References: <20180710000608.18878-1-alistair.francis@wdc.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Jul 2018 17:47:34 -0700
Message-ID: <CAJ86T=Vd0KzB++uZJzcANeKkic+oAAtnJg8RQNWQ-x4pSROtbQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [meta] xorg-xserver: Enalbe systemd-logind is using systemd
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
X-List-Received-Date: Tue, 10 Jul 2018 00:47:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 9, 2018 at 5:06 PM, Alistair Francis
<alistair.francis@wdc.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This has been disable by default for some time, so a few comments to
justify why it should now be enabled would be helpful.

There are also two typos in the subject line (and a [meta] prefix
isn't required for patches submitted to oe-core).

> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 882897bd25..89318e53c5 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -123,7 +123,7 @@ OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
>  PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
> -                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
>  "
>
>  PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

