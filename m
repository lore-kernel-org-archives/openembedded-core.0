Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B8ACCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:36:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.12008.1760110602219021877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1BfTbL+W;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FC8AC08CD2;
	Fri, 10 Oct 2025 15:36:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 312F860667;
	Fri, 10 Oct 2025 15:36:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C059102F2225;
	Fri, 10 Oct 2025 17:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760110599; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gTfna/31Hd1QGcEtghpEEe5KrCt0F+nTSD1iiEHJnDo=;
	b=1BfTbL+WgYUkaNEQ0fqreiaZ1EVHPnpDmHqUByeXoed1FjK6u6A6+83jk/CAr1c3bSqLYk
	830wWuB+y0M4/0i8+P+3PuxnLnsrCOYJHrqNLFw23TXAvF29sQfgpYQF+VKiLWCKqZ8Tm9
	DTtb8CaHX4qoD3Xk4BExq+0iHDWvNufdaSmNc11gkLsjXP4UUdxmgQB7Ly6xMN1+lNlXOX
	UqmI/Z7PeO3HqhOD9tYUotzfy4k4B8CJANxhUqMJZHb51APeedomzgscA3i57RTqM1QUne
	i/bAqzInBtDNbx9cR31AmkfXjHqTaay4NP5VnwB/tcES3YFYWTicAfI1mqZs+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:36:37 +0200
Message-Id: <DDER4TNFACYK.197FU3Y7W8OXL@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3]
 oeqa/selftest/bblock/fitimage/sstatetests: Fix changing MACHINE during the
 test
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
References: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224691

On Mon Oct 6, 2025 at 3:14 PM CEST, Richard Purdie via lists.openembedded.o=
rg wrote:
> With config fragments, changing MACHINE in the test like this no
> longer works. Use the forcevarable override to allow it to work.
> This also needs a tweak to bitbake to work correctly, sent
> seperately. Whilst ugly, this avoids the need to start changing
> config fragments within oeqa right now.

Why not move the inclusion of auto.conf after the addfragments call in
bitbake.conf? Maybe this triggers another issue, but I'm just wondering.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


