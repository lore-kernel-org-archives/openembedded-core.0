Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA710C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:32:18 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.25565.1659965533156180426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kXzdap46;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C76B8200009;
	Mon,  8 Aug 2022 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659965531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QfRZbs19EuJ6HiTDcrYAZJ5LM2lEoUlWkKrb1ml4M80=;
	b=kXzdap46rG9R0KtKKHxPN+xEdRDlAwfz0QYU25ST0089y2RbZ648DkGnHnFct94TNAxkXC
	8BoVH5O5jiCUpFGzabZ11I1JzxeZvwR1EGXm3N6oqSUzRqMRdOpVNGQIhPsG4XaMx9frXl
	RnfNePLPBdd2w+dGxGI3FLVCJ1zsy2iwhf6O04uGNo3SySgBBXhByFVfNP+msgz28LHq6d
	wV+NnKAWGNWpfOqgQw9vMXW3Gn3hC++rYCNExdxjYnXQGUPC2auIGIsfViDiME8NUwCPr+
	h0zLULMJ403+VjOIdTlbKQGwRq+WpCywT+fN84mUFunqAKXmcNUJjDyzKCrhFQ==
Date: Mon, 8 Aug 2022 15:32:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] classes/sanity: De-golf regex
Message-ID: <20220808153209.199cd35b@booty>
In-Reply-To: <20220808131951.2029559-1-JPEWhacker@gmail.com>
References: <20220808131951.2029559-1-JPEWhacker@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169088

Hi Joshua,

On Mon,  8 Aug 2022 08:19:51 -0500
Joshua Watt <jpewhacker@gmail.com> wrote:

> The regex to match github or gitlab was unnecessarily shortened, which
> prevented them from showing up when grepping.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Thank you!

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

