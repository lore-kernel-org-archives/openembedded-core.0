Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325B7E63F04
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 17:01:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1967.1771174872255680874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 09:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fktbrCht;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so13111655e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771174870; x=1771779670; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsDCCfsxJM3VbbsS0nmE9sV3QG6g09IwLaZPhJNXt9c=;
        b=fktbrChtsxlCrVFa6fsXSqNYAFFtP2BLsXO9IjSPDnFRlrbB3KVFLoH4KWpbF22kmG
         ImotMNsNp6BxQ8cYiXTIFit8VFKeac8MiVEwLQgK1qunSQZ8tSOP7AcRvo2GWaCVYUyW
         T1b1OBOQLGvAYClblROEbtL5MEQ6RcP09EvjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771174870; x=1771779670;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsDCCfsxJM3VbbsS0nmE9sV3QG6g09IwLaZPhJNXt9c=;
        b=FWWLNnm7v3SJIDcavh/4bDC0i2Feeq45kzZuxEW+ZxFxESqu8B+8YAw109fwLIFKxi
         auvYfc2eAnuE7ZorMGMKnmE7spUPsajNQ6Mk4nULEf1zdtnxvgnwWy3bZfEYIOwqFlWN
         rENCseS64Gz4Ds/Y5UEt3wN4M4KKdsn5/BLrYyBY4gGCYgPTKYMcBtFg4oLe2MVVMY3q
         3oajdWoUPmM38KTlaa8uRd0PLOB7BIwQ9yyq7RGJcMVf5L01gfLlyKXYbpmmb82dd1mW
         1/h5GVLnznY7FjAl5rd/7omyV8HibpCCMVzp8iBpRNQ1R6W0Cgu3HMMEuAYKe3Dl6zCo
         lu3w==
X-Forwarded-Encrypted: i=1; AJvYcCVXjlwPAgfdAcj0RoOgBGzi+vGlHxD2qmEKXu2dj8UDv69W0cVMjAUoAyxnMeG4McRQZ3CETYV1aK/7zErfz6a5Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwulSIbniFChj9kAdrjBjuTaWADNUAxoXN0SH8Mwa7S4XBcW1Xu
	MMRTzABaZUb9UmCBbPIgKVFlQ2ss1IMhmTparCmBNPJm9B/Gijzg9rw4HPkrWpw6suU=
X-Gm-Gg: AZuq6aKWqM2BxtBQkPy/ozgfIHabul9E6DmgPMMNqJD9FDKlX/lEzmHWlC5kgKZ8KXH
	m/9gTAYs80axKH5VeaaI6qhuBtnaEr6XC5M2fqPncUNC3dEx23QV8BKyqF3C87ABSGOaz2MSDlj
	b+Vl3r4YNr4uBKAIW2wQdStgTcpzPPq5B8KlQkmInZbEtjF4RWW6POggJO6a2wn4j04BgM1iIFc
	hdDifcNf4keu3b8INiKsBAATWwFUZosSQe2thLJsk6z4klMGbrSJG9N1zMTOM6H4/AIXNEwRd5o
	p2tz/rKZWMDgRGH16JjCz2h+d56yzPCAol7tIvvqW5xlag+9/HjYoS7uTBnNJ0EexHQqEWlC+HL
	Qv6dkTFyipSXZ93xoAqSrFts7hDzC3M2up2oF+zDv/LnklLCY1QeLabIaMlveTJpUkethHUvr9a
	fK2IBdf7QMpIGtrrK8HkG/Xj7+H8+UOO1w9THhcQ7GRkfxhlr7jEK2UHNtlgycdTvHaSw21vCnY
	1vdQOzmCyQEMNlC
X-Received: by 2002:a05:600c:3b93:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48373a02c73mr162855615e9.10.1771174870412;
        Sun, 15 Feb 2026 09:01:10 -0800 (PST)
Received: from localhost (2a01cb001331aa004f0e69d34802d536.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4f0e:69d3:4802:d536])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483740be167sm180504665e9.15.2026.02.15.09.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 09:01:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 18:01:09 +0100
Message-Id: <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add
 test for Linux Rust sample
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <paul@pbarker.dev>, <elmehdi.younes@smile.fr>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <Harish.Sadineni@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
In-Reply-To: <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 17:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231166

On Sun Feb 15, 2026 at 2:40 PM CET, Mathieu Dubois-Briand wrote:
> On Thu Feb 12, 2026 at 7:10 PM CET, Harish via lists.openembedded.org Sad=
ineni wrote:
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> This new case tests that the rust_mininal sample inside the kernel sourc=
e
>> tree is buildable and works properly: check that the module can be
>> loaded and that it prints correctly.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>
> Hi Harish, Yoann,
>
> It looks like this test is still a bit intermittent:
>
> 2026-02-15 09:27:44,140 - oe-selftest - INFO - runtime_test.RustKernel.te=
st_kernel_rust_sample (subunit.RemotedTestCase)
> 2026-02-15 09:27:44,142 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-02-15 09:27:44,142 - oe-selftest - INFO - 11: 13/57 404/671 (87.99s)=
 (0 failed) (runtime_test.RustKernel.test_kernel_rust_sample)
> 2026-02-15 09:27:44,142 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/open=
embedded-core/meta/lib/oeqa/selftest/cases/runtime_test.py", line 506, in t=
est_kernel_rust_sample
>     self.assertEqual(status, 1, "Loading rust_minimal module failed!")
>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/unittest/case.py", line 907, in assertEqual
>     assertion_func(first, second, msg=3Dmsg)
>     ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.13/unittest/case.py", line 900, in _baseAssertEq=
ual
>     raise self.failureException(msg)
> AssertionError: 0 !=3D 1 : Loading rust_minimal module failed!
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319

This is oe-selftest-armhost on ubuntu2504-vk-arm1.

Harish, do you have access to an ARM host to reproduce/debug this?
(I have looked but the builddir for this particular run was already deleted=
)

--=20
Yoann Congal
Smile ECS


