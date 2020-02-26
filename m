Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEEA86154A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:01:12 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id by15so1318221qvb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ppN5tPM0uYRYNG7MsTPMO2zIPKi3TiLJbmH2bwIj5uw=;
	b=uGyN9sT/D5U5u6ZR/ZT/CCk2Vkj+e0N7IEZyZx6PnS39/0ON+I3/yXBHf7Auv0FqlR
	KyIR8t9KG/nCmHwV4bApofcFWPTYrK9qp51kH3XHX346OOCsbUIuZf/3zkyg4DrfYUML
	YtDJVqj0K/FqS355/+A/yfuhVuZxTJGN07OcY4svE1Ijw9RDVq3Ua3RGm42UjhMCY6Ai
	pEkWXB74+9OvlCgQoeMQXbseaE7gle5ImZxLt7kKu0/FJc55Kit4Qr+2GFgYz/kuxhE8
	u+yP7BT7vssVOAb7ozvgi0DWtnVko197MSq7CefVYd/0Jk00eg02YHGp9FI8GnQdrS7j
	AQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ppN5tPM0uYRYNG7MsTPMO2zIPKi3TiLJbmH2bwIj5uw=;
	b=sjkEt+Tqtydgpdca77OUzLL/N1DMaMVwQd2g/6csUjhg28pK51IESPW6R+sjv44wEs
	JqsboCMgosG0kyirD/3azQwoI99JEME9D5ILD5rLW9Ju1psASfR168evXtl3NpanxllJ
	S8I7yvgwHheZd3eIDRitxeXpSuPakV3NqKZaeM/AmzM0Kd5fSIBZFCrZc4W3fbSpFPwR
	66TNIoiR6JQrwGJoI0C8mugXccPanY28GdbfvZVmUAG9TCXZOE/lV5slBY8ETLPEVxyx
	7tunjpq0YInJLfZktd1bHUbuAL2LKHaKj7QKpCa/hLB4iTklO4SAj1oPW2aw8S4kCP8X
	CHQA==
X-Gm-Message-State: APjAAAWpt+vBzc+9ZXYrIiPQI7B1qeTcG/NX4D/eoS3b7ZsvJtDiQYtP
	mEYmoxwkgfCm4dM5qir8TNnl/Cj8vS6bDiqoXXEIQhBl
X-Google-Smtp-Source: APXvYqwqT4rinF9eBNiS+jVfJQTsIA/N7IibQNBJOgZSkWvug0f4bKEVn9VscAZcdSlm3WJtiYd4g5ZQXRwaIGsmMO4=
X-Received: by 2002:a05:6214:524:: with SMTP id x4mr5693815qvw.4.1582729273388;
	Wed, 26 Feb 2020 07:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-5-zboszor@pr.hu>
In-Reply-To: <20200226135716.49255-5-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 07:00:47 -0800
Message-ID: <CAMKF1soh5mSvuVC8zhven1QwAPPU7DqiOr2Gw8TB4wmW8K3cYw@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 5/5] mesa: Enforce TOOLCHAIN="gcc"
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
X-List-Received-Date: Wed, 26 Feb 2020 15:01:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 6:08 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>
> When meta-clang is used, for example to build chromium-x11 from
> meta-browser, a linker error occurs in Zeus.
>
> See: https://gitlab.freedesktop.org/mesa/mesa/issues/2533
>
> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 800e8813c7..b8f09a2ed3 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -24,6 +24,8 @@ PROVIDES =3D " \
>      virtual/mesa \
>      "
>
> +TOOLCHAIN =3D "gcc"

lets fix the linker error instead.

> +
>  inherit meson pkgconfig python3native gettext features_check
>
>  # Unset these to stop python trying to report the target Python setup
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

