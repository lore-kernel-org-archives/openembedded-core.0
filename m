Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94586C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 08:48:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.46347.1682326098298688338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 01:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iO8xhFuC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6FABDE000C;
	Mon, 24 Apr 2023 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682326096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqfFnQRPPYOLS3JnQoZWiOVyWdZGJMNRj+MTjq5Ps/0=;
	b=iO8xhFuCEj7e1BtanlxEYVo91WauG0jiKsRmHcHtjiuz9xtF4menkh302cbidGnPMwAdAG
	U57Yac8Le/U+MbGlPwSaKVLWJ1lDYYB5VOa3RoVmG4TqPJAj/LsRfg9r+XtjS8AyQ81pDM
	O/q1MjvZe+GuxNlzjtWkHR+S4vLVrdsTcJMMNaMxwnIdkPLZutugBZiCcKyzOXGkdaTRaU
	D5PUrspUezpAISRMdNAdMhBm2p+OjeFjAG3xuabm5mc/ymBXWuHhNIkgSeHH/zsfiRcjwr
	qXofdAO4kypwZFc40N2a/EmtxBha13RbgVMeWLRG+WEV8wql5KVPqHvc/rhXgw==
Date: Mon, 24 Apr 2023 10:48:13 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Randolph Sapp via lists.openembedded.org"
 <rs=ti.com@lists.openembedded.org>
Cc: rs@ti.com, <zarkakareem@gmail.com>, <reatmon@ti.com>, <denis@denix.org>,
 <afd@ti.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] wic/bootimg-efi: if fixed-size is set then
 use that for mkdosfs
Message-ID: <20230424104813.79ddd2bc@booty>
In-Reply-To: <20230421212613.3660730-1-rs@ti.com>
References: <20230421212613.3660730-1-rs@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 08:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180343

Hello Randolph,

On Fri, 21 Apr 2023 16:26:13 -0500
"Randolph Sapp via lists.openembedded.org"
<rs=ti.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

