Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1615D16245
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:22:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.52564.1728904958134971725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I1SmFfm1;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431195c3538so28127905e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728904956; x=1729509756; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cP3yjDA6BMsweQDTvhQ97CZXCQ0d8HDxjZJXVbIqQaw=;
        b=I1SmFfm1+ZKB7U1tPFgI3hmqErVqzhsJVS/jXUYyiZrK8UVfUtU0NnGfs55EAq4erw
         6I6XcYYj8LpmdfBfW7OMN5KuPj2AMpsZQXdcTtm37P0y5Vc3peQCPa/m897T1aYRjzLv
         Hvlc+2A+CThh2puUlo6iwAGO12CrUlvrKrQKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904956; x=1729509756;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP3yjDA6BMsweQDTvhQ97CZXCQ0d8HDxjZJXVbIqQaw=;
        b=Nj7/uqqAMiczpdaE0YPq0t1y1tXSNG9lhU2Z3EWi+2ExlJpTxcVti7SffntkuPU88y
         qWZfuGVW2khOENwDM2PxRDZop5Y7Ynud7ej293KKRUwE3X3gS5fq2r6G06rMYgTRy6KR
         gx+6/ePdt4mntvE2R9XltNrt4Pn+xg2d78LVoIj7Tz2J1/BcxSmB0bVJqnyW+0EBsbvu
         b1/MwrVXXj8ML8hwTWKV2CJMvZpMKnCZJJDHzITAJ5XtjD/Z53ZrL89Sj4d86rHUYd0z
         TIYuQ0MSDikPbZIufMjInF9fwJaOa/TxJtog5H+XvHCbOXANoJHw/Z8lacOmnyxM4YQk
         m4FA==
X-Forwarded-Encrypted: i=1; AJvYcCU+N56Q2CQX7jWgTwevODG3ZB3VbpxIFyxXvJiQ2JpmPVGVDNWDQ/stFpDEKkS6g+WnbfHRfkMZ0CAIcEThlHbeXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnILQGWtaWHUGHopbZWmlWLjrhcvPe/ygUsTBfY6M/yVVha1g6
	UBUBP23SYVk6By7hU7t5kZ7HyDLzTYUDrPRcVx2dc6Cq46zbvvzcZiI4QItjPgs=
X-Google-Smtp-Source: AGHT+IHGnRhYvkK/DvnZciADh6oC42TVrHNvzuTrH8jFCtxBXRso5X7Q3XbIakgh6EMaPJnl6EL4QA==
X-Received: by 2002:a05:600c:1e18:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-4311debbc74mr108956275e9.5.1728904956441;
        Mon, 14 Oct 2024 04:22:36 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ffc51sm117896765e9.15.2024.10.14.04.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 04:22:36 -0700 (PDT)
Message-ID: <b0778cf2-cb73-4f29-bd6c-474f23639844@smile.fr>
Date: Mon, 14 Oct 2024 13:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Tim Orling <ticotimo@gmail.com>
Cc: Tom Geelen <t.f.g.geelen@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr>
 <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
 <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr>
 <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
 <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205754

Hi,

Le 14/10/2024 à 12:42, Alexander Kanavin a écrit :
> On Mon, 14 Oct 2024 at 04:00, Tim Orling <ticotimo@gmail.com> wrote:
> 
>> Yoann and I were able to figure out a promising fix for maturin which is the root cause of the reproducibility issues. It needs a little more testing and rewording the commit message before we submit upstream (I mentioned data.tar which is a .deb thing not a wheel thing)
>>
>> https://github.com/moto-timo/maturin/tree/sort-records
> 
> It's a bit more complicated and I thought I'd document that. There are
> three separate issues here:
> 
> 1) Maturin creates a .whl (zip archive) where files are listed in a
> non-deterministic order in the archive index. I'm not 100% sure if
> your patch addresses this problem - does it? Are the files supplied to
> the zip writer in sorted order?

We did not address this point with the patch, if that is fixed, its a
welcomed unintended side-effect.

> 2) Maturin writes a RECORD file into that same archive which is as
> well listing files in a non-deterministic order. This is certainly
> addressed by the patch.
> 
> 3) python3-installer takes the .whl from maturin and processes the
> files in it in the order they come, then writes out *its own* RECORD
> based on that order, discarding the RECORD from maturin. So it
> implicitly relies on the intermediate .whl being reproducible.

Ok, I did not know that.

> I've fixed the third issue [1], and it does fix the reproducibility
> problem in the actual target install of cryptography. Installer
> shouldn't be trusting that its input is already sorted.
> 
> [1] https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch?h=akanavin/package-version-updates
> 
> But the fix for maturin is of course is also welcome.

Awesome, then the python3-cryptography 43.0.1 upgrade should be merged
after your patch?

Thanks!

> Alex

-- 
Yoann Congal
Smile ECS - Tech Expert

