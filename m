Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1D326194C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 22:10:51 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a25so3344977wmm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 14:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UiKzYlC3HPQageEDQ6U2sR2wkr1ArX9X4oTOZ+FKzGM=;
	b=Gvc1wFuvdO9lOUcX8/bfZpLnW55GThEphy9YOroOTkv2cGfsqOUGfTzzEWGFRqfAxE
	hys8+cfJzUeZhJjjvDk1XwjBu5EaJ9aM/jtN/Ixybi9wJKyjaFdF/JBzdxyjxTNf6no3
	hQ8jvsMvvXFUXUfxhioN3pSHc3vrcRJf9pr38Souc/k7mYAmLVNQrI2GlTgOz1vk6cQu
	LV7s0tVNqb4YUTAoeVkm3qfGqXqyoLgjZWXk1x/zkB+d16kGMNO9yrJIXRp7TfKnuf9x
	St8OWuAipU+cD1EY9Xf3w71324XiVuWbhi7f5jVnNxNslDWJOs4yHW1068MnCMShHZYR
	w2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UiKzYlC3HPQageEDQ6U2sR2wkr1ArX9X4oTOZ+FKzGM=;
	b=Lcfdo3Nn5zM5kbBDXduwB3qendG6Y0sfkL0KMaSoL7QVqaCNC4xilEN4S3RXfd5GtL
	5zDq7tX1mqUfyFgoxwsLsb7ZF8ToEOvLdkKxPt7PvAg9CWtKToLVK+qkcCcxJPve886w
	7iGFoa8qBCuEVPh5jE1dv2SOTJjaoOc5P5dhs0TxXYx5F29y+95uBdFDhIsHQN7ffqZs
	bYIYcfx1E7b38ZHify+A15y7GFh6FoyzX8IF+KyfZmhGmEXH+0VvoUOg24vWhgAWUtoC
	llyyIsDQ2z7qzcjd40Uw6pOjcA5AMByqzzziN6bvuMbJPbVToostSTlDb+gEYo4Q9p4+
	FilQ==
X-Gm-Message-State: ANhLgQ1hXh5uepzUEsYRU8u9/bOLyzDcxr4J0TsfHK/J2v2IuR4rYphD
	/H0vNBu0xpdg+GrYFGfdN3Y=
X-Google-Smtp-Source: ADFU+vvx5NNb7LDzzIbB/Sp5lln5ab24L10t9DDp7xdwQdBb4ZigYOw1lBNFY0yasbisHbhwzmGbqg==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr607783wmj.170.1583273452329;
	Tue, 03 Mar 2020 14:10:52 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	o9sm37316424wrw.20.2020.03.03.14.10.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 14:10:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Mar 2020 23:10:50 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200303221050.ldjizftg4vnq4m6r@jama>
References: <20200229234742.3780-1-matt.ranostay@konsulko.com>
	<6353532b-aa0e-a005-2589-2e8281863fd5@gmail.com>
	<CAMjhiJjY-9N=J03XNV=TuAUW+RAxWKfzrmM64rqPv0z_tx70yg@mail.gmail.com>
	<5251314825f750f21564e99b8e20b0de2625fd50.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5251314825f750f21564e99b8e20b0de2625fd50.camel@linuxfoundation.org>
User-Agent: NeoMutt/20180716
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: freetype: add pixmap to PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 22:10:53 -0000
X-Groupsio-MsgNum: 135974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mv3oik6tsr56sqmz"
Content-Disposition: inline

--mv3oik6tsr56sqmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 09:45:25PM +0000, Richard Purdie wrote:
> On Tue, 2020-03-03 at 22:23 +0100, Leon Woestenberg wrote:
> > Hello all,
> >=20
> > On Tue, Mar 3, 2020 at 6:42 PM Jacob Kroon <jacob.kroon@gmail.com>
> > wrote:
> > > On 3/1/20 12:47 AM, Matt Ranostay wrote:
> > > > Add pixmap to PACKAGECONFIG defaults to allow consumers to
> > > > render color emojis without distro changes.
> > > >=20
> > > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > > ---
> > > > -PACKAGECONFIG ??=3D "zlib"
> > > > +PACKAGECONFIG ??=3D "zlib pixmap"
> > > >=20
> > > Wouldn't it make sense to keep it off by default and let whoever
> > > needs it enable it ?
> > > /Jacob
> > >=20
> > I would agree, and would also vote for opt-in rather than opt-out for
> > this use-case.
> >=20
> > Do we have a more generic stance on how we select the PACKAGECONFIG
> > defaults?
>=20
> It feels like I've seen this come in a few times, I've said no, it
> keeps coming back, I gave in.
>=20
> Basically the policy is trying to keep things as sensible defaults for
> the majority of users. Many of our users are concerned about build
> time, space usage and minimisation of dependencies.
>=20
> These things do change over time as our userbase changes and as the
> demands and expectations from software changes.
>=20
> In this case its fairly hard to figure out that tweaking this option
> breaks emojis and libpng isn't such an uncommon or problematic library.
>=20
> Its hard for me as the maintainer of all this to get a decent feeling
> for how people feel about some changes so its also based a lot on feel,
> there is only limited patch review a lot of the time.
>=20
> If there is strong demand not to have this, we can revert it. I'd like
> to see how many people do/don't want it and see a few more opinions on
> that though.

We (as LGE) have pixmap enabled at least since 2015, because people
really want their color emojis on TVs, so having this enabled by default
will allow me to eventually drop 1 bbappend from our layers eventually
when we upgrade to 3.1.

So I would vote to keep this change.

But on the other hand it will still leave 828 other bbappends, so it
doesn't make much difference to me :).

--mv3oik6tsr56sqmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXl7V6AAKCRA3VSO3ZXaA
HCHEAJsEzH4EACaBnu3ncV4DkRgL/ycsTwCcDugs6/uD2VUITTLJ+a5pWPqDHlI=
=IS/2
-----END PGP SIGNATURE-----

--mv3oik6tsr56sqmz--
