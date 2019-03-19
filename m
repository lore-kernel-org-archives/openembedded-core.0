Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 393EC7CE25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 17:07:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so6408582wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZIySSlS/nKOioecwoHGefRAnR25GS655HzGxxgF2WqU=;
	b=FjSbGOG7N3w4Wlj7v4ERkmFzwZVZkSeKILJA0rWUe8k8Adm1vTbF6aeJDBn7aDSJOa
	s2nFuolGRGpXH8TDAqVBuhm9twVtSu/Oj0R3i3+AhDQlgy7zumaP3D9yqDO2hp8uIrZ6
	ojOWWQ6ecyd6wHOK4l8hr1TJBZpG5cGImQgu+iUyoT6KZyVs1VdDeEFo4vBb+VqXxxaN
	YGIHOSmnrVtRWLff5ODVykB/i1IiRb5m7R+g/Vqo990e1oT87V+Y8ycgO/Cd5n2dqKMo
	TvWjABiqzYrf/UgH96q1fM3vQsOt4ci/TaQJtctEfymyHE8eJj357lDbOJ2zKkJm4++s
	8x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZIySSlS/nKOioecwoHGefRAnR25GS655HzGxxgF2WqU=;
	b=HdHdN3hXxYogbX0iv+9HEo34h5v+rRNBYKGzbgMDD2yiQuBwis1fR5W9qs5pvnh/Zz
	gs9QMQ49U5kN0DalavEf7dEjqKYS8NdC95IuWOQXj7l48cA4Pacb3tEVJaBeZLX6DIU7
	K3XT7yawFysatHu+/o8mbwflUL9UpnRWlAn/edIt/K61kS6bBrvwTCNji8nNP110vOYg
	j3n8Lb8OTKaAF3dhZgy5Ux3oo9IExGY5QuJTe/w7eNM/uWuC/pKqACfMS9h/Xr7ri8A+
	xPRurcyE/WRypzGYyz4ecK3uT10j5K28F1VBVSuKarjrEs3cm6LGpvnYRGiifRH2o2BM
	N7mA==
X-Gm-Message-State: APjAAAUw0LCybc/qClKWwJ/GYsTZOjVyEyxNTD3d7bGsdyjo190HBtOE
	8X8L8L3ViOTSpt4cWpcefvI=
X-Google-Smtp-Source: APXvYqwXp5MXWHgBnkxDATCvGZixI91NqROsIkJlzcIWpiqhVualKJ7C8BnXC7EpWP/uatJLUazjBw==
X-Received: by 2002:a05:6000:1110:: with SMTP id
	z16mr18362333wrw.28.1553015252789; 
	Tue, 19 Mar 2019 10:07:32 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f196sm5551852wme.36.2019.03.19.10.07.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 10:07:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Mar 2019 18:07:36 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190319170736.GI1994@jama>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<D3413079-663B-47D2-8550-658159790D3B@gmail.com>
	<20190319104001.GG1994@jama>
	<22BB06E0-D9DD-4070-960B-53D03755B65A@gmail.com>
	<20190319135538.GH1994@jama>
	<8ECD4C1B-CF62-4D11-9757-F3176AEA4B50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8ECD4C1B-CF62-4D11-9757-F3176AEA4B50@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 17:07:32 -0000
X-Groupsio-MsgNum: 122428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline

--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 05:31:52PM +0100, Alexander Kanavin wrote:
> For what it=E2=80=99s worth, OpenSSL is also being relicensed to Apache 2=
=2E0, so backporting their fixes may not be an option either.=20
> https://license.openssl.org/
>=20
> Please be careful with your language: I=E2=80=99m sure you know that reci=
pe maintenance is a tedious, thankless task. Having it belittled doesn=E2=
=80=99t help.

I'm sorry, I don't want to belittle the recipe maintenance task.

I'm just saying that using OE to build commercial products is another
level of complexity and if we as a project ignore the issues companies
might have while upgrading to newer OE releases, then we shouldn't be
surprised that there are too many products built with really ancient and
unsupported OE releases.

I'm not recommending to anyone to use openssl10 forever, I've replied to
this thread mostly to warn other people (who might be in the same hole
with openssl10) that this is another pain point and suggested possible
way how to work around it.

More commercial users closer to master might also help with lack of
resources, upstreaming something from danny based build to master is
much less likely to happen than from e.g. thud. Having a bit easier
upgrade paths or at least a bit sympathy for people having troubles
persuading management that spending a lot of time and money to rebuild
all native apps, just to get newer build system (which no customer will
ever notice in the end product) might help as well.

With app store filled by native apps from 3rd party companies and
required backward compatibility with older products, the stable ABI
might be more important for some people than latest, greatest versions
and we shouldn't ignore such use-cases for OE (or at least not assume
that nobody needs openssl10 just because oe-core recipes can already
build without it).

Cheers,

> > On 19 Mar 2019, at 14.55, Martin Jansa <martin.jansa@gmail.com> wrote:
> >=20
> >> On Tue, Mar 19, 2019 at 12:35:59PM +0100, Alexander Kanavin wrote:
> >> Just to remind once more, all upstream support for OpenSSL 1.0.2 cease=
s in 9 months, so shipping products with it may not be the best idea.
> >=20
> > Just to remind once more, shipping products isn't as easy as building
> > the few recipes included in oe-core.
> >=20
> > For example:
> > Believe it or not, some projects need to use old Qt 5.6 due to license
> > change in newer version and 5.6 doesn't support openssl 1.1,
> > backporting the necessary changes would violate the license as well.
> > Providing clean room re-implementation is also difficult, because there
> > aren't many other options how to implement this than how it was done in
> > newer qt already, see:
> >=20
> > https://bugreports.qt.io/browse/QTBUG-71623
> > https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-suppo=
rt-on-qt-5-6-5-9
> >=20
> > Yes, it's not the best idea, but even backporting security fixes to old
> > openssl might be cheaper than buying commercial qt license...
> >=20
> > Cheeers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJEhdwAKCRA3VSO3ZXaA
HOpvAKCczKDwpzm38lj3mzNMOvpo8AQ4RwCfeIizEq6LM6xQBYxHvPg+TDbweYQ=
=Dq5e
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
