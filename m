Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB1FD2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:59:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4885.1768910353211712595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L3oBE7pt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CABE4E421AC;
	Tue, 20 Jan 2026 11:59:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23B3C606AB;
	Tue, 20 Jan 2026 11:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7A910B6B3FA;
	Tue, 20 Jan 2026 12:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768910350; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Ihki4qaRmVk/chFbzWeKdxXNcIjgmrc3kU2/pyHPhw=;
	b=L3oBE7ptHW2RR8deHchMFBz7MrBYj26s3kPqZG6PZ4dRDJqjbLhmEoV5EahwJ1Y+1RCJLP
	uBCnAbefMm8kZ7wzFNPno4ccy+P1GFXXNLsJLX7uId7aVnU5hP1B3jbYpuOt8Ma0ZD7JnB
	rTpgah6HYQ+LaiWKJhK2Z7sL9zq4lRgL3NbnR/czFhTuqZA/EMbiadPnhRFQ3PQmlvkBKU
	LX78ukXjdVoFjeGefQl/YPAs7QGcAa/qjohf6qzC0dXNUV2QhaaFGH/ZFeLfVZsw1wyGGq
	9P7p4G7fLohmo30cZX39xZTskSBrj1y+EfieD03xtt+Pn9sgXTHWdOQ+NinuPQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 12:59:09 +0100
Message-Id: <DFTEDVX1EJ4O.ADHORW5LAF40@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 00/14] IDE SDK Improvements
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
 <DFNBA0VIZPB8.12G68QK151UGC@bootlin.com>
 <3fce84b4562ce40c8ee858f36640ca1cfca39b20.camel@gmail.com>
In-Reply-To: <3fce84b4562ce40c8ee858f36640ca1cfca39b20.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229677

Hi,

On Wed Jan 14, 2026 at 7:37 PM CET, adrian.freihofer wrote:
> Hi Antonin
>
> My proposal for proceeding here is to drop one patch from my series:
>   [OE-core] [PATCH v2 13/14]
>   oe-selftest: devtool: add test for gdb pretty-printing
>
> This one get killed by patches which are currently on master-next too.
> This makes it almost impossible to fix at the moment.
> When things will settle down, I will test and send this one again.
>
> It is just one more test step which would be nice to have but not
> essential.
> It also fails only on a ARM host, which I cannot reproduce.
>
> All in all just too many floating parts for getting this to final state
> right now.
>
> Could we please proceed with 13 out of 14 patches from my series as a
> next step? Mathieu already hat such a branch for a while.

Sorry for messing up with what Mathieu had on his branch, probably a miss o=
n my
side as I've picked up his work.

I picked your patches again, and while some oe-selftest runs did succeed, I=
 hit
this error, which seem related to your series:

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4983396/raw_inlin=
e

From this build:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3035

It was run with the following commits:
https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3073

I don't recall hitting the issue before having your series in my branch, so=
 to
be sure I ran another build with only your series applied on master, and I =
still
have the issue:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5038061/raw_inlin=
e

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


