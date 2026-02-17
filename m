Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537FEE909DE
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:01:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16902.1771347684089829045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 09:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CrDvfJPZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 049251A105C;
	Tue, 17 Feb 2026 17:01:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD73B606D1;
	Tue, 17 Feb 2026 17:01:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D707610368AB9;
	Tue, 17 Feb 2026 18:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771347677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7ElT/IDOIix2IyvoBrbE+/NmBhewOkWCMQYbeJTndK8=;
	b=CrDvfJPZ6xkOiK07/tdtAIiWw8K7OaL81KMLy6XhCusvOGTwQj4oMA3bH7u45oTgSIiR17
	O3+ssORjdkuczyzSzZ4JjYN0rPL+yC3ljVFZemPzHrjaYBGoap25eW1VNhAjbGeF85hTnF
	CYbKH/i3BZqJRve8IDk3QP1ofpT552E77eR+ASu3adY80LOyJYlBOE5NxCBiSzhT3PGcVg
	TwyrF12tyrOT/TXXIQKR2W1uoiXC91fcd/qCA+i9aIzprtboVE7T/9rUhpcQuF8svIKEFl
	Y2Jruqn/ZZFLxwsMRdg1CTKVcT32Ey1cuzX0H6ryDgLSzTF1uBFDgRjIqFOpxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 18:01:12 +0100
Message-Id: <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
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
In-Reply-To: <DGGI69KGL871.JD0YXGHLVBAH@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 17:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231263

On Mon Feb 16, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
> On Mon Feb 16, 2026 at 2:09 PM CET, Harish Sadineni wrote:
>> Hi Yoann, Mathieu,
>>
>> I tried few builds locally, but not able to reproduce this.
>>
>> On the autobuilder, We ran following builds which were completed=20
>> successfully on ubuntu2504-vk-arm1:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3326
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3331
>>
>> Additionally, One of Mathieu's build also ran successfully on=20
>> oe-selftest-armhost ubuntu2504-vk-arm1:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3323=
>
>>  From what I can see, build 3319=20
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3319=
>was=20
>> triggered from a-full/3219=20
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3219=
>:
>> However, when checking a-full/3219, it triggered build 3317=20
>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3317=
>,=20
>> where the rust kernel selftest passed.
>>
>> I can see few other builds were successful on oe-selftest-armhost with=
=20
>> this patch series. I=E2=80=99m not sure why the failure occurred in this=
 case.
>> Mathieu, could you please try running a few additional builds to see if=
=20
>> it reproduces?
>>
>> Thanks,
>> Harish
>
> Sure, I will launch a few builds and see how it goes.
>
> AB maintenance will begin soon, so I will start either later today or
> tomorrow morning.

I believe I got one:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3346

I backed up the build folder, it should stay there until next Monday.
(/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-17
on ubuntu2404-vk-arm1)

Please tell me if you need me to extract any build artifact.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


