Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCD7C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 11:22:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15185.1706181729369034669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 03:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RtyUpIMF;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kpvb60nwOuffmwdpS699znSYrH+d8W3zrbTHGZT2v8s=; b=RtyUpIMF6VRvymMH0vbpzGixRC
	VwrVHAwq8+7Tp2ktlhalf+DF8tzGgZtSNQNuoNqssgXz95l9j1OP7g8/D1e0Lub8yEtkNsxwC30J4
	M2UZ2lOflsv0cdqqVhJUvi6NHOcBUEBj2unQYU8MudiQ3DjegR9y8Zbu2B+7RerCk+pDFN98Z+G7o
	x9A9sLpiMY3P9Chn17PmU97brK1UWxUI+ocTADjF2swwBRQG1ktbmksE+K1jlnUN+aJWWCzNNHkk9
	o4AnNvbS1KH9+nW4r9PNGvoSdWDRiwRLS7/PQ1A8cQZjzo/CCTAQZGT+P9pf3zcMp42uQ0E46Fc5Z
	wQEQYbcw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:50244 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rSxo5-007I5v-0I
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Jan 2024 06:22:06 -0500
Date: Thu, 25 Jan 2024 06:22:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: tutorial-level questions to clean up recipes for demo purposes
Message-ID: <58f27f4-ffee-b4f2-9d39-2c286f7377c4@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 11:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194316


  (NOTE: i'm currently tutoring some colleagues in the basics of OE
and using standard OE recipes as examples of good programming
practice, so occasionally i run across something that looks strange
and i just want to clarify so i don't have to say, "i don't know, i
guess there's a reason for that, i just don't know what it is." so,
first question that has arisen ...)

  in current dropbear recipe, very last line:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/dropbear/dropbear_2022.83.bb#n134

the line:

  FILES:${PN} += "${bindir}"

but as i read bitbake.conf, ${bindir} is *already* part of FILES:${PN}
and i see nothing in the rest of the dropbear recipe that redefines
the PACKAGES or reorders them. is there some point to that last line
that i am simply missing? it seems unnecessary.

rday

