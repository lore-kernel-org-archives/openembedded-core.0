Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2410CC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 09:43:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4951.1675849376610280399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 01:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CWKG/9KS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7FF5E0009;
	Wed,  8 Feb 2023 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675849374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HqKJhMh615ajwqu8bdjYHwVtsvri+0TUU/7yUVkOIXk=;
	b=CWKG/9KSt1zxNT7sPciYEIxn6tIHicSHz213c1GLjtrVVi/IkhU6jvM6CFKfzAFCn40VWw
	dl27VlHKQslxSkiz0tScNAkA9ZWMca38cXMrXdNB9BXLpDg3TSa9+5SXLqzl4rGQs+whRt
	8oCa+vwbVRhLFdCYvphB/VKfPk+rLMiG3Wp3cxnrbCBG+OmnktxJbwpaiwqimF9LFwrvJ6
	MsCWd354gXznVSNNuhNT9p6D9xrBwXyy3wtRwh3PjGHn0PMEzemj1UcLfQEXmMaAF++gnM
	XY2YJYyt5xb7+VhlfQQCmsjRyc99/VzFgBezLWabHD9YRpTep/L9YGDlhBz3UQ==
Date: Wed, 8 Feb 2023 10:42:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Chen Qi" <Qi.Chen@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 01/52] ifupdown: update 0.8.43 -> 0.8.41
Message-ID: <20230208104250.7ef3107b@booty>
In-Reply-To: <91a725de-88b4-6dad-cd41-f6a44cd5d685@windriver.com>
References: <20230208072143.2930292-1-alex@linutronix.de>
	<91a725de-88b4-6dad-cd41-f6a44cd5d685@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 09:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176898

Hi Chen, Alex,

On Wed, 8 Feb 2023 15:48:40 +0800
"Chen Qi" <Qi.Chen@windriver.com> wrote:

> Typo. It should be 0.8.39 -> 0.8.41

Thanks for noticing! I have fixed the message while applying to my
testing branch.

Alex, I also skipped "python3-sphinx: upgrade 6.0.0 -> 6.1.3" as I
already have a patch by Tim doing the same upgrade in my branch.

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

