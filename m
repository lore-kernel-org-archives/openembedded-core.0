Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DC4C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 19:29:54 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.37.1657567778691213808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 12:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=ixJrSiNW;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from Seans-MBP.hadsten (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id 50134E9047;
	Mon, 11 Jul 2022 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657567775; bh=Xyr+1C7U1eOlnfl+YfEnW3B9YtH15c/ZUQTaTi53h78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixJrSiNWpaNW+RPVvlqZP5ZJrVWowMKpHtcwtoBDLlhRkloEnHc6l1Kp+p0Vbh6Qt
	 7YueFaFJ0ZysYCgn7cvenOaz1zatw1qAiQDy0wolgeRO3Qg1NFZ+tPdANO83I5Gxg2
	 HFWT0bDYfHmcY2GWz13bxJ158hYI7lvIzCkyeT/3K4wFj0wqGqXPeI9El/lFeb2ob6
	 +mtgQiotx0jf+UM9aE3thbKqPFLGJ1blUbsMn8vHHPMu2+Kce7mta6ZRJG9HpKnLcx
	 IxIpbqO6kTUyvrLYHqVFkmW4WlFVtQ+Aa1AQhIolcC+6xdyHFmp1pD+qy1gr1aL8e5
	 LuxLihNQzPYEg==
Date: Mon, 11 Jul 2022 21:29:34 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] zlib: minizip: add recipe
Message-ID: <20220711192934.i7nd2p3xotbhmjku@Seans-MBP.hadsten>
References: <20220711083309.1749253-1-sean@geanix.com>
 <20220711083309.1749253-2-sean@geanix.com>
 <5227282d05b0791d57457c44f63859a97001c6ab.camel@linuxfoundation.org>
 <20220711085329.su52yw5ygcpoalfm@Seans-MBP.hadsten>
 <2e252bb607b9ef3a5821a1a0882246c5de157a89.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <2e252bb607b9ef3a5821a1a0882246c5de157a89.camel@linuxfoundation.org>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 19:29:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167881

On Mon, Jul 11, 2022 at 09:58:38AM +0100, Richard Purdie wrote:
> On Mon, 2022-07-11 at 10:53 +0200, Sean Nyekjaer wrote:
> > On Mon, Jul 11, 2022 at 09:46:58AM +0100, Richard Purdie wrote:
> > > On Mon, 2022-07-11 at 10:33 +0200, Sean Nyekjaer wrote:
> > > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > > ---
> > > >  meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >  create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb
> > >=20
> > > I can see what this does, but why? Who would want this and why?=C2=A0=
There
> > > is no detail in the commit messages. Also no maintainers entry whic=
h
> > > will break QA checks.
> > >=20
> > > Cheers,
> > >=20
> > > Richard
> > >=20
> > >=20
> >=20
> > Hi Richard,
> >=20
> > We have some software that depends on minizip.
> > I don't know if an extra package zlib-minizip or this was the prefere=
d
> > way to add it?
>=20
> I think an extra package on the existing recipe may be simpler and
> easier maintenance.
>=20
> Commit messages do need a bit more information in them too, it isn't
> enough to say what something does, it needs to say why.
>=20
> Cheers,
>=20
> Richard

I think it will be quite hacky to do it as one recipe, as zlib and
minizip is to seperate autotools projects and zlib isn't even compatible
with the autotools class.
I could something with addtask but I don't think it will be very
readable.

Any ideas?

/Sean

