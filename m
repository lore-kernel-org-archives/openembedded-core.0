Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD379C04AA5
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 20:40:14 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.16247.1661373601736906624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 13:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lDRVX0it;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 83800200002;
	Wed, 24 Aug 2022 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661373599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNppEbm/QLI5WH9ArXh8x7CFfysB8vHY7CYajWlmq90=;
	b=lDRVX0itmaWNbxruINsGn/GG7/zznZ/zXj3QM9BFhCBYZYM0ueWjeGPsWgnZXsJBY4TgqI
	mqktBDTotrD4fbkTgQztuvoQTGqgiwH0VNE56CutWAyc/a3xlz3PUJvAeYTGyBUc8IBMEs
	ByD8t8q4N50mmQBUL4gAqZGJV3EaNe80IN0iZ7FmVFfj0duccHkYLnD44+cyKfrzRrekCh
	mp7I0ujhn1p+vfjdrw0pmbFOWeQGVqSGnpF5nTE+E/h1E2Qi3VF5qIUBnni6oSQwbtadkC
	OjbILtp9eEOXfc1pxtOuSoVo5+KzyDuKcz8+tmilf2ORTVt9YtMMoWTC5qwtuA==
Date: Wed, 24 Aug 2022 22:39:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Tomi Belan" <tomi.belan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util: Fix resolving relative
 paths from "/"
Message-ID: <20220824223956.75729556@booty>
In-Reply-To: <20220824165136.11510-1-tomi.belan@gmail.com>
References: <20220824165136.11510-1-tomi.belan@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 20:40:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169828

On Wed, 24 Aug 2022 16:51:36 +0000
"Tomi Belan" <tomi.belan@gmail.com> wrote:

> pseudo_fix_path() incorrectly assumed that 'base' never ends with a slash
> because it's a canonical path. However, base can be "/" - a path which is
> canonical and yet starts with a slash. This happens when pseudo_cwd is "/" or
                    ^^^^^^
starts -> ends?

> when we're starting from a dirfd pointing to "/". The wrong result from
> pseudo_fix_path() caused the database lookup to fail and made pseudo abort.
> 
> Signed-off-by: Tomi Belan <tomi.belan@gmail.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

