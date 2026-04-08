Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4773510FC458
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 22:06:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.118232.1775685985843032306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 15:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Skk0ThDX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ctuHFbY1OEOqOg28H4jFZNB406zgOG+qwYKhy7n3oYs=; b=Skk0ThDX338qNrg7FolaqWLZD6
	cMxEvRq7H/D3+uillWrQ8lJHH1OBBGDTmrSP0y8LaQMKn/EXPBN6e9LIPwUeWTZDXAx3HEP3wLHh+
	Rbhb4Fx7g89yMzG37Lf2uQbkvxWgHtRlIitAVb+b5M8xQ3R5bK0mB4Zn/Mpd7gs+tpFQrFSoeXK8A
	sRpttdpXrC7JLwyb80VldQ8uhdtaif1YROoVaVD19vKm2foHfp4YikdvoQAXjoHJ40Kzjprn5JoRE
	FPvNPcOZAKfCJ1KlVnUERB0uKV1gLh55rtP5rO87LG1ybRT08F/1emR2NX/8n/e5GXM9GuY8oKW6P
	pTswvpMQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36422 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wAb2T-00000003SmA-1tmd;
	Wed, 08 Apr 2026 18:06:24 -0400
Date: Wed, 8 Apr 2026 18:07:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
In-Reply-To: <2725ce14e862d3bdc289000c1dd3e904f9cc6e39.camel@linuxfoundation.org>
Message-ID: <d26267f4-8ecf-3b8f-f0b4-141d33aa7c23@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>  <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>  <c8876982-82da-0f03-b9ef-2796fbcab38b@crashcourse.ca>
 <2725ce14e862d3bdc289000c1dd3e904f9cc6e39.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-209704516-1775686066=:3662232"
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 22:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234870

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-209704516-1775686066=:3662232
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Apr 2026, Richard Purdie wrote:

> On Wed, 2026-04-08 at 14:52 -0700, Robert P. J. Day via lists.openembedded.org wrote:
> > On Wed, 8 Apr 2026, Richard Purdie wrote:
> >
> > > On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembedded.org wrote:
> > > >
> > > >   puzzled by something i just noticed ... the documentation for
> > > > "ASSUME_PROVIDED":"
> > > >
> > > > https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_PROVIDED
> > > >
> > > > clearly suggests that these represent recipes that would not be built
> > > > as they are already on the host, the example given there is
> > > > "git-native".
> > > >
> > > >   however, in a walnascar-based build i just built, native recipes
> > > > that were listed in ASSUME_PROVIDED were built anyway, even though
> > > > they are clearly on my Debian 13 host, "git-native" among them. in
> > > > fact, a number of recipes i checked appear to all have been built from
> > > > scratch, despite being listed in ASSUME_PROVIDED.
> > > >
> > > >   as a test, if i then tried to "cleanall" such a recipe, i got the
> > > > perfectly reasonable:
> > > >
> > > >
> > > > $ bitbake -c cleanall git-native
> > > > ... snip ...
> > > > WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
> > > >
> > > >
> > > > is there some reason that something listed in ASSUME_PROVIDED will be
> > > > fetched and built anyway? is it a version thing?
> > >
> > > Some of the recipes have a PROVIDES for XXX-replacement-native and you
> > > can build/depend on that.
> >
> >   sounds like something that should be in the docs, just to avoid my
> > level of confusion. :-)
>
> I'm sure you could work out a suitable patch! ;-)

  already working on it. :-)

rday
--8323329-209704516-1775686066=:3662232--

