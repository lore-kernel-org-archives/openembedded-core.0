Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDCFC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 08:44:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3415.1681980240890371906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 01:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E5tghEy9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 93DEC60013;
	Thu, 20 Apr 2023 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681980238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/jAaXmRg1sCP3SDi98fzuG5Y0mds1w1jk5rS/Pgv4I=;
	b=E5tghEy95tbj9Lgc3VxPfCPQhlAWs+3l07tEUAjLK35AwcHdY+wiRo2CSWq749t6MzW4tH
	3ftVPSObsfC1rsD1E9jP92SUxriT+aZaM22MIYc8wuA7+HKzrhWY5RtSC+39i+gL0hM52/
	R+lQQURhaS8aEFlaNtju0M2BZyvL2BUld7ScRqIBw7ROPMOdggtEvbuieu4KekV125ALQR
	CbTdrKeqLz+FEaUV9upYwYRsB4r2cJc3+aWI0iNz3uvtlvjgazRATNFt3B8c3v97LGDAJB
	EmZTmc8WmhZbsagRFmmv5bcbUu0hqDeLuIQWApH2K1tW1jFp5EqVOkswI/sy9A==
Date: Thu, 20 Apr 2023 10:43:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yang Xu via lists.openembedded.org"
 <yang.xu=mediatek.com@lists.openembedded.org>
Cc: yang.xu@mediatek.com, <openembedded-core@lists.openembedded.org>,
 <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2] openssl: set package level PERL5LIB
Message-ID: <20230420104355.68722b88@booty>
In-Reply-To: <20230420063034.16806-1-yang.xu@mediatek.com>
References: <20230420063034.16806-1-yang.xu@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180239

Hello Yang,

thanks for you patch. However there is an issue with your e-mail, see
below

On Thu, 20 Apr 2023 06:30:34 +0000
"Yang Xu via lists.openembedded.org"
<yang.xu=mediatek.com@lists.openembedded.org> wrote:
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the wiki for more
info and how to solve that:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I'm taking your patch for testing on the autobuilders, fixing it
manually so you don't need to resend it.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

