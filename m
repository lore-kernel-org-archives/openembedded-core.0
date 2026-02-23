Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E935E98DF5
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 07:21:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30869.1771831305219178228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 23:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dRRLM4Jt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5376C139AE;
	Mon, 23 Feb 2026 07:21:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ADFB5FD43;
	Mon, 23 Feb 2026 07:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89C3B10368D7F;
	Mon, 23 Feb 2026 08:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771831301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZStzSSnJ0QU4xVRpWM5s1B9pteHW+doHsElPkp0OsYI=;
	b=dRRLM4JtlkPkk+HiIyACmaS/GBiwcKm/sMQM9+jfjfwJM7HsoEFmdy5bQ21bSGeokRm23J
	UlQ2eNeDIBrxeCWFgKQkzV/u22xdETpVbshbNCF2QRo26zDEqSPifMjaS43bzTt8REQEtS
	AzshEL1ZaS0HT2cLQEjbpjk4U8SS/dg3GxHFK5KxcMbUmFhrS5Ql5E8l0TUsg3WxPYz7MG
	JMrvkcEycWXnUFQR9t24LjbvLmyxyj4yV8rzOvGSyD7BDHJzXBbQYWFD38wDl6oZe8qOXB
	AQeXw2naQhShtdeabaMlRuOISCOBqxlcDhhskypnj1tf7jOE879CzmvJR+K4KA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 08:21:37 +0100
Message-Id: <DGM5RWWI8ITI.1N1WPFMB4FBJB@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add
 test for Linux Rust sample
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <paul@pbarker.dev>, <elmehdi.younes@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Harish Sadineni" <Harish.Sadineni@windriver.com>, "Yoann Congal"
 <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
 <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
 <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
 <DGGI69KGL871.JD0YXGHLVBAH@bootlin.com>
 <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
In-Reply-To: <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 07:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231649

On Tue Feb 17, 2026 at 6:01 PM CET, Mathieu Dubois-Briand wrote:
> On Mon Feb 16, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
>> On Mon Feb 16, 2026 at 2:09 PM CET, Harish Sadineni wrote:
>>> Hi Yoann, Mathieu,
>>>
>>> I tried few builds locally, but not able to reproduce this.
>>>
>>> On the autobuilder, We ran following builds which were completed=20
>>> successfully on ubuntu2504-vk-arm1:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3326
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3331
>>>
>>> Additionally, One of Mathieu's build also ran successfully on=20
>>> oe-selftest-armhost ubuntu2504-vk-arm1:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/332=
3>
>>>  From what I can see, build 3319=20
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/331=
9>was=20
>>> triggered from a-full/3219=20
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/321=
9>:
>>> However, when checking a-full/3219, it triggered build 3317=20
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/331=
7>,=20
>>> where the rust kernel selftest passed.
>>>
>>> I can see few other builds were successful on oe-selftest-armhost with=
=20
>>> this patch series. I=E2=80=99m not sure why the failure occurred in thi=
s case.
>>> Mathieu, could you please try running a few additional builds to see if=
=20
>>> it reproduces?
>>>
>>> Thanks,
>>> Harish
>>
>> Sure, I will launch a few builds and see how it goes.
>>
>> AB maintenance will begin soon, so I will start either later today or
>> tomorrow morning.
>
> I believe I got one:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3346
>
> I backed up the build folder, it should stay there until next Monday.
> (/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-17
> on ubuntu2404-vk-arm1)
>
> Please tell me if you need me to extract any build artifact.
>

Hi Harish,

Do you need any file from this build before it is removed?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


