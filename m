Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416A7C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:39:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1406.1707719967653540668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=u8OfnkXu;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C3cbTNm78ovuOT6Y537rq9R68yY7Bl2VGW4/LZhdHAI=; b=u8OfnkXuEm+6vm+JK6JwdooX6U
	/cKVu+KXJevuCNHhFdHnmrrv1Wqns48zKIez/X7JdROW3zs6+YsLhxgd1LXuWVPMEl93I/o1ilGvp
	4PMELbtInro8GVNrak1t1u1+3BZyorY08KzQK3TyTfuvXVWN5RoGGZYNZUlmBXyGl5lpjUBCHHjjz
	yF3bSv+Gc6/fDAN3UgYt6+Ox3Zft5atBVDdrT1ygR8sODA1MzuaUzI3aBE7pfSTeg44MEBWmHI/HS
	42qLYbPNUhCFZb1iYJ1BLJME4ugBu7wdQKW/HWp01E/Jhy44ah3u18/l4wC8e9taCTe9oO8wA6Vuu
	aWpx3Y2w==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41462 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZPyO-00BUX8-16
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Feb 2024 01:39:26 -0500
Date: Mon, 12 Feb 2024 01:39:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: more ptest pedantry: why conditionally include "run-ptest" in
 SRC_URI?
Message-ID: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195299


  more annoying nitpickery ... here:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/xz/xz_5.4.5.bb#n28

it's not clear why someone would go to the trouble of conditionally
including run-ptest in SRC_URI as i would have thought the only
benefit would be to avoid the triviality of copying run-ptest into
WORKDIR, but beyond that, i don't see what the point is, and that's
the only recipe i've run across that bothers to do that.

  is there something more subtle happening here?

rday

