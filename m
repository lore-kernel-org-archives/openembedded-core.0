Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB115C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:13:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.175930.1672211621239646627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SpfzfR5j;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id b3so22526579lfv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eSDpJ8oCGpvnUG7IP4MH+BG9V8t7I7hHA0JPWDP1sxQ=;
        b=SpfzfR5jI1shyTX14SJ3pMTul8TlEhZZ82NP7gEuG4ZpGFgY9gnd/1d/BXvYkdVXFq
         Z3sjkzMjiC1Op5DNFxeV5ZnXcszCbV5+NQbdfQBxfaM+niEJELgK0tjGySA3UqSLISyL
         VlKROq2z8MgeDT0OxLBjCjFCvFPnK3x+HuKl56CMgdHraMCTvUFRvM5fBdv79fENP3Vp
         A2Ct6IJVo44/TZmgahuIcUdLQCkgHuuRkiN8yA5NWr6IWNVzWeyZ2tKMZ00wp7jQDtTD
         VswY5WXX3UAv4FpjhmY88jkw8SmRRb2SlNjO8S18iJeOA7uMUJy4UAUY5UP3qKySA74V
         a2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSDpJ8oCGpvnUG7IP4MH+BG9V8t7I7hHA0JPWDP1sxQ=;
        b=eRGq3p2tftq1qtsNWQ13XSG3ZNRI6WF7JGsrZ83j+/BUFFQdrPoEsgULzJKKAbPnc1
         G3dSMJrSO9KRPTcUIQvGT6yyu6wC4HdoKCyZiQPqLlgMAXreVf6MVVXi+SeK27W1l7so
         UpQna1vn37yjmB85fMvfOSHzqPbh8Lzmt5Kk7DROkQRT3mRZZmqrYw0iOUHTmXXLw1xw
         NWQKm7IW49VXZVhE/cpro2gZ8IJVTLOSvxs2AbcXxsFniGTG10wKbrJZRBzVba6kq3DF
         d2twirxnzM6LtqX4eWSqZT+CoknejZn2+NSM1AhdFjIHTt2drRY+F/4CEtNplS3AKGAP
         vY2A==
X-Gm-Message-State: AFqh2kqz5NDjZFJkOI5cueSBT0G9LPi8xgnE3hSeRAUL84Ysv7p2gzRT
	iBKk3opzbsJhErPdS9psa5mri7A+CFLaEzrnpoI=
X-Google-Smtp-Source: AMrXdXtFGMSDun4GoCVgyClZ83ZzPcdVN3YxLj4qayqpWdpslzNglX7PrJiq+Di04ydZvkIqqW11LBMPK46uPC3tlMU=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr1438874lfq.345.1672211619276; Tue, 27
 Dec 2022 23:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20221228040546.1790437-1-vince@underview.tech>
In-Reply-To: <20221228040546.1790437-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Dec 2022 08:13:27 +0100
Message-ID: <CANNYZj_DY9PdAFLBC0qkMgpy86PqVPxCA2b45bXaRDoLZOANoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: allow mesa (gbm) to compile without backend
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175040

On Wed, 28 Dec 2022 at 05:06, Vincent Davis Jr <vince@underview.tech> wrote:
> +Fix gbm compile without dri
> +
> +Upstream-Status: Inappropriate

This looks very much appropriate for upstream submission; please do so
and re-submit as backport.

Alex

