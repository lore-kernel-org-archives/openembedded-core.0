Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57582C5AC9E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:50:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.525.1771602611078542415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E8PWRah6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 271AF1A0ACF;
	Fri, 20 Feb 2026 15:50:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFD4F5FA8F;
	Fri, 20 Feb 2026 15:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FED810368D40;
	Fri, 20 Feb 2026 16:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771602608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jPpQ36bBuSPxG1RjJXQR/WPxR1epuTe5QFeTVVOYF5E=;
	b=E8PWRah6f2YvBN7T2Fjt1frz3nh0shYtr+FdQQmLRvWhCBocYAXtDmF+u1MwwN5tg2YNE6
	arM47APqDK2tcoVen5QJ49n+mmbphLHVRbGyXVemw2flkbIzFKqiYj+wLnppFfe8bB7nzZ
	uYa+KZ2+byPBhFwsSV01gz0DpZ8t1qOIS0dmz5pDkBv+6mjpAFw1F3W0U4pje5Qf6qB25e
	Ab2LmjZ/ZhkNav9vEj47eY4FdVU+j/3In91ilzzz2WHUmcvis/j5xT9cNymNUbQ6VU4Gr0
	HF6aRpYexAR4Y/UIXvxh8VOm3aBukC7doSZmVelUHi3s/kDKGYFgo5V50L27fg==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
 "jpewhacker@gmail.com" <jpewhacker@gmail.com>
Subject: 
 Re: [OE-core] [PATCH 1/2] meta: update avahi patch to remove ref to rejected
 CVE
Date: Fri, 20 Feb 2026 16:50:06 +0100
Message-ID: <2766773.BddDVKsqQX@brobin-bootlin>
In-Reply-To: 
 <DB5PR02MB102136D45CFB056C2F0B13F1FEF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
 <20260220-update-patch-with-rejected-cve-v1-1-cf113d8a15ca@bootlin.com>
 <DB5PR02MB102136D45CFB056C2F0B13F1FEF68A@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231531

On Friday, February 20, 2026 at 4:46=E2=80=AFPM, Peter Kjellerstedt wrote:
> Please use the recipe name as prefix, e.g.:
>=20
> avahi: Remove a reference to the rejected CVE-2021-36217

Thank you for the feedback. I will send a v2 on Monday.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




