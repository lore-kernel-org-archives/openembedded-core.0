Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A69C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 18:36:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.60344.1682361385658604645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 11:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mhYy/61V;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF1DE1C0002;
	Mon, 24 Apr 2023 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682361383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrPmjY/hkJ4k5daXZADvMiCNmC6L9Z9A+UrJBRm2E8Y=;
	b=mhYy/61V5vBJwCaeVbM7KtO2IXcO2sfYZf8H8eVN7Lj21FxyKL546SuJwaLjXDieuD+JLc
	HgtAwKPwIglhbqbjGVDn+ik3y5peq+x7GuauK8lEUFkyxGMgHsL1sECUDIFbU4V3bXnByz
	kRu/RkHrTHrLRon9dOT/674vNMIsmSsWyjZ1IG+MtjUnMx8hQb9NutjMHzoHFwezC2a6PZ
	/TRVzubRPmN7J6o6KJmaRQzvuRlLvEV79c16DKWgybDnsmUE0v18rRNtPoZp+kcF4oteKW
	3kn0fBkos7GY4frORmtVGd44sdrtrM6IlUM1Y0NP7XAylplSyoENs48AnClVhA==
Date: Mon, 24 Apr 2023 20:36:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Joe Slater via lists.openembedded.org"
 <joe.slater=windriver.com@lists.openembedded.org>
Cc: joe.slater@windriver.com, <openembedded-core@lists.openembedded.org>,
 <randy.macleod@windriver.com>
Subject: Re: [v2][oe-core][PATCH 1/1] ghostscript: fix CVE-2023-28879
Message-ID: <20230424203620.435501df@booty>
In-Reply-To: <20230424173432.3199964-1-joe.slater@windriver.com>
References: <20230424173432.3199964-1-joe.slater@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 18:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180362

On Mon, 24 Apr 2023 10:34:32 -0700
"Joe Slater via lists.openembedded.org"
<joe.slater=windriver.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

