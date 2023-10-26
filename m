Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD17C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:32:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.75552.1698337927427633926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RWtcWwi6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BZ6xivmttpwMFYO+lAEOkmjzlxTC56TUi73c1ftGwg0=; b=RWtcWwi6xC56ugHx6QEZtqEpWj
	NdzF6SOFipRjfYwnPq2Zb4wEFCGSrtLGd/92RZEVFVEb3pG0De9Os9Plcm7poH1Mil4ckD4pVtEFA
	PVkR7D0LxdrBGEMRzfKBvcGZkbO2pfnucuZ2BxCzFdHIhMz/zrimRdvXkvKWNGaTKa8bVQqklt3k4
	fWKMmhnWbZWWGXd22A5NMlyLOwqDjRuIEnhwyvR2xpBSNaJJLM2fcSjYaxjtp/kUeIfVYj/7ndHGV
	jfixtYTtOmNLpU3J+iNZRQh6z3EvY8JRUggDLiNO+M38dwxmXqZz2w/4kqlKJ0pNMbaoxBuJHXpRO
	jCKirYDA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:52320 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qw3H9-002XQs-0C
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Oct 2023 12:32:05 -0400
Date: Thu, 26 Oct 2023 12:31:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is it worth a newbie cleanup task to update "class
 Whatever(object)"?
Message-ID: <416992c3-78c-c92d-b76-2c3bedf9440@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 16:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189736


  just noticed that there is a lot of "class Something(object):" in
oe-core, where AIUI, the argument of "object" is a throwback to
Python2 and shouldn't(?) be necessary.

  is there any value in letting a newbie loose on a task to clean all
that up? or is that more churn than it's worth?

rday

