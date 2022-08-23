Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A06EC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:29:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.32537.1661264932425963336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SNycGF3i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3337EC0008;
	Tue, 23 Aug 2022 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661264930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g76LwCtoyu7EROwHjm0I03bWEtUrCeEWtdXEi0jt1Cw=;
	b=SNycGF3iwUSHWC5xubQVqE2DzSjSFnvDR/+v9OTmoQy9XYBaiHtyMXGL7zFXc2qIraY/HK
	0j1rsa1tkkmzhKJTJu6EMvegnq2Fscjwjpo3U7XlJ59ATxwAGE/Kh7rEpsYchI7b86Hh7y
	wt+mNKHfR2LACRcNkEbY/MCaoqTdik2UGgveSNI6GGSIc/gCs8BVnjWoE6Vr/E5n+H51xZ
	rrEqxWQUUgYSOmrK3cEU5tzw5Zpn85Oi5LomR4BpOwNBPNKJdgvIoE4T5UypVJ9zZXXhlo
	GKRBsfUv74P3JsSW6QBTBQ0KqQKnOh8oMkJy577a4kP/08MNFXjPDeERSfadHA==
Date: Tue, 23 Aug 2022 16:28:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Enrico Scholz via lists.openembedded.org"
 <enrico.scholz=sigma-chemnitz.de@lists.openembedded.org>
Cc: enrico.scholz@sigma-chemnitz.de,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] npm.bbclass: fix typo in 'fund' config
 option
Message-ID: <20220823162848.3468656c@booty>
In-Reply-To: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
References: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:29:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169709

Hi Enrico,

On Mon, 22 Aug 2022 13:13:36 +0200
"Enrico Scholz via lists.openembedded.org"
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see above, your sender address is getting mangled. This is
not your fault, it is done by DMARC for anti-phishing, but it makes
applying your patches annoying.

Can you please try to work around that by setting the sendemail.from
parameter in your git config?

You can read the details in this discussion:
https://lists.openembedded.org/g/openembedded-core/message/166515?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crootfs.py%3A+find+.ko.zst+kernel+modules%2C20%2C2%2C0%2C91453338

Thank you very much!

However you don't need to resend this patch series just for this.
I fixed it manually while applying to my testing branch.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

