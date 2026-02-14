Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F3EF5849
	for <webhook@archiver.kernel.org>; Sat, 14 Feb 2026 15:50:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8332.1771084235694892161
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Feb 2026 07:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bTziHkdX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49D3B4E40D7D
	for <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:50:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1008D606CB;
	Sat, 14 Feb 2026 15:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFF2010368F81;
	Sat, 14 Feb 2026 16:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771084232; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R+lmChM9tgxmyGX8h4AU9wN0c1PHnnXfhmGuSoV0dn4=;
	b=bTziHkdX/I+hp+P5T6t8FVcvyxa23uRxUGgRZWK48fRPyQwKxDVRJikHQ/1YjhvttpmldI
	t+DWXv+uyb/vigDyFdvNlhVJctL55ueB5kG6hc6XUy0AOOFCHPCXGBoEOJSc0v0IgFYBKv
	ZzUSEcfSqCrPvi5d6chTViMCPpZUds94zX2JKt+4DYJ2yP5cbjyaJSly4LBQZJ55o/ZSPb
	V18UyhN72eIKNkDCtCmadzlYBqJ8zam3KnNo27hWX9bkOlu6y5a8BPqI6+feUSNe9uFtzc
	ptDkzZ6TY6bZErJo1HRAnBDFi88B0lDBZSWZixSAErc+GDLolCU7kFE+LSBSvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 16:50:30 +0100
Message-Id: <DGESYN3NJURK.3GU7PIXW085UT@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure
 during install
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
 <20260213014119.3451355-2-ankur.tyagi85@gmail.com>
 <CADySD0H+H-w5iUUFJcGLjp=q2oEbmBWPY+3usEjDz82RHyWD-A@mail.gmail.com>
 <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com>
In-Reply-To: <DGESXA5MRHGZ.2WQP923GQ4SYU@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Feb 2026 15:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231151

On Sat Feb 14, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
> On Fri Feb 13, 2026 at 2:44 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
>> Hello,
>>
>> Since I am unable to reproduce this error locally, I have sent this
>> series only to be tested on AB to investigate further.
>>
>> cheers
>> Ankur
>>
>
> Hi Ankur,
>
> We had a failure with your patch applied:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3353
>
> Do you need me to extract more details?
>
> Thanks,
> Mathieu

Sorry, wrong link. It should be:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3352


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


