Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FD7EA4E3B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:15:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.164266.1772468132029030264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sQNvJeoV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03F45C40F86
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Mar 2026 16:15:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B55A95FE89;
	Mon,  2 Mar 2026 16:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 818E3103695B7;
	Mon,  2 Mar 2026 17:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772468129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8vjBX3Rs4Ei2fYFXenXuvUv9lwseJ4eyJSMKdy3UtJI=;
	b=sQNvJeoVopWgahI3uSMzVfS6FEioaKbN0pj2gTUCXck8CUNd6stBRUWu39NIdHcTuWDWCP
	dqN4yIqvtzebr3Y4zctFE5Sz1CkfpNHVoEwZJ/SldTDCKdA+KQk+bo/8I8wVi486Yb3snA
	oXkjNUbNmPw7lE+2Nphycve/HeQA8u4kNZavQT6Q/4XvVm2HgcTgtA1tGoNf9aRCP1kbkR
	wZvWN3q3+3n+6kMa0ib9IF4UA2vRJysgLB5eU9erRSPyasTfLfTRCbjph6T2icxFFaBqoA
	fxlkn00KGx62ME7+NT1BKQ607U1jOGgnlXTlPkxldlkJfMVGovp63WvRG0ddoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:15:26 +0100
Message-Id: <DGSFIGH5C5HJ.G5NI0606QP4D@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 00/10] spdx30: SBOM enrichment and
 documentation
Cc: <Ross.Burton@arm.com>, <jpewhacker@gmail.com>,
 <stefano.tondo.ext@siemens.com>, <Peter.Marko@siemens.com>,
 <adrian.freihofer@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232221

Hi,

On Mon Mar 2, 2026 at 5:01 PM CET, Stefano Tondo via lists.openembedded.org=
 wrote:
> This v5 drops patch 07/11 ("spdx30: Include recipe base PURL in package
> external identifiers") from the v4 series, as it is now superseded by
> Joshua Watt's commit 874b2d301d ("spdx: Add yocto PURLs") which already
> includes oe.purl.get_base_purl(d) in the default SPDX_PACKAGE_URLS value,
> making the separate patch redundant.
>
> All other v4 patches are unchanged. See v4 cover letter for full context.
>
> Changes since v4:
>   - Dropped 07/11: "spdx30: Include recipe base PURL in package external
>     identifiers" =E2=80=94 superseded by 874b2d301d (spdx: Add yocto PURL=
s,
>     Joshua Watt, merged to master Jan 8 2026)
>
> Stefano Tondo (10):
>   spdx30: Add configurable file filtering support
>   spdx30: Add supplier support for image and SDK SBOMs
>   spdx30: Add ecosystem-specific PURL generation
>   spdx30: Add version extraction from SRCREV for Git source components
>   spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
>   spdx30: Enrich source downloads with external refs and PURLs
>   oeqa/selftest: Add test for download_location defensive handling
>   spdx.py: Add test for version extraction patterns
>   cve_check: Escape special characters in CPE 2.3 formatted strings
>   spdx-common: Add documentation for undocumented SPDX variables
>
>  meta/classes/create-spdx-3.0.bbclass |  20 ++
>  meta/classes/spdx-common.bbclass     |  63 +++++
>  meta/lib/oe/cve_check.py             |  37 ++-
>  meta/lib/oe/spdx30_tasks.py          | 329 ++++++++++++++++++++++++++-
>  meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
>  5 files changed, 518 insertions(+), 6 deletions(-)

If this series is accepted and merged, would you be able to help documentin=
g the new
variables introduced by the series in the Yocto Project documentation? This
would be sent on the docs@lists.yoctoproject.org list.

Documentation for these variables would be in:
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/varia=
bles.rst.

The SBOM document would also likely need an update:
https://git.yoctoproject.org/yocto-docs/tree/documentation/dev-manual/sbom.=
rst

It can most likely be based off the documentation you've already written th=
rough
the [doc] flag. I can help with the rST formatting. This would be greatly
appreciated!

Antonin

