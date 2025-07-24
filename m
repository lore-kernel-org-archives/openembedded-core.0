Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB16C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:15:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4832.1753391692519910231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=D7RQ+w8J;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X9Z7wi7h1UN02nSEYJHB/H2pUO+bmneJPS6V01V6SPk=; b=D7RQ+w8Je4YCJKjL8HM/rHRcii
	RXZhkLBLvvvkAfMSgNsyw5lllwOJx7ftn/HOfeTA31Lynl0AouM40JwJ6NqO6DdJufSMynWnfnMLf
	bk4p1mmu8IuzVMRaXtolkUtHnQaqWh3BoOOlmYBb8wA+RRqAiEjn1WIrvAyX/vYl7wIUs4rHiS0sh
	5Mx7TBqjz4vcP1+4lSWhALcQzy5erIrJVbpNC8GJA50ocPDxSDgX/gkGU6a2RCJRttjLvDfBFRlzY
	ZnaO0vx25EdTxQtWg9eTXwfn452NX5MqhBC7s6GegUU+X+JtoINUHoFZJH57meGvs/u3SI1LEDRl9
	8YMQCaQg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59564 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uf3H4-0000000FLe1-1A2M
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jul 2025 17:14:51 -0400
Date: Thu, 24 Jul 2025 17:14:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: core-image-initramfs-boot.bb does not inherit core-image
Message-ID: <1a0f28f8-ae36-10ef-9b17-b3139bf6015f@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220872


  i notice that while the image recipe filename is
core-image-initramfs-boot.bb, it does not in fact inherit from
core-image, but only from image. so why does the image filename have
the prefix "core-image"? it seems inconsistent with the other image
recipe names that have the prefix "core-image".

rday

