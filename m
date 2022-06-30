Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B31C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:43:22 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.27368.1656607399657013993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ogGnt4O2;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id a13so34713386lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y+S9akMCLa12Mio/y9tBb7UyZI5FPXr4c5oQQ7G7MsI=;
        b=ogGnt4O2FXHahASMzG6EgrA0h/Nfp4NvJ5AEbXgOA5HIP/F/EpQWo0WtVNcqWG6gmE
         VGjqn0Ki5d5GTK0hRBghEhuOsO8DKmpZc0GpJ0M1NlIuUjEEd2t+Qv31kds6Dg1Zxcr/
         W8n/YkTAEBn5e4bhL9OSzwkGGKbHrpuJuaYJAuW6Ue8Ws6keOPSTXCLBlDx+sD+wcnUz
         /P6l8barj/KX7ALmq0ZZqMdsFJalxbgHfLFrUNrpoDs+zBvMoNEnKXztp8dWOVMX5T4Y
         ISDkIt6H1r5SvO/KORLNYWRtMhJC4RYJY1iDTcVw+mAr/Pl0nbfCAkqD8Q3u4OdfAJaz
         Gzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y+S9akMCLa12Mio/y9tBb7UyZI5FPXr4c5oQQ7G7MsI=;
        b=78NzJnNlOQ8V2HczMpWoaM9G9M3msFtrlLn9PZigxJoLfm6VyXJTVsdnjM076cN9Gy
         79PcCyBrKVDeMbqkh5f1TonYxWtiYMr0ajTYhyhn/JqF6sjPxpjGkucG/oz3zWgJzsoQ
         Hk+unn2rWkq3iUq0ZEY883d3lk4YWT4zTS1c+r1QHblbVp+fMu2Wws4BXnexmGNP0/85
         uP/SEkPj8Jh9F5aNMOJlunbXhjhx3QQRI5EBi2xvd7a+Y2xedPk34UP6+LD4tPhgH2J3
         pif9kajBYQbESCZBHzP1tB+9FWc6rInPJqcOIeg5dj7ctf7q6exD8SyOPgDX9nRd8M+3
         Y/Tg==
X-Gm-Message-State: AJIora++fyMKmhFga6hSbJEsSBed/IvuqlNdu9zJm+q3TonIdc4gUewf
	9JALcjLPC8QDQos8XZNkSbtCgbJCRtUMEfqAdKw=
X-Google-Smtp-Source: 
 AGRyM1tBQfGitvBVeaQld9K+OYw0vL1ih55tkQ1ka7wkNCTfbAD8q6x1et+Rbm4YzUstGorDdXlzFVv9s7FeGH3HouU=
X-Received: by 2002:a05:6512:acc:b0:47f:769e:6aef with SMTP id
 n12-20020a0565120acc00b0047f769e6aefmr5930963lfu.26.1656607397899; Thu, 30
 Jun 2022 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220630162044.671912-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220630162044.671912-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Jun 2022 18:43:06 +0200
Message-ID: 
 <CANNYZj_Y4JKwLaFF4FU28Y8HxCADJFW+b9tQnQfxBjjkf-vUnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Upgrade 3.0.3 -> 3.0.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:43:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167429

On Thu, 30 Jun 2022 at 18:20, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> -           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \

The file needs to be removed as well.

devtool (or AUH which will run in just a few hours) would've taken
care of this automatically :-)

Alex

