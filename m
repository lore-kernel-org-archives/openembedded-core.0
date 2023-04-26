Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F71C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:30:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3856.1682501424643456923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=THBhFQwm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 203E0FF803;
	Wed, 26 Apr 2023 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682501422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEngxAtUmm+sE6T0L1prIxe+EbqvBPcg79w9MXySWyQ=;
	b=THBhFQwm+1cOfXmJ95uFC9qQcdjOQYt2KvGWJWWgxUIPdtTv2F3shH3JXO3niGfLPfaCOr
	DdP9ZK0jNT1b0Uj4GHnBbkPZSQB8e0qWi4x8aS9CL7CNaywkvLn7Acw4GKJhQvj6HvFSi1
	zWv+L89RrrHCjEchByMwcbo0FmPCDcgFp5jTKzNqvUl2dm0818oPsjnFb1mhV3uNvOPyGN
	f9kgvv6uaDVD+qaZ38eR+4RP95bDjhdf+5hJZXyQpacNxA0hZ419N4A4ZO9lU1md7mfXSS
	r0DA+7tEx6Jh2pAa5Jq8LPLR60H6mGEKKwDiqwec+/JcTsjOf33GYu+RMAhbzg==
Date: Wed, 26 Apr 2023 11:30:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Chen Qi via lists.openembedded.org"
 <Qi.Chen=windriver.com@lists.openembedded.org>
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] unfs3: fix symlink time setting issue
Message-ID: <20230426113020.5576e563@booty>
In-Reply-To: <20230425050517.2562368-1-Qi.Chen@windriver.com>
References: <20230425050517.2562368-1-Qi.Chen@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180417

Hello Chen,

On Mon, 24 Apr 2023 22:05:17 -0700
"Chen Qi via lists.openembedded.org"
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the wiki for more
info and how to solve that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I'm taking your patch for testing on the autobuilders, fixing it
manually so you don't need to resend your patch this time.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

