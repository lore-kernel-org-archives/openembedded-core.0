Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C35C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 11:55:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.9972.1707825319653267397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 03:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PppzgYs0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IVZ289JkgLQRf+7ZgJR8uS5Ie86mjXrEscJLE3k58mg=; b=PppzgYs08lTa7xybkDmd+oppPP
	ycoFialVtXTOfOiH3Bj/oWOXA4EXu3kCfpNsVgzAKa0IDyr/cNFz0abNLQnJRhRjdZBii8qVD2Bs/
	X3TZd/3IaANB4gO9eZCOePph2Yud/YYqqxX1Zp8aKs4gcb4A6Pk9QEqtyJs9eF7fTm3gM20Go8thr
	x1LaTyN2PhQlCfKgwN2aRo/1y7k8BbxrSoNsuOHRp13D2UI58zt4DNwTmJZ6l5dq0BRQFCRusRX3U
	mB84QsC+Fa3b1lyiEqzxyvLIMzLtuLA03aEis3Ylas54KWIqpX8twr/1nbKo6e855VVS0SflY4OJy
	kXhvkXXg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41548 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZrNa-00EY5g-2A
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Feb 2024 06:55:17 -0500
Date: Tue, 13 Feb 2024 06:55:08 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: another possible ptest oddity
Message-ID: <6ef9e3cf-6246-3e7b-b4eb-4912b91ac63@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 11:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195391


here:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb#n51

given that check-memfree.py is being copied to the standard
PTEST_PATH, what is the point in line 63 of explicitly adding that
file to FILES:${PN}-ptest? would it not already be picked up
automatically based on its presence in that directory?

rday

