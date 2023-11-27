Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA352C0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:48:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.104960.1701114478448818169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 11:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QH/jFMIJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7626EC0009;
	Mon, 27 Nov 2023 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701114476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcgb9Px4TL+b00sZdht9BHBa03b1tpIj6Nw2zpV9O5w=;
	b=QH/jFMIJ7I4qLtS9o1o/JuPG/1031CWmrqBr4nQ9sh/EGO+tVqw9qFC61o32HRzm4eWNyp
	PnK6iMOYnbiH2Z8ZmbCXz5JZg3vbEqIuRZRyHZ6gxwo6XoGzs2b5KHjpDDtPNV1jes/T33
	TI1RAQVa1FpopUmVzTWCzjnmts9WbKBhWNFjbp7l4eq5Nog+V/1GlW9pSQFyEfmLlfvEne
	oh88H7UQyfWeElYAkZtu7Pt/tSup+Cog9gyH8IT9LB2rQdhy3erEIA4IEAkDKOdZwmaKgV
	jkmb1A/Wfp8ZPqEIurIN6Vps/6jS8YKGFf4KTWA0Sdi6sRd0vedHDDfvFN85pw==
Date: Mon, 27 Nov 2023 20:47:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com,
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com,
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com,
	umesh.kallapa@windriver.com, steve@sakoman.com
Subject: Re: [OE-core] [PATCH] glibc: stable 2.38 branch updates
Message-ID: <202311271947555ac0c342@mail.local>
References: <20231127040046.1024625-1-sundeep.kokkonda@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127040046.1024625-1-sundeep.kokkonda@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 19:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191322

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 26/11/2023 20:00:46-0800, Sundeep KOKKONDA via lists.openembedded.org wrote:
> Below commits on glibc-2.38 stable branch are updated.
> 1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
> 719866ab2f Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
> e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_map"
> 
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 19b98bc11a..ccf9d505c5 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.38/master"
>  PV = "2.38+git"
> -SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
> +SRCREV_glibc ?= "1e04dcec491bd8f48b5b74ce3e8414132578a645"
>  SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
>  
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191246): https://lists.openembedded.org/g/openembedded-core/message/191246
> Mute This Topic: https://lists.openembedded.org/mt/102823529/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

