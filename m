Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7BBC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:47:02 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.12454.1749142013976675757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ml8mALlP;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23526264386so10884005ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142013; x=1749746813; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXescvVzcu9kdzFJ3RGNqH2a6zwVMIjE2Sr/hOpJD9s=;
        b=Ml8mALlPOa7Sj0673V2FyKtl0VeOb1Qj9U+0hbbld23F3yJw0t5gW67aWmVahbRRfZ
         UvFvH0UqioZN7mDWe0YCSHWU8QYtslYjXL3gkhqhFKbb9TuCjDb9Tii/qeh0TbtYNp1L
         /222Rx0utFm1mor8DEN9sM6IIKU4zKj+NzcILS6VwnRqyQsdsUKIeC+EyEPEe/mKyNVQ
         9o0Nu0ILSmmutvHTwd3lYHxBZxD08OIWu/UDlFHeJjinv/Z64KX5HWDhSTaC6SARx9NR
         dX1JiTYbOk+olAicpsp3ES7fIryjiRzIDv6yuRO/gG2qurIyi1mGPnktb5CASAnGVH2F
         GrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142013; x=1749746813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXescvVzcu9kdzFJ3RGNqH2a6zwVMIjE2Sr/hOpJD9s=;
        b=LT3w7aCZegr5fr2LNOMznE2jd0G9KXT4rpUcELPITTWyxA7/dJVsT1j1ZVhleQYrfU
         8x4ZbfTzbfnnFgWPixmHBVbuc3UpCm07GM7LPoGcJQnwhpYspUvrSlbPoy/Q3K+FjZXE
         M2OK6KyqyYfg/wP+gfKJcQDGW8ejO106qAxpI3C7IVUTVaB3Ca0hIaqOv8qTLYBwMOcY
         Js3lIweLhlIjn4f+1SQnOfUG5LreJBfuehdfpTHQn17Bmwd1rdvgKDQVh23FPsKjgyvI
         OAdGWw1VysTwNV80m0W8fPwprdzmjUOur526723WojpmfF9V/7iPCb9cJKmioY1/wEXe
         GTQA==
X-Gm-Message-State: AOJu0YyRyyEhdJAaz7I+Ldu+ZiX9Qfnhi/pHHnWul8IeKcIPoCRxpZ/E
	WInI4ovw+vXNoJFOrWLXXflwg+Zqx+j5lsZJmIkJFA+D9DctdoZQDd7Wt5PYVqtl
X-Gm-Gg: ASbGncuY259a5LXLJRclM2Uy+/gc6nRCQZkypURm58jUw8zYsPABQz09PVa9njjXntg
	3nCDIQEnAAtgzRgI49GRaxSemfhcXoft5BJyruFwCrtLy/gvmBMYkNxyon6CUrdTYerQYfCYYbZ
	6c/EHpB9fBfHhfUHRRTJC2YOn0YVdINhHZub92pd9/Yrkej3fiNVaxsMLSFckXm3GzYsMmx7WjF
	1HoqJ/+7Awhg+HCUwJgVctZX2sWW/0tDYItpUnKWmPF9zRvvCRyzSE8UzlMow2i8dcjQy43f+q+
	X8mdrwbyVMABa9kWGyax9osBwxvjQ1eCr5q+yACfh1rwuU/kXg6YCQlpe/RNhFxCUpq6Xi3XwdB
	1zj0hgT6KDzd+WPsyjt7LkNMeVMw8aWOxxDlqq/c=
X-Google-Smtp-Source: AGHT+IELupXTC012iPD/X+RPgo7Qvyj1j3ZskANHuqc0xWmuZSAtZweC1eBMZHCtXfrJoi8M8QNgAA==
X-Received: by 2002:a17:903:1987:b0:235:1966:93a9 with SMTP id d9443c01a7336-23601cf6b8fmr989775ad.3.1749142013378;
        Thu, 05 Jun 2025 09:46:53 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:6842:935a:ea78:e087? ([2601:646:8201:fd20:6842:935a:ea78:e087])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be97e5sm121850035ad.103.2025.06.05.09.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:46:52 -0700 (PDT)
Message-ID: <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
Date: Thu, 5 Jun 2025 09:46:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
To: ross.burton@arm.com, "hiagofranco@gmail.com" <hiagofranco@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Hongxu Jia <hongxu.jia@windriver.com>,
 Hiago De Franco <hiago.franco@toradex.com>
References: <20250602205546.426714-1-hiagofranco@gmail.com>
 <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 16:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218077



On 6/5/25 6:44 AM, Ross Burton via lists.openembedded.org wrote:
> On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
>>
>> From: Hiago De Franco <hiago.franco@toradex.com>
>>
>> Currently the libgcrypt-native build is failing with the following
>> error:
>>
>> | ld: t_thread_local-t-thread-local.o: in function `main':
>> | t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
>> | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'
>>
>> Backport the fix from upstream and add "-lpthread" to
>> "t_thread_local_CFLAGS" to make the compilation successfull, similar to
>> what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
>> does.

I wonder if the -pthread should be added instead of -lpthread since its 
adding to CFLAGS and not LDFLAGS

> 
> This has been merged but I’m curious: in what situations does this fail? The commit talks about NetBSD and we’re not seeing this on the autobuilder cluster.
> 

My guess is that pthread check in configure is failing. If we can see 
config.log from build dir for this package we can get a better idea.

> Ross
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218020): https://lists.openembedded.org/g/openembedded-core/message/218020
> Mute This Topic: https://lists.openembedded.org/mt/113436606/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


