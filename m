Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46442E9538F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:02:27 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18876.1770206535915799793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lEDKEVZO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 06B5FC24381;
	Wed,  4 Feb 2026 12:02:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50F5B60745;
	Wed,  4 Feb 2026 12:02:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1F78119A88F7;
	Wed,  4 Feb 2026 13:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770206530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=roq4KE9ckIrbnredK7vnjGlbaypjRltpm08usRlZIRI=;
	b=lEDKEVZOldsrc98hiSXmDZYwc4VrDqIMLsxIpOeQMyDTFTWu20mogwaxZvwUkixeR4hNsc
	xQlaavX1jiAyXksRjmx/cK/gaLr8CDe6XWZ6X4uA7wr/WaooIdakN8LNSSYNRQ+Jvw1eaq
	mAfP1DF9DuRQzgfyjbf1AXhPLZ9n4Qm7hlSrD8mKDUOGIMwhyofeQ638M4R9N5NWKgbvMA
	gxIAx4mN6Ybep0nApVZRus32jdAORGMbWspMb8JoBR0U1/SJYpLc5FrSfzIzJBGAsNyKKc
	plqFMjQvx7ub/ACiaPVIpldLFp835ZflBzdtuRtCtXIXlRLBl1s7+W0OJWmrNg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 13:02:06 +0100
Message-Id: <DG65UBT3KMF5.2WJ3OAQJJR7EX@bootlin.com>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
Cc: "Randy MacLeod" <randy.macleod@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
 <pratik.farkase@ericsson.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <pratik.farkase@est.tech>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
 <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM> <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
In-Reply-To: <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230512

On Wed Feb 4, 2026 at 12:09 PM CET, Alexander Kanavin via lists.openembedde=
d.org wrote:
> Unfortunately this was merged to master prematurely, and I just had to
> sent a revert:
>
> https://lists.openembedded.org/g/openembedded-core/message/230509
>
> Please address the issues and resend.
>
> Alex
>

Just to be clear: the v2 was merged, not this v1. Yet, I confirm we
have the issues mentioned by Alex.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


