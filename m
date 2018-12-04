Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 439 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Dec 2018 17:27:00 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 009DD6C507;
	Tue,  4 Dec 2018 17:27:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 437CF21957;
	Tue,  4 Dec 2018 12:19:42 -0500 (EST)
Received: from web5 ([10.202.2.215])
	by compute1.internal (MEProxy); Tue, 04 Dec 2018 12:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=message-id:from:to:mime-version:content-transfer-encoding
	:content-type:subject:date; s=fm3; bh=QNlwAi8ZXA0mEIMLJGgGryB/TB
	btiI/+RuvoF1K4bkM=; b=KjnyK7Vc0AXytl5WX7p5e45Rfe8NDcm8wUNaEX00a5
	R6WdIz0kEKDTTJgRh7U3c/2hHjR8gHqjyxMoY5wuLTPb9oJ4zaQlMiFcH8PHJaCG
	/xVHHwlbkNTg1JvnZfDSRui4fi33P8eVKeQrV/Xqx+n1NPMW1oEnpH99kuxbTzVs
	D6pUvinRFFUKjKywOcBGZJRg3Ir7bGhYX4nridRXaXDXsF4aKOFEfeO8wFuGJFK0
	9W8qu/XbC7bOnbLch9NsJvwPdfw3OusR/e/Cq4ijP6Gvoi9li/LzMPlcqmFHyIHB
	+5ewMsbmq1faLuqWgsTA7QAqAH65Xj2TQO6E2BukmOgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QNlwAi
	8ZXA0mEIMLJGgGryB/TBbtiI/+RuvoF1K4bkM=; b=KQUWNXlz8m/5QaIOjCppfJ
	AsU81Sg2Lr4B8hIkHy6oBDXyLuJ3qPSzKPUP9AdPZi1Yi1gaJNdbLPdv2feg3vem
	T33tyqUvcBmdjTB37lxPbZYzrBom73GpGakyTkYDK2S7vg2xil/oCkJBs4Tr9yxh
	dih5PkKCCVYuTe3pYIbYfioiF3vWXV39OpOoNnQAOGbk4Lh3vBb3Bwob4IuWK+CA
	qvaVoYO7ZFe49efwcQuvDNO7opZcrGhHalJ7+wQPt57BQMq/LMHxgIH6KT/d7tPC
	+Vzd6KEFuP3FdzBlnjTijJmM4v6J4sN0mF0TzMHPfXZrYqvyQMK4hCg9iLCH4Ffg
	==
X-ME-Sender: <xms:LbcGXN7j66wLGKkZZkLHrzJ4pIRuBrUP62RBK1wEtfeq8sqEXNpIvQ>
X-ME-Proxy: <xmx:LbcGXEbl1USeEdX2VZPEv9IHYvty8dqUbaAyjZIMklHFu0gDsOSv4w>
	<xmx:LbcGXHwCxos4UuwBH3rzivi4lmnH1p_eknYzvsRvMITmKtTjQ6kIAQ>
	<xmx:LbcGXLCsaDh8xu_7YQoQ19b_ZidpaWuFTETMTR3Qemko6oH6BxaVBw>
	<xmx:LbcGXEF4ZYGQ5bXgy42pZCpNC3Xkmd8_HTgHt8RLarO1GUmcLTzdSQ>
	<xmx:LbcGXHiYEGw62Ncqfk77ASvdhUosLHXTyTYSGMkStOxt3pnAbpCdJg>
	<xmx:LrcGXPSsCwes0GWLOh5O4l8wb_FYj8SHo33jZnMea7UaZdDyBs4QzQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id A022D9E22A; Tue,  4 Dec 2018 12:19:41 -0500 (EST)
Message-Id: <1543943981.3647901.1598659240.48255280@webmail.messagingengine.com>
From: Paul Barker <paul@betafive.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-3449945b
Date: Tue, 04 Dec 2018 17:19:41 +0000
Subject: Wanted: Volunteers and demos for OpenEmbedded FOSDEM stand
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
X-List-Received-Date: Tue, 04 Dec 2018 17:27:01 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Hi all,

We've got an OpenEmbedded stand again at FOSDEM this year! The event will be held on 2nd & 3rd Feb 2019 at the usual location of ULB Campus du Solbosch in Brussels.

I'll be present most of each day to run the stand but we need some additional volunteers to help out. Ideally we need 3-4 volunteers for each day so that we can load balance a bit and have chance for breaks and coffee runs. If you're interested in volunteering could you reply to this email for now, we'll probably get a list up on the OE wiki nearer the event.

We also need some demos to show off. I don't really have much myself this year sadly. Demos should show off the benefits of OpenEmbedded (such as building the same image for multiple machines). Ideally we would have a couple of hardware devices to show off along with a demo of Toaster, the layer index and other visual parts of the tooling on a laptop. Demos may include commercial hardware but please remember that we have limited stand space and want to show off the OpenEmbedded project and related open source technologies - a sales demo of a proprietary product isn't appropriate. If you've got some form of demo to bring along then please let me know by email reply.

Cheers,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

