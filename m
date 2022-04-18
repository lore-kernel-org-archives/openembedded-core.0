Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B705C64E94
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.37084.1650267287963788885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 00:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fhOZprtJ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 95ADD240002;
	Mon, 18 Apr 2022 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650267286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNEqTIfw+9g2mi08lLcKGD7r3mREB0xy9InTVPaxLeM=;
	b=fhOZprtJU85lDjKIpPUlxlNOGnDD2DxbK49a/rW6zIxuN6Bo57yvsAT1vlIZuRfWwn6Cx2
	Cw1QRe+EmhPDSLke9YZpU8lHmw94xgAUTL4zKkHzD91EcQImIh9uckj0aEu9U/m40GGXDK
	56mj8iMmBg4nD1Co7BnvcqPcAPRJvsG3NhM1UyisDy+unjVEQhwHfjFwF/eQxgFZsJ3D2c
	kXjOAbHDRQTnwRqpYOABsUIOa1varXZxGwNJdsHIwg5GVWhRrJdBZvFp9K7rJSenqBRuI6
	qoYEjlI3Ts5+IMCXL8qdYDTlT90VTZCECC5IaVzFgzsr20adJUrrhNbA3ylPjQ==
Date: Mon, 18 Apr 2022 09:34:42 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Suhrid_S" <suhridsubramaniam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Suhrid_S
 <suhrid.subramaniam@mediatek.com>
Subject: Re: [OE-core] [PATCH] clinfo: Upgrade 2.2.18.04.06 -> 3.0.21.02.21
Message-ID: <20220418093442.09f7f5aa@melee>
In-Reply-To: <20220415182519.47954-1-suhridsubramaniam@gmail.com>
References: <20220415182519.47954-1-suhridsubramaniam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164584

Hi Suhrid_S,

Il giorno Fri, 15 Apr 2022 11:25:19 -0700
"Suhrid_S" <suhridsubramaniam@gmail.com> ha scritto:

> From: Suhrid_S <suhrid.subramaniam@mediatek.com>
> 
> clinfo 2.2.18.04.06 released April 2018 does not show correct
> information pertaining to OpenCL 3.0 released Sept 2020. It shows
> version as `2.0` or `2.2` in systems with OpenCL 3.0. This upgrade
> fixes it.
> 
> Signed-off-by: Suhrid_S <suhrid.subramaniam@mediatek.com>

This patch is not for oe-core, it should be sent to the meta-oe mailing
list instead.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

