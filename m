Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A47C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:49:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.15691.1751035780390112499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=S0KNnJ7n;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dsnyfpqf9skj9uCmALA2Sye6rKvIj2DgfEV285isyNM=; b=S0KNnJ7nzpfoGA/SeYq+loRUPe
	f+9ZJOGIR1CTKn/R9ZbrfDHuYXIiGopqgRk71cir6lt2kFngYTClTR8OoSL1u//Cq464laJVWxP0z
	BmYT2jp3Yc11o3cZ6rGdKKOQKvE66MnRpHcx7zRbslmLzi/G43slhtmEuuwdCgmq7E3pdjE5u8j3R
	yENd+gLo6fs6Jk8l0z7uVeBahSiY0gFyq7sidhqG4ulUPH7tgXJENaIlkaA6nv2Wg/Xxy/5eGLBwl
	mXKk1s5cfIaYwplk9T9qAp/vO5DgXOH2/+bqkDT2AbzLjg508jwHwpqkJN6xXOxbHPI5Xsm0I8hig
	lU016Zqw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:41898 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVAOX-00000008n9M-2WdZ;
	Fri, 27 Jun 2025 10:49:39 -0400
Date: Fri, 27 Jun 2025 10:49:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
In-Reply-To: <CANNYZj9ABvvEZDAHwPCTpwyv+GomWhasey-2TB7t_pgGeeOziA@mail.gmail.com>
Message-ID: <d19508dc-c0d4-166f-62db-50a716881f2c@crashcourse.ca>
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca> <CANNYZj9ABvvEZDAHwPCTpwyv+GomWhasey-2TB7t_pgGeeOziA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 14:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219423

On Fri, 27 Jun 2025, Alexander Kanavin wrote:

> On Fri, 27 Jun 2025 at 15:31, Robert P. J. Day via
> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
> wrote:
> >   i forget if i've asked this before, but should OE's
> > local.conf.sample be extended to include all of the machines defined
> > by the OE-core layer? particularly the two qemuriscv*.conf entries?
>
> TBH what we should move towards is an empty local.conf.sample, as
> things it does include are all over the place and at the same time
> don't cover many important tweaks.
>
> But for now, yes it should have risc-v, and mips/ppc should be
> dropped. Basically it should match what is getting tested on the
> autobuilder, rather than what is available in oe-core.

  if we want to keep it this simple, i can submit a patch. unless
someone thinks there should be more cleanup and wants to handle it.

rday

