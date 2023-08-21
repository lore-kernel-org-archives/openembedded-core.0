Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57253EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:11:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9355.1692619858301682886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bfP+fDg4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12041E000D;
	Mon, 21 Aug 2023 12:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692619856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1smaby8EzoS+9dy1iYC6yYrMvIQJGuv6dJZlk8jNgH4=;
	b=bfP+fDg4VlPok9xUQqZbU21wycbyAgXf9uECJqR4Uo26kyxIKftO3qW20Xv5pZGSy+zDeD
	/yTinLdKS9dgGeSzAJCkW3bqJEjknoWmL9WUxCzEyDJO0c85r0ztGNSYQ8lbTJED1P4S0o
	D6lWAjcoBlDcDZsMj6OGEzujZ45MNLTw2o6RB00nFt6t1F6uGn5zEAYv4vsiG0FMYOkDDN
	oOkdi1kQC34R+0z7iWlatmNgep21mka/jIeLGuIrnFKxM086yqODTHEA5G3+RrPkrHSXAA
	cZKwyO1aTaULiepMRCnIXaTOFDgl2m7+9IIOf6P2BQ0di+7LTlDNE8cZPfThOA==
Date: Mon, 21 Aug 2023 14:10:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jasper Orschulko via lists.openembedded.org"
 <jasper=fancydomain.eu@lists.openembedded.org>
Cc: jasper@fancydomain.eu, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve_check: Fix cpe_id generation
Message-ID: <20230821141054.4f13eb78@booty>
In-Reply-To: <20230821120230.29184-1-jasper@fancydomain.eu>
References: <20230821120230.29184-1-jasper@fancydomain.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 12:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186434

Hello Jasper,

On Mon, 21 Aug 2023 14:02:30 +0200
"Jasper Orschulko via lists.openembedded.org"
<jasper=fancydomain.eu@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the wiki for more
info and how to solve that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I'm taking your patch for testing on the autobuilders fixing it
manually so you don't need to resend your patch this time.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

