Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784E2CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 06:30:56 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.201751.1697524251395151178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 23:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=v42FB8Ck;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGfY3tPYsyWLnPE8D10gueyWVLPOTGLmi1jLMrY4UUY=; b=v42FB8CkWuFPS3t+jP0ZAjpWzM
	xcu74SHW/2W3Zn6uOR1FsvnJDdE9FnLIx/EKr5xpd+sTAcxTnLCdt5YkzueUJxeqC6NkaAuiPhH0R
	7LNEIG9oeLRH0OHVrIiGIjnQ7FW75sQ0Wl3wI2muxcAsGelLztwg3EV+0pvN0wfUTlMhU9JWfM+5q
	j4/pGScsDMivY1ZHlRK/y+KLeKYWRIe3FK9r7A2ra9jZKb2zSZ9z73zp1r7GCSTBZEq2HTCgvtLvJ
	z5e0m/ljbVrK46DdltQC0gI3svScIgTwkFnQE4MFn9ymFUk2XfI27WJtL/7mhv2GLizMxmU/TyxDE
	AHMYCRZg==;
Received: from [::1] (port=60340 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qsdbM-001AB3-1F
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Oct 2023 02:30:50 -0400
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 02:30:39 -0400
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
Subject: why is it PROVIDES = "udev" and not PROVIDES = "virtual/udev"?
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <99f6ac2e0b7aeecfa55ffa161a00c050@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189316

given that the PREFERRED_PROVIDER feature is typically used for 
"virtual" entities:

* virtual/kernel
* virtual/xserver
* virtual/libgl

and so on, is there a reason that this pattern is not followed for the 
selection
of a udev provider, which is referred to as just 
"PREFERRED_PROVIDER_udev", and
can be provided by either of systemd or eudev?

rday


