Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682ACECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 14:38:16 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.71398.1661783892338599079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V6WnzfQ4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87757100004;
	Mon, 29 Aug 2022 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661783889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u4dyV6AyvqhI3prudusBr1snJRCIKf//pFXXeM0ujsU=;
	b=V6WnzfQ4DoSYsmtqzXNFPcejVXhjw5slZnMBiBq06SgUIWjLiabfvQXtobKjZWEeTxgFWL
	LIDkC+knbDh0JiuDL1rlCn1DZv8+DIG5FWzYylAC0siXUleRivehKyP8EtFkkkZjs/8/Dg
	qGqLi/s9SWhA5HrZVIoIz+NhUNoWeaIxmiYbFJywkJHrzCXb/p9Q5pX4BxBKwPI/Dpp0Nm
	sL5w5vpmzdCCe1BPzia0/fT1DdSgqZkswknOArt8JEthFsXG6BpO10c9Iyq7LXERzyqzYe
	L2isPyVv7VCLmDy9dvcZPtbMqUqWHaYyMCT9O3ff3jGWZEqoQfjHdhPyxQzUzA==
Date: Mon, 29 Aug 2022 16:38:06 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>, OE-core
 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
 <alex@linutronix.de>, Ross Burton <ross.burton@arm.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
Message-ID: <20220829163806.1be6d653@booty>
In-Reply-To: 
 <CANNYZj-bDq3VaZTu68SS7VgZ_31680f+mxcC-gGYXox42+jXqQ@mail.gmail.com>
References: <20220825203451.2074080-1-alex@linutronix.de>
	<170EEE7825BF9D73.11791@lists.openembedded.org>
	<20220827213209.02c7bba4@booty>
	<170F511AB039C9FD.22386@lists.openembedded.org>
	<CANNYZj-bDq3VaZTu68SS7VgZ_31680f+mxcC-gGYXox42+jXqQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 14:38:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170014

Hi Alex,

On Sun, 28 Aug 2022 14:01:08 +0200
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Okay, all this fixing and re-fixing might have become confusing.

Indeed :-)

> I
> pushed the latest, complete, rebased patchset here, so you can simply
> take that:
> https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/setup-layers

Thanks for cleaning up things. I think having a unique, properly
versioned patch series (v2/V3...) in the mailing list would help.

This week Alex Belloni is in charge of taking patches, thus up to the
two Alexes...

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

