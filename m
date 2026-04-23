Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DA9F99340
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:29:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14480.1776929373416626059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N6/kySFk;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so37863625e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776929372; x=1777534172; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7cGAAGeH0MXPShHq2fKf09jHv1XlKDlMlfFTCfrIos=;
        b=N6/kySFkAT/eZ2Tk+8Rd5qe0h8ZmeeOjrQuPsgrkqXpXKaJJ3xtsMX/EGffSBrKAsR
         FPt4bDczwe1RYXuLYDjHT2nhGRVe2kzOCbeLozEwS6zzCGawAk2qTm+xRIxhQoa1+WDK
         TDJHa244QB6VpX0GdjJN9heeyyYgrC2DYXHMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929372; x=1777534172;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7cGAAGeH0MXPShHq2fKf09jHv1XlKDlMlfFTCfrIos=;
        b=jrRZpS7Y2g1rQfFDN1s10fse1SqPoChdt7oVHqzemRnRcRZYZWxHY1PQgLCxBKIJvi
         /s1NF6OVDFcssXCm+6N1RDYriaEVOjIDtmwKDY2GF5rLo4E/zpbZ/DsApNqOnioRb2oj
         xPuUMPGzC+6Az/tsOMP3sFDuWcPLtCH8DR8FAZohHEpnTaycymFkFZdtdDswio8yD2iC
         Z/LgwEEN+qnZoDXyAKXonPEDbkjlhj41sjmfm3iDruZp06d2ixlk8f/fuDqiah0NgM7Z
         iDxrIblK2t56muY+N1IOzn8K9/PBlLLZ+UebpdHaY6fxbsRUDHggBm4GJrRDzOTaH4r8
         sZ0w==
X-Forwarded-Encrypted: i=1; AFNElJ/3bEPpWfzWTpV+hoJrjgiKtSZL7Dehc1DeBQBI4erST60dI0IWpi6EqCeAymg8IBaU7Vg+tQsTRvmhVk0t2a8j6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyvz4cdSbqSZZsmnItobEncatuVkzdkSN08fVOAnuWPZqt1Vlk9
	F/nmuSyV9tXHUbAwvNfctxXYLuhNPjxMlUUb9QXvappjIU01hIDqktn1kYO1hN9oT98=
X-Gm-Gg: AeBDievT8jes/NvsE00u/F2TnXGkhKd1a0D+MuLmWrHtnz+LeP5fRKEHH2x2wHNC2Qn
	AgZoaD8+pXR899Ivmm8oTvdi7ZsvXmner8Uvcqlk3GXuQ4PXucX5oM0jIJrGHtrzhYHNDAXbRMV
	sdM6XUX/xkSxfXUpExRCx/H2NqmVTIuqqayJHpWmo+KbUQVnT5utM1M24BQIcFcQSFFd5VSPvvI
	7vOhre0dLBQJnj6+XpMXt+fuRy5etA/tOS3gRmXpbRSNlfQri1/FCMEUagehHPK6aHZsvqdL05p
	MXC7ZfuXn8iOv+bvPmudfZIXA5N71fv2w9Egsje4aJCqD1u4gyRnezEMYeEjJPUgwUAUM2+g89l
	85NV/gMhdyXILdPwPYyk8w0BQF88T5B0zPLeYjEYnT3Ifn6vdSkzSLfp7gHxgeq54Po1JKrm016
	LIYSWj43YF8Bnsq+5kBx18OBsXUQcH6PFoVkLBhat/n0cm95ntnUnm0he7K9F8LJvKFEqHdEdU3
	2lO9CXZVMVFllqpUCHi6MhWrw==
X-Received: by 2002:a05:600c:a08c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48a563cd176mr141494185e9.7.1776929371653;
        Thu, 23 Apr 2026 00:29:31 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm469286905e9.9.2026.04.23.00.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:29:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 09:29:30 +0200
Message-Id: <DI0CW3KSBR0U.2DMG7JRXV5QFF@smile.fr>
Subject: Re: [OE-core][PATCH] grub: update search parameter
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, <arindam.nath@amd.com>
To: "Xiangyu Chen" <xiangyu.chen@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
 <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
 <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
 <95988640-2fa5-4e41-a980-2173af637eca@eng.windriver.com>
 <DI0BSP6LTXLQ.3H9BKWL7KE1YY@smile.fr>
 <88dd3787-7e07-4016-8bd2-529772791df8@eng.windriver.com>
In-Reply-To: <88dd3787-7e07-4016-8bd2-529772791df8@eng.windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235747

On Thu Apr 23, 2026 at 9:18 AM CEST, Xiangyu Chen wrote:
>
> =E5=9C=A8 2026/4/23 14:38, Yoann Congal via lists.openembedded.org =E5=86=
=99=E9=81=93:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Thu Apr 23, 2026 at 8:04 AM CEST, Xiangyu Chen via lists.openembedded=
.org wrote:
>>> Hi Richard,
>>>
>>>
>>> Since the behavior was found in OE scarthgap branch, could you please
>>> help to cherry-pick this
>>>
>>> commit: 42b530581f72 ("grub: update search parameter") to whinlatter an=
d
>>> scarthgap branch?
>> Hello,
>>
>> For whinlatter, that will be too late (the last build has already left f=
or
>> QA).
>>
>> For scarthgap, I would need to look into it (change does not look
>> trivial). Can you send a rebased patch targeting scarthgap?
>>
>> Thanks!
>
> Thanks for your info, a rebased patch will be sent later.

Received, thanks!

I will consider it for the next review cycle.

>
>
> Br,
>
> Xiangyu
>
>>
>>>
>>> Thanks.
>>>
>>>
>>> Br,
>>>
>>> Xiangyu
>>>
>>> =E5=9C=A8 2026/3/31 10:57, Xiangyu Chen =E5=86=99=E9=81=93:
>>>> Hi Paul,
>>>>
>>>>
>>>> On 3/5/26 19:49, Paul Barker wrote:
>>>>> I'm not sure that this can work for all use cases. The grub
>>>>> documentatation for hints says "First try the device HINT" (i.e. it's
>>>>> explicitly a device), whereas the documentation for cmdpath says that=
 it
>>>>> is "an absolute directory name".
>>>> While the documentation defines $cmdpath as a directory and hints as
>>>> devices, grub=E2=80=99s internal implementation of
>>>> grub_disk_open (grub-core/kern/disk.c [1]) is designed to handle this
>>>> exact "device+path" format.
>>>>
>>>> When a hint like (hd0,gpt1)/EFI/BOOT/ is passed, grub_disk_open calls
>>>> find_part_sep to locate the partition/path delimiter.
>>>> It then uses grub_memcpy to extract only the device part (e.g., (hd0)
>>>> into the raw buffer for the disk driver.
>>>>
>>>> The remaining string (gpt1)/EFI/BOOT/) is passed to
>>>> grub_partition_probe, which identifies the partition and gracefully
>>>> ignores the trailing directory path.
>>>>
>>>> The current syntax ($cmdpath) results in double parentheses ((hd0...))
>>>> if the variable is already populated.
>>>> In grub_disk_open, this extracts a malformed device name ((hd0 which
>>>> no driver can open, triggering a hard no such device error.
>>>>
>>>>
>>>> Ref:
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/grub/grub-2.14/source/grub-core/kern/disk.c=
#L192
>>>>
>>>>
>>>> Br,
>>>>
>>>> Xiangyu
>>>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#235740): https://lists.openembedded.org/g/openembedd=
ed-core/message/235740
>> Mute This Topic: https://lists.openembedded.org/mt/118009422/7175143
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [x=
iangyu.chen@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


