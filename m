Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36612C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 07:08:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9291.1789542505465927518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 00:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gRiHoc8B;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 38D121A0887
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:08:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECEA060337;
	Wed, 16 Sep 2026 07:08:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CF5B11C7AFE7;
	Wed, 16 Sep 2026 09:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789542502; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G9SmXY2a5e3wknkDOCYc99c5Ff8c2JNhU/aMz+oENNY=;
	b=gRiHoc8BNLwjX950bqNf+IsGafwzPKREgfFcg7QipNE+GrEBlWjj/3Ke9qqGmh4Y1KaL+p
	fSNKY1ULCqKeA36UyvDyoQEQ5ZPYGMbBs1qoxjk8EY2xg3b+oT87DZrxuTQNy2YDDqxr6l
	enaA+w4NooRgPxY/99GKv2d1gmdKchUA/Vo7bVAYsVFy3ULzQGLHt9uMaPIW2CHJP/nJZb
	JQsf6/oQ+bqWDkboFr/YK7Ludau4SYxI4jilJluqnCnzxVtbyh1/VK2p0rQbiljZe5KDc1
	2oWDIjbl6+3GOwPMi5SQGTxJS3mk+64m3GI/8ZVCASj4qfa+KxOiI4y+6obV2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 09:08:20 +0200
Message-Id: <DLGJVF9KWOYU.1N40QY6ZHMK0G@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dwagenknecht@emlix.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/2] Add meta layer information to spdx
References: <DLFQEDRDYFEW.1N7Q1KDCOBXUD@bootlin.com>
 <20260915130509.2184318-1-dwagenknecht@emlix.com>
In-Reply-To: <20260915130509.2184318-1-dwagenknecht@emlix.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245930

Hi,

On Tue Sep 15, 2026 at 3:04 PM CEST, Daniel Wagenknecht via lists.openembed=
ded.org wrote:
> Please continue to consider this as a draft for discussion only!

It is useful to mark these kinds of series with "RFC", if you don't conside=
r it
ready for merging. I must admit though I skipped over your mention of this =
being
a draft in your cover letter.

Antonin

