Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA49C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:28:18 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.17216.1658906890450167833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bLJselur;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id p11so21049114lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eSw4bXRsnlMTtj0gAqlIV3Zh/dayICAgOIm/xBCZTXM=;
        b=bLJselurE/gJ+0mZLDR6AfDjIrBncgf6/jNFuGBxhU9U3YiBkOjBAqQrDbtgBARkxZ
         NOXf8NYY2l159W+v++UWezsLnL3rdisUhif08GO5Yk3tMZLppq0neXI5E05S3Ym0mxNn
         rsgTtJU96P+IS59fea2v+C/WP9G/WZ8jy/cJQKlDIilztSdtWZoQfuvW6/L9/sVzM3MV
         na9d6sKzYhNRYtGs+US9aYAKHhC2rDEbjO4KCgrL87Bxiyk00OmZU9k5C5vunMjI8y/x
         SHlIcnz32QP/38PEZ+95P5uJvwMUljJ/nSs6drXNUMFHT/I2S4aYpVdKMTVm7AyW+IgJ
         vnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eSw4bXRsnlMTtj0gAqlIV3Zh/dayICAgOIm/xBCZTXM=;
        b=RtgP8Hc1J433fGjxv8B1D3ADiUnGJsxgkBuiO+YpI5sv/9Mmyv76K+kmr8VNfNJnWo
         xo2Ftf9H9ik+RSXScABJO+xmmGR/wVxtc1fpu+nm4VPOr0TMooUdq+hG8u0z/y4pXjGn
         Bx502NPlMdDQd+0iMdUkPTwArVh+daUtOZJ+KYzKhHVGa4Irbf6stNLW6X9Pfxf3TAoJ
         fBS3KspaKdObhwmpuVlVpwwMUTNG0Al/qlh+iiF9UwZof6VzDrX45HS3JktcaeryDh3M
         s/gHumdPI6cfgaC4XuLfe/chQ4j2QBB46bYQft7GqOVLP+clRzW44228Lz8h9g2JN2vS
         US3w==
X-Gm-Message-State: AJIora8ysceohgUHTPi3FjS2kjiL1AZMc9iHxwzWqy/k+bQkydD1OeJc
	ZLcVHnh2aNXST3zk1nDe2xu/MB37hAh/zY6CGpo=
X-Google-Smtp-Source: 
 AGRyM1v1Xhnp1eXXcpYYeaK1RQHuE9q3RCNWpfBjBol5h/dogJij37V4xv9vAEMNUHRyz8lIA1RfkG+bYacUyv2y+RA=
X-Received: by 2002:a05:6512:3fa2:b0:48a:16df:266f with SMTP id
 x34-20020a0565123fa200b0048a16df266fmr7379046lfa.414.1658906887816; Wed, 27
 Jul 2022 00:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: 
 <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 27 Jul 2022 09:27:56 +0200
Message-ID: 
 <CAApg2=Qt=nwRRbRF6u4tsze9O09JiJDAmrSHv_A=9mX2xUFMAA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcommands:
 autologin root on serial-getty
To: johannes.schneider@leica-geosystems.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168544

On Wed, Jul 27, 2022 at 5:37 AM Johannes Schneider via
lists.openembedded.org
<johannes.schneider=leica-geosystems.com@lists.openembedded.org>
wrote:
>
> when empty-root-password AND serial-autologin-root are part of the
> IMAGE_FEATURES, save some of the developers time by not having to type
> the (then still sole) 'root' username on the serial consoleafter each
> and every reboot
>

If this change is accepted, it would be good to have it documented
really soon. It is likely
to break CIs.

Regards,
Marta

