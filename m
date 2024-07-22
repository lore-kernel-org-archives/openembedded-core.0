Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85892C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 21:18:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.29667.1721683099828883567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 14:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B42440CBB;
	Mon, 22 Jul 2024 21:18:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7RPRdVPxMAI; Mon, 22 Jul 2024 21:18:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1B5D40AC9;
	Mon, 22 Jul 2024 21:18:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6369B164000; Mon, 22 Jul 2024 17:18:16 -0400 (EDT)
Date: Mon, 22 Jul 2024 17:18:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
Message-ID: <20240722211816.GS17572@denix.org>
References: <20240722053459.2462155-1-denis@denix.org>
 <d938bbd2df1a8138bd8e181e945cd0911f22d03e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <d938bbd2df1a8138bd8e181e945cd0911f22d03e.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 21:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202325

On Mon, Jul 22, 2024 at 09:51:51PM +0100, Richard Purdie wrote:
> On Mon, 2024-07-22 at 01:34 -0400, Denys Dmytriyenko via lists.openembe=
dded.org wrote:
> > From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> >=20
> > Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cro=
ss-canadian.
> > This will improve (but not fix) reproducibility of gcc-cross-canadian=
.
> > Also move this code to functions to avoid code duplication.
> >=20
> > Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> > v3 - add common functions to gcc-common.inc instead of gcc-configure-=
common.h
> >=20
> > =A0meta/recipes-devtools/gcc/gcc-common.inc=A0=A0=A0=A0=A0 | 19 +++++=
++++++++++++++
> > =A0.../gcc/gcc-configure-common.inc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 1 -
> > =A0.../gcc/gcc-cross-canadian.inc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 3 +++
> > =A0meta/recipes-devtools/gcc/gcc-cross.inc=A0=A0=A0=A0=A0=A0 | 15 ++-=
------------
> > =A0meta/recipes-devtools/gcc/gcc-target.inc=A0=A0=A0=A0=A0 | 16 ++---=
-----------
> > =A05 files changed, 26 insertions(+), 28 deletions(-)
>=20
> I ran a test build with this series and there is still a reproducibilit=
y issue:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5097
>=20
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240722-tr5=
vb5sa/packages/
>=20
> the key difference appearing to start in gcc-src.

Thanks. What's the simplest way to reproduce it locally?

--=20
Denys

