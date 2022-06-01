Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F41C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 08:32:54 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web10.5085.1654072372581104659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.197,
 mailfrom: marcel@ziswiler.com)
Received: from [10.10.1.194] ([81.221.243.92]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MVw6g-1oKZpG0wps-00X4Hn;
 Wed, 01 Jun 2022 10:32:46 +0200
Message-ID: <7ac20da267c772c462028483d5ff451d8dd39373.camel@ziswiler.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Date: Wed, 01 Jun 2022 10:32:43 +0200
In-Reply-To: <b252408c-60b7-62aa-10b8-860ab0ed0a5b@theobroma-systems.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	 <20220531213206.7119-2-marcel@ziswiler.com>
	 <b252408c-60b7-62aa-10b8-860ab0ed0a5b@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (by Flathub.org)) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:8rypyPD5i6L6s3uqK2TOOPc9jEPYUWc009PBcQAM3xNd3+V8VGR
 NyBzz8T5sDmnKWn0dAC+fAEfu8Q/Zq4eNiBJSeYEiOEUcEGoDlOGPVfIuEyUXzFZKHBFoPU
 g2uVowO37fqhxFIFVCrKqgGD3LTbecUk795jW2MZA1SFOvZ5UAoAnf0QA3X4vIKRorMzE5u
 XnAbZmmHOEEA+LBhJa8fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dwC8qp/IGXM=:MVS5HpFK8foSyJUhm5wTe+
 +Gl2d+FynQQnlnI+xN2XJYcbW4ARRDBMGqx3LcQ1+t8gXwmoaswNzcE8O3CWcY3Vl8+zLDj/2
 Kjuj+ZiTZJ+99Vl06bMqNqDPpEHdS1nMjVHgY6uQHnrK3bD9+q1JfoMKQj4fvCnvzW83mX8E/
 J7vFccz8DbLoPc1zrRmX7cCK/FUG0o4SpHQrrpseHCYaTnzmhrrLZT+NLi1sCXMnhAN5dLS9D
 uZ0GQKGnCnpPE7lABOk7Dv5EG/xnu63OV5xhAFtKCGwDjIQK9Jzl4AkpBHjgdjPcjSr7TGnex
 QplpurkodIR1VCQHORpoJUQMjujQDXpIUcCNcBf7qqrvl2AiGWVxnDCRICQdxZEhY4dXC9A7A
 RwPx/dmfB/0/gPFmN1d6+VUjw7R6hC4tyeBshvY//B3p+wSbfy8UXo7Em9i6kvoxVryAPUpuf
 eHyS55VLcDfZxQfBkr1QO2trrupiDo6cTc6d3Z6qQUOmP3djZ/nYwZir0oewEhk3XsgevFobq
 uyYkPf2uttgqWPQ3oiu1NLi5xQnq/6fBiyNQPiFKPb+0oInNGiHDbWNyqFuMu94GoL5VZMAwi
 QNAH7L8Hu/FlSp3xzhYMUzznjut8e2fbCDINGQhRn3f7eJWVh2xY1LIGhxAYdOXgy4LqrAlSj
 o4hXy2LeAfx1sLhJKaFUU0LzFuwI/FHgZynWCu8R/Fs02/62pY6KshRFZeu/NFFhq4ZuSw7UW
 ddEm+4bh3rOaCpwaOpMY9IgCR+2dLjYgRitDag==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 08:32:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166365

Hi Quentin

On Wed, 2022-06-01 at 10:13 +0200, Quentin Schulz wrote:
> Marcel, Peter,
>=20
> On 5/31/22 23:32, Marcel Ziswiler wrote:
> > From: Peter Bergin <peter@berginkonsult.se>
> >=20

[snip]

> > +
> > +SRC_URI =3D "git://github.com/Avnu/libavtp.git;branch=3Dv${PV};protoco=
l=3Dhttps;nobranch=3D1"
>=20
> We don't have a single recipe with nobranch set in poky, so I think we=
=20
> should keep it this way. I assume this was needed because, there's no=20
> ${PV} branch available in the git repo (it's a tag).
>=20
> Technically, ${PV} is a tag on github and not a branch. We don't have a=
=20
> single recipe with tag set in poky, so I think we also should keep it=20
> this way (tag=3D requires network to check that the tag hasn't moved=20
> between builds).

Well, remember. It wasn't me suggesting the use of PV. However, at least at=
 first it really sounded like a
sensible goal.

> What I've seen some recipes do instead is to use github archives. See:
> https://git.yoctoproject.org/poky/tree/meta/recipes-support/re2c/re2c_3.0=
.bb

I have been there before, but, unfortunately, Avnu's libavtp on github only=
 uses=C2=A0their archive [1] and not some
other download facility whose use is also discouraged as per [2].

I mean I guess I could just rename the recipe and otherwise keep relying on=
 git with a hash but that also does
not seem like a really good option (e.g. keeping PV and hash in sync and/or=
 even checking on this would be a
completely manual task). Not sure. I hope somebody more experienced might p=
resent the golden trick to this
dilemma. Thanks!

[1] https://github.com/Avnu/libavtp/archive/refs/tags/v0.2.0.tar.gz
[2] https://git.yoctoproject.org/poky/tree/scripts/lib/recipetool/create.py=
#n430

> Re: alsa-plugins which may require it in a PACKAGECONFIG option, it's=20
> not really a reason for inclusion if not enabled by default. Otherwise=
=20
> we would have one big layer only with all possible optional dependencies=
=20
> and their possible optional dependencies, etc...
>=20
> Cheers,
> Quentin

Cheers

Marcel

