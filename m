Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD4A70900
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 11:48:12 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 132E5BF0E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:48:13 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014073013481265-3883 ;
	Wed, 30 Jul 2014 13:48:12 +0200 
Message-ID: <53D8DB75.2030407@phytec.de>
Date: Wed, 30 Jul 2014 13:48:05 +0200
From: =?UTF-8?B?U3RlZmFuIE3DvGxsZXItS2xpZXNlcg==?=
	<s.mueller-klieser@phytec.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 8.5.3FP6|November
	21, 2013) at 30.07.2014 13:48:12,
	Serialize by Router on Idefix/Phytec(Release 8.5.3FP6|November 21,
	2013) at 30.07.2014 13:48:12,
	Serialize complete at 30.07.2014 13:48:12
Subject: [RFC 0/1] add support for the barebox bootloader
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 11:48:12 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed

I would be happy about comments on our barebox recipe and provide a 
story for it to be moved into OE-core:

The barebox is a bootloader created by and for kernel developers. Its 
system design and user interface is kept in close relation to the linux 
kernel. It has support for arm/blackfin/mips/ppc/x86... Most of the 
supported boards are current arm SoCs. As seen on
https://www.openhub.net/p/barebox
the community is very active with 1801 commits from 66 contributors in 
the last year (u-boot:3547/319). It gets maintained by pengutronix a big 
linux kernel contributor from Germany.
Currently, as far as I can see, only freescale supports barebox in the 
meta-fsl-arm bsp layer. As barebox is used by many arm SoC board 
vendors, e.g. we here at phytec.de use barebox, the missing support in 
OE-core could be one reason to see few public bsp layers to be pushed. 
Its the most crucial part of the bsp. We maintain our own version of the 
barebox recipe at the moment. It would be helpful to see it becoming 
mainline in OE-core as this could create some traction towards including 
barebox support in more bsp layers, as a lot of machines are supported 
by barebox.
Maybe there is a better place to put it in, or a better way of 
implementing it, as David already said.
Anyway, I hope this recipe will be helpful for someone.

Regards, Stefan

