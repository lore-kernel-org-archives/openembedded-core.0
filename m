Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD77C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 11:24:50 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.309.1637234686849167807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 03:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:56964 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mnfX3-0006yM-WC; Thu, 18 Nov 2021 06:24:45 -0500
Date: Thu, 18 Nov 2021 06:24:41 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: Ross Burton <ross@burtonini.com>,
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to "prune" dead sstate-cache?
In-Reply-To: 
 <CANNYZj_2c2ADAdcavRbOeZk8UZKB9DNM+x-4G-59Jy_bDaovYg@mail.gmail.com>
Message-ID: <c03ee03b-cc8f-947b-3fa9-6b998374b523@crashcourse.ca>
References: <8ca5808d-1fd6-751-f9c9-b99ab8242cd6@crashcourse.ca>
 <CAAnfSTvfHM0eBoA8N48=UVBcDPnGUrfkHt21VseMWFOMMe5YwQ@mail.gmail.com>
 <CANNYZj_2c2ADAdcavRbOeZk8UZKB9DNM+x-4G-59Jy_bDaovYg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 11:24:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158476

On Thu, 18 Nov 2021, Alexander Kanavin wrote:

> There is a caveat here. This will touch all sstate that is needed to
> construct an image, but won't touch sstate needed to build
> components that go into the image. So target packages are guaranteed
> to be kept, but native items may be deleted - I've seen this with
> e.g. java compiler that is used for few specific, rarely changing
> items.

  i'm willing to allow the pruning to go a little overboard since it
will just be recreated. i'm fine with that.

rday

