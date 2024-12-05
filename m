Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66137E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:39:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.6725.1733391567140692688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ATX9OuwD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E54F4C0003;
	Thu,  5 Dec 2024 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733391565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WaibhP+lbEIkOD7a57MlAJ0XCEPB33l8CMsyRfYP3+c=;
	b=ATX9OuwDVqiWyR38x93R9ZX9zfrBW6pPlNZ9z6Y3W1zxqA0nVLWU+8UxA7rCx0mCq3cTHi
	9JFZ8umcLXDqfE2bSFKQG97F/OqPSfiZXIyZpoQKxgkYw7d3VZW8daV9VLFEWLtOxLE8tj
	GHjkqXszhTI9WRHzQhp+0UD96TR4BgT+sjFufGFeSO2ChaeuQz5xJIIOOR+A73v/GbxjBC
	0JxF8+8caM/Od1HGlyShzq85gTzVHFI67zRb6BVnWsfrGpoz+GN3hK3LnfBEcpkcJ0xYoW
	YRRKyvbOxYLjfy8HPJf0akIC19/obBjotZ/VGyp+o6o/JdUztSXxcDVXQZD+OA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Dec 2024 10:39:24 +0100
Message-Id: <D63O0ZMCX6IJ.2V08S8OIMA8KS@bootlin.com>
Cc: "Alexander Kanavin" <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241204120838.141829-1-alex.kanavin@gmail.com>
In-Reply-To: <20241204120838.141829-1-alex.kanavin@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208370

On Wed Dec 4, 2024 at 1:08 PM CET, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Upstream has moved from autotools to meson, which requires a substantial
> amount of tweaks to the recipe.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

Hi Alexander,

Sorry but we still have the same error. Looking at the patch, I believe
it did not change from the previous version. Maybe some issue while
sending the v2 ?

https://valkyrie.yoctoproject.org/#/builders/65/builds/595/steps/11/logs/st=
dio

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


