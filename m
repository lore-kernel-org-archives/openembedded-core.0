Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D7A5F6FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 05:57:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y19-v6so6555063qto.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bPb+rVODtM3w1+LrZe7sfEYwqFlrho8UTmTzYc73FQc=;
	b=Bpmmu1T1zafktmHYOk7nqClLE9pU6cIt2TeYDf8f0iKIjsTWC/5EJSI+gj+BW4DKJQ
	arW84+XeQ26xpWDtP0qNiyG/xy3Z/GfhcrdjB/usO36DVOyWcGNlaAHl44JHHR8vk/cO
	S+vphyFK19/Wdh4aW4kFuvlSI7R7eeaq9+qlJkoloUFFC9ltNixgy68em5biZEB5EExP
	CDEFC/NFAvpSWhncuvasP+hcmqok8KCDttRPqlkEVxp9r+Oj+kW5ia/YwR4DB0U0rIZG
	FVE2Rx4w5oihBBVnLFFMKkfcG+EXxVQJv93oroNaGa4o/tFipDsfZdkza3ScbQ5bWIHZ
	EPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bPb+rVODtM3w1+LrZe7sfEYwqFlrho8UTmTzYc73FQc=;
	b=ASSr+lhQRo0topatO0njT9XltBGc7M04W82kHxslectID/QSBZ9DVkSjykKBVIckFx
	mPTXSYRFRnUSrZj8YWQ6/lgVZHVAUK8NzlWSD/nc6K+pAAokjeSKb0r55hraaAsWUmLn
	rE6K+Wq6dQyIkk5ZBG+PmTUjUYvM1eAtIawJlzXCHgpgdotblcQ8ht6Di8WaIU3nJpHr
	okKDAjsC2O/qFZk78CcBM4E4TnzDvSbIUvdtj1EgX8Lgn62RQ+NSa7BBU3bvIt4nKnOk
	hBayeLNkmpfCOj7y2BEu0ZzRV2l1v8rOrwHZJU/+5zQdfyPxYx8qmi8fuvn9aK0JvDrl
	UqBA==
X-Gm-Message-State: AOUpUlEbQjYEYNuCUcEN2fgiMEn0zQ/gRmb0+mhRlGGonT/Hg7lIDlQt
	VyE8OhqPK8cCScvj3GnKKDzoctiGR8tggUC4nXg=
X-Google-Smtp-Source: AAOMgpdRx6TmX8OaOQRgmPgFgbMlDUNLgAf+VsraFrZ99RojS1Ss2ei5R0SbvP5IN+9GCmX7r27i11/WB2hku0NsqcY=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr19542849qta.117.1532498231522; 
	Tue, 24 Jul 2018 22:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <1532488573-19987-1-git-send-email-christopher.w.clark@gmail.com>
In-Reply-To: <1532488573-19987-1-git-send-email-christopher.w.clark@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 22:56:45 -0700
Message-ID: <CAMKF1sr-j2=S1r37V8MaMX4E8KEvMwSrDoMJ0DfLAgvodSZa+w@mail.gmail.com>
To: christopher.w.clark@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils : enable production of EFI binaries on x86-64
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
X-List-Received-Date: Wed, 25 Jul 2018 05:57:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 8:16 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> When MACHINE_FEATURES includes "efi" and target is x86-64,
> enable the linker to produce Portable Executables: EFI binaries.
>
> Supplies "--enable-targets=x86_64-pep" in EXTRA_OECONF.
>
> Enables building the EFI variant of the Xen hypervisor.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 37813dd..eedcc7e 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -69,12 +69,15 @@ python do_package_prepend() {
>
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>
> +ENABLE_EFI_BINARIES_x86-64 = "--enable-targets=x86_64-pep"
> +



>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --disable-werror \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
>                  ${LDGOLD} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
> +                ${@bb.utils.contains('MACHINE_FEATURES', 'efi', '${ENABLE_EFI_BINARIES}', '', d)}"

I think we should avoid using machine features rather enable this
emulation unconditionally for efi enabled
targets, which for now are arm/x86/x86_64/aarch64

>
>  LDGOLD_class-native = ""
>  LDGOLD_class-crosssdk = ""
> --
> 2.7.4
>

