Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AED0D41D79
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:36:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.86980.1731418569354111102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D+NNfrDR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7364220008;
	Tue, 12 Nov 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731418567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=21FVxlii/qP+PYqR4///U1p5+hO9FbGBTJFj3iRxyXU=;
	b=D+NNfrDRIFid10WaQ4wHwEMotMOb5q+n6ciigqBI8q/cOcgWHebK6BWXnjPBf3ytG3Thpo
	XsNrGaEKlrrC66VrXS4vYXf4oyIcgGIf39HyNATY3Sbde0k5WAP9cxTrRoCjEmTQlPbQm/
	0Nrf0bzxkCxa/Zoc8dtt9ONiwACC421mWSMzlPRYSXBy4iNsnYiktDqEvX3DpD0zBTznO5
	Qz4HzOITyel1WzUceXAww1O52IAQlgaLPCywirCsNsChBRo6LwdKO9RBQtlzo/siZH73DX
	KX0t5pt2v+W0jy6AggEaTcENkoJ8b1RE6bPLwFi6NYycg9Wz+k3L5LQi5m4Ing==
Date: Tue, 12 Nov 2024 14:36:06 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Jinfeng.Wang.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2]v3 tzdata&tzcode-native: upgrade 2024a ->
 2024b
Message-ID: <ZzNZxr5mKWHXQ6vm@bootlin-mathieu>
Mail-Followup-To: Jinfeng.Wang.CN@windriver.com,
	openembedded-core@lists.openembedded.org
References: <1804B3B536644BBC.30502@lists.openembedded.org>
 <25b5bbc0-ec05-418a-bd30-6edb7dfbbf92@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b5bbc0-ec05-418a-bd30-6edb7dfbbf92@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207051

On Mon, Nov 11, 2024 at 10:35:30AM +0800, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> Ping...
> 

Hi,

I believe these patches were already merged in master:

https://git.openembedded.org/openembedded-core/commit/?id=0c8f87d5d4ec9f286b1e85d114cb9a728c1ff64b
https://git.openembedded.org/openembedded-core/commit/?id=b84b29b1827624270cc1698feda2ee87d55c01e4

Is there something missing ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

