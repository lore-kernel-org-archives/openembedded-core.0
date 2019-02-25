Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D86747C81C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:02:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o10so2669281wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VRfzVlvEUd1KmGeMpPrqU03H4z1pKU+SAX9cCNzOwpo=;
	b=F9dMnvrbQxt05ZfWS2u0i75IwrBPoSg/y+jUbeti/Ye6ofY2aLb0PzjCX5jt1Jx2nV
	xkqPKMybDzgji1CV6DEOiA86BYaNWKpNbDNQJwjp+FI3KLzSkf9O6oDrmniJsNTMfT5Z
	j4OGtvD8Cc8wAPyMZ855/FqioMdxMhOeMUOG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VRfzVlvEUd1KmGeMpPrqU03H4z1pKU+SAX9cCNzOwpo=;
	b=XudX97VpoBQIqFD6ytIH39vvCf+4bXjtnsXry8cex7583rJf/gvsimYsKI05lLkeyd
	WfPxIQVyXpzXFwrHeVXtnB0tpil0sHvCnASFwpXw6WOLYQ8mbO/3pOAsOGUHmJYR9Qzb
	IYugDsbAonb33p0ISeCGMwCCAHtlgmr29dh5INXSeNNU9W9Xy1bhXfm2nvkSyPFhnUEP
	x2z8KSJGjXcFxb913vF0+hdSXGHYjnJ6riq5eXtbnMCg7IofWLZuNYrhHt/IM+5qlMPn
	SD4/ZWsQJ08rTWVb6pPs020umJiINHR/LlySikNjOXSAB1trcMgnLogCv2GJCXRHp/f/
	QVPw==
X-Gm-Message-State: AHQUAua5KpasyoOIfUrxapWqpIEJ+SMbjaLAo/XywClkvXA0ZAfQIZd1
	+g1dEw6wYajGuYSXZHUDbYTExA==
X-Google-Smtp-Source: AHgI3IZpWVP1kRzUjA59z8RVoPyvThpKfHoNkEzJHzXu64Bx0wlKuJKKhy3it51SAOGZmS8WNUrExQ==
X-Received: by 2002:a1c:e1c4:: with SMTP id y187mr10499125wmg.50.1551092556498;
	Mon, 25 Feb 2019 03:02:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u12sm8071813wrt.2.2019.02.25.03.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 03:02:35 -0800 (PST)
Message-ID: <3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 11:02:34 +0000
In-Reply-To: <296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 25 Feb 2019 11:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> Except for ming32/darwin, which do not support them.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index c127434b020..95e9e0ede77 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
>      fdt sdl kvm \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
>  "
> -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
>  
>  # Handle distros such as CentOS 5 32-bit that do not have kvm
> support
>  PACKAGECONFIG_class-native_remove = "${@'kvm' if not
> os.path.exists('/usr/include/linux/kvm.h') else ''}"
>  
> -# Disable kvm on targets that do not support it
> -PACKAGECONFIG_remove_darwin = "kvm"
> -PACKAGECONFIG_remove_mingw32 = "kvm"
> +# Disable kvm/virgl/mesa on targets that do not support it
> +PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> +PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"

Sorry, I just spotted this. Please don't use _remove in OE-Core. Can we
rearrange this so we don't need to use remove?

I appreciate there are other users that have crept in but I'd like to
see them gone too...

Cheers,

Richard



