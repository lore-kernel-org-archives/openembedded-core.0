Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F896C433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:22:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.6855.1652962941328962737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z4jHk+CQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9BF37FF816;
	Thu, 19 May 2022 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652962939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6z8VsbHWdqx0RfoWYESPKChzYiGJDaM7lFcSfDwGUs=;
	b=Z4jHk+CQks34SeCzeuY42Gt5c/eiDFJ06QL6oDunXfnls9hPtTb0xt8tzdJOrfZ0G/sYxl
	tdRUYGLVIGxe5GIHamu9cWypG5Tk7yxNLz9Tyh8ndFXXDF33f22qJe9WDkt3tHL8HKjlyP
	5PImtLInqjBQZQSbngGxqVTpDE8DxQqOXnMcl/ILxFlGIucloNfoXsQ4CveQUINitqHJXO
	RXaIP4zAo+OZbCLuRMzefwmzl8/LYSlxHsE5y0IqnBmEf2AnVFi15mMkzE6JQ6GL2djdsN
	GgoHaqEaUvtpXrujcEduzs5n7Eci0I2wVpEB+TqAPIyUk74OjoJAj5BjE49lTw==
Date: Thu, 19 May 2022 14:22:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Squires <mangodan2003@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gstreamer: updated to 1.20.2 bug fix release
Message-ID: <20220519142217.4a4b2cb6@melee>
In-Reply-To: 
 <CAPxFgq345oM_htKTmSGTTb2qZ7sNp5GQQNwN28cP6SwM2jA2sA@mail.gmail.com>
References: <20220518123723.134317-1-mangodan2003@gmail.com>
	<20220518171247.2a7d0ab5@melee>
	<CAPxFgq2tqLtPeNZdjcp3LuYZ=Ou=MxBbx1We7+g=PErPhOGsZw@mail.gmail.com>
	<CAPxFgq345oM_htKTmSGTTb2qZ7sNp5GQQNwN28cP6SwM2jA2sA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 12:22:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165883

Hi Daniel,

Il giorno Thu, 19 May 2022 09:14:15 +0100
Daniel Squires <mangodan2003@gmail.com> ha scritto:

> just out of interest, where would I look to checked what's been
> submitted? As I looked in master-next of oe-core before submitting it
> was still in 1.20.1. Is it just a case of scanning through this
> mailing list?

Yes. Patches reach the mailing first, and from that they are taken for
testing branches and eventually hit master. Apparently you have checked
a short time after Alex sent his patch, so you have definitely been
quite unlucky.

No problem at all, these things happen. Thanks for your patch anyway!

In the future please remember to use "reply to all" so that the mailing
list receives the entire discussion.

Kind regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

