Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9A1C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:36:38 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.6831.1657614989207485817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flpbWRv/;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a10so7224841ljj.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqb79wo7Ss00qc5d3jQ6zlxW+pRaEM3f3/7qsN8Q8Xg=;
        b=flpbWRv/QVkvrRnyDJ5ePAObuQzvE8FXzQODUQzz4+Yls0B8NZNLCLeyshIS/++yI5
         jYkr4KwTjUKxolYEvRquyNIsPqdFtfwld4WowxNEUWi1uCCwhRI99l1tIbfACCEvq76P
         joshAifSExsBMchK0Rb3vFa/ThcwvlsJStKZEG7wB7qWhkjE9gF9PAHmZuwTigo3TKO/
         lcktMayuc4uR1FXeSl9tPXimV5qBS5qfrGsi2IG+Ju/QkGPzi//R9d0CZ42wKxU79JDH
         +/fNzb7+nwEwatFOQnWNnNOpZvLOYHFkUP5lu/P/mGkFwjyYP7xDojAwhnbCQjdCrB6E
         GiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqb79wo7Ss00qc5d3jQ6zlxW+pRaEM3f3/7qsN8Q8Xg=;
        b=BZCoj9QYLlStjY/KPWcIamrN0Z/WB5tPDuGh8hFJTyycsINj0/GzMQRPV8hy0mEpSP
         fqH+TZ+UL/vU9U8+xGjEWIBfotYXvsSKI3cSyRvfgtvAsi5+YFsd5/MRHVZ8uM7IjPGb
         Ku8UlPCTNTNzhwIOWDvXeNAqvav5EyvRnodDU1Aqu1ckRez2aRePzkMKZjZYZYbGXySb
         i4UQ5FDdfrQfVvzwCYTBRoWL6ct6i6niavDD8BVnKXgdSkFA/b1Li+f8eIaM02b9UePh
         iB0iMhBDerNUTnoqyo5XN3niqsOoPRIU1ImUZrpev19xTOuD9nnI0cxry3zqXapeCo5u
         X1/w==
X-Gm-Message-State: AJIora+iYhvAiQLELlDio4Yav7sFREpWE3i3eKGsrdsxlVZ4kK9Yt80e
	RK2B0pkYgsoipkZBI1ZM5KtL7vrHYisDLL6GJ+U=
X-Google-Smtp-Source: 
 AGRyM1s71kWfNJL3iYuUkEiCv6ve9ng/IY8Aw3SGgDjskctAPfQbZtKPElgcGZx2qWRAclWE31s/ZnYRJ/llt3/m2Tc=
X-Received: by 2002:a2e:b7d5:0:b0:25d:5320:ebad with SMTP id
 p21-20020a2eb7d5000000b0025d5320ebadmr12018752ljo.56.1657614987164; Tue, 12
 Jul 2022 01:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220712023708.15346-1-sakib.sajal@windriver.com>
In-Reply-To: <20220712023708.15346-1-sakib.sajal@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Jul 2022 10:36:16 +0200
Message-ID: 
 <CANNYZj9aYaSxkreFGhybKzmeRXt5cd36Lvg_S-tT+adFc6UVww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2022.04 -> 2022.07
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 08:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167913

On Tue, 12 Jul 2022 at 04:37, Sakib Sajal <sakib.sajal@windriver.com> wrote:
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

Why did this change? Needs to be explained in the commit message:
License-Update: reason.

Alex

