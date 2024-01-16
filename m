Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD83C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 10:05:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9929.1705399537836191650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 02:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZQkjRYSK;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e800461baso10816265e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705399536; x=1706004336; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fttAHgMDN1J42dH2WUuRBE76wgUDhr78fdBoSC0R/Q4=;
        b=ZQkjRYSK/XJSdzjaQulhhu7EbrkhimiEPpQGsH7cxGi1r3/HO9HEk0LAOAB8KpEVlM
         p2HFeiff1BeFS6XZkHtd3NAfkby/3LDVZUwN+nI/g5imcPWqeyQaLEvTPEyIf+/8OZqz
         3mlxGCf7EOJH1njUFnoCRQWMrqRsXSZLEEralpeB5DWd/y5c5wql7oAkYUVFQY12j4P2
         EAirjAmqoaNKazsscE2rCKXzZ4LPMtE5PFJ2+l4B9ZbFiiE1apBpFLsenfkdvEfzUtzJ
         DoABbQHUOjUczCQYu4JHX/P/b1cZXSgpV2fGwBkJ0NqSetBDs6H55j5LylpRaN1JMmDd
         0d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399536; x=1706004336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fttAHgMDN1J42dH2WUuRBE76wgUDhr78fdBoSC0R/Q4=;
        b=HLAFpWGeBPmfBwG3QNFjoEV+cooRSceqSGEaHjxIpyPoamKjctmOYa1Xvdn6s3n4pP
         AXZo/G7P76GxdqTAYmk+mMykCURUvlt1hv7JKA2pzknXs+jI85fifRXSM1yNf+TQISuP
         3kTP5tBRAx6hSn5gIe1dVtXdAexY8AMzJR3zQhgid7PA3RrSICyRHqlh+9MirJTfaZgq
         BUczUDKxhB5W8kumeabZrP1ZWr0Qz4iQ0+t9uW5bHsnpvrVzW/7ksUQQh+hRn9gi4JKU
         zvCAK4JSnajWnFGTVugwliq6TISjTrTvLf0Q6mh08NBIXzPj1odXLLZR8ghoO6yCMqw9
         3kkw==
X-Gm-Message-State: AOJu0YzERdiNCGvJ++Iua7aJMtUKTNzA3jYFBFpntyutkrDzsdmPVcFO
	MKuCkbvFbxViIsGzwt2G6Fk=
X-Google-Smtp-Source: AGHT+IEOvBYzmtZ+rmOy5oHhu0bfdsICqULY+7HW6Fycp35QWBF7fh3HwB2vfTIRsUi+5hUy5YV57g==
X-Received: by 2002:a05:600c:253:b0:40e:70f2:5754 with SMTP id 19-20020a05600c025300b0040e70f25754mr1083208wmj.250.1705399536004;
        Tue, 16 Jan 2024 02:05:36 -0800 (PST)
Received: from [10.139.3.237] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c501200b0040e77ce8768sm6891009wmr.16.2024.01.16.02.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 02:05:35 -0800 (PST)
Message-ID: <cc8df8ea-e8c6-4190-a02e-9ffcbfa7ab0b@gmail.com>
Date: Tue, 16 Jan 2024 11:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2 7/9]
 oeqa/selftest/recipetool: Move create_go test to a proper class
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: patchtest@automation.yoctoproject.org,
 openembedded-core@lists.openembedded.org
References: <0101018d1172d8bd-cd6ef52d-0c3b-4f2e-9b9a-a06b4234da50-000000@us-west-2.amazonses.com>
 <553ec677-73d2-4595-a113-304f269918a5@gmail.com>
 <CANNYZj_T7xfJy51UaB9UVaB_S-ZM=UHNy-7Aqu2akAyd+P4syw@mail.gmail.com>
 <20240116092834f19a1e78@mail.local>
 <CANNYZj90_-6AssGQLxc7tAqT24KDBMB5NPNpsD3g-XLOXc1sGg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CANNYZj90_-6AssGQLxc7tAqT24KDBMB5NPNpsD3g-XLOXc1sGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193848

I also have the same opinion. What else am I supposed to write in the 
body if it were merely a refactoring (function moved, renamed, etc), and 
it's already described in the hearer?

Slava

On 16.01.2024 10:32, Alexander Kanavin wrote:
> Because making it strict would only result in useless noise in the
> commit logs. It's entirely valid to have changes that can fully be
> described with a commit header. I see it as a notice to consider if
> the commit message should be added, at the discretion of both
> submitter and committer.
>
> Alex
>
> On Tue, 16 Jan 2024 at 10:28, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>> On 16/01/2024 10:08:50+0100, Alexander Kanavin wrote:
>>> No.
>> Why not?
>>


