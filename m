Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F9DCFA76F
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 10:42:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8639.1763721757731104435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 02:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=k6CHjhS4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 457DB1A1C81
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BEC360719;
	Fri, 21 Nov 2025 10:42:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35A61103717E6;
	Fri, 21 Nov 2025 11:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763721755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gM/b5ou7fGgY1fT5U6mlHCme5zih1IfrJrWrLgVY49U=;
	b=k6CHjhS4SFd/TOD5wwSrpKV5EAVeRrDFHMj1QaH9fMUZG548QDi1S/AQwtykBi+JUCb7fg
	G4rbfFj8zO9Pa/7n5CQrNfZj/Sp0keIUNUVqpNNbK1zmjjCIYEQmprom6Qzn77z7/QaKRv
	SpZHfz4cbjSE2B5cVZNVekL7MXE3Dpx7dfGsGTygUDj+K/20jnF3yo1CyH6OZfMqMV+ycl
	VvIExesZTzMhjf6A5vdj+/KXOcADtOSEbikj98gdXACaPQYBRWO2NVTQgH16EW7L9M3i8V
	qw9Tb4oGdP5kDhFiivb5ooOy51RG5dgd3x7px3y8duc/YuEjSK6b+9puhyqcGw==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 mathieu.dubois-briand@bootlin.com, miquel.raynal@bootlin.com,
 antonin.godard@bootlin.com, kamel.bouhara@bootlin.com,
 pascal.eberhard@se.com, jpewhacker@gmail.com
Subject: 
 Re: [OE-core] [scarthgap v2 0/5] backport: allow to extract all CVE_STATUS
 info
Date: Fri, 21 Nov 2025 11:42:33 +0100
Message-ID: <3086109.mvXUDI8C0e@brobin-bootlin>
In-Reply-To: 
 <CAApg2=SYhNKQrdSM6VNDYzqSbwBrGDB30Za1=TOruk8Dqa=Umw@mail.gmail.com>
References: 
 <20251121095415.288301-1-benjamin.robin@bootlin.com>
 <CAApg2=SYhNKQrdSM6VNDYzqSbwBrGDB30Za1=TOruk8Dqa=Umw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226664

Hello Marta,

On Friday, November 21, 2025 at 11:35=E2=80=AFAM, Marta Rybczynska wrote:
> Hello Benjamin,
> Do you confirm that this time it is ready for review?

Yes, I confirm this time, this is ready for review :)
Sorry for all the initial noises...
=20
> Kind regards,
> Marta
=20

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




