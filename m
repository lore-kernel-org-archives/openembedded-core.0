Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA3DC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 22:23:32 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.1165.1639693411777682388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=leBtGwrg;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id gu12so655022qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V6guddaQcN0jzMv1bmVCfSTCnNTtA4S4VF47p7mrmQQ=;
        b=leBtGwrgE56yFw3BgqOGna+YrDeohcz9c/t57akYbzrKAIsFqS+PdOFynECzTJ50zK
         M/t5JxhnrDkSivsHymhndoZcSsX0toPva4DHCh95C7LqWnRvJO2698PKwvhkmbibHOYf
         bsS0tnn/A/Nm5dbIi2ML4pm0PwAOsOYq/g5x2ZSslnLj7hBiRXRV4ZXK1/yaFe7mhp6o
         2YSLgIp8AIjIAPzuZgL+LowRv814ILbwVkI5BCaPLg47ucULKej4uv1t+aCIT5AqXbUu
         TEa8jmv38xrmbHa7dViOJUfivcuPgOMfSr7xbdN7sX0xy8PsvjyILLnt0FdHD/EA6YSt
         sw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V6guddaQcN0jzMv1bmVCfSTCnNTtA4S4VF47p7mrmQQ=;
        b=c1TWYlLQ7QRpvlEgBWJSw48ZywX9o6SMfjM/WJYh7LHVkRO0aUZFmu+9YbJBgd15Sn
         h/LK4/2GmPTdrMCBmHArKiBbc8te0FDSvUA/qudrm8XQ+YG49VRr5/JMW4fg1MArERmJ
         ajfpYyb99prFXSicopLbzSNdZC34PLKBvvkhPLfU7z8gzs5qfbXWtxVhn0P8KgCucxBG
         8q68a2TF6SkwkRBbF0rThb+Tv4iRHSWbjSvFXhlZmdZvydUIeEYqvCE418RlqJu2+6wd
         4C2+praY2wx2Ya84xrnH9v/w9mwofRhgTYQ7rVfKQCjyQqGtrrX4dd1PB3Z9MNMzsinw
         tiXw==
X-Gm-Message-State: AOAM5323zqX+VNbCqOD47QN21/Ubsh6W9P9DRo3XZtlH2QT79VUB/K7l
	d81JtylPh5UooO+M5XKosAuYx3f3pQPQq7LFKIc=
X-Google-Smtp-Source: 
 ABdhPJxivqsMAua8ZHYIHVwD9lDdTtsrPEn7Zh0RpUd0Djq+X6aibulf5BNrHavmuex95V5JP7M0ujyAySNvwTf2Zkk=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr17855075qvr.110.1639693410683;
 Thu, 16 Dec 2021 14:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20211216220748.29376-1-jdmason@kudzu.us>
In-Reply-To: <20211216220748.29376-1-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 14:23:04 -0800
Message-ID: 
 <CAMKF1sqR78UFCjoRenB0dhuhuQY+htwAvvgSDjaoR_ybvmEbtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto-dev: add qemuriscv32
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 22:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159808

On Thu, Dec 16, 2021 at 2:07 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 80f62a0412ad..744b74ce3749 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
>  # we need the wrappers if validation isn't in the packageconfig
>  DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
> +COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)"

lgtm.

>
>  KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
>
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159807): https://lists.openembedded.org/g/openembedded-core/message/159807
> Mute This Topic: https://lists.openembedded.org/mt/87777809/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

