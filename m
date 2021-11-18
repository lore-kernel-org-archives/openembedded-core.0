Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD8BC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 19:32:17 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.918.1637263936408672340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 11:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=49402 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mnn8p-0007N3-9i
	for openembedded-core@lists.openembedded.org; Thu, 18 Nov 2021 14:32:14 -0500
Received: from [19.12.77.165] ([19.12.77.165]) by crashcourse.ca (Horde
 Framework) with HTTPS; Thu, 18 Nov 2021 14:32:13 -0500
Date: Thu, 18 Nov 2021 14:32:13 -0500
Message-ID: <20211118143213.Horde.VQrZhrVDre9u2xGsebkyk75@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
Subject: anyone played with TAS (TCP acceleration service) in OE?
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 19:32:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158479


colleague just asked me about the viability of TAS in OE:

https://tcp-acceleration-service.github.io/documents/tas_slides.pdf

i've never even heard of it ... anyone crammed it into an
OE build?

rdayu


