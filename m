Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6ACEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:01:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8245.1687183259263419857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OBJbEJJb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687183256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZ6AAG6ptkk0+p8G10w5DWW0/E/YwLUGG96lfq/1Akw=;
	b=OBJbEJJbvVZOIVHqhYEwAhbPdaiKOJORzcM7tD7yWMwnVWm9yA6kK/ajb7x3H2sNsD+JQZ
	hqqDdvZM10Maa3JVxwTtHUTWLIXg51PTBiVcjksr1F1UNZbpRU6aawb9a1ZtPWyANkDhwF
	U/3/IeCmpsN1SpQIcD7jQzpDmI1YsG1AnAPKMtAijOWF/1k3SQgrGDjDiyP1SEUAzZ/lpH
	XU5GZ83B0kJPc9deQ7W00s2Pv/rn5LE/Wbp9iShm21HR7OIv3XtcwiyjoRaCaRMtd9JLQI
	mL22kgv1KBLwbTFZi9uCCgKrN9S6sEUUoIbzDTH77y5l7xSVCpds8N50kt6Dgg==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63D5B1BF212;
	Mon, 19 Jun 2023 14:00:56 +0000 (UTC)
Date: Mon, 19 Jun 2023 16:00:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] base-passwd: fix patchreview warning
Message-ID: <2023061914005653e4f646@mail.local>
References: <20230618212617.232149-1-alexandre.belloni@bootlin.com>
 <CANNYZj85WkWiLNMjmGVijaNRXf3uzJRtS6Oi8rGi5QpX=yyZTQ@mail.gmail.com>
 <acca71ff9f0c053f16c3b489557415b25659abcc.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acca71ff9f0c053f16c3b489557415b25659abcc.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183110

On 19/06/2023 14:27:04+0100, Richard Purdie wrote:
> On Mon, 2023-06-19 at 15:18 +0200, Alexander Kanavin wrote:
> > Should the regex that finds these lines be fixed rather? It’s
> > entirely valid to say ‘upstream status’ somewhere, it should be
> > matching ‘Upstream-Status:’ at the start of the line exactly.
> 
> The check is deliberately doing fuzzy matching to spot "broken" lines.
> Whether we need that any more now we have other checks for correct
> lines is probably a better question...
> 

Yeah, this was my assumption that doing fuzzy matching was expected.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

