Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF92C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 22:44:41 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web09.1955.1637016278664038291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 14:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=c3pehvVM;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 99dd24c3-4665-11ec-bdeb-f8db88ea9a09;
	Tue, 16 Nov 2021 06:44:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I4niuzAUgBSRaSv9mByw+21mJO9+IClZ4a+JGX/d9vc=; b=c3pehvVM11j4P/Kfw8EEd47M41
	HR8+mi6o18288CnNrqvblqqMJK3PECqHZdD4jWwdbFycldbrChEouIdSlNbCCNfvybmTmU2jfa2Cf
	ZwU+4pH7qOYy5OX0yhzJc670s38zCHIgpQ3gDsiKzgh+Wg9G6lExFezEXz/xECsKKmrwwPjU/j/TK
	B/7jRrvGZJUkcHkdZLv7p5gJWgFU5GFhxdYoHGsWZxAa2FLResV17ONLiyoKl33OD/MGugL1OjxAx
	cCYewFBIZWtG3WpYkGbCgMr8Mc+qug0sECiH5fw2eHfli0fFJ8U9HG1H7K1oNt5O2JtZCQsWVEFrv
	g0jthqvg==;
Received: from [151.210.145.152] (port=54364 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1mmkiG-00C6fH-La; Tue, 16 Nov 2021 09:44:32 +1100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Joshua Watt <jpewhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <sakoman@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Saul Wold <Saul.Wold@windriver.com>,
 Andres Beltran <abeltran@linux.microsoft.com>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
Date: Tue, 16 Nov 2021 11:44:31 +1300
Message-ID: <3381838.aeNJFYEL58@linc>
In-Reply-To: <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
 <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 22:44:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158316

On Tuesday, 9 November 2021 08:01:38 NZDT Saul Wold wrote:
> On 11/4/21 2:20 PM, Joshua Watt wrote:
> > On 11/4/21 3:50 PM, Richard Purdie wrote:
> >> On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
> >>> On 11/4/21 3:43 PM, Richard Purdie wrote:
> >>>> On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
> >>>>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> >>>>> quinta,
> >>>>>=20
> >>>>> 28/10/2021 =E0(s) 21:58:
> >>>>>> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
> >>>>>>> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma
> >>>>>>> <quaresma.jose@gmail.com>
> >>>>>>=20
> >>>>>> wrote:
> >>>>>>>> Hi all,
> >>>>>>>>=20
> >>>>>>>> There are any plans or is it possible to backport the SBOM/SPDX
> >>>>>>>> to the
> >>>>>>=20
> >>>>>> dunfell branch?
> >>>>>>=20
> >>>>>>> I'm going to yield to Saul as to whether he thinks this is
> >>>>>>> desirable/possible or not.
> >>>>>>=20
> >>>>>> The packagedata changes are pretty invasive unfortunately and
> >>>>>> likely not
> >>>>>> something you're going to want in dunfell sadly.
> >>>>>=20
> >>>>> Thanks for the clarification.
> >>>>=20
> >>>> I have been thinking a bit more about this. I did wonder if we
> >>>> should consider a
> >>>> mixin layer of some kind for it that could work with dunfell?
> >>>>=20
> >>>> We could host it, it is just a question of writing the mixin layer a=
nd
> >>>> maintaining it.
> >>>=20
> >>> I don't think it's going to be possible with a pure mixin layer, since
> >>> it relies on the extended package data?
> >>=20
> >> I suspect that could perhaps be patched in through a layer though? You
> >> might
> >> choose to drop the compression piece or do it differently for the
> >> backport?
> >=20
> > I'm not sure if a layer could hook in well enough to get the data
> > needed...  maybe worth an experiment though
>=20
> Yeah, I am not sure an mixin could track the changes for package.bbclass
>=20
> > With a backport, I would probably either use GZip compression or no
> > compression. The zstd compression was designed as a drop in replacement
> > for Gzip if we wanted to go that route.
>=20
> I will say that we did something similar with Hardknott for WRLinux, but
> did not propose it upstream as Hardknott was knot going to be supported
> longer term.
>=20
> Having the spdx class standalone with the correctly backported changes
> seems to be working

=46YI Andres and I have done this backport to dunfell - should I post it? T=
hat=20
said, I did just take the hit on some of the invasive parts (e.g. LICENSE=20
value changes). I think given regulatory requirements this is important for=
=20
lots of folks, so we probably need to do something here. Happy to be part o=
f=20
it.

Cheers
Paul





