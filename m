Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A21D6D233
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:50:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.80425.1732737047737258690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBA9640C8E;
	Wed, 27 Nov 2024 19:50:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oirm90ebR6l2; Wed, 27 Nov 2024 19:50:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C0C740A28;
	Wed, 27 Nov 2024 19:50:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EC2441640E9; Wed, 27 Nov 2024 14:50:40 -0500 (EST)
Date: Wed, 27 Nov 2024 14:50:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from
 meta-openembedded
Message-ID: <20241127195040.GA20070@denix.org>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
 <20241126000836.6901-2-hiagofranco@gmail.com>
 <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
 <20241126121716.eqskoqfleyrn4fgu@hiago-nb>
 <CANNYZj_-a3mU3z3jqxCqharjZ2pdPubPQi5jH2wko+jejLWu2Q@mail.gmail.com>
 <20241127191310.34ytvodxrpkf77bu@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127191310.34ytvodxrpkf77bu@hiago-nb>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207961

On Wed, Nov 27, 2024 at 04:13:10PM -0300, Hiago De Franco wrote:
> On Tue, Nov 26, 2024 at 01:21:09PM +0100, Alexander Kanavin wrote:
> > On Tue, 26 Nov 2024 at 13:17, Hiago De Franco via
> > lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.or=
g>
> > wrote:
> > >
> > > On Mon, Nov 25, 2024 at 04:51:37PM -0800, Khem Raj wrote:
> > > > Don=E2=80=99t forget to send a patch to remove it from meta-oe on=
ce it get merged
> > > > into core layer here
> > >
> > > Sure, thanks. I will do it once this is merged.
> >=20
> > You don't need to wait for that. Khem will take care of not applying
> > it too soon.
> >=20
> > Alex
>=20
> Hi Alex, I just saw that Richard merged the patches.
> The patch to remove hw-data from meta-oe is here:
> https://lore.kernel.org/all/20241127190841.137119-1-hiagofranco@gmail.c=
om/

Hi Hiago,

Just wanted to thank you for listening to and addressing all the review=20
comments while working through the multiple revisions of your submission.

Regards,
Denys

