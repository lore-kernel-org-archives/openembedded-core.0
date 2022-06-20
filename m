Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D6AC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 09:50:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.28468.1655718599683343731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 02:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NBoB7JMU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF4591C0013;
	Mon, 20 Jun 2022 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655718597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XV6pjcOT/32JnncEsV8c2lADLvas/jdxij5LxiAuctE=;
	b=NBoB7JMUZtDiNSRTz9v3IJly/bwSD5wMxrToKu3kXKw2I0gyQKmnKmuJtkW4bu8ukdp1jI
	NR7QuHs2xaIxKYNF/8X/WEYNyyAE5lg3xJHGUjRXIBpA6RKJUxr3qVgJecu0tf3Omz4D1O
	0T/bSg847uMO6DHrP57z/BzH9FAZ3NsYyRXD1eM/o5XpYg2fQUuW1Higl1uu1/8dP5U/tG
	C5a80uHbDp9fhDN/wClZE3FwByBu7lasUtxzOfwYSAXMD/A7HN6fkpq5JJH9jYvg6yy+lp
	hHNmO1W41j/Rr7Cce7/wdeQHruTJI518H+gggFEjh0L34Gpqnp9nSrnVMpwHdQ==
Date: Mon, 20 Jun 2022 11:49:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Qorin Qorinna <qorin.qorinna@nl.abb.com>
Cc: Qorin Wu <qorin.wu@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file since
 it has been moved to a separate file since version 1.90
Message-ID: <20220620114955.61d67615@booty>
In-Reply-To: 
 <AM0PR06MB4625172F0F099B35BB980A7BD9B09@AM0PR06MB4625.eurprd06.prod.outlook.com>
References: <20220620080820.10211-1-qorin.wu@gmail.com>
	<20220620112027.4ed71759@booty>
	<AM0PR06MB4625172F0F099B35BB980A7BD9B09@AM0PR06MB4625.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 09:50:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167090

Hi Qorin,

On Mon, 20 Jun 2022 09:24:22 +0000
Qorin Qorinna <qorin.qorinna@nl.abb.com> wrote:

> Hi Luca,
> 
> it's because the normalize-resolvconf requires sed.
> 
> These are the error messages that I got when I built the package w/o sed
> ERROR: resolvconf-1.91-r0 do_package_qa: QA Issue: /lib/resolvconf/normalize-resolvconf contained in package resolvconf requires /bin/sed, but no providers found in RDEPENDS:resolvconf? [file-rdeps]
> ERROR: resolvconf-1.91-r0 do_package_qa: Fatal QA errors were found, failing task.

I see. In this case it would be nice to add either a line to the commit
message or a comment in the .bb file, just to avoid others to wonder
why sed is needed.

I added a line to the commit message on my branch that I'm going to
test. It would be great if you could do so for future patches. Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

