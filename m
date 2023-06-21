Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7C6EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 07:55:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.5818.1687334122537295523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 00:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=An8D25A6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687334120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDNPwZTWq1Sp0gDsEn/Bh1WUOKqxMvkaRhTg7P9c6Jw=;
	b=An8D25A6Epy7k4eyz1gRq/4FNZORyFcBE9+Qb2uPQOKce5lLu0Ok/8Nc/2d35bK2Pfp2M4
	JTEX3A97aChI5r16x6v6r864KspBDGryjCI8fCILHw5Ih9Bxu9aqToNjwdX7hYPACt/Bsl
	GuLDxmg4mwtySZYB6m7N5im0IS/aAlMgO7HdljLah9imihchSsJCrdJIqvIpfjE8OOi3Nc
	Wjwt8HvnA40hk8w8J1VC+VdaYOog5qs4o2R2Sm9xk/x5X0is8cvZDuHiKKn98dcoUiTBYV
	xk8ZO6xrLOgbwe5vfd5QngeS8b2eI19m+fZ9WPXUvmm1osIBVSJc22txTVE6aw==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90764E0005;
	Wed, 21 Jun 2023 07:55:19 +0000 (UTC)
Date: Wed, 21 Jun 2023 09:55:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andrej Valek via lists.openembedded.org"
 <andrej.valek=siemens.com@lists.openembedded.org>
Cc: andrej.valek@siemens.com, <openembedded-core@lists.openembedded.org>,
 Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core][PATCH v6 1/2] RFC: cve-check: add option to add
 additional patched CVEs
Message-ID: <20230621095516.0894b0c5@booty>
In-Reply-To: <20230620141557.54562-2-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	<20230620141557.54562-2-andrej.valek@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 07:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183172

Hello Andrej,

On Tue, 20 Jun 2023 16:15:56 +0200
"Andrej Valek via lists.openembedded.org"
<andrej.valek=siemens.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the wiki for more
info and how to solve that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I'm taking your patch for testing on the autobuilders fixing it
manually so you don't need to resend your patch this time.

Best regards,
Luca


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

