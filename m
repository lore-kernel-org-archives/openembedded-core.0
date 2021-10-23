Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189F9C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:17:35 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network
 (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web10.11556.1635023852968220798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=fR6KICu4;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id 8a5024bd-3446-11ec-bc81-f8bc1204ff90;
	Sun, 24 Oct 2021 05:16:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R6CBkZuigrumbMjHVKwBPlm1NU/qluncVdMz5j9XyMA=; b=fR6KICu48v4tx6a93Fm6KTgqqh
	1x5+kSVlKfyl/kAsYIpZaOGCIlVnGrVZl/F0PSgPx5XPPEradOsD+Pl95Cq4b9w+hoTSJN9/lcGMh
	K7L9EuJPKCzhfJJmPNiVLCIGmOZ6f46d0v0lW24U3ovcvHu6Dg7LuGJ7xiXYHolXPBV2ByTluwq1q
	ZHEJ34qnZo3jo1Vr0JWQt4BtWxWzB9NeBE/hOBWAiFQMBjIlIHVd7d0CTexPDUOlQsbS16vx9QZaj
	wVji7U0dEgOflbgWW7PH3RXvKlKhwUnCEtgkYpUmGMvwQpu4kZNYZfd7BQn0Lall9X0w4515RKpp2
	0EzMSD+A==;
Received: from [151.210.149.31] (port=56502 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1meOOM-00Be0x-N2; Sun, 24 Oct 2021 08:17:26 +1100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 18/65] u-boot: upgrade 2021.07 -> 2021.10
Date: Sun, 24 Oct 2021 10:17:26 +1300
Message-ID: <2080098.irdbgypaU6@linc>
In-Reply-To: 
 <CANNYZj_LwDStdwbCP0NrrgbUQXumck1AqdZA35iAu+OvsRJsaw@mail.gmail.com>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <4686739.31r3eYUQgx@linc>
 <CANNYZj_LwDStdwbCP0NrrgbUQXumck1AqdZA35iAu+OvsRJsaw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 21:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157316

On Sunday, 24 October 2021 06:33:29 NZDT Alexander Kanavin wrote:
> On Thu, 21 Oct 2021 at 03:14, Paul Eggleton
> <bluelightning@bluelightning.org>
> wrote:
> > Not sure what the official protocol for this kind of thing is, but
> > meta-arm will
> > naturally need an update for this (as seen via autobuilder warnings).
> 
> Yes, I think it's usually done after the fact though.

Absolutely, I just wanted to make a note of it ahead of time.

Cheers
Paul



