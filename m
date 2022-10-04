Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC3BC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 20:45:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.16045.1664916340164866178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 13:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j2xdXwLh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6BEC9C0003;
	Tue,  4 Oct 2022 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664916338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NH9DG49Vf8RVD9vZ+nvXPGbmnITkIyjTSE+QVKjcH2Q=;
	b=j2xdXwLhiSmQv/XxU7cm5jMutIXFp3IWzERWEBzDUj9Ed55fQohoSyNniL75LWJChuHLOw
	Rr1GiRIEgFh529RMBOxmZPNIE1yLeAVpWgKDsAZF6iWkE4cTGF/J1z87BuhUkeiG/KjnzP
	9uFHY91YG+e9xd05iIw/7Odt0a9P6aUsd+W/yc78AhdlSAuBR3jmFtSffIjrkLmsEM8d1u
	6OtdX5hC9d0WQzGIBtcbmlcAQV2sYmLDQzkv+KG5K9cHXCKwkwOEO+t0xOIX+nVwXOE+k6
	SRg37/8DL/X1nC3zDNjBhruikueXiwyhg1ZxjrJ4vx24L1XUXrPMHITpxF44Ng==
Date: Tue, 4 Oct 2022 22:45:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Steve Sakoman" <steve@sakoman.com>
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][kirkstone][Patch] vim: Upgrade 9.0.0541 -> 9.0.0614
Message-ID: <20221004224535.71e9152e@booty>
In-Reply-To: 
 <CAOSpxdapxsxYR+YAUNnYWmQStsEhhZpgC6BdrhLT4JfDZZYpBg@mail.gmail.com>
References: <20221004071151.2920751-1-jay.shen.teoh@intel.com>
	<CAOSpxdapxsxYR+YAUNnYWmQStsEhhZpgC6BdrhLT4JfDZZYpBg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 20:45:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171433

Hi Steve,

On Tue, 4 Oct 2022 04:21:25 -1000
"Steve Sakoman" <steve@sakoman.com> wrote:

> This should be taken for master first before I can cherry-pick to
> kirkstone!  Copying Alex so he can add it to the master queue.

The patch against master is already in my queue, thanks. The build is
not green due to a different issue so I still haven't sent my
testing branch to Richard.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

