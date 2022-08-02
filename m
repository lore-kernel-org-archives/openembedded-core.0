Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6AC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 10:01:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.4323.1659434472662634378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 03:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BuOoKdjX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 57D24C000A;
	Tue,  2 Aug 2022 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659434470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2QmJI2PpICag09rCheWXnCvYIugEc1l1/mkw24GuFg=;
	b=BuOoKdjXkMWiqCJu6goRAqW4Kr5yUoHCEnfM+KRs1Ej/YnhC6HZs+vvgBG7685KYF4+Q0L
	xWp2fhwaFy1Gk4+FTzZMX402dHv1PT8I2C5JpgHmQK7ISJSDE/1wLuP3DciM9Ol3ET46nT
	JrC5W4a0JayrWlSHHIlH/dkCiNoAk/gIw7sKlPj97h2JwQhWrYDkAfBFCId/vZU430gRA1
	riwKNtyzc+D2LNkUmLr/ORlYf0unS5iSonvSrFssRdtoKHJMqH1OUGVeiptqe45jv4TWXG
	WJFN7g63LQeKXL9Epd9lf0PLppX77q461cBKVeDDYXurrF05ecIye67KS8Ruew==
Date: Tue, 2 Aug 2022 12:01:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Johannes Schneider via lists.openembedded.org"
 <johannes.schneider=leica-geosystems.com@lists.openembedded.org>
Cc: johannes.schneider@leica-geosystems.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH v4] classes: rootfs-postcommands:
 autologin root on serial-getty
Message-ID: <20220802120108.18bb83e1@booty>
In-Reply-To: <20220802094019.962927-1-johannes.schneider@leica-geosystems.com>
References: <20220802094019.962927-1-johannes.schneider@leica-geosystems.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 10:01:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168777

Hi Johannes,

On Tue,  2 Aug 2022 11:40:19 +0200
"Johannes Schneider via lists.openembedded.org"
<johannes.schneider=leica-geosystems.com@lists.openembedded.org> wrote:
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As you can see above, your sender address is getting mangled. This is
not your fault, but it makes applying your patches annoying.

Can you please try to work around that by setting the sendemail.from
parameter in your git config?

You can read the details in this discussion:
https://lists.openembedded.org/g/openembedded-core/message/166515?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crootfs.py%3A+find+.ko.zst+kernel+modules%2C20%2C2%2C0%2C91453338

Thank you very much!

However you don't need to resend this patch just for this. I fixed it
manually while applying to my testing branch.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

