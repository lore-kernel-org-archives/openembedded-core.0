Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D24C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:53:39 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.26212.1657529613638672802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=lxbDx60y;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from Seans-MBP.hadsten (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id 4F95CE6BB7;
	Mon, 11 Jul 2022 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657529610; bh=OaS0X/y5YZ5fUOmvyqkVzMd+nLY2FGTjYn6+fRjL4GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxbDx60yfMAnw/C5V0RNflQ7rH9/O48zvmLYbkfp+mIvySQf8zN9iB377J0pFMfb8
	 5kOQes9yN5D1tvgSioSGukrANZMPT7RqwsfGeOwkKbLCkrQlvWAFcJmKlgzMefE/0j
	 3h3VsKXZy6810hua3g7PK0n2Yp/pEp0Ber6vutbOFEx483KqbXyW8poRXZdtUwAKba
	 p5owgY95PYIQRZHUIx4ilLM0kVpaXx/GvWD08/pPtfMnbouS73gk57Bzuf5xmDlPRi
	 SNjD+q2CG2eXZWXkRvssxa3IXQCvj6SPuiUcimMWfd2jKnwBncaCl1zFLXtI/3kjDy
	 jf05VNrmn+5Yg==
Date: Mon, 11 Jul 2022 10:53:29 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] zlib: minizip: add recipe
Message-ID: <20220711085329.su52yw5ygcpoalfm@Seans-MBP.hadsten>
References: <20220711083309.1749253-1-sean@geanix.com>
 <20220711083309.1749253-2-sean@geanix.com>
 <5227282d05b0791d57457c44f63859a97001c6ab.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <5227282d05b0791d57457c44f63859a97001c6ab.camel@linuxfoundation.org>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:53:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167864

On Mon, Jul 11, 2022 at 09:46:58AM +0100, Richard Purdie wrote:
> On Mon, 2022-07-11 at 10:33 +0200, Sean Nyekjaer wrote:
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> >  meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb
>=20
> I can see what this does, but why? Who would want this and why?=C2=A0Th=
ere
> is no detail in the commit messages. Also no maintainers entry which
> will break QA checks.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

Hi Richard,

We have some software that depends on minizip.
I don't know if an extra package zlib-minizip or this was the prefered
way to add it?

/Sean

