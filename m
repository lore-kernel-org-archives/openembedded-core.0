Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D87BC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.1584.1639590011162376074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCd3W3Eq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id o14so17073302plg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:organization:subject:in-reply-to
         :content-transfer-encoding;
        bh=6panpb6pxyd4C0umN7kMtLJCZ+9Cm1sWdNxsLXofr3g=;
        b=UCd3W3EqyFtrPCm0bypt/pG6VszrJmxsW3NVoqYC0N9IQp+anD1KuqvMYT4dxaYFRO
         1napgTFlceSYYuNvaxW1VwazBkVLQn13rokWLiXojjNVB3kYm81KV20Rci4wXUAph+IA
         J1Hg8wWFUHVo7/zSYvHJjkFhaktCj3oqac7NKL+JyegCYUX05LLE2+k+1wRllt2J069a
         jMTUIN3Copg1iUYTpFFicRB5e+6BuwzA8NEyx4x3jkWAQRmKq3dv81+HlxNuM+w/ZjMk
         gVEpfuk2x7MI2GfIWGe3qbCa/C1iEso205w7Gakz6OBFKk+EQdEFGP+qMAp8mvBnBzkd
         FTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=6panpb6pxyd4C0umN7kMtLJCZ+9Cm1sWdNxsLXofr3g=;
        b=g6lMwrNleyykAsKcFDtQvzIf4Cj0uJ3jAZ0NcHI0RL9jSphItESAPf9Jt6DSzVuEXV
         LTombeCDrZyukllAVqUzyvj1mTsUllvcTX7cXVnLC4zS6HBQyuui4elRFR0Yg1l9F+Fp
         YLA2cBfS+6YH7UhbBpSGYaVYM4zaklAgActWGuPWxsIc/5IzNgNMQTzOVhnR81OKumLv
         z5J8puYmw/Teedijvt6GOOtmE1S3E3Y1C4Y3Qi0iFXRXZM6tlsizFpX80wPTY/vgPmuG
         ZuiLNpsz2qjF3equ9SlVfOjDp1/ZvdUH5KpDbU3kl9AHXI+zoXZ/npS81Q988fgqNCWE
         bSIA==
X-Gm-Message-State: AOAM533ILJUH4h/A9rbKdulOdUxxjf2mBUDdTWiCrgWGRRaKbOz8VxGg
	qsVH9/E/BR6pjNB4HKoXK3s=
X-Google-Smtp-Source: 
 ABdhPJzfGB8WZrop95mNGYx3q+0PUzcZ0ZAedldrgwpY4uz1K2UO8+mu5fcV/Mb6JHEbDfRVOXI8zw==
X-Received: by 2002:a17:90a:880a:: with SMTP id
 s10mr933012pjn.214.1639590010632;
        Wed, 15 Dec 2021 09:40:10 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:cd09:406c:9104:34eb?
 ([2601:646:9200:a0f0:cd09:406c:9104:34eb])
        by smtp.gmail.com with ESMTPSA id
 d20sm3258855pfl.88.2021.12.15.09.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:40:10 -0800 (PST)
Message-ID: <12b73e8c-d4b7-d8cc-0c1f-425c045a95bf@gmail.com>
Date: Wed, 15 Dec 2021 09:40:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-3-alex@linutronix.de>
 <CAGgRHJpbpit-O5dRs_ytafLgk8cOb4qReACeGDaB2sk=jB+qWQ@mail.gmail.com>
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 03/26] meson: configure and use generic
 exe_wrapper
In-Reply-To: 
 <CANNYZj_eCMyQYHhx7uhZ34NTGekeWAwcGSPCvE1P-tO5wLhp8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159735



On 12/15/21 6:52 AM, Alexander Kanavin wrote:
> On Wed, 15 Dec 2021 at 15:07, Matt Madison <matt@madison.systems> wrote:
> 
>     Inheriting the qemu class unconditionally causes task hash changes
>     for allarch recipes
>     that use meson (e.g. cantarell-fonts) when MACHINE is changed from,
>     say, an x86 architecture
>     to an aarch64 architecture, due to the qemu bbclass referencing the
>     OLDEST_KERNEL
>     variable.
> 
>     I'm not sure of the best way to fix this; doing an overwrite of
>     OLDEST_KERNEL in
>     allarch.bbclass as is done for some other variables might be OK? I'm
>     not sure it
>     makes sense for allarch recipes to reference any QEMU stuff at all,
>     so maybe splitting
>     all of the exe_wrapper support into a separate bbclass that is only
>     inherited when
>     EXEWRAPPER_ENABLED is True is better?
> 
> 
> To be honest, I have no idea why passing '-r OLDEST_KERNEL' is there to 
> begin with. It's very old code which I didn't write, so maybe you can 
> submit a patch that removes it and I'll give it a spin?

This option helps detach host kernel version from what target kernel is, 
many architectures requires newer kernels as minimum kernels due to them 
being new and stable ABIs for them being completed in newer releases. So 
if one built aarch64 on really old distro which has kernel < 3.8 then 
aarch64 binaries will fail to run in qemu user mode complaining about 
too old kernel.

having said that, since then qemu now defines arhitecture specific 
UNAME_MINIMUM_RELEASE and calibrates  UNAME to UNAME_MINIMUM_RELEASE if 
QEMU_UNAME is older which means we do not need to set it explicitly 
usiing -r option anymore.

I did however found a bug in qemu where this value was not set properly 
for riscv32 which I have sent a fix upstream.

Lets try dropping -r option, I think it should work. Good test would be
building qemuarm64 on a build host running < 3.8 kernel and see if all 
builds ok. or qemuriscv64 on hosts with kernel < 4.15



> 
> Alex
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159726): https://lists.openembedded.org/g/openembedded-core/message/159726
> Mute This Topic: https://lists.openembedded.org/mt/87494764/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

