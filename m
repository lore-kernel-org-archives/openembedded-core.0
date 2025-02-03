Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A2CC02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 05:17:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.81496.1738559871741031491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 21:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGdNPkVH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso26590435e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 21:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738559870; x=1739164670; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udv+4574V1AWrR8ZHq8zjqdug4A0tY0az480GvKrbPw=;
        b=BGdNPkVHbhot5Pix6iXUm6p/sLGiJ7U+YI47cDUFlGHiGlTniJ/AID+ufHnqMzGyLO
         fBPEAI7TxVs4DlXYa3yCjFSBX1YPTmPZXaocWJwYy3prdSMUKUgN+M/zv9GUcdZG5tUE
         k14PhliGYFWDE4V6OrB09xmMM3f216NGWB9jXij49rQbTrSWhepwgZU67XGgrGedmbI3
         L1d2vkPWryUSQA2+hD4qUVdfL1gyUdfeVzbQhTyrfOIhfuNUATY23AMveaU9ll+i9ZNI
         mdWL8G1w48JDGEd/L47f9LG0fAw4ku9HL8T3GelyzQBLcRGVobx6NRMNzlHaKrAu9CIz
         WgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738559870; x=1739164670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udv+4574V1AWrR8ZHq8zjqdug4A0tY0az480GvKrbPw=;
        b=VsrGjc1FQCXVajB0ZzyP1yj87jxY8/ty4kCs+TjnlA+2DYqjv3Uw3Z1ZBrnprjvAk6
         qKO7Xz4fnPldMi4tuE8v8+ZZjOvPCbACnvA7M13cCuqwKR6mD6ZNkRDkRx04cBFZXAWz
         hEm6QoxgF7g13EY9oyO9aRMaqPa8z9UnHjlOkvCIZzuGEmCxuO3iqKSWFQQRVEqEzlM7
         vpfHZoJZH/aZgacyXbjkaadj/+lhscGM6HOag7uVO3Q6ZhUsyNmdNTsEuWNh6krIghQ4
         Gk9sx1Ztloa2a1zUo8ExPcxe8b/V2XvwwxmekL4AGtKE3lkft/R2LLazgCRv8qhF3urw
         OURw==
X-Gm-Message-State: AOJu0YyUuK3AAELzBgdw7/zMEQg9LYdO8RuryJ16sYa64wsxUYY8zVcx
	TrpfrwVf8eiTfxzLDk90GptUorXZZtkpiWL366bGFRR9ZAUEl/VM
X-Gm-Gg: ASbGnctdTQFl2X2bbws0On92K2J9rgW6qIKZkNMbRUKhHshCsKLTHdd7ljQePXPMQT2
	pLlxQVF6LPq2WqX0GbD30kszy54UvJGv5aHz+nBY4r+tSxrWIciQhc43H4ATcsZdX1ri9NP5ev9
	yx5AbOGiiyeRaWDZrJzS8cBzSLfp3l/aotbDPB7r1IdoiwPB5AnRNbqxGgb0HvZP7ts5QctV+6I
	iCgaaoxKClntHSZ28B/R8haghzO4OE/kKcufJpLO47td17JRTFfdSjZpdhfBMDtwd5M9NiCTsMq
	tkq84ZS7taxqjndBFOJ3VwrV6GBNQ5txOcVtFsrPoRdgiZGD
X-Google-Smtp-Source: AGHT+IGQOhCKPjrcbW2F+fBd+KQB3E4lHQzUpqHX1NcWd82JnJMrTruY7I7JTvdLD9kulClIEIrtUw==
X-Received: by 2002:a05:600c:a45:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-438dc40cf15mr158296455e9.23.1738559869959;
        Sun, 02 Feb 2025 21:17:49 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf896sm11959201f8f.94.2025.02.02.21.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 21:17:49 -0800 (PST)
Message-ID: <048f3048-f9bd-4299-a92c-1696eaa7bb3f@gmail.com>
Date: Mon, 3 Feb 2025 06:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: dbaryshkov@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
 <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 05:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210630

2025. 02. 01. 12:37 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
> On Fri, Jan 31, 2025 at 01:59:14PM +0100, Alexander Kanavin wrote:
>> On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
>> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
>> wrote:
>>> Upgrade the Mesa package, dropping applied and refreshing outstanding
>>> patches. The dri3 config option is now gone, dependencies are merged
>>> into X11 deps. The swrast gallium driver has been split into softpipe
>>> and llvmpipe drivers.
>> How was this tested? For me it fails immediately with the same error
>> as the previous update attempts:
> Yes, I forgot about the Intel world, I was testing on ARM & ARM64.

As far as I can tell, the libclc dependency won't be needed for Mesa 25.0
for the Intel iris driver. It will still be needed for Rusticl.

>> | Run-time dependency libclc found: NO (tried pkgconfig)
>>
>> Basically, mesa updates are blocked until clang lands in core. If you
>> want new mesa, please do help out.
> Is there any work in progress? The latest attempt I see was made in
> November.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210505): https://lists.openembedded.org/g/openembedded-core/message/210505
> Mute This Topic: https://lists.openembedded.org/mt/110914607/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


