Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id B9F3371E4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 00:04:12 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d5so7200360uag.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zTKl43zskqfsOUg4ZxIkqcyBgrAARJAnXbo35f52Z28=;
	b=nuRGMm/dFIvGw6Bx2rwVoSZZ/ShodFPmxIDRL/kA9bc3MKDOxHftXnt2ZIRuG6P7CK
	C4SAgUwyeX7WOg4uUFwqBwgQvWgym0yqluE8oMh1Fic7ROIkQbc2r7CPiYNo6s+RXkEM
	rb1I0NKmivVYmvuB42vx+U6VgF4mnEGDzJh7Zf9U0Bg8q/p3FhCXTQTppbu5u9vuccc7
	PoPmm6gWNSqMAvvtaaT3YM/KPknh/3gpMcr0yAANRubSs7p7gXjewK0/NcSbGfCTK1bo
	MCQN2r8LEHockOuPFbZ+L2W2ggegXcpuM9v4fSAmpABPkLSDhIJj6aBGhrXnp09JyUBT
	AFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zTKl43zskqfsOUg4ZxIkqcyBgrAARJAnXbo35f52Z28=;
	b=AEQQ8wEI23wOLzTKHluQ43upUUmdsF2wBD4WXHeke8JYvYx2XMzrLquDL6M9EG1bsl
	JYdZl9vAo1KitBhlRpzGJHgAh9W1qwRB/MGfvxxmWPLEbGLLob3m5o0ev/TdaDVP6Lzh
	EBuOLPGRA3hSEdAzSba/GXb0/OhGB5leNNJtPCcJIcOF6az4Zd6LaJJip+UT6rlC8IX9
	ZTu7gkWnTa+O01zQURgMI2FHvzNohBzwzQYw6JgEmlCwyJRQDyIOY1/dA5ijw21yB4Jn
	eNyqe5T1G1j8xOFEugoaHSvEsYRe0O36w7/yChVq9TG7vzyaq7xjq3J1DI9n5R9fAlQG
	+k0Q==
X-Gm-Message-State: AMke39mvRnrwc5iaANZif8EcXayGSCn05Q+Kvwg8CddkM3yuh3oWbLMZ/6j0wrrwf30f1f+kx31DKfxpbaXKdw==
X-Received: by 10.176.83.218 with SMTP id l26mr9092143uaa.69.1486944252375;
	Sun, 12 Feb 2017 16:04:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sun, 12 Feb 2017 16:03:42 -0800 (PST)
In-Reply-To: <20170212202035.26659-1-sarnold@vctlabs.com>
References: <20170212202035.26659-1-sarnold@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2017 16:03:42 -0800
Message-ID: <CAMKF1so-DwfWtRi-Bsod6CjTJ=iawGZocMk8_QOg3-cdFtunLQ@mail.gmail.com>
To: Stephen Arnold <sarnold@vctlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] gcc-6.2: Add fix for missing no-PIE flags
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
X-List-Received-Date: Mon, 13 Feb 2017 00:04:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 12, 2017 at 12:20 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
> From: Stephen Arnold <stephen.arnold42@gmail.com>
>
> Fixes build on hardened PAX host with gcc-5 (linker error on relocs).
> Completes no-PIE config by adding to ALL_* flags variables.
> Borrowed from Gentoo gcc patches, tested on 2 hardened amd64 hosts.
>
> Upstream-Status: Inappropriate [configuration]
>
> Commited by: Gentoo Toolchain Project <toolchain@gentoo.org>
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

the patch is ok but please add this patch header to the gcc patch
itself not to OE patch. Secondly, gitify the patch on top of gcc-6
e.g.

https://github.com/kraj/gcc/tree/oe/gcc-6-branch

> ---
>  meta/recipes-devtools/gcc/gcc-6.2.inc                   |  1 +
>  .../gcc/gcc-6.2/0054_all_nopie-all-flags.patch          | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
> index b118995e1d..1a50d3a0d4 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
> @@ -78,6 +78,7 @@ SRC_URI = "\
>             file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
>             file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
>             file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
> +           file://0054_all_nopie-all-flags.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = ""
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch
> new file mode 100644
> index 0000000000..0e103cb1ee
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.2/0054_all_nopie-all-flags.patch
> @@ -0,0 +1,17 @@
> +We need to pass NO_PIE_CFLAGS to ALL_* so gcc doesn't fail when
> +we compile it with older gcc and pie.
> +
> +--- a/gcc/Makefile.in  2015-06-25 19:18:12.000000000 +0200
> ++++ b/gcc/Makefile.in  2016-04-22 00:12:54.029178860 +0200
> +@@ -991,10 +991,10 @@ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@)
> + ALL_CPPFLAGS = $(INCLUDES) $(CPPFLAGS)
> +
> + # This is the variable to use when using $(COMPILER).
> +-ALL_COMPILERFLAGS = $(ALL_CXXFLAGS)
> ++ALL_COMPILERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
> +
> + # This is the variable to use when using $(LINKER).
> +-ALL_LINKERFLAGS = $(ALL_CXXFLAGS)
> ++ALL_LINKERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
> +
> + # Build and host support libraries.
> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

