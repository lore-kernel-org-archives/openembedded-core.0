Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 23DC460053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:41:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so17980703wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ozvVWKSlijKKU2/O7k7YKo7muPJN9VQJXI3ojm7Ha5U=;
	b=rDQHtcCutdpHr9fl0v6+OmuIGdx5l0zmxCuBmRALpdjE7yL+G7UQzVMglJ8SE15930
	Lgd3KVQvN1JwjWYSxYei4a/6vXXV17JczVnUBzNFV7lUA9rEMWkmqxW3n2LJkXpl6CDn
	6dWfSKehqMU06/Vr05xrxNQau3UcXyO1T7tmZLE6MEZc1AK8fPuNw/2vh3Jdk8bLV4Xv
	urAGT1ZuleEkV/VXVSbePmbR7CPzEXrLF4G5gbc3bt1ejG5S9YSJlF7grmk/E1vWGonF
	VE1AHls3Vm9bfVOAj0oqVES2JBnkkoU6i/fFexgVDJdkxCALCLTs404+Qw8C1W8k8/Iq
	KqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ozvVWKSlijKKU2/O7k7YKo7muPJN9VQJXI3ojm7Ha5U=;
	b=i2SNx3bDU5RWzO5giLbqS50A1bzNgJuMI5cLNiFT2ffsYkyIRb7Of2onR4B0TlgemO
	BFYN78PhMgfFLnwax8UST4lcO4xucIscJmjI3uc2HSEu1I/B8EEJCYztj4HkvWiaA/rz
	oEIsoWKYQI12JKbl1xNqUhp9K3uc7vj4GVq/vuautinPu2qgppP4VcoxXChoiUAhabUb
	FZ3Oe7XfsyLTDIPCyAquVn/B1ohoUk7S3k36r3mPkzgNqHHo7dY6mZZw2rODOAymCzRT
	eUGDlyv7tSnZZibFUe2CaKoOdXHqBNFeKmmhzaK3bS0V4N5tfbPoumNKW2mXUtBKMwaG
	ce2w==
X-Gm-Message-State: AEkoousNJXsN+3uCpIRU/z1EQXn7f368HlSX4kS4AG8z/sEWlbASzA8x/acDav6UNztjYg==
X-Received: by 10.194.145.103 with SMTP id st7mr21627496wjb.61.1471956063753; 
	Tue, 23 Aug 2016 05:41:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	m127sm27203510wmm.21.2016.08.23.05.41.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Aug 2016 05:41:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Aug 2016 14:41:03 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20160823124103.revwci7cwvxafwzd@jama>
References: <20160823012731.22993-1-raj.khem@gmail.com>
	<39624d78-d684-3ab5-7287-8e1f526d37d5@linux.intel.com>
	<0b221b07-9c5f-c28c-c082-7eb7510c5e17@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <0b221b07-9c5f-c28c-c082-7eb7510c5e17@mlbassoc.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Update to final 6.2.0 release
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
X-List-Received-Date: Tue, 23 Aug 2016 12:41:04 -0000
X-Groupsio-MsgNum: 86151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3iqurx6srdil2j35"
Content-Disposition: inline

--3iqurx6srdil2j35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 02:29:27PM +0200, Gary Thomas wrote:
> On 2016-08-23 14:13, Alexander Kanavin wrote:
> > On 08/23/2016 04:27 AM, Khem Raj wrote:
> >> -#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> >> +BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> >>  #SRCREV =3D "bd9a826d5448db11d29d2ec5884e7e679066f140"
> >>  #BASEURI ?=3D "git://github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;=
protocol=3Dgit"
> >> -BASEURI ?=3D "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-2016081=
5/gcc-6.2.0-RC-20160815.tar.bz2"
> >> +#BASEURI ?=3D "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-201608=
15/gcc-6.2.0-RC-20160815.tar.bz2"
> >> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}${SNAP}"
> >> +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >>  #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> >>  B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> >
> > The commented out lines should be dropped, they're just clutter.
>=20
> Also, how "final" is it when the URL points to a "xxx-RC-yyy"?  Seems
> a bit premature...

If you read it a bit more carefully you'll notice that it doesn't point
to "xxx-RC-yyy"?

Only your reply was a bit premature :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3iqurx6srdil2j35
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAle8RF4ACgkQN1Ujt2V2gBy5/ACgsQVELKHf4Wx6b8IwVtYSUiT8
St8An3b0a8NxAnL75PCyHCLRo/PmekEr
=gCls
-----END PGP SIGNATURE-----

--3iqurx6srdil2j35--
