Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABAB57CF8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 19:30:11 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id g187so395921vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nQfeE5TXt3NHLzQXFcNTP5qUXBIzEqsIt+ApixlbQu8=;
	b=qQozddfTDyaZrlZo87eYauEW5itSyBvkca1Vdy7kTZ/5HLYRH5N5PFsWL11tA13TgX
	+woL5S0aW/IEIxrkTVo3TmvXX7UMIkMuuHDSTyV/YdCHXrAxaI+HRYhyUN2p5o1jB5+/
	3mNIKfFNrBhkGBGI2ehQML5ysGfkONGYiwdv4fsmvmr82QaZe9/DzMd1gi907c+Sufp/
	Jx+yxYG0arj6MLnKaAiOSzC92pX2hF7wZEaFL5zqFZipIR8KeXLL2W64M2yl+qAKmoPC
	Ic1Lmfv7UxTpwdNtj676wCButDpXbCx7shPPy2pVjjzucpfUeQtt1HkW50uZ218t7qzS
	1TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nQfeE5TXt3NHLzQXFcNTP5qUXBIzEqsIt+ApixlbQu8=;
	b=jYHV9EuJFpiVUGhFoGX3JoM0Kl6DjoHFtR1yr7Mt+ZnGBkEALkHduyGOoXSLG+bUQq
	xWrsyfmVAiJ0XCMDq2lEsoKH9EUAyIptNVM1M8BfRFv112sxMImdHQxy7pJ+zSKwrjJn
	WF4HAFWUwAbaCoLODniBclcsKGmM+gu5rmtagA+igAsEkF67tRGu/7FXr6pFTyYFNR6+
	5TbnMFeM0iXdQc7uzUdKog8N/iTDkZqGzWpmLaVbJyIQVYizqiNzahjKMBMMMnQdbqe4
	SaAq+VV1yNFVi0OtlX+tIcZQO8QTmmRID3QcBm7XyVioklO6vPlAMPIVnDjh/mSDBMLO
	iqQQ==
X-Gm-Message-State: APjAAAWaWkeqY8j/uzZmPxvELvwdL34KQLNOIEa8eydTnU1zky+FMdGL
	OEKgJ1ItaNnWfsIhtes2jpN02VXMMmpJ97S3ktE=
X-Google-Smtp-Source: APXvYqzAMY9YdOOuRP5OKIRotcw0Qz378xi9/y48KfV0HP7SlZuk/XhaFqhRmMURVDjsnW3/a3ECUhHhizwt727zAtk=
X-Received: by 2002:a67:7a14:: with SMTP id v20mr3326671vsc.197.1553196612504; 
	Thu, 21 Mar 2019 12:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190319181544.314-1-luca.boccassi@gmail.com>
	<20190321183541.31260-1-luca.boccassi@gmail.com>
In-Reply-To: <20190321183541.31260-1-luca.boccassi@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 21 Mar 2019 19:30:01 +0000
Message-ID: <CAO5Uq5Q8APL0y3+VPt6Z2b=02ZdNkjUi9oG6gh-XS7gQOr_r0g@mail.gmail.com>
To: luca.boccassi@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: install dumpimage and fit_check_sign in u-boot-tools
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
X-List-Received-Date: Thu, 21 Mar 2019 19:30:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 21, 2019 at 6:36 PM <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Dumpimage and fit_check_sign can be used to extract kernel and ramdisk from
> a FIT file, verify them and kexec for a faster reboot.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v2: add dumpimage and fit_check_sign to FILES_${PN}-mkimage to fix build.
>     Not sure if it's preferable to do this or to add a new package, please
>     advise if the other is better.
>
>  meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> index ff26e32482..b72033a566 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
> @@ -45,11 +45,19 @@ do_install () {
>         # mkenvimage
>         install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
>         ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> +
> +       # dumpimage
> +       install -m 0755 tools/dumpimage ${D}${bindir}/uboot-dumpimage
> +       ln -sf uboot-dumpimage ${D}${bindir}/dumpimage
> +
> +       # fit_check_sign
> +       install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
> +       ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
>  }
>
>  ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN} = ""
> -FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage"
> +FILES_${PN}-mkimage = "${bindir}/uboot-mkimage ${bindir}/mkimage
> {bindir}/uboot-dumpimage ${bindir}/dumpimage

There's no $ here

> {bindir}/uboot-fit_check_sign ${bindir}/fit_check_sign"

or here

>  FILES_${PN}-mkenvimage = "${bindir}/uboot-mkenvimage ${bindir}/mkenvimage"
>
>  RDEPENDS_${PN}-mkimage += "dtc"

-- 
Alex Kiernan

