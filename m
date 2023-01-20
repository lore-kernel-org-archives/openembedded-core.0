Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7B1C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 11:48:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.72167.1674215278353057575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 03:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z8soO+yW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E294B1BF207;
	Fri, 20 Jan 2023 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674215276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4qXIpIgpIm7O5arHIWzEpB0dfzUVIJd4Lf2AmbT0dk=;
	b=Z8soO+yWCRNcBBfnY9vQ3ra6AHGHOuj9OiZ3SXXwoF4mpoc3BnDPHHp9FMOAAce8v7oMp+
	qJ9tC62pT+a7d8JHg8vyU1hPJyYfSTLhIP7oK7mgA1nfabf940iGHSpYYRuk7DOrZLIV+m
	REXNxhltOpiDCeJ2URdq+6y8Ld5Cd3R3XU9nZsbJai/s3ivqgTT1XnZ/YOkF2NksNFPjo4
	J/DhNj/aLyWfZ3xVRGkFkkIfjW39MCgkk5d2PR09k6EOC2RXHUJsaNdOSPhwI8X88Pvomp
	U69vRxp9Z+V8RcElc9lCC1SfZrUMuk/dksFdW7F/1j5uJRRTv+drAWWvaaOfTA==
Date: Fri, 20 Jan 2023 12:47:54 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/3] binutils: Upgrade to 2.40 release
Message-ID: <20230120124754.14c0e5d3@booty>
In-Reply-To: <20230119235141.1603399-1-raj.khem@gmail.com>
References: <20230119235141.1603399-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 11:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176185

Hi Khem,

On Thu, 19 Jan 2023 15:51:39 -0800
"Khem Raj" <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I'm afraid this time the patch does _really_ not apply, and the simple
sorcery I did for v1 and v2 is not working anymore. If you could
recreate the patches based on a clean oe-core master branch that would
be good.

Thank you!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

