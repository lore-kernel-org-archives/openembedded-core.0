Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915C9D6DDF9
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 12:44:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.19991.1731674658673468355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Nov 2024 04:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cYyjhf1/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713C5FF806;
	Fri, 15 Nov 2024 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731674656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RpUBYV+//sdny0AbQc4EC+WKSbxdYlCWpFm/lXXGc0o=;
	b=cYyjhf1/uwp2c1+U+qmB30OdGY9onj0eE06PjIXUQA8wrBTJ+OMpOo6FlTFBi0Z2fg5zXl
	OupNp7yvtZqVVLf69q6uen/SGvVcxPbA/3hnE61X6o+P1mwZhUL9zGvScHfClxEejWq8gE
	3Z01Hyg9ulB7FoqOtWAICdPYRCV3r6Uk8FDJJY8df9ytMSypaFW2ko6ns4CjJ1LZbud7cJ
	xLjca93N78X2sitokN8AjYbCIF/wfx58cmTU2I6DxO2L9yfX+aCLE1keXk8dKZk94tfvrd
	y7ROlmCcON932BIQllXew/vpN3dvFR9bc1AZtjc8x0ataG7lDlwenkGn+IKzsA==
Date: Fri, 15 Nov 2024 13:44:14 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: add an addfragments
 directive for oe-core and dependent layers
Message-ID: <ZzdCHndPtezHmT75@bootlin-mathieu>
Mail-Followup-To: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
References: <20241114111100.2624737-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114111100.2624737-1-alex.kanavin@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 12:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207184

On Thu, Nov 14, 2024 at 12:10:59PM +0100, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> Please see the patch to bitbake for syntax and implementation details.
> 
> The path prefix to fragments is in its own variable so it doesn't have
> to be hardcoded into tools.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

Hi Alexander,

I'm not sure what is the issue, but it looks like this patch is breaking
the patchtest-selftest on the autobuilder: the remove layers step is
timing out.

https://valkyrie.yoctoproject.org/#/builders/71/builds/431

Can you have a look at this issue ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

