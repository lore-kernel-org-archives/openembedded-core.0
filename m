Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0D9C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 17:43:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1119.1637602994384672656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 09:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0F7C40C30;
	Mon, 22 Nov 2021 17:43:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVKKrQWpu4-x; Mon, 22 Nov 2021 17:43:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C275040AC9;
	Mon, 22 Nov 2021 17:43:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE74B1746D4; Mon, 22 Nov 2021 12:43:07 -0500 (EST)
Date: Mon, 22 Nov 2021 12:43:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: pls comment on weston non-PAM patch (link inside)
Message-ID: <20211122174307.GQ18191@denix.org>
References: 
 <CANNYZj8h4kDhv-ZqkKqMY_aXAezOVYmmrV28jn-jQjdK-d3N2Q@mail.gmail.com>
 <CANNYZj-A4OU5FvM3sMLDfYiv0KBujAifRnCijZHxa_GP4YvELA@mail.gmail.com>
 <DBBPR04MB7753DF2FEB25F92BAD71E716E29C9@DBBPR04MB7753.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <DBBPR04MB7753DF2FEB25F92BAD71E716E29C9@DBBPR04MB7753.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 17:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158587

On Fri, Nov 19, 2021 at 05:58:42PM +0000, Tom Hochstein wrote:
> Thanks Alex. @Otavio<mailto:otavio.salvador@ossystems.com.br> pushed the 
> hardest for the use case and I don't really have anything to add. Given that 
> Pekka has suggested that there is a better approach without weston-launch, 
> it seems that removing the patch is fine. In the worst case we can backport 
> the patch to meta-freescale until we have a new solution.

I would agree - if upstream supports our use case differently, we should 
probably switch to using it and drop the patch. That would be less burden 
updating it between the versions...

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

