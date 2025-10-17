Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53E1CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 16:24:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.20712.1760718282404903510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 09:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=U2YYNkcl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=31AMxu4IdNc9GgyxiBwjYaJHAddGzmMJSaeagu3sUGo=; b=U2YYNkclNpK6h3bjP195v0Ctql
	bB8870fPsElJt3W32P9B2Kx39s3iKI96Nyh3kdtvGs2IAvz5bGgQufZztUCZkaeTqwsWpY0FnWjWK
	eY/Cc8ngo8Rr0dPvEYWsK6sV1BD+lmHIuquJhhHxUHLc9CddKpY5CWO1cDMAchRgFC9OMsDN6D7oe
	WSwvf10VsnF/7fnvjdJUlaOfDBBSpZkzjUtT2fZLOmsP9j49pffPHcjHko8KCg5jNi3P1v5FjRWSx
	imys7fLZKVKcgjdyAJ7M2IdSMh6pHhgiPHPZRL1X13/QwSKYZWthiKyr1T6bAI4ExlQ1CiSE4I7VS
	ioiRrpww==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37554 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1v9nFu-00000009LaH-2meq
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Oct 2025 12:24:39 -0400
Date: Fri, 17 Oct 2025 12:26:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Can someone recommend a general "HW bringup image" recipe?
Message-ID: <b9a7a502-004c-10af-5e4d-1bda96659377@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 16:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225025


  Some time ago, I asked for suggestions for what diagnostic tools and
utilities would be appropriate for a low-level "hardware bringup
image":

https://lists.yoctoproject.org/g/yocto/topic/what_to_include_in_a/82112196

the idea being to define an OE image that was loaded with handy
examination and diagnostic stuff used during board bringup.

  At the time, I had been thinking of a very old example of that from
the meta-ti layer:

https://git.yoctoproject.org/meta-ti/tree/recipes-misc/images/ti-hw-bringup-image.bb?h=danny

Is there a *current* example of such a HW validation image recipe? Or
possibly packagegroup? I'm just about to start collecting all the
useful recipes I can think of to assist with board bringup on a
somewhat old iMX6 target, but this is the sort of thing that should
have universal value.

  Thoughts?

rday

