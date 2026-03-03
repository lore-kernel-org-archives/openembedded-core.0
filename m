Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1814E67A9E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:17:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15078.1772533073379022652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gRGasfry;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 84BDFC40FA3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E40F55FF29;
	Tue,  3 Mar 2026 10:17:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5328310369609;
	Tue,  3 Mar 2026 11:17:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772533070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PGAb1N86TBjociS8pp2dlo2FgZBi4uJwcii8OUMw+Xg=;
	b=gRGasfrysORXu+PUL1Tc94Txtyf8NOpeqvdhlbWVRQXU/DXfGyWJdq406D7Zpdtq412ABk
	PC7m0FSuOn3vHQzAcDq5RrMzMmk5KcxVc6sJUjY53YE23/3VFZvtQ9VeSKeMnwukYtE7mO
	jLDjl5o7Tn57kVYT9pin+4AYM1EjdZ5c3rhNK97wy1gQAr3KvapRn6pwnnhKvCJi71hJoB
	b5ebwOM77VHeNeyQvj3MZih7hJUzj6GlKqlHLIZFTTSVRytJHzRfvaJl2lHeNI5Q5CSoAO
	8HDgHwLk6e4RkvMgetwiBEbVSBol9VcXdYXXyogqpEOz4AYFwYwmL2/vsBLu9A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 11:17:48 +0100
Message-Id: <DGT2J6CQKZUA.38KBV6TXXHY9@bootlin.com>
Cc: <benjamin.robin@bootlin.com>, <ross.burton@arm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 0/9] Add SPDX 3 Recipe Information
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232301

Hi,

On Tue Mar 3, 2026 at 1:43 AM CET, Joshua Watt via lists.openembedded.org w=
rote:
> Changes the SPDX 3 output to include a "recipe" package that describe
> static information available at parse time (without building). This is
> primarily useful for gathering SPDX 3 VEX information about some or all
> recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> vex.bbclass.

Once merged, would it be possible to submit a docs patch to document the ne=
w
variables in the variable glossary, and possibly update
documentation/dev-manual/sbom.rst to document this new feature?

Also, looking at the last patch, the CVE information removal seems worthy o=
f a
migration note in documentation/migration-guides/migration-6.0.rst?

Antonin

