Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69AECD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 14:16:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11229.1780064214981927519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 07:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PI9ca5le;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9924A4E42D81;
	Fri, 29 May 2026 14:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CFAB601FA;
	Fri, 29 May 2026 14:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29FD210888650;
	Fri, 29 May 2026 16:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780064211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=29pgILi5QQyg02LXb5XeKA2vtLPs+tYUyzBr9ovBa2U=;
	b=PI9ca5lej6gd8pn5wDmPy3n8p1Vlvr9+UONp9q6pMIA1EqudP4DQGDYFE3D4JtMO4T6Mhb
	NuymJW/MLG+BofHEg0MsdEoHN5nhNOIeoHWoJEBvISMymuKelL+LvtiaMCNbL9GDVlh28u
	RY5Ov5t24XnvokZeGQ7mXY7W2H1Ufz3IaGVzBv7FgecJEUSogc57vsQsY4NHWLa9e536Ms
	EvMG2oT3yHDMea8f2JGbTiYixiVOSjkxS6DL/lm1zky0v+OauFtoTknyWkKfgmjUzc56HS
	r6dQNI5crp2wuWVrF5X8U9itXmurc/B+tT7O5tEWrQPW9AqhcarWrNBO96807Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 16:16:48 +0200
Message-Id: <DIV83KFSNYA3.7KIHEGXISPD7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mengshi Wu" <mengshi.wu@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bluez5: add patch to fix 8.56 gatt cache
 issue
Cc: <shuai.zhang@oss.qualcomm.com>, <cheng.jiang@oss.qualcomm.com>,
 <chezhou@qti.qualcomm.com>, <wei.deng@oss.qualcomm.com>,
 <yiboz@qti.qualcomm.com>, <jinwang.li@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260521062216.3352030-1-mengshi.wu@oss.qualcomm.com>
 <20f1b74e-69df-4f4e-8adc-bafcae25dfbf@oss.qualcomm.com>
 <DIUYUL35MIBC.28DFKH9L53KYC@bootlin.com>
 <66751e5d-1d57-40d6-b1c9-15689f657b06@oss.qualcomm.com>
 <5cf7128c-1c12-4cd8-8405-d99b8bfa5de2@oss.qualcomm.com>
In-Reply-To: <5cf7128c-1c12-4cd8-8405-d99b8bfa5de2@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237756

On Fri May 29, 2026 at 2:34 PM CEST, Mengshi Wu wrote:
> Hi,
>
> It seems that all the patches I sent are blocked by the upstream email se=
rver.
>
> ----- The following addresses had permanent fatal errors ----- <openembed=
ded-core@lists.openembedded.org>
> (reason: 500 This message has been flagged as spam.)
>
> Best regards,
> Mengshi Wu
>

You can send a mail to the helpdesk: helpdesk@yoctoproject.org. Michael
might be able to help you on this point.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


