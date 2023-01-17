Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3994C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 17:08:55 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.202681.1673975327209054369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 09:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dTF5qHEA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0F5051C0002;
	Tue, 17 Jan 2023 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673975325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoYB+oJzVusOClcrJEUCmcJBbYXo+5kMFmWzjSr+IRk=;
	b=dTF5qHEAQ7PqQqguNGWyLJzf7ErrKpIs/45BGoaFYIPp9x1QruviBmcsItWdYBoR20n/QB
	QJAUOglXOOSovCfIet/ustQuNQpA0gHtUUY2f5hGw0zmaUQZpibR6IO4Y+PSI/jvNTxb9I
	iAvqisYUd98mslxBeBCYU9tiaNZNCoLGzXnyLLIouot7Sfhq8POrIAOlFysebpKxQa+Rja
	PQvrx1tBvSFezpCaojQrxHAnpnznZGyPdF9xtikimsGZO2Q/JYhaNKPUqMpmW7CBMUe/rd
	rIQFFIjlISOYBx7LHVJXPh9ZApg7WBx/+bjtmC54w1Jkc3pM0WozF9+9z1Qxaw==
Date: Tue, 17 Jan 2023 18:08:42 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Chuck Wolber
 <chuck.wolber@boeing.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] scripts/oe-setup-layers: Make efficiently
 idempotent
Message-ID: <20230117180842.17b3666a@booty>
In-Reply-To: <CANNYZj-d-Ref70qgf=+fr8ZDx_KXZ02q36d1Z7Qq4bEF5URAUQ@mail.gmail.com>
References: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com>
	<20230117180307.52fdcce0@booty>
	<CANNYZj-d-Ref70qgf=+fr8ZDx_KXZ02q36d1Z7Qq4bEF5URAUQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 17:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176058

Hi Alex,

On Tue, 17 Jan 2023 18:05:12 +0100
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> On Tue, 17 Jan 2023 at 18:03, Luca Ceresoli via lists.openembedded.org
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
> 
> > I'm afraind I am unable to apply this patch on my testing branch as it
> > conflicts with another patch ("oe-setup-build: add a tool for
> > discovering config templates and setting up builds" by Alexander
> > Kanavin) which is already on my branch.
> >
> > You might want to rework your patch on top of Alex's, or just wait for
> > it to be on master and then send a v3.  
> 
> I think RP is not going to accept the oe-setup-build patch in its
> current form, so you can drop it for now.

Ah, sure, I had missed that, thanks for pointing out!

I removed Alex's patch from my branch and added Chuck's.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

