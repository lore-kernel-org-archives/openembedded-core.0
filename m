Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE4BC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 10:43:58 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.28.1637232237592839448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 02:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:56962 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mnetZ-0000OP-1C; Thu, 18 Nov 2021 05:43:56 -0500
Date: Thu, 18 Nov 2021 05:43:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Martin Jansa <martin.jansa@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
In-Reply-To: 
 <CA+chaQeUB2ew1=odQPwXbsXDL62LoNw3aZOR8x69oeHrksPr5w@mail.gmail.com>
Message-ID: <ba12a07c-68d7-294b-68f-213240d15f@crashcourse.ca>
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
 <CA+chaQeUB2ew1=odQPwXbsXDL62LoNw3aZOR8x69oeHrksPr5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 10:43:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158471

On Thu, 18 Nov 2021, Martin Jansa wrote:

> openembedded-core/scripts/sstate-cache-management.sh

  i just now found that script, and noticed that it is not documented
anywhere in the YP docs. perhaps we need a short section on
sstate-cache management somewhere in the docs.

rday

