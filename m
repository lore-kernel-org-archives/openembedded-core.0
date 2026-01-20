Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178A6D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 08:11:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2061.1768896658754206109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 00:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W1Aq6tKx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81336C214EA
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:10:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98B57606AB;
	Tue, 20 Jan 2026 08:10:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C91410B6B2D2;
	Tue, 20 Jan 2026 09:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768896655; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oxitqEcuk00evBtdRIexNNYO+qyxwkuD8IxcfTpjk3g=;
	b=W1Aq6tKxft5Vv3xvK9FkCSkVFHT7yQIZE2ds0VHMdSXDJQFWA6Pd19GQ8fB3aezFOCZXnL
	actQjfBhLXzCUhSjgmhCWjllLb9JwT8V5/PevcTlyxqOncKsEd7/EL9t4r4NTbDpY3bzMF
	5nES9Xo6/HFNEOc680nb4YP9Bt8abaI96nopHplwPggOiN2j0wcAMtwT4iQEnIxVmNOSAH
	R34L6EDS7UY3YrTdNkCv47xWFeKr+moUKairuJBYvd945UOsZA5fJukX/QZQ+aciAemmco
	4apL4wbVGIOjDFff8BDcScocorER/s370rcQJoggPyZ9h8+KLyVqEcCrASCJJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 09:10:54 +0100
Message-Id: <DFT9J4U0CL9Z.1B3K1AOQP1914@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Fix instance name parsing
 with escapes or periods
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <trent.piepho@igorinstitute.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260120011745.2474832-1-trent.piepho@igorinstitute.com>
In-Reply-To: <20260120011745.2474832-1-trent.piepho@igorinstitute.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229651

Hi,

We don't have systemctl on master, so this does not apply. Did you send thi=
s for
a specific branch of openembedded-core? If so, you need to include the bran=
ch
name in the patch subject, as explained here:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitt=
ing-changes-to-stable-release-branches

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


