Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A94C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:20:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.7570.1654759209487179272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VzFUSg4U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E73FE0011;
	Thu,  9 Jun 2022 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654759207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbv/TyIzpFhoskSycINW+C7HkVbQUbVS7TJ243Xk/kg=;
	b=VzFUSg4UEcE7HkQHjh7yqvNoUNmyBLW4fSqtXgjugezUgrP3buyrlq+IEGmBmT8Hjn/vVk
	cpNfxhoHqIsVP2pSoFgI8QwX77h4nQTN9UeEdLZCIR3IveG3JRqM36IhYkCi4H5JMYjwHP
	pAnpcWZV08f971m0nqcLlyQf87wP6jmBgYhOGz0pW44VBoF4Hbnp6MOtR6uo3+c7c6M/zY
	oEk6/jVClOLGPXs16/jIfvr4vY/G6jLepCRFZU+Co20c/cNO90wgRyHnGrTe3E0XRLF94F
	EcELIb58tlHNVAwPythqnu7cjrPO+9D2AUsfegN85IPShHDXcP1IKlhC7CO+MQ==
Date: Thu, 9 Jun 2022 09:20:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Rasmus Villemoes via lists.openembedded.org"
 <rasmus.villemoes=prevas.dk@lists.openembedded.org>
Cc: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] e2fsprogs: add alternatives handling of
 lsattr as well
Message-ID: <20220609092004.5315043c@booty>
In-Reply-To: <20220608131205.2218528-1-rasmus.villemoes@prevas.dk>
References: <20220608131205.2218528-1-rasmus.villemoes@prevas.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 07:20:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166759

Hi Rasmus,

On Wed,  8 Jun 2022 15:12:05 +0200
"Rasmus Villemoes via lists.openembedded.org"
<rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:
                 ^^^^^^^^^^^

As you can see above, your sender address is getting mangled. This is
not your fault, but it makes applying your patches annoying.

Can you please try to work around that by setting the sendemail.from
parameter in your git config?

You can read the details in this discussion:
https://lists.openembedded.org/g/openembedded-core/message/166515?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crootfs.py%3A+find+.ko.zst+kernel+modules%2C20%2C2%2C0%2C91453338

Thanks you very much!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

