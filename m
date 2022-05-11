Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69FEC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:24:01 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.9650.1652264637420055224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 03:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38786 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nojVc-0004UY-Cq;
	Wed, 11 May 2022 06:23:55 -0400
Date: Wed, 11 May 2022 06:23:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alistair Francis <alistair23@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should local.conf.sample include MACHINEs related to
 RISC-V?
In-Reply-To: 
 <CAKmqyKMaVVgg2FOmjmE4NERqNJiCC=5ceNv91Wnxn9RM7j25ew@mail.gmail.com>
Message-ID: <e7c1c88a-21e8-f525-9fa1-ceedea3e5e38@crashcourse.ca>
References: <c57da822-52c-e74-988-32454f2d30ab@crashcourse.ca>
 <CAKmqyKMaVVgg2FOmjmE4NERqNJiCC=5ceNv91Wnxn9RM7j25ew@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 10:24:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165493

On Wed, 11 May 2022, Alistair Francis wrote:

> On Wed, May 11, 2022 at 12:06 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   just now noticed that while oe-core includes machine definitions for
> > qemuriscv*, local.conf.sample does not mention them. is this just an
> > oversight?
>
> Yeah, that's just an oversight. If you want you can send a patch :)

  on it.

rday

