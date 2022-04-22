Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2BDC47095
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.6583.1650621582827391601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hKnWzeiE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 01C802000E;
	Fri, 22 Apr 2022 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650621580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlWyXPJFDT1rYv0pl+w+KLsTXqs9NeDDTVGv1QdQ/gg=;
	b=hKnWzeiEc0BDM47I6Wv/3b+29HecDvu8XbLXHrss5RUV1mNGFySBODySoA57t05qs+R/M1
	tZ5rec/c6WSVCfWqgDGxB0WzAlsuzxt7Go7317zq8+IalRjUkc7KRcNw21HbLAKWjgyPxG
	XZueyb/Go2/Q8+3XjWQ4Z2yoVMgJnO4IaCXNKVat1irVVXueQt4CmYytbju4Sm7j+eDNTZ
	oLMJC4B4cgr7cWncGP0PjwkN1HeD5nzspwnXnZjaTFlkgjL9ELEtQpWHTEan+quq99+IOK
	wKc+WLgFGFlDoU22UIhqAp28Rg3KRxRVhdxzRUB1bUljLdNKyZ0bpVUcnKr0nQ==
Date: Fri, 22 Apr 2022 11:59:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Matthias Klein" <matthias@extraklein.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
Message-ID: <20220422115938.776ffbd6@melee>
In-Reply-To: <20220422083247.1322-1-matthias@extraklein.de>
References: <20220422083247.1322-1-matthias@extraklein.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164784

Hello Matthias,

Il giorno Fri, 22 Apr 2022 10:32:47 +0200
"Matthias Klein" <matthias@extraklein.de> ha scritto:

> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-

This file is not in oe-core. This patch should be sent to the meta-oe
mailing list.

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

