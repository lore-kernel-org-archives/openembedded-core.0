Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A082CD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 09:05:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8652.1778317544496013425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2026 02:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I14JE5Q8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B45E8C5DC7F;
	Sat,  9 May 2026 09:06:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12F23605DA;
	Sat,  9 May 2026 09:05:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A4E710819F92;
	Sat,  9 May 2026 11:05:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778317541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Aj/aD2BhYT1CgPRGaxj4V4ZthihhKZLqS9hximChqNk=;
	b=I14JE5Q8MhcUchwCyvb4QS5FwL3DFVpkZYrIW259eBr86xWrtId8a28XkVTQMnI7Y4Bxxf
	baO1+bz2AjcKJlEvsfIa7oNs2Cihky2PBuVUuJRDSmSXVsLRs5hxLqc/3hA/367d8gN06k
	UM+THCpcLKvp+uAcsohnZ8N2kEtB9HpjK3c9LJp607tQD6rDeylRIXL2931cK+D10U5vW+
	Nh5MHOmppxBDGr4B9TWqHtOsOnOQOxJq7mGvr7+4wUnX+LCSqPunyd8HGoHizuvDsdDTtG
	eSr0GBHDUuxu7SC5wVDdqSIKqDThUGseYI/NlBuBJadzWC35BgZtE2cQTevBQw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: alex.kanavin@gmail.com, ross.burton@arm.com,
 mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org, peter.marko@siemens.com
Subject: 
 Re: [OE-core] [PATCH 2/3] sbom-cve-check-update-cvelist-native: Update source
 revision
Date: Sat, 09 May 2026 11:05:39 +0200
Message-ID: <i4WkHvUYQT6mlhx9cfe0vw@bootlin.com>
In-Reply-To: 
 <CANNYZj-fGt-JVeuqFcd6Kx4O7F15aYgvd_0uPQkGdNswz3qSZQ@mail.gmail.com>
References: 
 <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
 <18ADAC6FE23DE2EF.2984594@lists.openembedded.org>
 <CANNYZj-fGt-JVeuqFcd6Kx4O7F15aYgvd_0uPQkGdNswz3qSZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 09:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236761

Hello Alexander,

On Friday, May 8, 2026 at 9:42=E2=80=AFPM, Alexander Kanavin wrote:
> On Fri, 8 May 2026 at 21:03, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Note that I submitted a patch that sets PV and tag checks properly,
> > and fixes upstream checks:
> >
> > https://lists.openembedded.org/g/openembedded-core/message/236714
> >
> > Can you rebase the version upgrade on it please?
>=20
> NVM, there's an issue Peter pointed out in my patch that I need to fix fi=
rst.

In your patch you could also update both recipes to the latest tag.
This way, we can drop my patch, this is simpler (for me) :)

>=20
> Alex
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




