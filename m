Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 427ED797B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 14:00:31 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id b19-v6so9725328qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LW7iGvRx1otXb0Dp1KyU8SIr6CWKGMFz/vgzakpNdjU=;
	b=DUxvByF26Ljfj6GW2M4rsJoVymhfMDVleYss/DEceSZheYx1+SXct9BLseCaDQ9eMr
	1Ax06//3PCcH9ZuAk2u7Je8oInvZPRFv4PsmyhZA+65O7HvLfhoqzyQVemuTG1TyV6CS
	9KWblZQnwLRoFkBePNOELRz6/3zapIcWsYwGouhx8qw+xFZiDvADUJcqXCChG8Cvyzfx
	jvXiOtqD0B2HF0Ev4g/645oB9Fp/HZ2JSswbDkHBHIgCKDCL8XAvih98GtHSZIcO/qc/
	JOr3YoXQV+/9L77AQ7U35Y73YdKjgE3rnqGBdaWJFjdMbYxq4Xml0mMKMyN+wkhlyZQZ
	qo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LW7iGvRx1otXb0Dp1KyU8SIr6CWKGMFz/vgzakpNdjU=;
	b=tXiXn9eUQojbyZRdsjGVhiva/p7vJe9cjsYuJyuYd9b5LJ/BQQUW69OU7h6gTXBNaM
	E6olFaBLcvKjY51UmmrXPi+AhYj41aFcmYtbtoygus4afQLrBy7/d206P1ILpltpyvRi
	x9kzkZLo1PEjy2coRjtzPrccnmhfOZ4AdPCjSjf1teOkF3hkApUz4sxkYJBwKrtu53Ea
	U2kkvufQI8j4EoXWQYdJT/wJA+rfJxQRbWQ42GF/dXxxgv+fWQrWkx7fvllEr2SbKhsF
	qyTDMaIeugczbybj5eLO8gClxhldbolQBn6O+2l5+skhWw9Z/s5y1X0zECu7+DqojfMZ
	ITzQ==
X-Gm-Message-State: APzg51DfZQghrUta6VYw3LsB/eBIPa6cTKcwZEt4hsDrCynQ13GSUYZB
	AuzBbJFnT8ofRQUJbKf3jw3TyM+gPQIJiVZclTE=
X-Google-Smtp-Source: ANB0VdaZkbeOniOnPHnvqD61BUxroRkq5CyIVldoH9IPgwDmTxr9La9v0M3ICsI8p+RiAXheyWqqzVtX+wPMO2sB0rA=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr6015258qkm.2.1536328831973; 
	Fri, 07 Sep 2018 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180907131347.19537-1-richard.purdie@linuxfoundation.org>
	<20180907131347.19537-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180907131347.19537-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2018 07:00:05 -0700
Message-ID: <CAMKF1sqDmHuAAnPUMp6GP7vCkqi+AjRQJ49YVsoeUTTYSgWRQg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] core-image-tiny-initramfs: Avoid parsing failures
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
X-List-Received-Date: Fri, 07 Sep 2018 14:00:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 7, 2018 at 6:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This variable is otherwise unset leading to missing dependency warnings. Give
> it the same default as used elsewhere in other recipes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> index d7f97f3a170..4f11b4a90dd 100644
> --- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
> @@ -5,6 +5,8 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
>  actually generate an image but rather generates boot and rootfs artifacts \
>  that can subsequently be picked up by external image generation tools such as wic."
>
> +VIRTUAL-RUNTIME_dev_manager ?= "udev"
> +

tiny image should prefer busybox-mdev I think

>  PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>
>  # Do not pollute the initrd image with rootfs features
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

