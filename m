Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF5CEC1EAA
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 12:11:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19384.1770293459445806986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 04:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uf88KUDE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 55B504E4241B
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Feb 2026 12:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AE3E606FD;
	Thu,  5 Feb 2026 12:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94992119A8891;
	Thu,  5 Feb 2026 13:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770293456; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VB/zdBW16haB2YlTTi0mJUHSZELIFA8ng4VboyI8Wbs=;
	b=uf88KUDEdWUYMfCn4CGfkxlE3rnxhIlxZVilajBbDcDJrQjgLfNNyA8I0veOQiNnE+4bsa
	sxoiTEVljZaoF717QkXUplhxjLE0xqFpOOs5SdvISR9y5Oi3ZBvnAr8md1B/+sabmV/Nni
	AjrhMZDNcA0pBBZO1uZS767FjIV1b6NTFas7qcN1Qt6tKESwF46JfKEfTVqRYme3Bahhgd
	9l0KQUIQqMUYmqY42xx2bXvVeSJ+tH5Sj2yITqiLkVYCHPJ/6mZWGj6mkRZEmbCXrO5Eaf
	GWWY2mGPblCvtyC511X5JPEFAXKcPnm6k81DPdbyWNGRm3K55C5+kop0cFw82A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 13:10:54 +0100
Message-Id: <DG70NLZ9YPDQ.1CPDRKUREZP7J@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260203091329.1294-1-wangmy@fujitsu.com>
In-Reply-To: <20260203091329.1294-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 12:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230577

On Tue Feb 3, 2026 at 10:13 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Modify run-ptest.in to skip test_pylock.py.
>

Hi Wang,

Thanks for the new version.

This was reviewed during the today patch review session, and two
comments were made:
- First, the commit message should explain why this test is being
  disabled. I know this is linked with the tomli dependency, but please
  say so into the commit message.
- The second point is about the disabling itself. Did you had a look at
  possibilities to modify the test so it can still run in oe setup?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


