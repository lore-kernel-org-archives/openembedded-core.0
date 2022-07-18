Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE84DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:02:23 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.30737.1658167340628028760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pI6rNehg;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id d12so20688375lfq.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RU/XlZbGElPFbL/g/IKePuQ6zz60QggkZTCzjz6jTSs=;
        b=pI6rNehgXAKOH8QIMRRHM+3iynw8XI9HRVhCfAcYydMkj5xIt48R1//UmLfVDVAdwg
         DJiHXbdH4g8KcSNGq5V2P45AJM7S71sMFAwaQzIQZ7tdr+TohhcrXfLFwBKjkjAucXzM
         MRUSOOzZCXMy175CkkWjXVg2wnbbnx3ONOJdFe5HLgJ0USPvsEcTWDXi7Nxg/O1kyYRm
         V3zUa4QVWiXQqvRVRjqVgv7HUEDStNBqtMa/IyZxcDAQplDQPDW+xWsDo8TI0uIe/b0U
         +wJDRBonqLImZT7ReP8nFGvjQxnB//B1/25SPLFVqOEl/HLCNZuNG+Yxo5eRltx9Hbs+
         No0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RU/XlZbGElPFbL/g/IKePuQ6zz60QggkZTCzjz6jTSs=;
        b=nY2WRHJRddXbR1XxeNsIuesW1buznIfFHXAyHchFsC1W8iNg8XMxeqfx/tvC+K9JVP
         KxE05rEiSRcjKGFcSzFUVhEumpr7sY2tIAzT0f+FumFrIVRrzsr7VYN3ysO84GTlihhw
         kTfNL1k2yP+bxBpf3KZfWLqEF5Imw0uhnjtKQLzJD6XV7eDTuCx9gPkOzSsmFcgbmsIQ
         rArDcPnOp8VzXBi7NachEiJojPT4RfoirOTjPpbLyvp3rVkEdQMcdk+eYMvgAaedfyFs
         KcyBXZNSZvzH0Z47TZcGDbexcnmZykPXf70cWrD2Ewhfof5Q1FQVWlYfvuqDC1qgTSuv
         0yPg==
X-Gm-Message-State: AJIora/YdMPYvYjc4VFqh6FQxkZDIG3/PBB6uEpYEyKAJuAUW9mqos1h
	UGDPrFd0JTKMwEmyraNcKFx2ULaF3Kj7FL04cw7BNGrz
X-Google-Smtp-Source: 
 AGRyM1vixGIdSKSUMlreNy6ho+2Yj33ORAddy0chQy6KHQy8nGm4c2/4QCpwvcbrRHsPLtsx5Nm0FRRDmlmU0I8tnRc=
X-Received: by 2002:a05:6512:1050:b0:48a:2319:59bc with SMTP id
 c16-20020a056512105000b0048a231959bcmr8997404lfb.665.1658167338857; Mon, 18
 Jul 2022 11:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220718140910.519671-1-dragos.panait@windriver.com>
In-Reply-To: <20220718140910.519671-1-dragos.panait@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Jul 2022 20:02:07 +0200
Message-ID: 
 <CANNYZj8hWHrog59eRbZ5z0eZTA6hn9XwHrsy=MrUNOD8Me-uWA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] strace: update SRC_URI
To: Dragos-Marian Panait <dragos.panait@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168247

strace.io opens fine here. Can you check again please?

Alex

On Mon, 18 Jul 2022 at 16:09, Dragos-Marian Panait
<dragos.panait@windriver.com> wrote:
>
> https://strace.io is down for some time now,
> so switching to https://github.com.
>
> Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> ---
>  meta/recipes-devtools/strace/strace_5.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb b/meta/recipes-devtools/strace/strace_5.18.bb
> index 08f0f1d27e..2bdc3519ee 100644
> --- a/meta/recipes-devtools/strace/strace_5.18.bb
> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
> @@ -5,7 +5,7 @@ SECTION = "console/utils"
>  LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
>
> -SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> +SRC_URI = "https://github.com/strace/strace/releases/download/v${PV}/strace-${PV}.tar.xz \
>             file://update-gawk-paths.patch \
>             file://Makefile-ptest.patch \
>             file://run-ptest \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168198): https://lists.openembedded.org/g/openembedded-core/message/168198
> Mute This Topic: https://lists.openembedded.org/mt/92459281/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

