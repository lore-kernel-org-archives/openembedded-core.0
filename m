Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11750.1795083900496314653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 02:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=A6QXO9Pr;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so19080515e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 02:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795083899; x=1795688699; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HivymBtqPIc+8Hl/7vfUcCPHuBA9xuLbn+3cazUJZSo=;
        b=A6QXO9Prp5VQIWiJAxDvr5/f4f2rTbiYPWQ09+5MAbydF//ZS2EBhoLjenUkcQiBTK
         LbvI2+rOlCtno0Sc9VloQ6zGIh/XEySUoF+g0LiSSVJyl6QZjjSTYIBMM784pM+doq2U
         t0LP4HFaqvg5ND2vTZSomS4vuwafH2bGJJOkSlgCCGhPV865NMZyV+PfMoIG3++iSY1c
         sAmx/GNr1oKZRh0S515PUXzegx3ZcA/t3J5GP6iXCDupoOuTf9ZbTXs6L9qcFxS486ZL
         NULgTgRCaXyO83pqvyok+R8liPbeLDayx4Vk9TsaXUyyaS+m3fV6jFHUHE28YbOviioE
         rd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083899; x=1795688699;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HivymBtqPIc+8Hl/7vfUcCPHuBA9xuLbn+3cazUJZSo=;
        b=DfhyysFHd/n1WNF+pf/fPgx+PayfqE4nN63HzIuHFZK0EywxPSFPx8LB6wPpk2MEQG
         YByQ+AVpnxVWXMi9gExNhzv/pzJpgqe7LiXSUgwnKPMynz744qch3SaS5dxYHjXJX7Zu
         4/Y3uSIwtwAsS1aZomOfP7B3EmBUcgebb1d2rPo6EQp1luT11fKylyYKvsUiKFv1jVxy
         dUYH7e3FnGphGZENfYhjLY2xxECLYZjIpu68gYzMLVeXfG7KG8nQ9w8oS9Oismkb3Ifn
         vAh9dt54+vSpYVIGNw6EpkVnd0lsZQlKY0ZwdzgqsIX2J9bs8DAzs2UYExs1I7pwXAUl
         R91w==
X-Forwarded-Encrypted: i=1; AL+hErFxkHn+xEKiBzFElwucSKYoYNod4IJSLcP/WI1nZGct/T9KtwaRP8I0xj9Ne/CRZtvvBFBNzb+8CZOsmP37w+tFVA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/ZPGmKTgdeMBWCb2EdbwPBYm97WaTZ7B8WZQS8Qs3R7tKGlSJt
	IuGqSuIJDFb4St27R6x8Cfc65Y88Z7PE7f1bBCMHMxXo72/ZZcX8YQouvsTxIuFDfiA=
X-Gm-Gg: AYBFou0cVb0sh2dJVQHpQM0O6JVV6OoX/0A33PagdYOSYwrbSCgPABPVhvjZWI4i4GK
	uaWhXPxdo2zHsAVisM+G/UpVM+drsw4+S0XbhqwHBnLjtj3lAcMyOByxOBr6CN4C95SEReWONsW
	B09ZRNSDtCkn0haHRuVfj0wvCvnl7NeQ2J/UaWDM4hYnTIfzfR2lTJ7YL00e/5Ry/Oafuf631Pv
	0fgPt73ZX88iPiJ/Lcw/SLuP9jq2wTZoSwewiO9jzlRQ/FfxHzYQRuhT8IJyjgexJd7EKMFqZKZ
	S4ZLFiBvcoXCAXkOGTejbOZStKXpeSHLf9wjG+VUJkN4Kl59bPAacBOH2/6/2ilftLiqeoyWJum
	2Fs7erqJxzzpUe9a1AgqqSBhyf3oAu0ll9gEYyO1MxKHfhBkhNZB+VBwouU9s5G+mPOHSysybWW
	np52JL3+k9ZfPO6Nide1hLjfz6Y+gtsVLocHmMyOVVS8ca5dbcHQH7K+SbgDokNgQTxS9BQBW0f
	O84Y9s4g/lRErePht0uMvo6uVRyHdSmtr7sbt3WF8a9cs33/XAmDRv9Tu7NAo9L9dnpavnHi5zo
	05U453KgjXh1PbDEfJRqdw7wZpG8xMGpD6jO8p6lpBsVSCAyiBJrkQVVE9nP8sgpvqXclyapPZz
	6eziTwKDFqQyBe/8l
X-Received: by 2002:a05:600c:8b8b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb7da19d2emr102043545e9.12.1795083898623;
        Thu, 19 Nov 2026 02:24:58 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm31184135e9.11.2026.11.19.02.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:24:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 11:24:57 +0100
Message-Id: <DMZ44U8O2RR3.3PG16IJMUE4A7@smile.fr>
Subject: Re: [OE-core] [PATCH v3] [wrynose][backport] bluez5: Abort
 continuing response on fragmented CT replies
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <jinwang.li@oss.qualcomm.com>,
 <xiuzhuo.shang@oss.qualcomm.com>, <chenhong.zhou@oss.qualcomm.com>
To: <shuai.zhang@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261111112254.1486896-1-shuai.zhang@oss.qualcomm.com>
 <a4daf280-ed05-4335-95c1-dd0f99123184@oss.qualcomm.com>
In-Reply-To: <a4daf280-ed05-4335-95c1-dd0f99123184@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 10:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250660

On Thu Nov 19, 2026 at 9:12 AM CET, Shuai Zhang via openembedded-core wrote=
:
> Hi maintainers
>
> On 11/11/2026 7:22 PM, Shuai Zhang wrote:
>> Send AbortContinuingResponse when a Get Element Attributes reply
>> arrives fragmented, as the CT side does not reassemble fragments.
>>
>> Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
>> response on fragmented CT replies") to bluez 5.86.
>>
>> Fixes PTS test AVRCP/CT/RCR/BV-03-C.
>>
>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>> ---
>> Changes for v3:
>> - Remove Simon Mikuda's Signed-off-by from the recipe patch, as he did
>>    not sign off the upstream commit
>> Link to v2: https://lists.openembedded.org/g/openembedded-core/message/2=
48377
>>
>> Changes for v2:
>> - Fix subject prefix to [wrynose][backport]
>> - Drop Upstream-Status tag from the commit message
>> Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/pat=
chtest_results_for/121863269
>> ---
>>   meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>>   ...inuing-response-on-fragmented-CT-rep.patch | 62 +++++++++++++++++++
>>   2 files changed, 63 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-=
Abort-continuing-response-on-fragmented-CT-rep.patch
>>
>
> just following up to see if there are any updates on this.
>
> Thanks,
>
> Shuai

It is part of the current review series:
https://lore.kernel.org/openembedded-core/cover.1794939400.git.yoann.congal=
@smile.fr/
... pending negative reviews, it should merge tomorrow.

PS: Checking if your patch is in the review series is a good reason to
read those.

Regards,
--=20
Yoann Congal
Smile ECS
