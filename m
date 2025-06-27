Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF5C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 16:07:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.156.1751040418452360006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 09:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bXESTrHh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6FDbrXh6CtGucsnhZUu2x6+bMLjlOa3WNzSJJg8ZVKM=; b=bXESTrHhYlGd2vMCSTvajw38Of
	vfz34LESmpwTMnF8aI+cBP74zWpae4xFlTcUbrDDWNuZzlASVE+OdhLsNUTBDGHmKOjxss1cy8VKn
	JDb3nxFXDNBWXZiChudNb+PFH3wMbg6S6YYIHPj4O30xmsvK4G3NvQ6xhea5JhogXJJW2IKtCmGUq
	TsWYmaG1/3L4i+PBVtUXJ6mz3uhqlrYy7hYIrKJhvvhxO6jmey/WcLfrCTg00/QoqljCZ82sd7F6q
	FHJwLmuTgZVzHNK/vM/Bg4g0J24GBzPDC309wwH9F/s/ct5UI8j+0+eVy4oNUexppA5FNkw5TSwng
	yKSbSHEA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56126 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVBbL-00000008zb7-37uA;
	Fri, 27 Jun 2025 12:06:57 -0400
Date: Fri, 27 Jun 2025 12:06:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] local.conf.sample: drop MIPS/PPC, add RISC-V
 entries
In-Reply-To: <CANNYZj_E1G8BimqHf7mJe+exq4bmkrj1V91-kTw_0EAtjFLOyQ@mail.gmail.com>
Message-ID: <ca06e2a5-a372-0bb1-91c8-2d4b846d2abf@crashcourse.ca>
References: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca> <CANNYZj_E1G8BimqHf7mJe+exq4bmkrj1V91-kTw_0EAtjFLOyQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 16:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219428

On Fri, 27 Jun 2025, Alexander Kanavin wrote:

> A similar fix is needed for meta-yocto:
> https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample
>
> Alex

  will do, but i will now embarrass myself by admitting that i did not
even know that that layer existed.

rday

