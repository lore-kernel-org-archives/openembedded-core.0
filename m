Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF662C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:18:26 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web08.8966.1654096698301284906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MUYKb-1oM5rQ07sp-00RHde;
 Wed, 01 Jun 2022 17:18:15 +0200
Message-ID: <655c7b4a4608cdb745e15ad6d0ab3beb88ca9fad.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Luca Ceresoli via
	lists.openembedded.org" <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org, Peter Bergin
	 <peter@berginkonsult.se>
Date: Wed, 01 Jun 2022 17:18:12 +0200
In-Reply-To: <20220601170502.1889c3e5@booty>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com>
	 <16F483479D2BE28A.13026@lists.openembedded.org>
	 <20220601170502.1889c3e5@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:XT0b45/+Yhw+oNexi9oVYKdLXH5eskBcv9pLF3xFM7sLQ0hX2zw
 8O5hRkVUcJ8fnWgctEhNWZrghXLGi6VsPATd6WbVwtepYOAzB6TJKKRezF2jNIm9MkAK2ZV
 IXUQKM7FS+Gg+kN0HsPoKy828JIlRMV5Y2ZbY9CRXLCl9yyl9ax3gXuzugiy8iOukEhpYcc
 bW19EqOGEwzQJ1DewrqXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Sh71qhOi8E=:4pbOP9URfEQXnSJnbwB2CL
 HNrgIv4vA1tvzQge25pS/O3oTJ+DnvhJr0jmUZ6KI//miqtYkk56Tp2Hr7TRijIn+qHQb+03m
 ccCZ+mAz5/UcBCYriSA5rrkvY1AG6/VVjQNG+zHz+WPHHx3gh6W9DRSd50j/cvA/0rlgBpAVm
 1GTLzQvNqIEI7kVhsGk/iLJvQUMQWuxW8sZqMC7+sQqMM33fTpPcTgVP0QoSGObzOYo0Qw7+N
 2lMgxRW2mwxpX+GiiHil8QScwefZBI/CjwG+wmspc+Q9RIoYFYhHJo8NWWLJypqLhe3NZshhq
 epfwzy0OHQf2GBbBtw/VdnjHbzGnUK15P10SWnjXuTgr67FRQwiDecVrxwwY5vpR/660E3UPD
 RMNfHZyDUYdSRC6H5UUzA/4/Pptgt/y74VdWfSg/u0gkqHCDn0l2uKlqL9lG8SR5Q948aFANA
 SFlhn3rVX8eq/tbWbDoGKNUhXeloTwQGJEWTCfLqdnalw2WULYaUHtn6YUD0JXWlwXJo3GfoY
 Dv5ajHA7ZLRYYCoAulNhvNdQj1qgeZmeyLuH6KQjfcpdSOH0bBDmAohYvMv8x+oRdhG+L+rri
 CaWOeyb6lIdohFqK/paGoL3sGmdMnNbKtRUQYqyhWUChwsCAPOsK5Xgv44T1fP1W109xcxA8f
 VAsBt4qpVcnGQPGjhaCznZdFUseVVZjU8nff42C0v+CJLhj/l169fAZqO8D7HyF77pzufa7bf
 2yP+QnDNEGyblDb5ERaj+vHo+elu6E3NrO/yxQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:18:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166388

On Wed, 2022-06-01 at 17:05 +0200, Luca Ceresoli wrote:
> Hi Marcel,
>=20
> On Wed, 1 Jun 2022 15:48:15 +0200
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> > Hi Marcel,
> >=20
> > On Tue, 31 May 2022 23:32:06 +0200
> > "Marcel Ziswiler" <marcel@ziswiler.com> wrote:
> >=20
> > > From: Peter Bergin <peter@berginkonsult.se>
> > >=20
> > > In order to enable configuration option aaf (AVTP Audio Format)
> > > used for AVB the library libavtp is a dependency but no recipe for
> > > this library was present. aaf support for alsa-plugins was
> > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > >=20
> > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>=C2=A0=
=20
> >=20
> > This patch is failing on musl builds:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5308/=
steps/11/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5294/=
steps/12/logs/stdio
>=20
> This patch also triggers selftest errors because the new recipe has no
> maintainer:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3657/st=
eps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3661/st=
eps/14/logs/stdio

Okay, thanks. Sorry, I missed this being a mandatory requirement now. I gue=
ss I can add me and/or Peter as
maintainer. No biggy really.

Cheers

Marcel

