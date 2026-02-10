Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A1EEA813F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:55:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22967.1770738903980700584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H6Eq/f1i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D8BB1A0D4B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:55:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 373C8606BD;
	Tue, 10 Feb 2026 15:55:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCADB10B920C9;
	Tue, 10 Feb 2026 16:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770738901; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LxrY+icU/Snho1fZwqLaI9V1Elje2159rz+x9XrIXG0=;
	b=H6Eq/f1itOjFUXxywDrSAkG5O5eJJz1q6TKpPoSzWeatDb7w9oRVzzeUxHflfxe93YOAc3
	Hz04ZrVnRkr4OSudbpSZCEv4KzO8ycBlskUhLjPAMfRFBGPs20wclTdHaDHyayEKjLuddY
	2XZoI9W/1raCXkwyLBgz0yxEWEek3BfqAQG43oq9RbqEnHBCbTEkcGoP3a24viw8XXB/Cj
	AKdTaoMLudPGTjRhnnX2ZT0xzgH3oKI2+jxhB5q30uQqzIBqQckhPCoMhhqB+66iYEyDMz
	5QaYgQnKnfulbo1D0/cB2dHvi0vDofR5WPgQvMR5c1TFy+5DR2j/b+ZDp/dLqQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:55:00 +0100
Message-Id: <DGBEJWQD2JEH.3TTL8JP14XJG7@bootlin.com>
Subject: Re: [OE-core] Yocto Project Status 10 February 2026 (WW07)
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <yocto@lists.yoctoproject.org>,
 <openembedded-core@lists.openembedded.org>,
 <yocto-status@lists.yoctoproject.org>
References: <19266426506120e17fec17b1eeb1ed03ee36d8ec.camel@pbarker.dev>
In-Reply-To: <19266426506120e17fec17b1eeb1ed03ee36d8ec.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230915

Hi,

On Tue Feb 10, 2026 at 4:50 PM CET, Paul Barker wrote:
[...]
> - Patch review is now using two branches:
>     - =E2=80=9Cmaster-review=E2=80=9D  - patches which pass on the autobu=
ilder and will
>       be discussed on the patch review call
>       (https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dma=
ster-review)
>     - =E2=80=9Cmaster-backlog=E2=80=9D - patches which have been discusse=
d and need
>       further investigation or more detailed feedback which we haven=E2=
=80=99t
>       had time for yet
>       (https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dma=
ster-backlog)

Do we want this documented on docs.yoctoproject.org?

Also, what becomes of master-next?

Thanks,
Antonin

