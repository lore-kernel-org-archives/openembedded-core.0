Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51C3C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:33:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.26905.1653309187908824102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jzeQmEaV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8A56D6000E;
	Mon, 23 May 2022 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653309186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ORMCI6r/gj0LAYc6ILZRplqrh4KcT0V5mq/q+hWOhpo=;
	b=jzeQmEaVdsbb5WKvtmmCuGVEz9AVBAYQEvcwNXl7KLvK8PkxWorFrrdWp96RtGVebmbZZn
	9hACdJZnN8nKACdeptf0MWUQStrP9LJ1K28TChNk11Ud8d9daySQb7En6QDwvH4JXn5U5i
	ySpD9wtguieUC0Gs8I1ee0hTYKtYx0TGpG4Vc9/EpayFSsllsghvgECz5u4csnfpa+iXT0
	cV+ETvVFMPwr284KT1h7jxfJWoJBOACSBSNn88aS19fVawhP4befGUTXNzD3V87HY+ho6U
	wIBBSHyKtirHKjWXDcl+/Ao2jM74wBNHPRhv5DZBbSEcChuERAVIDepI0BuyaA==
Date: Mon, 23 May 2022 14:33:03 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][RFC PATCHv5 5/5] libsdl2: add PACKAGECONFIG options
Message-ID: <20220523143303.6cbab8c9@melee>
In-Reply-To: <20220522084752.1855131-5-f_l_k@t-online.de>
References: <20220522084752.1855131-1-f_l_k@t-online.de>
	<20220522084752.1855131-5-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166011

Hi Markus,

Il giorno Sun, 22 May 2022 10:47:52 +0200
"Markus Volk" <f_l_k@t-online.de> ha scritto:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>

This patch does not apply, it is conflicting with a previous patch
from you that is on master. Can you rebase and resend?

Thanks.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

