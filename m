Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05DBC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 07:44:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.3930.1651650277989163014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 00:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OJkTTEAF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BE94024000C;
	Wed,  4 May 2022 07:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651650276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeZdk/jOSldO1sCtRINdbg4KRjrPgOAt1k4wElHSUjM=;
	b=OJkTTEAF0MvHbrd7X5Ps1DumBTmbB/9szagB8W4dl/7G+JPqFxDfvgHQ2vIcAqCY3TZKBu
	eAt/If9iHFZZcjHnDTX+lm7/LSo0uqhwzR+HImLFYlH4XXhqGo2ogBQyX/eDIH4Pite8HI
	ehbebuUF6A0ohDbl4QYrZceNh66Z7c2RL6YqIQS+muqpOmZbxslWo4RD8VXCMGQqx5vh4Y
	5YrAi1hHD10wKjXixVO+7CccQIEDn6McWdRH9e0G0g9EjWc2Bhuf2Gx0B2XVR9k1914AWM
	qlcUPxrx9/rtp0P3wDCwPFDExhYXa0oZQZaYdNzTUOl5CKI8c+J3TSLlhmuELw==
Date: Wed, 4 May 2022 09:44:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Colin Finck" <c.finck@enlyze.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] networkd-dispatcher: Update to 2.2.1 to fix
 CVE-2022-29799 and CVE-2022-29800
Message-ID: <20220504094433.26b5b4e0@melee>
In-Reply-To: <20220503130957.282-1-c.finck@enlyze.com>
References: <20220503130957.282-1-c.finck@enlyze.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 07:44:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165212

Hi Colin,

Il giorno Tue,  3 May 2022 15:09:57 +0200
"Colin Finck" <c.finck@enlyze.com> ha scritto:

> Signed-off-by: Colin Finck <c.finck@enlyze.com>
> ---
>  ...{networkd-dispatcher_2.1.bb => networkd-dispatcher_2.2.1.bb} | 2
> +- 1 file changed, 1 insertion(+), 1 deletion(-)
>  rename
> meta-networking/recipes-daemons/networkd-dispatcher/{networkd-dispatcher_2.1.bb
> => networkd-dispatcher_2.2.1.bb} (95%)

Thank you for your patch, but meta-networking is not part of oe-core.
It's part of meta-oe, so you should send it to the appropriate mailing
list.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

