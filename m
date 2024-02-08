Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7456DC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 23:16:38 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.4200.1707434197347072802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o7I4TfBV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A84360002;
	Thu,  8 Feb 2024 23:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707434194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xW7sp6bb68CrZXppi9P9K/LpYmLie0O/uXxGC7EZg1k=;
	b=o7I4TfBVDbBVa0sbA0QptWnLzmlcXGVQhr1J10THQXmmkxHK1oQ/7pxgZKP+8wZT1JIVn8
	7KBVWiQw2qIPiq1onRdLX2NkcI8mmvf7KWRYiQrv52CXPcHL6laYCnpNl7uJCs1nDHx2V9
	DvAh7FcVOiDCYkPRWEVm/DMhthwB21/YP5h7MsTDDEWj+obuSFy+NHvbyP33MRBoDZuGgl
	FGhAWIGf5Cly+RjDWDxoFAYzkZG2opcr1zLzEuThi9t7XbtmfnJrxHqJRRIljcz5KBtNEK
	puJxik1yUUTeQ5hR8uQZ/f8FfBcxL76/QrLReoIb7j3Rz8PhnyIgb0cS323KlQ==
Date: Fri, 9 Feb 2024 00:16:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: matthias.schiffer@ew.tq-group.com,
	openembedded-core@lists.openembedded.org, oss@ew.tq-group.com
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Message-ID: <20240208231633e8d8b5ad@mail.local>
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
 <104bcdd2-27f1-40fb-9ad0-0fd506af3041@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <104bcdd2-27f1-40fb-9ad0-0fd506af3041@navimatix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 23:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195180

On 08/02/2024 14:54:49+0100, J�rg Sommer via lists.openembedded.org wrote:
> On 07.02.24 11:25, Matthias Schiffer via lists.openembedded.org wrote:
> > Deploy the kernel configuration with the built images, so it is easy to
> > check its contents, or rebuild the same configuration outside of the
> > Yocto build system.
> 
> Isn't the kernel already in the -dev package included?
> 
> From a security point of view I wouldn't welcome the inclusion in the
> main package, because the config should not be deployed by default. The
> config contains many information about the available code in the kernel,
> which an attacker can only guess otherwise.

However, as per the GPL, you will have to provide the kernel
configuration to the recipients of the product upon request which can be
any attacker.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

