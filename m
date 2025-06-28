Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59910C7EE39
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 19:23:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4083.1751138584921313261
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jun 2025 12:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z0o0zfNy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QN4rbZ88+vAjjGFLU2eSv1mEJZNZe/MWLSqoqsDOFw4=; b=Z0o0zfNyo2ba3JF7bT/b+2p8O2
	1Ukmkh5Wch0zKA6rUE1sSUxohe3xhSU6cQ/6S2fMpzrCk1W45Xz5vpYTuZ3iHvsz2WBBqNsRcIkJ7
	l2jdFvftHMxxoClpEcDg+spTAQvPKoSQZJpFpWyloLmCf2c95b5rETnezCaTdXrCjMwNeWiovjgy/
	5xdxeFDb5BZffF4MmkCncTrFVNe8r3mhD94+D5hdiaFjYI40H6jtksXzOoNEV04vbyQ8oKsDdvn66
	lZzwG8GqjQMNh9TPqzIMfeV2DHVlaTJJuLmhNYFTU36nQhFw4MfpAJlgrVWBWXnQLN7904SWT9o2m
	ipowKFqw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49524 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVb8e-0000000DQrs-0JEE;
	Sat, 28 Jun 2025 15:23:02 -0400
Date: Sat, 28 Jun 2025 15:22:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
In-Reply-To: <CAMKF1soQgsa46zWKSPD0KyXBF3RG0AooY0TBou4hh4zODTViVw@mail.gmail.com>
Message-ID: <b1375659-7802-5af6-709a-4b1e49f345f8@crashcourse.ca>
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca> <CAMKF1soQgsa46zWKSPD0KyXBF3RG0AooY0TBou4hh4zODTViVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-158081155-1751138581=:200488"
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
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 19:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219436

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-158081155-1751138581=:200488
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 28 Jun 2025, Khem Raj wrote:

> On Fri, Jun 27, 2025 at 6:31 AM Robert P. J. Day via
> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
> wrote:
> >
> >
> >   i forget if i've asked this before, but should OE's
> > local.conf.sample be extended to include all of the machines defined
> > by the OE-core layer? particularly the two qemuriscv*.conf entries?
> >
>
> It does need to be documented and easy to get to especially for new
> users. So adding would be good if there are no other
> options being worked on.

  here's what i submitted as a patch:

https://lists.openembedded.org/g/openembedded-core/message/219430

thoughts?

rday
--8323329-158081155-1751138581=:200488--

