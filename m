Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CEDC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:37:18 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.14064.1683103035319690039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YVVtKy1p;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4efe8991bafso6181183e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683103033; x=1685695033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cph9esjGdXQp7DwYbl6zuoW5YXBQCTIhMPWX3rsvfDs=;
        b=YVVtKy1pVBSAwcFLPDUqc3djJs1LYIaqbMayRCx/WPbFNSHfHJuHmRg615w9NzoN1x
         RUOlBsLmQ4dWoBS7bQZ5WJFXVeTrBHhLXxD88ki6khOIrXf4m3AKdMkwm9hvsweSsx5U
         VwSctEcrldksdHkA9oi5PoXHzBumeusmhV3b9+voREmDpipHPepHfctu3mCRirWues7d
         HBN9xMNwN6YXLKiz/cDS+xEioQS/K51XbCO6O58sYQejwNybTiGOIJq2MOvfruvGMBGN
         y5izcqWWgHHufKUPSITUVuQCSwwjcxn7fGGOzep2CC5/bEScN/my2vakbscO3TodjkEb
         P6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103033; x=1685695033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cph9esjGdXQp7DwYbl6zuoW5YXBQCTIhMPWX3rsvfDs=;
        b=S3Njx9YlxmLBBbHA7NNJR4RdoNyrkHrPz9wEqIbxcX4G1TDtjrWMQ72kB7c81Dv5fA
         95ol5OwUgHG1qOJKnOE5vJ4qcWDpdReNb7zJcUX6LnAx8ZXgXyVihgPr4pFlWZny25AY
         Oc8nfxZF/fXzGK44+OlDKRm6YMLVhaDRBCmtZ+07G3krtYOAXkT7lXA1DwlFG+Xk1iA6
         PXHSFa+7t6zorqNUo3fBymoL76boGf6oNA+ylRq8ZMIkxAmkRSDhHALBRNRttrK8A43Y
         I2+4u8yZJQlymvvOYW8IZIVIJVHD9gBMuut5VsF93Fv41pq9L7f3TY+JaYr2f0/YQ3K2
         IcqA==
X-Gm-Message-State: AC+VfDw6XH6mvGuf0ODif8C+RKhQrCryHAWnChR9PmUPCFeGcbSLs5LG
	vCePFSi9/fGDRmp4+tFcF1+qRVlJn0VIvyQOFNY=
X-Google-Smtp-Source: ACHHUZ6Gy5Fnv/KL4JcZTxals5e/Yvvk/OxWM3iDaj5R5gExLggJcAyAWCGNTYwJ/fu/BDhQNt06zYfyj/eu4O6w7F4=
X-Received: by 2002:ac2:410c:0:b0:4eb:104b:bf61 with SMTP id
 b12-20020ac2410c000000b004eb104bbf61mr843512lfi.58.1683103033426; Wed, 03 May
 2023 01:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230502195932.2196823-1-ross.burton@arm.com>
In-Reply-To: <20230502195932.2196823-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 May 2023 10:37:01 +0200
Message-ID: <CANNYZj9hNOKAD2=ZbEc9ywHaU=vR2wVDg999=yGF=oJ46tU1nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180787

Please respect the upstream version check; vulkan should be updated to
sdk-x.y.z versions, which currently means 1.3.243.

Alex


On Tue, 2 May 2023 at 21:59, Ross Burton <ross.burton@arm.com> wrote:
>
> ---
>  ...{vulkan-headers_1.3.239.0.bb => vulkan-headers_1.3.249.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.239.0.bb => vulkan-headers_1.3.249.0.bb} (94%)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
> similarity index 94%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
> index a6b30fa8310..ea6312133ca 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.249.0.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
>
> -SRCREV = "2bb0a23104ceffd9a28d5b7401f2cee7dae35bb8"
> +SRCREV = "870a531486f77dfaf124395de80ed38867400d31"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180766): https://lists.openembedded.org/g/openembedded-core/message/180766
> Mute This Topic: https://lists.openembedded.org/mt/98647309/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

