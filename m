Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521B2C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:47:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1496.1707720474097537353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Tv6vPkV5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=28vdvtNSjXK//lanZisPZqy+SBe5AwsUDCgikRqDpto=; b=Tv6vPkV51Sr7gNmT+V7HHQX0IW
	g3RRzTiFcIv8aB1eowgrmTFsTdGaDrNW5yClxtYFFLmyrh/iugCio40efEIgiGhrX7P86Mq7rrNQk
	GDoK7QssoCBvsn/DZO8+Mjw6sIIjhhqcgp+NBEFlUFRjErHmBdjEjwrlMfA4dB0cg+OCknvHyjO7I
	PPf5M+l2ZRbISPiwP6TvfnQCLajBZkWf5s+c2onlwWB5Xg5HaLOY7d2ITWiu5brWYglsWwXQXndkF
	/+C9Ny2pmuT5z6TYhnYvXo7XrfafSVjiYtjxyGN6LY8pLSZrpWuRaz4y8B4Y22v+5zcowIeS2FsHG
	huWKcMlw==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:41464 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rZQ6W-00BVIX-02
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Feb 2024 01:47:52 -0500
Date: Mon, 12 Feb 2024 01:47:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: more ptest pedantry: why conditionally include "run-ptest" in
 SRC_URI?
In-Reply-To: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
Message-ID: <53fb346e-af6-36cc-3a17-d062a8fcefce@crashcourse.ca>
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 06:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195301

On Mon, 12 Feb 2024, Robert P. J. Day wrote:

>
>   more annoying nitpickery ... here:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/xz/xz_5.4.5.bb#n28
>
> it's not clear why someone would go to the trouble of conditionally
> including run-ptest in SRC_URI as i would have thought the only
> benefit would be to avoid the triviality of copying run-ptest into
> WORKDIR, but beyond that, i don't see what the point is, and that's
> the only recipe i've run across that bothers to do that.
>
>   is there something more subtle happening here?

  just for fun, tripped over a number of recipes in meta-openembedded
that do the same thing, like this:

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/re2/re2_2023.03.01.bb#n10
https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb#n21

and more. i'm *guessing* that's not necessary, but it doesn't hurt.

rday

