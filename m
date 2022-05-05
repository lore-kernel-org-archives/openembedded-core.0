Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1785DC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 12:33:47 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.10168.1651754026496337179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 05:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTb7RY+6;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id y2so7343022ybi.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jenZiABM2q+71SeHHj2D7A1rcwyV8YprA4aC8cty28=;
        b=eTb7RY+6cDVxVmNoC7IcpCC8TKG6iZPnY4XGJp0618OvQZqpK3ZYTKNRzLqlTGORaK
         3WQ2HyWgwsP3WnAIleFH/WFinNZq45xQFtJeuX31Lf8AZ5sTTn35i2USBdHASwdIXaMD
         3lpfdlt6H+dI052TN9WzrUsBhidTm6rTJfAbS/kX8yYOVbVhzymrX6dayzW0rjSJNOHq
         r6GQnyu4pvxC5E7tO12YivUm+4Tls+gXtdNXr08JAQ7Xj2P6X9eXoYnCBgPYswnVbLOB
         xMk/uNl9xqV6f4DJa3A18jSUS0v/t4vX00PN/2FLTfcrC8/42kDSZZFPbxcap/dPyEst
         ZqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jenZiABM2q+71SeHHj2D7A1rcwyV8YprA4aC8cty28=;
        b=xYQtZTrB+rTe7Lbl4GSTOKl1xend8RzPaInFnxgCz87XcdfVkzGOw0pTuYFpHIayYW
         WxjloR4y6xBVxyBKAO8Ak9NqSPJz0jK95q3GIIRyQDYZ05teRsEd9WiQJJrPGtAnMUct
         AjwE00XayJvpX15nKoIR1KoZ/MXdzvxPR0IW+olLAIp6dADxQOwh4Z794CPz3EsuIBl3
         Jey4+BPKAQYVTvfQ4A9DIQGyz5Vl905soDNCsgOo4NOsaFf9vQFlIHHczfAjjRjERWcJ
         cYD1f+SrUWRFy5ScozpwxP+T9zKBqGwpYAXM33hsDsTerMtLYEnTxbAgnfjE/ZObXBaT
         IH+g==
X-Gm-Message-State: AOAM531sEN3ShauxdoxrhhZCV4MXU72kI/PMZ4Vm1LU9ZP08/oRffkjj
	pjXDmmCfedLb6koRB+2pHvFNLcB478ewm47dJ3s=
X-Google-Smtp-Source: 
 ABdhPJwC101hIPWgtyVN2ij0WSJsQsCIhnDUV1Vs1Imytr9CwHh6xqugr3SEO7FD4KirI1HCHSQjImhWlWrkjWuGTww=
X-Received: by 2002:a25:428b:0:b0:648:f57a:ffd9 with SMTP id
 p133-20020a25428b000000b00648f57affd9mr20404780yba.382.1651754025567; Thu, 05
 May 2022 05:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220505101446.1634380-1-zhe.he@windriver.com>
In-Reply-To: <20220505101446.1634380-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 May 2022 08:33:34 -0400
Message-ID: 
 <CADkTA4OH2KLTayoO3fCwoOx1yhjGqn_-qkcKRXh3BKVaFh3k+A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemuarmv5: Change KMACHINE to qemuarmv5
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 12:33:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165297

On Thu, May 5, 2022 at 6:15 AM He Zhe <zhe.he@windriver.com> wrote:
>
> yocto-kernel-cache has removed the compability of qemuarm from
> arm-versatile-926ejs-*.scc The setting here should be changed accordingly
> to avoid build faliure.
>
> do_kernel_metadata: Could not locate BSP definition for qemuarm/standard and
> no defconfig was provided
>

Jon sent a patch for this yesterday as well.

The fix here is correct, as is the one where he mapped it to the
versatile platform.

Cheers,

Bruce

> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/conf/machine/qemuarmv5.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index 2dad504c99..17148ab929 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -18,4 +18,4 @@ QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  PREFERRED_VERSION_linux-yocto ??= "5.15%"
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> -KMACHINE:qemuarmv5 = "qemuarm"
> +KMACHINE:qemuarmv5 = "qemuarmv5"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165294): https://lists.openembedded.org/g/openembedded-core/message/165294
> Mute This Topic: https://lists.openembedded.org/mt/90907770/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

