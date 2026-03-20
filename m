Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD0A108B8EC
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:18:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9461.1774001903022410631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZJj9OpoK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 295AA4E4272E;
	Fri, 20 Mar 2026 10:18:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00887600E0;
	Fri, 20 Mar 2026 10:18:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 707A610450A89;
	Fri, 20 Mar 2026 11:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774001900; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZnniheCoa3Y+lQEeFIYu6XjZ4K/VoLG5og4qYQ8KKY=;
	b=ZJj9OpoKlnxA3FsU5nit/m4/CljFGRuexa5MI/Ul3ghW1P3gII7UzYfP4Mix5gDu8LGv0n
	W5Sh7z7KjWEHAieDGhYiTPxlTCxC6bXy/gdWLXHOKdk9AHRZuDBWfa0SK4W9Wq/KFZkbno
	LCfvY6r7Wd/YRYxE6dd09eTlC8q68pgwOdPUWgEXy81AEwl2Few9FrfpIVKDeXtLLWPOjl
	Zg4cOLz1ZtM1HTYKNgt9Z8N5Bz3PB+d1aPrh7nnS7I6MK9zMX/31FKdDox/uCkO3M6POjs
	EYlpM+15eSitNBAt06hmIv5RaUXvnNRtbkUdMDgs/HyojyJ6P4tda1MnIdruFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 11:18:18 +0100
Message-Id: <DH7J6TM9FKE3.36FFZ15MS96JB@bootlin.com>
Subject: Re: [OE-core] [PATCH 9/9] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@gmail.com>, <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
 <20260318223736.3414885-10-adrian.freihofer@siemens.com>
 <DH7F8OQYC7QP.23LPE0REKT1BC@bootlin.com>
 <7ce9c599973474ff4ce0b87c3aa43b4a0b6bec71.camel@gmail.com>
In-Reply-To: <7ce9c599973474ff4ce0b87c3aa43b4a0b6bec71.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 10:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233595

On Fri Mar 20, 2026 at 10:11 AM CET, Adrian Freihofer via lists.openembedde=
d.org wrote:
> On Fri, 2026-03-20 at 08:12 +0100, Mathieu Dubois-Briand via
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3579
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3474
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3360
>>=20
>> Can you have a look at the issue?
>>=20
>
> Thank you for the feedback.
>
> Looks like the summary is: Pseudo crashes on ARM hosts (but not on x86-
> 64 hosts).
>

Hi Adrian,

Just to be sure: the second and third links above point to two x86-64
builds.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


