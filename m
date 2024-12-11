Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE76E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:19:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.11955.1733926782986710491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WK0dH6Yf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E9691C0002;
	Wed, 11 Dec 2024 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733926780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=/yNKxKWTXtt87q7QQ5QtaMHDym8+oQggWqW5QIHGlS8=;
	b=WK0dH6YfQ9C/uYoJuAbYpaGrwa9CUx7A29d8HDh9xou0WlOI1J2svqAQ/Bc5+4oQwVNxkG
	dM0uypFchSEDGG8zohPc6XUrSycAP6jRerb/IwDm4H0+6uX9YqCB0LwhJMq6n3ksHqs1Y9
	RmjPHtbLBFszNFVGQF5g3xqq/BTQr3Rqkyln14MIj3HtQNnkFeoTdoAKgUvb0At6qUBOWP
	3T7taJ+JEzRolPvzd1PL8S9+lYgrCmYGSgHZfRoFyJJZwcxmlUNHUTIT+7qUJL1E36C+mV
	61WqihKhJl/g3gB1rG0EbV10nsyAw8pYogxoZT2NV8WmGW4rjfTmp+6VeX3MPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 15:19:39 +0100
Message-Id: <D68XQU2RSZ0C.2V137AIRTE2ZN@bootlin.com>
To: <ejo@pengutronix.de>
Subject: Re: [PATCH v9 0/7] Add barebox bootloader support (and testing)
Cc: <a.fatoum@pengutronix.de>, <alex.kanavin@gmail.com>,
 <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
In-Reply-To: <20241011120117.818804-1-ejo@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208584

Hello Enrico,

Since this patch series introduces a new class for compiling barebox-based
bootloaders, it would be nice to have some documentation for it.

Openembedded-core classes are documented in yocto-docs[1], and documentatio=
n
patches are sent to docs@lists.yoctoproject.org.

Could anyone, preferably the author of the class, take some time to documen=
t the
usage of the class in yocto-docs/documentation/ref-manual/classes.rst, and =
the
variables the class defines (especially the ones that can be overridden for=
 user
customization) in yocto-docs/documentation/ref-manual/variables.rst?

That would be greatly appreciated. I can help if needed.

[1]: https://git.yoctoproject.org/yocto-docs

Regards,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

