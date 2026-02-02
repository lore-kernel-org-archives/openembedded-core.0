Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9783DE73152
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 09:46:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49500.1770025600631875734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 01:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FikQY8be;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 850154E423CF;
	Mon,  2 Feb 2026 09:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A65760767;
	Mon,  2 Feb 2026 09:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42BAF119A88FB;
	Mon,  2 Feb 2026 10:46:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770025597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TODIy3ZghGy7ZwP/ppWHMy/Lee0F1dfnbWcnLaE2MJw=;
	b=FikQY8beU9DqO6AnXVG4yNUkVNvy1GnFTvIZyBhUqlFkAEe3HPiV0XGPfanaok8LJuYD+O
	qDHjucytsdczQ6Et4nBfRwrXMwLSRj0m3xNXGLYuUTDq7togjZ8bWRxmyd9cCL97ofcH71
	t4BufaM1zYoXaWdwAITdu3msOQEFQrxExSmO7OEqaEz6qo69iiAR+kZEUN+GDk1pnj9OMF
	YA5ZjeMtPQk8ohNT5kymOaq+O7f09rbQe+83Waxb3bDDheaDmuRNVmLcQar5tzIOdoBCaH
	iQyp/39a4okmVWYTMJmoh8boJ+If32huX+7fhXQrdcRrXSrvBHoD5/nHDCXOCw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 10:46:35 +0100
Message-Id: <DG4DPH1SFNO8.1TC9B1KGGAS56@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>, <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <patrick.vogelaar.dev@mailbox.org>
Subject: Re: [OE-core] [PATCH v2] openssh: add variable for key path
References: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
 <20260125091540.8808-1-patrick.vogelaar.dev@mailbox.org>
 <DG1159ZW7WWD.1S10T841PJ8PX@bootlin.com>
 <1439731459.127966.1769853692567@app.mailbox.org>
In-Reply-To: <1439731459.127966.1769853692567@app.mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230349

Hi,

On Sat Jan 31, 2026 at 11:01 AM CET, Patrick Vogelaar via lists.openembedde=
d.org wrote:
[...]
>> Thanks for the patch, it was merged in master. As a follow-up, could you
>> send patches to document these variables in
>> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/va=
riables.rst?
>>=20
>> And add a note here
>> https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-gui=
des/release-notes-6.0.rst#n24?
>
> I will send a patch that documents the variable. But I don't know where t=
o put it in the release notes. Can you guide me to the section where this w=
ould fit in.

Yes, it should be in this document:
https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides=
/release-notes-6.0.rst

Under the bullet point "New variables"

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


