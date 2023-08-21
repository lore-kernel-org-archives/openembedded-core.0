Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CF7EE49A8
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 19:56:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.684.1692647801569187903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 12:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Adcm5Q0S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C41362000B;
	Mon, 21 Aug 2023 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692647799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXmzDabmvMQc5jY4gsVeP8jc9RlDOcPkKYYR846FsZI=;
	b=Adcm5Q0SxTSb6dBqTPJSytAg6KDvPY7P4kLbsJ9/gpe7ngcvdijjiRxq2vvmWc56Z6RPGt
	SK/5UfliMbfcg7/AzPBAydG5YSrMqldeKdE846OV9ZFNkp9jIHK4W9hTlw6f+LrZMH4cJw
	MkNRYbiqTtQFIaZLBjp0Q0JPLOGAfD+A7QVXyExElbBx9u1LTEehxOE854OBy65dyzQdHT
	xkWWVOSKEZB6BWR3VNAjPEB8P5+37lV503BEhPtLZSQ7jQRvseP3EcOK+T8UyxPimH7Xb8
	1CN4JL5HqT+OXt3d6r9SQ1bUM/rzP4k8N3ZbWGrAdIU/MRr3eSsrNi7J6NfqVA==
Date: Mon, 21 Aug 2023 21:56:37 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Adrian Freihofer
 <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 12/14] devtool: ide make deploy-target quicker
Message-ID: <20230821215637.5fac6385@booty>
In-Reply-To: <20230821161120.171956-13-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
	<20230821161120.171956-13-adrian.freihofer@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186483

Hello Adrian,

On Mon, 21 Aug 2023 18:07:15 +0200
"Adrian Freihofer" <adrian.freihofer@gmail.com> wrote:

> ---

This patch is missing your Signed-off-by line, and also patch 8 does.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

