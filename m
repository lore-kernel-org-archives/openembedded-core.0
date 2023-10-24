Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7620FC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 08:33:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.143224.1698136429066179145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 01:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HcthG4Q5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A54801C0005;
	Tue, 24 Oct 2023 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698136427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4AI+66XfGZ4ne0LaxR2T+ls9exLOOVrynAPWhOWy20=;
	b=HcthG4Q5zlaPJfoWiXJQBe5d+usQ0nnNBRLbE5ZjCvY948wPApfpz8AG+mbOu2j5nzszUH
	WCf1pZe03v/SRiFJQVyfTxL40415bZA6LYXkWS68IOof3zB7+Xj1Y4WjLKmEECu7254qaE
	JF6gZWHNI7Ir49pEY1pVnBg16YmMbSoYL5MXqBRJ7nsrBRpn3kR8ea3GG7aQ6VO5Jz+SFK
	1meYxOqqD6WVQngtxUUjObYQ5m4vyD5LN6K5Qmh1zvIH/GBrSIaq0dL7955KMleqbLTAIS
	SRUMpsuz1nAENdogDe8QJDJKxYb3cUbd/ygo93dNc0ZgXV3LZG98kYxXgrCGcg==
Date: Tue, 24 Oct 2023 10:33:45 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
Message-ID: <20231024103345.306b9171@booty>
In-Reply-To: <20231023110618.3525311-3-alex@linutronix.de>
References: <20231023110618.3525311-1-alex@linutronix.de>
	<20231023110618.3525311-3-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189641

Hello Alex,

On Mon, 23 Oct 2023 13:06:18 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> Specifically, the test checks that everything needed for building
> standard oe-core images for x86_64 and arm64 is available from
> the cache (with minor exceptions). Going forward, a complete
> world check could be enabled and additional configurations,
> but that requires improvements to performance of hash equivalence
> server in particular.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

This is triggering:

AssertionError: False is not true : Missing objects in the cache:
weston_12.0.2.bb:do_package_write_ipk
weston_12.0.2.bb:do_package_write_deb

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6091/steps/23/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

