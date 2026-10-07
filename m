Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0A4CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 14:23:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10850.1791383019506655952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 07:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pMW48S6z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D6781A116F;
	Wed,  7 Oct 2026 14:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 121026074B;
	Wed,  7 Oct 2026 14:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81C8A11D512E2;
	Wed,  7 Oct 2026 16:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791383012; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+pgQUwBTw2Y5kfuKFhZNljsQGuLuJOvSU+Yzp3lZTRs=;
	b=pMW48S6zm92JNI0fIx7Laqf24Wmmj9k2h6oxAATn0PdMd/BSsbjpNb5t/XWktVC8pDV98m
	eHZugUF+xRuO5PmtgxY8cxJlqUVRRyuvq4mtNGQshPdIvWnwDR1UuF1MDslJ9SvzII0duv
	PO6PCv4RysvlNebIkEry0+hUF6dRoMwKYp+0+RUHwFiLAyoGAQnJqjW+tC+kdbOHPfLmHT
	lHQmfmjAHk7aZ6ojJwEvJbkcqB8uw6on39X+5UU/JXISRV8DYV3TUR2W+WoCjtQROYgijf
	UyYqH7cPQVe1th9VFyn7//KQMfA23rgFEXS7DHf59luxtBCIfHzL4CaaG30NDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 16:23:29 +0200
Message-Id: <DLYOA1SGS44S.13W5W0AQMQTIH@bootlin.com>
Subject: Re: [OE-core] [PATCH 5/6] python3-more-itertools: upgrade 10.8.0 ->
 11.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
 <20261007055820.59633-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 14:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247399

On Wed Oct 7, 2026 at 7:58 AM CEST, Jaipaul Cheernam wrote:
> changeLog: https://more-itertools.readthedocs.io/en/stable/versions.html#=
id1
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

It looks like ptests for python3-more-itertools are failing on riscv64
after this upgrade. It might be a timing issue, as usual.

{'python3-more-itertools': 'START: ptest-runner\n'
...
                           'tests/test_more.py:TestSynchronized.test_concur=
rent_calls\n'
                           'Timeout! System state:\n'
                           'Collected system state:\n'

Tried a few rebuilds, it did appear every times:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2563
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2564
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2565

Can you have a look at the issue? Maybe we need to relax the timings or
disable the test on riscv.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


