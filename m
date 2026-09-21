Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DB2C982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:36:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44130.1789976194388291142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=w2MYRZBG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1347BC2C667;
	Mon, 21 Sep 2026 07:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C21460339;
	Mon, 21 Sep 2026 07:36:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AC6D10328F4D;
	Mon, 21 Sep 2026 09:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789976191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=El69+7aUeQeVEy0eaAlcT20soU1mp0uhSasG9IG2iEs=;
	b=w2MYRZBGlhyts9mUCGLO5hbJlt4fv4EDgf+tmCHz8/hBxZE0JU8s+XaO+M6G7LifSdGe6V
	Zqeo2Q7iSMY334PbwXLxdvIYNl8BXWIhYedD0G2IpNWq37eV1upheTHjnepc2yKfk4pgnZ
	NKQEfjplNAhLIYFYQXgQLidoDAkKR8e3sMYV0aNZ7HJuVsXq8mU1Y+I9oD3M51ORonU5OD
	b8jVEpbphOD4TRf4zuQVgk4VortFohmaojPRmVE9127qTUzUI+uboIpc12lByRWR6CaBod
	MCMDbNJVCBsAVIqQ/0TkH08MoKYbc+szQH3fdX4Pbs4aDeOTcrSpQ2JTmGZqmw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 09:36:29 +0200
Message-Id: <DLKTLPBBWPNP.8VV5FMWOGUWZ@bootlin.com>
Subject: Re: [OE-core][PATCH v2] psmisc: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
References: <20260914130447.107189-1-pratik.farkase@est.tech>
 <20260916091531.14596-1-pratik.farkase@est.tech>
In-Reply-To: <20260916091531.14596-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246308

Hi,

On Wed Sep 16, 2026 at 11:15 AM CEST, Pratik Farkase wrote:
> Add ptest support using psmisc's upstream DejaGnu testsuite, which
> exercises killall, pslog and fuser via their .exp scripts. The tools and
> the testsuite helper programs (socket_test, test-listen) are installed
> under a src/ layout so the scripts' ${topdir}src/<tool> paths resolve on
> target.

There's still issues with this one, on musl specifically:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1232
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1217

Can you have a look?

Antonin

