Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82554C982D1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:36:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8828.1768577757138137626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 07:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V6csJNl+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E2B0C1F1FC;
	Fri, 16 Jan 2026 15:35:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F2E660732;
	Fri, 16 Jan 2026 15:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F7F910B68BED;
	Fri, 16 Jan 2026 16:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768577754; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=84Dui79TxdoQ3EEIz4wIbgTAJVmED0PLbYfszHzVXYs=;
	b=V6csJNl+KIDAyiuMjnQdzSFJOISOuS31Y4YLLHjJdScthC+6fPcinL5BX1z96p9iuqEbTv
	jrS4kYuRzxsiUiwtlPTF8R7x6dmpVhH38GRbKk1NSetGAKMU+7eEzTXmpkLbSM85KLAXoB
	zcnd0J7ddq67PDUXN4JYv1l0v+W1OIprVSrmAvFz/RSznafcBE9zCVAVFGxL+jChYmPFxW
	AA/w5r5umKhibUE+fVyf62eccsqUtv7VEiZoY/O9c2oME2IRUsPpJoyTYiUoAhsyZcTgp8
	TcG8No3GtQOqUSvFe9MNyexn303dJO43U4z7BqrYo1yFJR+gIUPERt9mv0Jvlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 16:35:53 +0100
Message-Id: <DFQ4HNJZ6IFE.2JI8LHG9EMVE2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <valentin.boudevin@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 2/4] generate-cve-exclusions: Add a
 .bbclass
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
 <20260115190331.2276779-3-valentin.boudevin@gmail.com>
In-Reply-To: <20260115190331.2276779-3-valentin.boudevin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 15:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229549

Hi,

On Thu Jan 15, 2026 at 8:03 PM CET, vboudevin via lists.openembedded.org wr=
ote:
> Add a .bbclass to generate-cve-exclusions to use this script at every
> run.
>
> Two steps for testing:
> 1) Inherit this class in the kernel recipe with "inherit
>    generate-cve-exclusions.bbclass"

If this class is only meant to be used in a kernel recipe, maybe
"kernel-generate-cve-exclusions" would be more appropriate name for it?

Not having "kernel" in it would make the class name sound like it could be =
used
elsewhere.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


