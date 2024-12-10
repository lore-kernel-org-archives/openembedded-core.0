Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66413E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 03:51:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2448.1733802685581781363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 19:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8486407E5;
	Tue, 10 Dec 2024 03:51:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nd-uHn85lumT; Tue, 10 Dec 2024 03:51:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CCEC407DA;
	Tue, 10 Dec 2024 03:51:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD88B16410B; Mon,  9 Dec 2024 22:51:21 -0500 (EST)
Date: Mon, 9 Dec 2024 22:51:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] bitbake.conf: require lz4 instead of lz4c
Message-ID: <20241210035121.GF23825@denix.org>
References: <2ff2f153f3d383ffa0fb240b6af32f7a3a3c8994.camel@pengutronix.de>
 <5971.1732375730064880818@lists.openembedded.org>
 <Z0TAHptOcCYEzSXB@ravine.members.linode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z0TAHptOcCYEzSXB@ravine.members.linode.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208518

On Mon, Nov 25, 2024 at 01:21:18PM -0500, Justin Bronder wrote:
> On 23/11/24 07:28 -0800, Gu=F0ni M=E1r Gilbert via lists.openembedded.o=
rg wrote:
> > Hi I'm seeing a build error on latest master when building Linux 6.10=
 due to missing lz4c tool.
> >=20
> > I see it's still used even in Linux 6.12: https://git.kernel.org/pub/=
scm/linux/kernel/git/stable/linux.git/tree/Makefile?h=3Dv6.12.1#n511
> >=20
> > On my build host, lz4c is symlinked to lz4. But I suspect the issue i=
s lz4c was removed from HOSTTOOLS.
> >=20
> > Anyone else seeing this problem?
>=20
> Yes, I can reproduce it when setting CONFIG_KERNEL_LZ4.  I've sent a pa=
tch=20
> upstream.  If they are receptive I'll submit it for linux-yocto.

Ok, this got merged to 6.13-rc kernel series, but it's now broken for all=
 the=20
downstream BSPs and older kernel versions that use LZ4, besides linux-yoc=
to.=20
Sigh...


> But perhaps in the meantime we should add lz4c to HOSTTOOLS_NONFATAL?

Was there a patch submitted to have both lz4 and lz4c listed in HOSTTOOLS=
*=20
(at least temporatily until this gets propagated everywhere)?

--=20
Denys

