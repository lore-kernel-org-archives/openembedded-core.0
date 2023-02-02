Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F29C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:14:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.13044.1675340072472256050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NUL7h9as;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id o20so2681394lfk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=haHYxh5oVGoN16aW4dRnuifaS5AoBfsyhgm46tg5pcg=;
        b=NUL7h9ashiHH4MdfN9U4Cbe5tTVfX4V4BxXhG7fa5cNYZgvZCpwLtCW9ceLTaLN5KH
         HLocPhim8t1BjPJXqgKCPRS8e8RjxRk9lq70WmByR7QTPT6QRw5Ksa20cLJNHUtdwV1A
         4edBQJQBhsu39vwEj93tuXLmJNpiOQfcZrj/jquF4FrJnEv1psnZTIobUJjQChTBfDfn
         LnX0MukUAPlqJ/VApPKWcdz3sRDi0lQMIJawBLAhTmNTFfXaGNCigaZ6k0Q4qXe+pFcA
         +eYfyTq/bUm3j80PbmS/cAITqJP6PDQdrAfnwGAIweI7Co8XabWUOp0Dw8BIO/FO1Tt6
         D9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haHYxh5oVGoN16aW4dRnuifaS5AoBfsyhgm46tg5pcg=;
        b=1pA5TBt0+WR4tmiptNWxCuhHHKnQ1VGBXXlOmazZg3qgE7TFk0PtEp/6HwBZkzXoYz
         eStWSdCoT355hMDa+0eHoqHk04E6JmBHw0QUx3JwTB7OALZ2dP7uUMz0AzCooC4dEDMQ
         dW3Yh3JnX/oKjtfC9qZEIOtRC7CVkO1YlUv2OW1A9nznXvEYEjjrazYztYVysXvBDI4F
         CesTPnKe3/mQT1NC41l/GwDgCgWOwmsHb1xzHf+RcfzdMcJyVxAbGDi2TgbaJSUu+baZ
         hKLSvfUWj1iFBDwtBe6q0nWAeUte/u1G+R0NYDGvbBm10U8wpXdLyZV1eHxJk1TwBXNv
         /mVg==
X-Gm-Message-State: AO0yUKVt/p+aURKKI7xNzG6YZSmEtjcG9dcqml3MhmHekp0RsU/zCaJU
	hKMHTR+xx1Av+F0FzdfGREW3oJTe90ryU9YcVKM=
X-Google-Smtp-Source: AK7set/cC7LfVooQfZzUNz5VU/pPyggzT4AOvD87+OYkWkGK/x+mfiUOdW/hEl8gd4VQodExDfj1fzWF8twQCVAgO+E=
X-Received: by 2002:ac2:5b5e:0:b0:4d8:76f9:7387 with SMTP id
 i30-20020ac25b5e000000b004d876f97387mr918393lfp.266.1675340070462; Thu, 02
 Feb 2023 04:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn> <20230202080219.3465767-6-wuxiaotian@loongson.cn>
In-Reply-To: <20230202080219.3465767-6-wuxiaotian@loongson.cn>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Feb 2023 13:14:17 +0100
Message-ID: <CANNYZj-J_02ysfgY5=RbxapdoUQ=4hQLVsFihdP9wOHvXfRhCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 5/5] uboot: loongarch64
To: Xiaotian Wu <wuxiaotian@loongson.cn>
Cc: openembedded-core@lists.openembedded.org, chenjiping@loongson.cn, 
	zhuqizheng@loongson.cn
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176692

Please adjust the commit message: something like "uboot; add a
loongarch64 entry" would be better.

Alex

On Thu, 2 Feb 2023 at 09:02, Xiaotian Wu <wuxiaotian@loongson.cn> wrote:
>
> Signed-off-by: Xiaotian Wu <wuxiaotian@loongson.cn>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> index 0bdbce725a..09b3c3f68c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> @@ -24,6 +24,7 @@ SED_CONFIG_EFI:x86-64 = ''
>  SED_CONFIG_EFI:arm = ''
>  SED_CONFIG_EFI:armeb = ''
>  SED_CONFIG_EFI:aarch64 = ''
> +SED_CONFIG_EFI:loongarch64 = ''
>
>  do_compile () {
>         # Yes, this is crazy. If you build on a system with git < 2.14 from scratch, the tree will
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176681): https://lists.openembedded.org/g/openembedded-core/message/176681
> Mute This Topic: https://lists.openembedded.org/mt/96696078/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

