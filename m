Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86610C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 10:08:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3603.1698401330299939514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 03:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f+vPXz/q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 688336000B;
	Fri, 27 Oct 2023 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698401327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dovnkhyEJL2KmCTHbuFpaSaRYZdiRgIrUQuyZD/Uwk=;
	b=f+vPXz/qTOxa+c2kxZuDwszIGBsLkjJXFQsGs+TlH+v1N5vgp4se3LDHN/6ymhdcRhScvU
	C6EuzDnypEN9m4NOmL1MJsiL70zeDtF7xwngxeTIpzvk0xkK61P/gXInv3jxNbp4bwmvmm
	kGm6RSLNTn5dtRhCOm8Rh64aFrVLart0ZfIzaqcgKUcapymY/YbuYXokjtR5kpvgWn0v5H
	izmqZBIB+HeAEVUFMeBP3jgh3RZqGjp7V8BBzIjLBAqJbrFuKTCcrOERqioRB4Qczm7Rhy
	ApqgIFmfLFy2laxbgKnOmtyQnljtQ6Mcvp8VhowPDbqYgQiebQwcKKTPZNB5kw==
Date: Fri, 27 Oct 2023 12:08:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "William A. Kennington III via lists.openembedded.org"
 <wak=google.com@lists.openembedded.org>
Cc: wak@google.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
Message-ID: <20231027120846.5466ec42@booty>
In-Reply-To: <20231025223710.93502-1-wak@google.com>
References: <20231025223710.93502-1-wak@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189742

Hello William,

On Wed, 25 Oct 2023 15:37:10 -0700
"William A. Kennington III via lists.openembedded.org"
<wak=google.com@lists.openembedded.org> wrote:
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see your sender address has been mangled, and as a result
the patch is rejected by the the openembedded git server. This is not
your fault, but we need you to modify your git configuration to prevent
this from happening in the future. Have a look at the Contributor Guide
for more info:

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity

I'm taking your patch for testing on the autobuilders, fixing it
manually so you don't need to resend your patch this time.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

