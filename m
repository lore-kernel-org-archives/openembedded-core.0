Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F794C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:24:22 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.1317.1659979453430583281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SpTK0zX9;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id u1so13659838lfq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P7Y3Doeu6nF0S6KTbTtPFAZEMAXE3asOyWHy3+s9AiQ=;
        b=SpTK0zX9RbNvCCz4R29SjQSeDYFz7cqKfDUHODcaBHBBWN+XAcADctyaYsTOMlzLRF
         mLc5ezOiFPUx0pzRlLp82VFV5UKD+PM/+Z+AZ7S0YuBeZmTaFsFIYYsH283h706US+pY
         ANx+MK25cvR4tO4K0QIFc2ZXN5GIBFBbeRm1WwfAokeTFQPnZDd6by5uGvogFVapWFyr
         Wi6q0Y6LsXOkx0wvyA5FJZjQexh88Wu2GcOeWgjxjKGhqZ11blUB7iqYRbKfOw60nkCy
         +UoWoayhl76gNBv6SYgq2Nth1J0eyzbk4i/rwj07rSVMGCTpzSRDT3lB5tAL555TjlsP
         viYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P7Y3Doeu6nF0S6KTbTtPFAZEMAXE3asOyWHy3+s9AiQ=;
        b=tB8Bdq96vMUQWOt9hjiF4PS6ZkrLcforYaDjm4YXTZL+b/Umv6E3h6BwHQeZTRbemy
         wose0iO0F4Mqf0hehdQuxUpy3fHGr75PxspAFgknSHgMhrSxkVqhBYvO1JWJC4f/bYnu
         WtXDCti28Pmqsp+5H7BB2cRJE+2jYZJrhsrwasYGbC/A0+NvU/QhwQ2aQAE5Ky600h2I
         FyHGBfnn0sfq5MH82o01CDnVpyG7PdvrEGWhzH48k0yqieUWja3HQKC+43DdNuOo+KC9
         maRT+CfU0IlD5xK28i1BJaopRp5nJz8ByhE64SoURlZH+FZ+Zx06t4WBZpNKSO1mfWJ8
         fU0A==
X-Gm-Message-State: ACgBeo1fYDI2xBRH4jtiZX7fgxtlMVCdhjBWo86BW8p06P6vohKaMgEZ
	WCjwZUkN/K2gjnkgnkBcZXRrbbo3d3KJFwcUIGY=
X-Google-Smtp-Source: 
 AA6agR5MYgzH7uvNf2qFoFPTaIA0mwVm64lkGS7misXH6NF1j5m7ByKV6Rl6myt0xAobBm25BaQH9iwNqW/Cp75Lhjo=
X-Received: by 2002:a05:6512:230a:b0:48c:2e06:6c74 with SMTP id
 o10-20020a056512230a00b0048c2e066c74mr3247258lfu.358.1659979451277; Mon, 08
 Aug 2022 10:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-6-alex@linutronix.de>
 <28454095-adb7-15c6-f09d-5763f5478c87@gmail.com>
In-Reply-To: <28454095-adb7-15c6-f09d-5763f5478c87@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 19:23:59 +0200
Message-ID: 
 <CANNYZj-KL5jjXEOXSiUx-09NBWEE-4q6yXP4deqvn3XrjJ5Q+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 06/44] cmake: update 3.23.2 -> 3.24.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169107

On Mon, 8 Aug 2022 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
> > +LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
>
> Reason for this change would be good to document in commit msg.

Thanks for spotting, I'll fix and resend.

Alex

