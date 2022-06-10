Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B131EC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 13:34:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.27140.1654868095242277292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 06:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=POiG2TOw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 07C7F6000C;
	Fri, 10 Jun 2022 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654868092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FKi6hcJHZX8MFPVRuRVcljDpg3wLOwKSN+gfgF6QIps=;
	b=POiG2TOwKDe4B/UwvyGMurAZtQ3FQ+Xwk74YfdWKTy/M87KRCTMJu78DyLMM4bhRtyR0pf
	C5Teh0bJxR5wom9d8BbAVXwTwu2VWGY5dl9zDCC+KxMAuyEgmvkqR+UZcENUAjFly+Hnx3
	qES+6Wq8cxkuMjWhK+foIrjdbtz7FVL7tbdGdgTHeZZ9Nzj3NWBQrfnJhMolF5y6jOv62w
	ZyI/PCXYAqR6pX4psnYTKnieiBiWtqKWLxR3WqLPjQp0Psdzfew/Ozecq1aWREVFObHTJE
	nxqZMwVKV6bP20ZAl6e4FMc3ox8A3F9hqFdzXYOxekv7CgzzfxQEp6ltSuZ3Iw==
Date: Fri, 10 Jun 2022 15:34:50 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pavel Zhukov" <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org, Pavel Zhukov
 <pavel.zhukov@huawei.com>
Subject: Re: [OE-core] [PATCH v2] dbus: Soecify runstatedir configure option
Message-ID: <20220610153450.631fc61b@booty>
In-Reply-To: <20220609092235.6045-1-pavel@zhukoff.net>
References: <20220609092235.6045-1-pavel@zhukoff.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 13:34:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166802

On Thu,  9 Jun 2022 11:22:36 +0200
"Pavel Zhukov" <pavel@zhukoff.net> wrote:

Typo in subject: Soecify -> Specify

I'm fixing it on my testing branch.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

