Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB27C4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 14:14:56 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.30011.1665929693307561879
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 07:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nNhcr96D;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g1so13905702lfu.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDGFNpyfzFN7Youd7nth5nqk80/ueRVA4xB1uSTIwfM=;
        b=nNhcr96DGalzfhFw7onXM3IFyy/GDNe5WrF4ZjWggutEIcF4MNhAS3n/Zs+e2t/8cH
         Qe9OjrbFH9reJnUdD430k11yUS5jXzkzGwXoDydxHXYLyU273hRp40/zkCsBe6AR0Idg
         d3PXJyDEFKzympvUXCEkSfz3nle8kKdodxvtDc9qz4aiwQNWfgCkgD1Ac2xPRe9H8uQH
         o1pe8DSNMW583XVwMiHqZbCu2xVZsUxfhbbRiTb1Wh7UfZY9umCcAsLSdBBlOl38f6B/
         TceHgI5oOI2uvnjwkRlHEZ8K6YnCcukQe/VwFrwFAns1DIEHO0XEzXkR16xEqchpcxTk
         jXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDGFNpyfzFN7Youd7nth5nqk80/ueRVA4xB1uSTIwfM=;
        b=unVRcN6IUwx5jd/bxsq0FOVH3wUav5avHjLc2yesPAGMsa86OMBXd5s1nTz7yfZ7bz
         mEongt4dKQ252vu0GpE5fIJpowCw7XDYrjYor0ni4wn+gYBSKxEXuMw39awiSIcBFVeC
         y/UkHRhGaTvEWirYsq3e1ZIChLWsUNH+f4JFR3qqKcAH6deOJ1/wD98sk72/mVZiJZlY
         s16lpwkFl8dEhTdDMYvbeuRO4I9gWw2cu6DWsCK8IsSQrp6/20HdjcruI/gHVJPqXPs9
         adkeX1oEq5fwWb9xL9LsCF53dEFww8lYfCvoIJ0APNp03KXDW84YSUhCeMoI8vAUoFiZ
         X8SA==
X-Gm-Message-State: ACrzQf1mqbIo/15bWkSdAbHr9Nhebz7Aw+3dfdJ/Okp/PttYPldvRke4
	0NOhBht/mj10k0TD+t1Vnyc=
X-Google-Smtp-Source: AMsMyM4L70SJJbvkSx1bga2SWT19dWJ594GPUuWf7dY5F0pRPROqBv/XTWSSf3VXxX8anU51V8edZA==
X-Received: by 2002:a05:6512:2350:b0:4a2:4e8c:79e7 with SMTP id p16-20020a056512235000b004a24e8c79e7mr2150009lfu.264.1665929691272;
        Sun, 16 Oct 2022 07:14:51 -0700 (PDT)
Received: from [192.168.10.143] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id d11-20020a05651233cb00b00497a61453a9sm1065538lfg.243.2022.10.16.07.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:14:50 -0700 (PDT)
Message-ID: <9536ebc8-dac6-3e93-fd6f-d6d804e75569@gmail.com>
Date: Sun, 16 Oct 2022 16:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
 <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com>
 <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
 <38f702d0-1b86-9612-e431-a43fcf960c4f@gmail.com>
 <CANNYZj-wE01Eei1eEHOoywngiBO6Sgp_gp3fLxDQEFYAzuPE6w@mail.gmail.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <CANNYZj-wE01Eei1eEHOoywngiBO6Sgp_gp3fLxDQEFYAzuPE6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 14:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171899

On 10/16/22 14:05, Alexander Kanavin wrote:
> On Sun, 16 Oct 2022 at 09:56, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> I do think it is reasonable to ask for not being mail-bombed with
>> machine generated emails.
>>
>> I am asking for either to:
>> * put them on a separate mailing list
>> * merge them into one email
>>
>> If keeping core updated still is "Alex's problem" then the AUH emails
>> are not having the intended effect *anyway*.
> 
> They do help, just not to the level I would like. They also provide an
> easy way for someone who is not yet a contributor to become one,
> particularly when AUH did succeed and produced a working patch that
> doesn't need manual fixing. They also make the maintenance problem
> known and visible. Sweeping it all under the carpet as suggested would
> make the situation worse, not better.
> 

Don't put words in my mouth. I gave two alternatives, not to sweep them 
under the carpet. A third option would be to publish the AUH results on 
some webpage and post the link.

> If you do not want to mix those emails with those written by humans, I
> trust your email client has a filter system. I still cling to the
> belief that you would want to help the core, and only personal
> circumstances prevent you, and therefore this filter will be set to
> put those mails into a separate folder instead of deleting them
> ouright.

Fine, I'll setup filtering to forward all AUH emails to the trashbin then.

Jacob

