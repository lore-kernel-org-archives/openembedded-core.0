Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F23CF3943
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:52:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10337.1763567541720751156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W8yLGaPG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 270A9C1118D;
	Wed, 19 Nov 2025 15:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 604B660699;
	Wed, 19 Nov 2025 15:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA09F10371A8D;
	Wed, 19 Nov 2025 16:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763567538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BcMRrkVGhkO2GnMtbI7qu7q7uLECvpI0T1SIa3Jls30=;
	b=W8yLGaPGLNrxvw7QGT90v1sg7jUOQnmmfFjzs4wSIpMi27ZodX9iopQMoxDN/k/4ktf2O4
	7NP8/+NHbxQAxy6w4hzIUZePen6Iq+vvuKxB4vUu0pY+wNpHWHEmej/hBaWHUQV+e9Xb7H
	QGAuVEVIaWGW4jqPT9oKMxA33awmd9BWVCLO7bm/F5RJbIbCj6CDe2S7RlnxXtAIvFAwYa
	B/HGIX3RPTHkLoiMdNeFdyCc9rqODXPaODx0C++sNH8ZF9/T3cMz4V8DPA564jCQioC1qm
	UKaG9bZR2YJrPbZ5mzijKjPaYuJwmlnYGnNyQeVsFIej1IB1HSQj3IwCJnhg/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:52:17 +0100
Message-Id: <DECSILYBSPUH.3Q482LTJ8SAD9@bootlin.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>, "Stefano Tondo"
 <stondo@gmail.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] spdx30_tasks: Fix
 SPDX_CUSTOM_ANNOTATION_VARS implementation
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251117130451.1711036-1-stondo@gmail.com>
 <DECJZ8GOEY2L.1LKIW4KZNILBR@bootlin.com>
 <AS4PR10MB51507A3160F4AD577CD35ED4ACD7A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS4PR10MB51507A3160F4AD577CD35ED4ACD7A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 15:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226559

On Wed Nov 19, 2025 at 1:33 PM CET, Stefano Tondo wrote:
> Hi Mathieu,
>
> Weird, this time oe-selftest was passing. Anything else I need to check l=
ocally to make sure it is working properly?
>
> 2025-11-19 12:25:28,520 - oe-selftest - INFO - test_custom_annotation_var=
s (spdx.SPDX30Check.test_custom_annotation_vars)
> 2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION1: ANNOTAT=
ION1=3DTestAnnotation1
> 2025-11-19 12:26:22,548 - oe-selftest - INFO - Found ANNOTATION2: ANNOTAT=
ION2=3DTestAnnotation2
> 2025-11-19 12:26:22,549 - oe-selftest - INFO -  ... ok
> 2025-11-19 12:26:27,823 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2025-11-19 12:26:27,823 - oe-selftest - INFO - Ran 1 test in 59.471s
> 2025-11-19 12:26:27,823 - oe-selftest - INFO - OK
> 2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS:
> 2025-11-19 12:26:32,996 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_custom_annotation_vars: PASSED (54.03s)
> 2025-11-19 12:26:32,997 - oe-selftest - INFO - SUMMARY:
> 2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 59.471s
> 2025-11-19 12:26:32,997 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Best regards,
> Stefano
>

Hi Stefano,

I was able to reproduce this locally, using:

- oecore: https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/auto=
builder.yoctoproject.org/valkyrie/a-full-2740
- bitbake: https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Dbitbake/au=
tobuilder.yoctoproject.org/valkyrie/a-full-2740

in local.conf:
MACHINE =3D "qemux86-64"
SANITY_TESTED_DISTROS =3D ""

An then:
oe-selftest -r spdx.SPDX30Check.test_custom_annotation_vars

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


