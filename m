Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.10057.1611055283119266013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 03:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d8LedmTl;
 spf=pass (domain: konsulko.com, ip: 209.85.167.170, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f170.google.com with SMTP id 15so20769849oix.8
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 03:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akp80Qy1dUIye+z29+uyvBWiT5xye0d3gCnJsbdXjks=;
        b=d8LedmTlO8u36UEnPaovX+kQ/aSG9gROp8hKcGiEnQLDW2pDiHWmKHhyBP80Nf3wxE
         F5ojYJHb0d3kCrwwb2jC2Qhv6cUVRT3BpNxDHi2J+QT68lw1jRSTMiw4SFHUwTH0N8uT
         ogo8S1lnvpwVV3Fu+RBLVyTvagO9fdt/3egw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akp80Qy1dUIye+z29+uyvBWiT5xye0d3gCnJsbdXjks=;
        b=K0vpwydw/r4BxsM9QdbID2fPD5ZiT5IZwMIxj88ciWwWOOM/yv01raDZxIRvsJWov0
         JDNNiF1Oje05HR81TgFtw7AGjLPudp59TbqY/+ZEL4XBs2wWsFw6yvM22Mwo6JllFvIw
         WpQvhW1n/lG6xzva4NvxT1eQmPcSHu0fbpATr0jRRsQ7VkujIIPgAZFZP2yKMa6o6EiT
         fGc7kNa/CI3Zs4JhZqBFZaN4g9jzFtOxewz94gfuZviKFfrw7inOJJxm5UgwUmqA+gNm
         DinhFCrzPUT3fXLUTSBAj6s+s8KYJpIN+ogD2QxQM/CvSNxxjTkN4CQt+JyUPhCSy/El
         WBjQ==
X-Gm-Message-State: AOAM531lJvJ1DKGMwFGn4A4iadfuyBAd67XeBIsdtRXeYhKvwooE8Zvj
	EcUI8VAvXWQB8dQGEl0BlcIzeuiEIMEEZQPdz3b7EA==
X-Google-Smtp-Source: ABdhPJzXmNE4tuPjbHERrLHugc6j4XWnNV8HedTyD6Ejmg08zIE+AfSid0NXpEaJaQ4LXyqvCx71n+OU8gYC48oCDmk=
X-Received: by 2002:a05:6808:a95:: with SMTP id q21mr2204160oij.6.1611055282508;
 Tue, 19 Jan 2021 03:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
In-Reply-To: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 19 Jan 2021 11:21:12 +0000
Message-ID: <CAM9ZRVtZBM=3ByycjcWw86Vg55U_J3guAY1bUL6w=sM52xSgxg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 0/3] kernel-fitimage: adding support for Initramfs bundle and u-boot script
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Lakshmi.Kailasanathan@arm.com, 
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Jan 2021 at 10:53, Abdellatif El Khlifi
<abdellatif.elkhlifi@arm.com> wrote:
>
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>
> This is the version 2 of adding support to Initramfs bundles and u-boot script in the FIT image.
>
> This patchset provides the following:
>
> - Initramfs bundle support in the FIT image kernel class
> - Allowing to use the Initramfs bundle with the FIT image in the kernel class
> - A self-contained test case allowing to validate the Initramfs bundle support in the FIT image
> - u-boot script support in the FIT image kernel class
>
> A 4th patch will be sent to the Yocto documentation which describes the new features.
>
> Abdellatif El Khlifi (3):
>   kernel-fitimage: adding support for Initramfs bundle and u-boot script
>   kernel: skip installing fitImage when using Initramfs bundles
>   oeqa/selftest/imagefeatures: adding fitImage initramfs bundle testcase
>
>  meta/classes/kernel-fitimage.bbclass     | 160 +++++++++++++++++++----
>  meta/classes/kernel.bbclass              |  16 ++-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 132 +++++++++++++++++++
>  3 files changed, 284 insertions(+), 24 deletions(-)
>
> --
> 2.17.1

I think the `[meta-oe]` tag in the email subject is wrong here. You
don't need to resend the patch though as that isn't included in the
commit message. This is just a note for next time.

Thanks,

-- 
Paul Barker
Konsulko Group
