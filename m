Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873E4C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 12:48:47 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.29475.1655729318555650984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 05:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d5frCYpL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [37.161.31.168])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06084240006;
	Mon, 20 Jun 2022 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655729316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRInGgXfcDof0ZlaEwDaYgcjrwCd3rcu4mpdGoGie/Q=;
	b=d5frCYpLcmt+W2m8iO9qSGQfu9QvnrjwslT6DcB5oHrpCkINfj/+WuWf77q32R1RbHXdRg
	t9lee5b8w/MjYdIcO4qdjRMLCacmPHVYAP4fetQR/r0PgIk5WgprbR69YJfd2dovOgMvE3
	pyiuqdgH3FKw51Q/2meJR2hb7IiMCLo8QBeZ6z7ShNA2VMjyXFGVq1+8fjWJr+U4b569Ul
	oVKnYiapXx0aTn93s8vbMWZPkg7dqz83v/cn2SzBFkd9/IbqxtKmQq6ys2u21+V8EjF8yQ
	Kx79Yn723mXMcAb+3JeZQA09wc5OX2+HL2XMdac6g3mVgz8WvtR/aE+dLCwyww==
Date: Mon, 20 Jun 2022 14:48:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/3] Add python3-hatchling (from meta-oe)
Message-ID: <20220620144832.0c93a7b8@booty>
In-Reply-To: <20220619212520.4158865-1-ross.burton@arm.com>
References: <20220619212520.4158865-1-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 12:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167096

Hi Ross,

On Sun, 19 Jun 2022 22:25:18 +0100
"Ross Burton" <ross.burton@arm.com> wrote:

> Recipes in core are now needing to use the Hatch build system, so
> move the hatchling recipe and class from meta-oe to oe-core.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

This patch is causing failures on the autobuilders:

ERROR: Nothing PROVIDES 'python3-pathspec-native' (but .../python3-hatchling_1.3.0.bb DEPENDS on or otherwise requires it). Close matches:

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

