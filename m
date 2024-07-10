Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5439C2BD09
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 00:09:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2791.1720570190808608692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 17:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B49C40C88;
	Wed, 10 Jul 2024 00:09:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eL_iVIdNbCy2; Wed, 10 Jul 2024 00:09:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0AD5840C1C;
	Wed, 10 Jul 2024 00:09:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF550163FEC; Tue,  9 Jul 2024 20:09:48 -0400 (EDT)
Date: Tue, 9 Jul 2024 20:09:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] hdparm: drop NO_GENERIC_LICENSE
Message-ID: <20240710000948.GP18231@denix.org>
References: <20240710000157.51922-1-denis@denix.org>
 <CA+chaQfv0ygbgvuaYfE_dUNXu1JCNSm0G6D8MsyKeSXB=nhSQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+chaQfv0ygbgvuaYfE_dUNXu1JCNSm0G6D8MsyKeSXB=nhSQQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 00:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201688

thanks

On Wed, Jul 10, 2024 at 02:05:41AM +0200, Martin Jansa wrote:
> see:
> https://lists.openembedded.org/g/openembedded-core/message/201631
> which is already in master-next:
> https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&=
id=3D129d2df6bb963bf33da3656ceb6ca5b03cd80383
>=20
> On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Denys Dmytriyenko via
> lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> wrote=
:
> >
> > Latest SPDX update[1] brought in a generic hdparm license, no need
> > to set NO_GENERIC_LICENSE any more.
> >
> > [1] https://git.openembedded.org/openembedded-core/commit/?id=3De9c1f=
48af10ccb58251ecc7e041babb99b94d6df
> >
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  meta/recipes-extended/hdparm/hdparm_9.65.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recip=
es-extended/hdparm/hdparm_9.65.bb
> > index d5e6ab6065a..1b6af566a29 100644
> > --- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
> > +++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
> > @@ -8,7 +8,6 @@ LICENSE =3D "BSD-2-Clause & GPL-2.0-only & hdparm"
> >  LICENSE:${PN} =3D "BSD-2-Clause & hdparm"
> >  LICENSE:${PN}-dbg =3D "BSD-2-Clause & hdparm"
> >  LICENSE:wiper =3D "GPL-2.0-only"
> > -NO_GENERIC_LICENSE[hdparm] =3D "LICENSE.TXT"
> >
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D495d03e50dc6c89d6a301=
07ab0df5b03 \
> >                      file://debian/copyright;md5=3Da82d7ba3ade9e8ec90=
2749db98c592f3 \
> > --
> > 2.35.3

