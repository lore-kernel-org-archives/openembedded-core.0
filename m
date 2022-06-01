Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546FDC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 07:13:24 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.4557.1654067595156795770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AN6pxxIL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 13858200008;
	Wed,  1 Jun 2022 07:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654067593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBc2RR+Kr1StGrt1NTGFrBJXE3DPPPcw5EiCSQVFpcU=;
	b=AN6pxxILXV7x60VM4USeRxO9V+GIHvthgV4TulzesUG7lGwbRDJHoTs5iO3a5USCV1YIYa
	mjTn0xXmhBXcGqQHuR4D/En8VGR2GBwMa+DLHc9Yz0oCpXLSjCRROVacg3rfbtXEItRqD1
	PgkjT8YZ13sDawur/P2CHQxFbZ1qbHDvpHdOFS8gTY8Nmb4P0E/cLHPjyoSoXYTGgxTMDa
	GWJYA0XqjoVrDoT40YbLeeZHPzP0MZWLJ5wRHlb0mM1DYHsZ6V0WNGbDA/ZRguuv2Fz3Sk
	A6oAu9GKJTm4k6VPLZwOvHPY4qrIFDdU8ovZiDtq8yRbWse2ZqA9Eodziaxf4w==
Date: Wed, 1 Jun 2022 09:13:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: sean.anderson@seco.com, openembedded-core@lists.openembedded.org,
 Christophe Chapuis <chris.chapuis@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.zst kernel modules
Message-ID: <20220601091310.5c35a235@melee>
In-Reply-To: <20220531151052.3667079-1-sean.anderson@seco.com>
References: <20220531151052.3667079-1-sean.anderson@seco.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 07:13:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166356

Hi Sean,

Il giorno Tue, 31 May 2022 11:10:52 -0400
"Sean Anderson via lists.openembedded.org"
<sean.anderson=seco.com@lists.openembedded.org> ha scritto:

As you can see from the above line, your e-mails appear as coming from
an inappropriate address. This is not your fault, it's a mangling done
by mail servers, but it makes applying patches more complex.

It should be easy to fix, at least enough to allow patches to apply
properly, by setting the sendemail.from parameter in your git config.
This should force outgoing patches to start with a 'From:' line in the
body, and that one is used by git am to take the correct commit author
e-mail.

Can you please try that before sending another patch?

Thank you!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

