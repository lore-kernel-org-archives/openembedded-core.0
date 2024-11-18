Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50455D43FF9
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:25:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.37193.1731921908972551634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:25:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ebd/i6lb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3DBFC0006;
	Mon, 18 Nov 2024 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731921907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/faFQ4h/D6EnAxsar2WmdH+Rrm4dauZyAGTor42Y18U=;
	b=ebd/i6lbpe1dPaRyt+qDzgzq62aNFW6AdQhOaXSYNU3jg1lSJaKCys8T55wFsS5b+7Wkxd
	pyxld2Hq0chan7A9bOo//bsoH7HudYt2aZQRkQzs474d3obo2p2zm2Wte4JWQNdbUPYopO
	cmafPhHrZ0h6yAI5x8/+LyI7eOCLj1L4ekaM48zYFeS6UZPkfzaKC5FU+CY3tjxBENxO/h
	5y6Cs8oLTbt76A4zzop2Il2PLxurJOqgvYWk6V7d4wM0zrhzwZGcMuOpszPEMwdXVNENy+
	nNFTOTNCbgWLgkHHVzvqghgwZIzHRjxrHsDfKnhWWLNqfbJxy3xZepBWSOn2SA==
Date: Mon, 18 Nov 2024 10:25:05 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1'
 hang
Message-ID: <ZzsH8fzusHfF-yEC@bootlin-mathieu>
Mail-Followup-To: hongxu.jia@eng.windriver.com,
	openembedded-core@lists.openembedded.org
References: <20241113125147.3276369-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113125147.3276369-1-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 09:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207212

On Wed, Nov 13, 2024 at 04:51:47AM -0800, hongxu via lists.openembedded.org wrote:
> +Upstream-Status: Submitted [bzip2-devel@sourceware.org]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Hi,

For information, another patch was submitted based on the commit
accepted upstream. So we should probably favor this other version.

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

