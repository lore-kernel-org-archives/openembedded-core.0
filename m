Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id D38ED789BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:23:27 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id q12-v6so1295910ual.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ioCq/3awSZn7Jt/CL51Zr3/BlJXR8wlmXxvw5JOljxc=;
	b=k61+4rLV7Qo+gyoIbAEQIdCX+7Mh6ENYjEV9NaIajRF+eg5hMoQ1zxwieYkGRYsN8g
	l5sxz2qrALRJWvlaNFlOWg+dwfsu7jpGOSolsWwzuK6k9mBuCh2DLB3j7z/gZWK0IX5z
	jGQ4zP2ZXdHyKXKh6YM3xZ62JqDV1XgGGUCH2yFOW841aSzUNiYbhl8zufrR4Zh4XNG9
	tiMCxq89G8xB3Q/FWy8zwXlCjVxjUodxKwzQXR8rnUXQxsS5BVCJphOKAByyfOZ7jBk6
	NmO6rREijmSWqM2xSfrsmU7VBgk6fEjfeATfs1/AbPiYRoRczK/16ztV7L70CxVMl6SM
	3IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ioCq/3awSZn7Jt/CL51Zr3/BlJXR8wlmXxvw5JOljxc=;
	b=HGWidJnCgzlS1PaDouJ5P1rm/WgymXhGGIITlv//1fCgm1p/8dkOgun8xNDltyTCLF
	EfmAEry1K6Je3xw9cpfG8c125firPPfEH5TQ7ReX7tadS0nQchly9WEPXSRHFKD9UlVC
	zdpFKCjcNRouY2HbVF5mIxTRjk8dz6j/8aRRvgcHlevjAeYfKZ9y+0rwD63+bGp8kXPU
	0EMHa7kaGuQiCmNAxYdPD4o3SRdaYFX7NzSAaQJy0IetOvNzHIN6RJujAC789cg/Nofl
	HQk+HJFnh5GUZ3iBppEAsziHmCyUwcxIPBP67ZgowoliNd4K8yl2dXmvmBobOiwmRhIR
	I9ZQ==
X-Gm-Message-State: AOUpUlEhB2Aoeee+ZIv0vMph96j6Asefbc1BqtR0LieBJDYy/VCScltg
	yQEKrwnfwl9S6iHqusKN7KNblWangEonLVBvLT4=
X-Google-Smtp-Source: AAOMgpfnGf1rcCQykzlbLrbpwVpj4D+TEJrQEXUMxVgFqZVGC/97BgMKGyjcTO1sFAf5dPOZT4jEstI2PVE1nxP7mr4=
X-Received: by 2002:a9f:33d8:: with SMTP id
	y24-v6mr1771353uab.164.1531851808498; 
	Tue, 17 Jul 2018 11:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180717163910.3196-1-ross.burton@intel.com>
	<20180717163910.3196-12-ross.burton@intel.com>
In-Reply-To: <20180717163910.3196-12-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jul 2018 11:23:02 -0700
Message-ID: <CAMKF1sq+kYj+hiPRRMbwZOR-Rr-MRmSM5aAoKUEWwiyROQPT3g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/15] harfbuzz: upgrade 1.7.5 -> 1.8.4
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
X-List-Received-Date: Tue, 17 Jul 2018 18:23:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 9:41 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb}              | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb} (86%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
> similarity index 86%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
> index 0a9b029461f..4d5964d6bb7 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
> @@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
>  DEPENDS = "glib-2.0 cairo fontconfig freetype"
>
>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
> -
> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> +SRC_URI[md5sum] = "f176eeda0a4e51a056d3ea6b9e65c27f"
> +SRC_URI[sha256sum] = "3c592f86fa0da69e2e0e98cae9f5d5b61def3bb7948aa00ca45748f27fa545fd"
>
>  inherit autotools pkgconfig lib_package gtk-doc
>
> @@ -30,6 +29,8 @@ EXTRA_OECONF = " \
>
>  PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>
> +LEAD_SONAME = "libharfbuzz.so"
> +

why is this needed in this version

>  FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
>  FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
>                         ${libdir}/libharfbuzz-icu.so \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

