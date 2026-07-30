Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEBDC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 14:01:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12494.1785420064550298657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 07:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xZabA5dO;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso15219165e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785420063; x=1786024863; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PZDTD6TnZBmdMQppVI6ALJcoVpEK4uAm8CxWeq0B0IE=;
        b=xZabA5dOwc6UywszMedrEoh7JNEcmmxNRPKUE2TBgZ3O3PpBHrH2YKThEHYtRpRtxN
         MJM3H0tbfZRpxBrAZawiss+oLgiTYGKB8y0FGMxdwz81rUhKF5E0u/qp4zt+ogIwi4R8
         nAf9IjZ/43mFjvyyMHnpmGh1hzW2+yjvcIS1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420063; x=1786024863;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZDTD6TnZBmdMQppVI6ALJcoVpEK4uAm8CxWeq0B0IE=;
        b=ZJPPF42wjmQF1cSLuQE7AWkhtFaGGk9SUZnxCZtehZHhVEUoXWtvqYZacHuHnnn8Bo
         foCMVTCBcd282eoyiWKLj5aTzXVEsLlfbX2PCETsvlSxXmJ+SUcJlM2WM1oPe+KBZTiT
         PM+BJ4XBiOSR23WOjnU3/2OWr8UYBb0TjCNiHcLzXq8w+Fb4rr7L5GTcwFocsLsRlW2c
         D+AHvmab90FbhI4z4UgvER83CnROp2gqE3Dhl8TeXGG7XxVx9ob8lf4IJOJKGlKvfcYO
         Ha6oztUWqZyMj9nycd+QjYJogJPOFrWKUDp+iUG8g55uNhDzmg2QPpO/rS1F9nLDOxOP
         isgQ==
X-Gm-Message-State: AOJu0YyXl2p0iVDw5F7wmnG0OKeMVO3tLccXxmnGblpQv1hIKRnn5I/H
	OvJkUugFHUeFuOK7d7ycv1VnVk4bvLi8EyuSng84oIZhovLxnS/dJpuKeBtQXE7HBR4=
X-Gm-Gg: AR+sD134/XORo76A3QY7+wb6BHblCk18hJafx0w/7YVpZw0x6Kde6yKztRV3xBgumBK
	eikcm6NLiWco2wO63/4OiameELkDIPO+yIAqi7JpHqpMekEWx7tgWmFiJRWsH2c7BFDeCF97zgV
	d7E5ZVAD6rukoTaoTKZBfcsY5HeP5BjRNPKhKjk2LrIroMgka1++7Br3L5g6qW8xrToWDKWomEd
	OFjUQgZUYIdxsBwLuXqnRRT0QMCTmFcAshj/z4L1NxfaQYacNbI5aqAtyHFY8zkqA/Zd19SSlBN
	9INwskkRuosgl3sOuB2zbrIECdjAs+OCYH1E6ZGr0c9BWE2pPO5OCjLkUyX49ZaAYuEjRHAcdKq
	B0kjCmdX/s0zAxPuWA7CP0/xCLMMDxaJA8lDX82UCWdJtcE9xJCBfA87rCgpHibQJVqoLCZh25S
	QpoUiTORpl13LWdhiNTn/NzKdzXmGCVVe2dOjJBFFUqqDCq9PqOiMvAIjft1YNmulhvCEvLnsNf
	dplEw51M6uC/gw0Cm+iSJRIEt6i7/bWhZCJOBCWu5C1Ieb6Lsle2g==
X-Received: by 2002:a05:600c:6c48:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-49800e7c602mr25660795e9.17.1785420062508;
        Thu, 30 Jul 2026 07:01:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f0ebfasm60158685e9.2.2026.07.30.07.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:01:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 16:01:01 +0200
Message-Id: <DKBYL99QOTEO.3BJX0NMLPEIJ@smile.fr>
Subject: Re: [OE-core] [meta-yocto-bsp][PATCH 06/06] yocto-bsps: update to
 v6.18.39
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260720155842.569263-1-bruce.ashfield@gmail.com>
 <20260720155842.569263-7-bruce.ashfield@gmail.com>
In-Reply-To: <20260720155842.569263-7-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 14:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242361

On Mon Jul 20, 2026 at 5:58 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.18 to the latest korg -stable release that compris=
es
> the following commits:
>
>     f89c296854b75 Linux 6.18.39
>     [...]
>     501543207378f bpf, arm64: Reject out-of-range B.cond targets
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappen=
d b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> index d8790f3..8816184 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> @@ -8,4 +8,4 @@ KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
> =20
>  KBRANCH:genericarm64 ?=3D "v6.18/standard/genericarm64"
> -SRCREV_machine:genericarm64 ?=3D "daaaf767b0cba42bcd9ba3f5b5f6b42b5e695a=
3f"
> +SRCREV_machine:genericarm64 ?=3D "08d2d1aaeb84ad2774df573efc336bb7ca773d=
40"

Hello Bruce,

I recently noticed that I never merged a similar patch for scarthgap:
* OE-core/linux-yocto is up to 6.6.144
* meta-yocto-bsp/linux-yocto_6.6.bbappend stopped at 6.6.21

Is that expected?
--=20
Yoann Congal
Smile ECS


