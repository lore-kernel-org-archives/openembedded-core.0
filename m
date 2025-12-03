Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3E3D12D56
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 12:26:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13843.1764764766435878521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 04:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KCtCZrSA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 43A704E419FF
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 12:26:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0089060706;
	Wed,  3 Dec 2025 12:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B21C11920502;
	Wed,  3 Dec 2025 13:26:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764764763; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zjfah3+SLO8QTK2TRze+/8F7i7ti0D65Elxe0q4YReg=;
	b=KCtCZrSAyTSxUFQNL2xXWNkEL2cVOVXFRUterkn+maCZ13af649lVQEC1id2h4q1Xg7zS+
	v/66yWwMlHHPytK/HcF1vUAKYt/tt1SPngEOfjwGwDYRlgtt4yj90kjl8CsI6mKjm5919a
	ETN6pzp9FoHL4UwqtyNQpjRwCNV3BR+M4dA7MG9aTu5gDFSmn5t2nvErgdi+Vq02m7UwMe
	+W2OTFDeSPtadA3PhjzTPZdMT8jm64MGSI+JiYzxOn6yMqwXzgGtDpE+paFRuDyLQqpfk6
	e5us4VOXz1wDmQdT0+ZSYBPGTRhAdPe7RU8zWTQw4RBFuP/qOtBs8MxBtMPdmw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 13:26:00 +0100
Message-Id: <DEOKWAS5XALU.VTBEZYEYZL1J@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] perl: upgrade 5.40.2 -> 5.42.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <schonm@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251202151032.15053-1-schonm@gmail.com>
 <20251202151032.15053-2-schonm@gmail.com>
In-Reply-To: <20251202151032.15053-2-schonm@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 12:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227223

On Tue Dec 2, 2025 at 4:10 PM CET, J. S. via lists.openembedded.org wrote:
> License-Update: Checksum changed because in the license, the physical add=
ress
>   of the Free Software Foundation has been exchanged for a web address.
>
> Changes in perl 5.42.0: https://perldoc.perl.org/5.42.0/perldelta
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---

Hi Jason,

Thanks for your patch.

It looks like some selftests are now failing:

AssertionError:
Failed ptests:
{'libmodule-build-perl': ['t/xs']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2708
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/798
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2664

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemux86-6=
4-ptest/core-image-ptest-libmodule-build-perl/
https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuarm64=
-ptest/core-image-ptest-libmodule-build-perl/
https://valkyrie.yocto.io/pub/non-release/20251203-49/testresults/qemuriscv=
64-ptest/core-image-ptest-libgpg-error/

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


