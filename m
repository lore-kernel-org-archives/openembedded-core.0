Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D540C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 10:52:59 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.12238.1632826373296218743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 03:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:57158 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mVAjC-0002eE-VB; Tue, 28 Sep 2021 06:52:51 -0400
Date: Tue, 28 Sep 2021 06:52:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] simplest use of SSTATE_MIRRORS?
In-Reply-To: 
 <9dbca117a4c0edf169132f1521d43593e308ee17.camel@linuxfoundation.org>
Message-ID: <7564b80-1dff-efdc-6743-b9e2885ad0ff@crashcourse.ca>
References: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
 <9dbca117a4c0edf169132f1521d43593e308ee17.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 10:52:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156414

On Tue, 28 Sep 2021, Richard Purdie wrote:

> On Mon, 2021-09-27 at 12:13 -0400, Robert P. J. Day wrote:
> >   colleague asked me how SSTATE_MIRRORS worked, so i had to check,
> > followed the section here:
> >
> > http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache
> >
> > and in one of own builds, i moved the entire sstate-cache directory
> > to ~/SSTATE as is, then added the following to my site.conf:
> >
> > SSTATE_MIRRORS = " \
> >         file://.\* file:///home/rpjday/SSTATE/PATH \
> > "
> >
> >   then i removed all of /tmp in my current build, and re-ran my
> > bitbake command, but it seems to be doing all the standard fetching
> > and unpacking and so on. what clearly trivial step have i overlooked?
> >
> > rday
> >
> > p.s. i checked with "bitbake -e" that that variable seems to have the
> > correct value. what silliness have i done?
>
> The other gotcha with this now is hash equivalence. If that is active, you need
> both the sstate data and hash equivalence data that match.

  i did notice that in the sstate section in the manual, and was
digging into it as we speak.

rday

