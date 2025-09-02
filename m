Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A915DCA100B
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 06:04:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.70667.1756793068365778421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 23:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ejT5RkI8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7637A4E40C67
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 06:04:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 319AF60695;
	Tue,  2 Sep 2025 06:04:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 153371C22DA82;
	Tue,  2 Sep 2025 08:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756793064; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=alh9kkU2WODBnkzK7QJ9mn6/w4Mblw5WZkTM+1guOsM=;
	b=ejT5RkI8fSONVMxRC/rPuB1CCrE7LC/FZKEYN6IM8WU4Gob/EEJkkr/zWb5nwvJ1rXgAtF
	j+IhY0VW+PCPuYNzS6PVRh4WVgEFkLd45WChWSInHK8btApTAnL6i65eMShx8bc1ECehkg
	MOAz31S5l3fZbyEyGwGLIHI0zvV2o6ysPjgwIbb6kACk2uv9aLuzHBJ0aNeWJ1NTIqEWEf
	oK8/tiPTmkUQlqwQtCIcU6l+j8FajVar1gpfv6XelICYL0iGkgg2qUfUCqCiniCmdHLrGZ
	M2XegQFVtnHwx8IIjJbFMZJQZ8/eu1Qv08plqaNWT3M1n8YNdNPDw14u2rRj2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 08:04:21 +0200
Message-Id: <DCI35YOZCBGW.VNB6L5KYVLKR@bootlin.com>
Subject: Re: [OE-core] [PATCH] runqemu: fix snapshot status log format
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <186133A59E9EBC76.5475@lists.openembedded.org>
 <8a6ecaf3-b302-41cb-a8f2-717c15812a8a@gmail.com>
In-Reply-To: <8a6ecaf3-b302-41cb-a8f2-717c15812a8a@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 06:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222705

On Tue Sep 2, 2025 at 7:43 AM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> Please ignore this patch. It seems to work on EndeavourOS fine, but my
> Debian12 system complains about syntax error.
>

Too late! :)
Yes, I confirm Python is not happy at all with the quotes in there.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


