Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51F8C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 14:57:10 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.19569.1677250621242177122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 06:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DPhaebKR;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id q6so1509152iot.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruX8XS0muJrDljeIcEj19fEPj39gGBTacsvtblqfVFU=;
        b=DPhaebKR/DcEpRq3YyACEZjWeEa8XyJahTxQNMbNx+Melp8AeobJ7TV5kO2EBP8SG/
         GF8KDG2lIy5YxTPqlebfjDVHsw9rPDnmA+Er/BExrFf4Uz0gT58ojo6Px0EE1u6zA+rp
         jrrIQP4lZaJmYyZd2jfkOgsw4Rcvj1mIWYcD0wqFipxaYXtmbcL6k0Ghlq9xOXc2SVsk
         kihOMt/w7ZiT8stiVbJ4brze7XsFUrkEd54YjHyrbimLR+BvX7K4+Sb+K7Iaz3HeSJ42
         kBi0KYar0nwfI1tR0cu8o8JIqwGXf2AX9+y1Hbq5AS1T6FQv/SHfGJHss9AUNbn2oFJS
         jZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruX8XS0muJrDljeIcEj19fEPj39gGBTacsvtblqfVFU=;
        b=L2jRnE7HAg7GimPgpxi/ay6uwQqIY+kPURHkW/Hs38WZqF1bEpZBsw/8rxMyNTAMQ8
         JTGMsTq24cxI7oWeexO6UQdcAhHSjXE/1maq9YVZoew5A1Rz4+gxDMpAN4yMDGvxRR7Q
         Z3pjYwOWTvxZk9eAA2tAhMy+JR4fAYm1K47yumBNFBKLylPCdvEUIO8MZH4ssYrKM4Dl
         KAd6ZDLcyW0dIWqfeOzg0rW5HhETkyvAxOx+k7z0Me6ezIvpjmqAS73aGIKDqDkX9beQ
         eoG6Zj6dL9kxUT5mqAQpJnwkVcwBt50pu92IQKzhGz5PRZdL9va7Q9TLfZXJbGXu6LCF
         kD/g==
X-Gm-Message-State: AO0yUKU1LNcPBnKAXWB0x6b6b4uIb5ua/gHzCIE/874Fyzk1hMXtc+D5
	q3PSt+Gg3KWib+AhCmUX/I6bqYnN0ofJ10PS5fA=
X-Google-Smtp-Source: AK7set9MbesCEOMT2FvmQlhf/aahGogF3rPPPk6lRlmn1Nm6dnuYI4/5G7pXvjLST3yZaRgcCZQwMcQmAa0kj6fIHO4=
X-Received: by 2002:a02:b1c7:0:b0:3a7:e46f:ffc with SMTP id
 u7-20020a02b1c7000000b003a7e46f0ffcmr5331969jah.0.1677250620436; Fri, 24 Feb
 2023 06:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20230224143717.2669400-1-kareem.zarka@huawei.com> <20230224143717.2669400-3-kareem.zarka@huawei.com>
In-Reply-To: <20230224143717.2669400-3-kareem.zarka@huawei.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Feb 2023 09:57:53 -0500
Message-ID: <CADkTA4NBeVoxgWmfcS6xy4j+BjxnwdjNRqYuVHS0+f8qy7UyEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/recipes-core/images/core-image-minimal:
 add mtools to IMAGE_INSTALL
To: Kareem Zarka <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Schmidt <stefan.schmidt@huawei.com>, Kareem Zarka <kareem.zarka@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 14:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177689

On Fri, Feb 24, 2023 at 9:37 AM Kareem Zarka <zarkakareem@gmail.com> wrote:
>
> The wic.py selftest cases test_skip_kernel_install and
> test_kernel_install for OpenEmbedded were failing on autobuilders due
> to a missing dependency on the mtools package, which provides a set of
> tools for working with MS-DOS file systems, including mcopy.
> To address this issue, we added mtools to the IMAGE_INSTALL variable in
> the core-image-minimal.bb recipe. This ensures that the package is
> included in the core-image-minimal image, which enables the
> test_skip_kernel_install and test_kernel_install selftest cases
> to run correctly on autobuilders.
>

I can't immediately say where the right place to add this dependency
is, since I don't run the selftest images myself, but I can say that
adding mtools to everyone's minimal image is not something I'd like to
see.

At a minimum, can't the CORE_IMAGE_EXTRA_INSTALL variable be leveraged
for this ? It's there to be used for cases like this.

Bruce

> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  meta/recipes-core/images/core-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> index 84343adcd8..5d626898f0 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "A small image just capable of allowing a device to boot."
>
> -IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
> +IMAGE_INSTALL = "mtools packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"
>
>  IMAGE_LINGUAS = " "
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177688): https://lists.openembedded.org/g/openembedded-core/message/177688
> Mute This Topic: https://lists.openembedded.org/mt/97206738/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

