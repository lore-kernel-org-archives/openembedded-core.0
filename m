Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E646C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:52:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.13421.1661359950552726642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SnaHpZk1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 904AB40002;
	Wed, 24 Aug 2022 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661359948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AweCx6fE61dztc2yeDxILuE6zs7eIHaj6ydnsRq9g+0=;
	b=SnaHpZk1KeSErvvExG66B+0erYRbI+FDNifjANXGKM/ADzzpMrqwzgnqB9/HL+Hmac/ANz
	W3SH+vTCmISEN7Yk9eAhnzPlEBFg+D7uN9ljrLo1Z0uondM7HjPiG431zVRCBeHDyF49nm
	ModfkaZwa3Q+1XmWTEFyfhjdLOgC3gWKq/Of7Un+B7RRiwAN0Rsc5BXJ2eAKDw3bjcDi+I
	lT6g3fl+ZOMWQwLOSY23PqD8qF8AdGEeD2/QQbEaxlvMZQFBfAiUgpiPYcDcB1fFDMHpEu
	ppRnJv8+VbiXNW6tyWOegxBzVRjkPWWuu0VTchrGg6JvPMB+l1rw8f2SBMYHqA==
Date: Wed, 24 Aug 2022 18:52:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] ccache: Upgrade to 4.6.2
Message-ID: <20220824185224.370c44bf@booty>
In-Reply-To: <20220823180151.3321962-3-raj.khem@gmail.com>
References: <20220823180151.3321962-1-raj.khem@gmail.com>
	<20220823180151.3321962-3-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 16:52:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169824

Hi Khem,

On Tue, 23 Aug 2022 11:01:51 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> Fix build with musl
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

AB testing with these 3 patches I got an error in test_ccache_tool. Not
sure these patches are guilty, but they are the only ones
ccache-related.

Maybe you can have a look?

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4037/steps/15/logs/stdio

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

