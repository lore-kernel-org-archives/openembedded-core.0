Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96131EF5848
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 15:48:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8302.1771084130575315062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Feb 2026 07:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HN2ebbtJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE8C4C1C39B
	for <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:48:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77C62606CB;
	Sat, 14 Feb 2026 15:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F321510368F81;
	Sat, 14 Feb 2026 16:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771084126; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=buxiBGJRx+7KRLbmyex/FSWME54oaeSRd47sl3LQl+k=;
	b=HN2ebbtJ/NIGFDeg/IkQVdDAGqF9vIbwVtFicOOfvUWrOKfYgDq9G+E0plOadnBJTSr0eg
	OceeU68gw7QbeMT/i4++Ax6ReNRjSi1GgNuF8PBnamGEk/u93qdDVbhTJ7nRSwKCHNIX2r
	tT5c/rQiWmBAlE8LtuCmgwEsYkV/zfIXmYDD2GOBFtTc//bzTLZA24GsyYtyBOHRZ849ax
	Zan9juobec/tmMY6EUivndBqOhOfw7z5tv3NeSx+kG4bokuPUY02HOyHzpOKs7U0XcnXQS
	oiVW5GgChyRRQk921mijOLGJF3DLsMbq85u8oy/m2aNU+mjSbZIHQLQ1hs+nvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 16:48:43 +0100
Message-Id: <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure
 during install
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com>
 <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
In-Reply-To: <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231150

On Fri Feb 13, 2026 at 2:44 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> Hello,
>
> Since I am unable to reproduce this error locally, I have sent this
> series only to be tested on AB to investigate further.
>
> cheers
> Ankur
>

Hi Ankur,

We had a failure with your patch applied:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3353

Do you need me to extract more details?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


