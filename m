Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D682C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 10:06:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.11730.1674036366644262035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 02:06:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ettic41g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A3A260003;
	Wed, 18 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674036364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTKCQsBkSGvb5kN+qn7d+6MmqC5abFjRVADbX0fuzjA=;
	b=Ettic41gkjAXz5fcnnxYEl5a4v5IhoNUBTIyDIZoaqmZr1QEC/KNVM1jWFfAsOXSWSqkfo
	jH3gpRiReR2cuI9CCY7eu6IZ2rZViicHxZTXW0+0pjO7z9a/i3ckN97OKtvt/2ioq8IykI
	h4CjZOuDakufFxqGB0EMeZ6eD1d+pcunAvL8xBHo6MyywjNWYhFThl4y1dIK+8xqqY2erh
	h3MYXNWz8o6vDRmGyALMEyZFN8jTC1i8YmKN0wHGbFYAYyxddnmFqcEa+VCENIOjP99JDG
	1wrFUqPFLEiIwQff5HcMPKCkowGw3bC6hXBbnuZwFwDwylgRhKMwEqb93PR7pA==
Date: Wed, 18 Jan 2023 11:06:01 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: maanyagoenka@microsoft.com
Cc: "maanyagoenka@linux.microsoft.com" <maanyagoenka@linux.microsoft.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, paul.eggleton@microsoft.com
Subject: Re: [OE-core] [PATCH] create-spdx: fix config build by adding
 dependency to enable reruns
Message-ID: <20230118110601.7d497d8f@booty>
In-Reply-To: <IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69@IA1PR21MB3499.namprd21.prod.outlook.com>
References: <1673978504-5453-1-git-send-email-maanyagoenka@linux.microsoft.com>
	<IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69@IA1PR21MB3499.namprd21.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 10:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176083

Hello Maanya,

On Tue, 17 Jan 2023 18:02:52 +0000
"Maanya Goenka via lists.openembedded.org"
<maanyagoenka=microsoft.com@lists.openembedded.org> wrote:

> Also, signed off by Paul Eggleton: paul.eggleton@microsoft.com
> ________________________________
> From: maanyagoenka@linux.microsoft.com <maanyagoenka@linux.microsoft.com>
> Sent: Tuesday, January 17, 2023 10:01 AM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Maanya Goenka <maanyagoenka@linux.microsoft.com>; Maanya Goenka <maanyagoenka@microsoft.com>
> Subject: [PATCH] create-spdx: fix config build by adding dependency to enable reruns

Here you seem to be replying to a patch, but the original patch does
not appear neither in my inbox nor in the archives (I checked on
lore.kernel.org).

Can you send the patch again? A "[PATCH][RESEND]" tag would be OK I
guess.

Thank you!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

