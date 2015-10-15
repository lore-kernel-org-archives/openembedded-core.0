Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id AD5F775F3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 12:09:13 +0000 (UTC)
Received: by wijp11 with SMTP id p11so26298024wij.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qUfkCth1GMqGsYH759C5L+aj6nrJ/GCaQ5YjSwZKs0w=;
	b=E+hJjXUIv/dpOVBWlZZjJT/ayZvh030QzrC4+TKfM4OzdRW6CMjP2O60po7y7vlRlj
	wVJ7v30uRnI7F7femXtWaZ/fsQcK/xe0yFyaIQTN4r0dbBAoqfA2wmQSasfReKN5shci
	af5Uqpzd7wfOyNbdZP0U8jGwDRtPfC8vTY3CtcaxRbDpO/vQEe5S91yFbpeMhsUUa7Vr
	WcGD59GCO5Qkxhz4/9YJUTiEAY9ZaT///pt3Sy3hchMepuM9wP4SvR0FrLERrLwsizVL
	SsI6VUQn6GAohLDinmnr2f+iFK76hXQIQgEPN3AHqTraDqI4ZN+qnXUSKXBLVEqr51Gv
	bjpA==
X-Received: by 10.181.29.102 with SMTP id jv6mr10131717wid.59.1444910953815;
	Thu, 15 Oct 2015 05:09:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fz1sm11192281wic.8.2015.10.15.05.09.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 05:09:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 14:09:34 +0200
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151015120934.GD2588@jama>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
	<1444906192.5251.63.camel@pbcl.net> <20151015113146.GB2588@jama>
	<1444909889.5251.68.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1444909889.5251.68.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 12:09:15 -0000
X-Groupsio-MsgNum: 72223
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline

--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 12:51:29PM +0100, Phil Blundell wrote:
> On Thu, 2015-10-15 at 13:31 +0200, Martin Jansa wrote:
>=20
> > It's package architecture for binary feeds with -mtune=3Darm926ejs and
> > it
> > can be built with or without -mthumb, that's why packages can be
> > built
> > in arm926ejse or arm926ejste package feed.
>=20
> Yes, I understand that.  But the point is that there doesn't seem to be
> any good reason to distinguish those two cases by PACKAGE_ARCH, any
> more than we use separate PACKAGE_ARCH values for binaries built with=20
> -O2, or -fpie, or any number of other options.
>=20
> ARM926EJ-S, by definition, can execute both ARM and Thumb code so there
> is no meaningful situation where arm926ejse binaries might be usable
> yet arm926ejste ones are not. =20

What about consistency with less specific PACKAGE_ARCHs which use "t" to
show if it was built with or without thumb?

Or more strange case when some DISTRO without PR service enables thumb
and package manager can in theory migrate/upgrade packages from arm926ejse =
feed
to arm926ejste ones even when the version is the same (doesn't work with
opkg)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYfl34ACgkQN1Ujt2V2gBwKygCgpmtMhVRhmpBCMQ0/ILMxrM3M
R2QAnicCi/T841Cmvd8qpRPKMn0ySq5V
=eQOd
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
