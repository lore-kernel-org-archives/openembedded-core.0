Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 41CAB7C365
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 04:24:12 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g125so4720597qke.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 20:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PDPWipkj01doL7zrQ4nnToxCvj5oxAc06/xBujI9V/o=;
	b=Gylq4Fo5VZsGszshSuj+ldwH8owDOzawce78BNHtx01LxXcCQUlTNI7RzTJOmOgAIr
	g5Q3Fx2ywf8joAcmQ08LkERJsaJaDqpKUQI02HI8sERmhV4u2A3IrQS7cFzbxBwy1Pgm
	4BNm8R4vhWjyGHAT4pvOwBgV3DSRGh38YCY7SMhpAZdTx5nB9XJnJTTyCYEuZaP9M81V
	jei2hFXs2JfeGcd9ZZ2AK3WNbhizgeDN1O0/ARPj0z0sR+OSZjKrO0igq0bd+uLYtpDN
	uXY+y/uW1aLnsPs8h5tFd1Hp4as72lydZq1EMz9Bs2tatew1j2GsD3W2pPlxWQChIwE2
	LCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PDPWipkj01doL7zrQ4nnToxCvj5oxAc06/xBujI9V/o=;
	b=W16YZps5PTIwo1jChaCrXTBnic8lIKvJmLX7V0X3ViJbmA/bmxKyTe53tq6ifATJvI
	L4f0rjHAmy+AQoMrPybOtgeriVyUwlX0P62Fund6SKbyTd14rAidt3UHXZGpdoymBv12
	i7RKNCO6V/ZD4HPH26c6YNe2wyRxknTzCPGGFWHSbkOs4LFL9AgymEwFa64vYLCWcuBc
	7CLyGwYpRKuHPu2Sal0UYJ9z4RSj1xqUsC3U5KM8ILxuoPsdqyyoQsk7f3TpoWN5ANWK
	eTm+Ba40zYvjsZaX7CRQsfvsjp/WQZtRn3TVZu6IUTjunYoxCBUenfXDKDUYwTRakbpB
	cnDQ==
X-Gm-Message-State: AJcUukeWm9uHXLVr5c0bixLiYB+lIjxaqkakiDy5c0fpWZtOpkj6SeBS
	KUflybwe+CWNIqvqWUOcsjTDklhx+30JB7GQVNNh8JJF
X-Google-Smtp-Source: ALg8bN7DJOI/eixGhudJhrNUQv6hdY2ZSlVAX0xG+m9hYGAPGe44BsI3unwNDmX5sJ2D5CrryKqkzhElw4z6NqNugEo=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr8633293qke.2.1548390253699;
	Thu, 24 Jan 2019 20:24:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548313066.git.liezhi.yang@windriver.com>
	<a0d185da70165b9d7e8166bf7e6a1a7065045fea.1548313066.git.liezhi.yang@windriver.com>
In-Reply-To: <a0d185da70165b9d7e8166bf7e6a1a7065045fea.1548313066.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 23:23:47 -0500
Message-ID: <CAMKF1srfkqtzhsQ7OcPUQsOuf_bzA4V-AOrCWhRm2Ur=G1BO_w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gcc-runtime: Add --cache-file to EXTRA_OECONF
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
X-List-Received-Date: Fri, 25 Jan 2019 04:24:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 24, 2019 at 2:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> This can save configure time since it runs configure multiple times:
> $ time bitbake gcc-runtime -cconfigure
>   60s -> 54s
>
>   Saved 6s

looks ok. Are we sure this file is preserved across builds
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 50ecc81..3d03d8e 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -15,6 +15,7 @@ EXTRA_OECONF_PATHS = "\
>  "
>
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
> +EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
>
>  RUNTIMELIBITM = "libitm"
>  RUNTIMELIBITM_arc = ""
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

