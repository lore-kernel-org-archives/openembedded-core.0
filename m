Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B70C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 13:57:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.845.1750427829960478418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 06:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RrvjAiNz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=49ba4V4jO7Zt+s8hN1YKIY/bRISBT0t8M2nnwXynQdE=; b=RrvjAiNzDyeyA721BK0xL7YQ10
	xUF+MAU5z9G2wGz7FXCxljlhTzN4Nd6C4SZtEdimR3ghrtFXtTXpUfRz0BoVl3CV/EEBcbBhQGoE8
	DWt6/fBJUpJz7BB+Pryzj55kpkRt0Ien2yDNWJo+nV6Pti6X5hVRLB6RDsscf++Jg9wnchkmYrrL3
	6N81xxjTAbK/ocEvf0Dx1B8ZRlRiUbyjxYrM95dSyepCOkGYzxtnrob4CNB25OTFxdToa+nHS4yM2
	WzX6NPQmTV0NscRTQrHTxBRR8oV2J2GiEYZSKnM4V/YOgOCIPWUVPaoKu/Pvd6zoM5Q15Fwe5tQMX
	jt+oc4Jw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:33066 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uScEs-0000000Grun-0zNA
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jun 2025 09:57:08 -0400
Date: Fri, 20 Jun 2025 09:57:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Is there an oe-core "janitors" task list for newbies?
Message-ID: <8805c7ed-5ac7-b4a7-6c09-7194ab3cff75@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 13:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219124


I forget if there was a place that kept track of tasks that were
appropriate for beginners that would let them get their names into the
contributors' Git log by starting simple.

I ask since I am reminded of something I noticed years ago -- there's
a ton of OE packagegroup definitions where the explicit packagegroup
name could be replaced by the simpler "${PN}". As an example:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb

where it seems almost all strings "packagegroup-core-full-cmdline"
could be replaced by just "${PN}". If there's someone who wants to
handle that and get into the Git history, it seems that would be a
pretty easy way to start.

rday


