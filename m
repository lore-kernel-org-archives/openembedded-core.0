Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9607CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:52:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.34448.1756975961481801045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yfj6NiPg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B69B71A0666;
	Thu,  4 Sep 2025 08:52:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F539606BB;
	Thu,  4 Sep 2025 08:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 545BB1C22DD96;
	Thu,  4 Sep 2025 10:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756975958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dPUPWSS7kx0JRQtJ56obsTZpz2y5Qckv7QZ4arcl9Jg=;
	b=yfj6NiPgyL8WYpAWI1AyAtO+jYLNMUWJ26T617Mt6R+QipFV0J7otas2v7QxfWzShMfggi
	BATFItYVfY2RoigXIkSvKFpbwrdoYbkdzLkVlf2wq3xnjgNjcJEKhzixAwxbo/dMJTfXdd
	TevLovzO5jH7GjVIJE5REggJoaUuum+HpAKvvDFHUTcnFxFM5AbAbWyM1S2IA7elLXKnVw
	VzKoFNnnkqjyIGMAUSbE7W2h9N1qEatmMKvAGsNkQ0Y82RvaVc+Hv0TyWEKA28/bWzpxKr
	HR2r5lL/PkSG6EDhzyv4EKp7KXzWnRhP4R7i5095xiO5uvgFqVwiYnbDcJfiRQ==
Message-ID: <58be21e0-c521-4603-aa8c-72909133616c@bootlin.com>
Date: Thu, 4 Sep 2025 10:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH v2] libsdl2: Add tests package and ptest
 support
To: mathieu.dubois-briand@bootlin.com, a-christidis@ti.com,
 openembedded-core@lists.openembedded.org
Cc: alex@linutronix.de, alex.kanavin@gmail.com
References: <20250904000724.1575300-1-a-christidis@ti.com>
 <DCJVRHOG6FV4.10QCP2VS4QG4Q@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DCJVRHOG6FV4.10QCP2VS4QG4Q@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222910

Hello,

I hope this email finds you well.

On 9/4/25 10:41, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Thu Sep 4, 2025 at 2:07 AM CEST, a-christidis wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> The SDL2 software comes with its own set of tests. Following that
>> introduce support for ptest.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>=20
> Hi Antonios,
>=20
> Thanks for the new version.
>=20
> It looks like we still have a QA issue:
>=20
> ERROR: nativesdk-libsdl2-2.32.8-r0 do_package: QA Issue: nativesdk-libs=
dl2: Files/directories were installed but not shipped in any package:
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testsurround.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testerror.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testtimer.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testatomic.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testfilesystem.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testthread.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testaudioinfo.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testlocale.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testevdev.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testpower.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testqsort.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testplatform.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testautomation.test
>    /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/=
usr/share/installed-tests/SDL2/testver.test
> Please set FILES such that these items are packaged. Alternatively if t=
hey are unneeded, avoid installing them or delete them within do_install.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2327
>=20
> Can you fix it please?
>=20
> Thanks,
> Mathieu

Just in case, there are some ptest failures as well:

Failed ptests:
{'libsdl2': ['testdraw2', 'testgeometry', 'testsprite2',=20
'testgles2', 'testoffscreen']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2220/s=
teps/12/logs/stdio

--=20
Best regards,
Jo=C3=A3o Marcos Costa

