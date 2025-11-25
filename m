Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA1ECFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:38:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12828.1764059916808986725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z7/PkVc2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3A3EC15D48;
	Tue, 25 Nov 2025 08:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58ACC60705;
	Tue, 25 Nov 2025 08:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BB2F1037160B;
	Tue, 25 Nov 2025 09:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764059912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7mRoGPmzuPcw/cQgVh1fTmdjrk9hunn9dQhMWbebQ20=;
	b=z7/PkVc2/1eSpP6VaIJ8PzCnKE2/MtTSLO2Dw+E+ccmklEFMtSouCfUhIg1WfX5B2wknn4
	OztwBsYDZ388qtW/l0acIF8QfGOAydmwLKJu2VWRkkmO10kSQag9zY+DMVMFn/EWbc6t26
	4irk4wDeAdURAC3z8FUt0TtKhtkh/XpnoJ2TeUfeDfQNtOlL08pMyCTylQ01nysGM1cbCi
	q/BommIVqkngPtPxrNFYm+MGDxClXxTzptf6X+DhYBEB2k+04mpLDgeXcTE41TsMV3hXjX
	b2Y3Iv5o8vBEHdtwzC2L3x9wgWTTpEAU/GWcXrME+5GSN8qIyuV0ewbdKUeygg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 09:38:30 +0100
Message-Id: <DEHN1R88V81C.6XS1X0NEFZ1P@bootlin.com>
Subject: Re: [OE-core][PATCH v3] documentation: Add comprehensive SPDX
 variable documentation
Cc: <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>,
 <stefano.tondo.ext@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
References: <20251124215058.1468645-1-stondo@gmail.com>
In-Reply-To: <20251124215058.1468645-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226753

Hi,

This was sent to the wrong list and should be sent to docs@lists.yoctoproje=
ct.org.

I'm also struggling to apply the patch:

Applying: documentation: Add comprehensive SPDX variable documentation
error: corrupt patch at line 118
error: could not build fake ancestor
Patch failed at 0001 documentation: Add comprehensive SPDX variable documen=
tation
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"

Can you check?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


