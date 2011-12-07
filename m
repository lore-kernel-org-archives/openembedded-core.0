Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYL4H-0003uk-1D
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:14:05 +0100
Received: by eaao14 with SMTP id o14so657738eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sOMUcFfgaOxXX3xeq6LMsM4UXOrebq8T5AAeUoZjmXk=;
	b=Ekks6IdnEaOXrGVaPkftBW6axs++IxcXWrLSyNFuctVTqY5khptihnYx56sUIinEVV
	8m+r4vFK8th8g/nTxUlZu+HAXhMrQvN7hIxihlno7U1IcE5q1YlIWdH0x8JaW7oBd7VZ
	zZ09qQHfEsXW9UmAGjRCaZIkiuSvJj8+rDXk0=
Received: by 10.213.19.69 with SMTP id z5mr710421eba.130.1323277636391;
	Wed, 07 Dec 2011 09:07:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm7933967eea.6.2011.12.07.09.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 09:07:15 -0800 (PST)
Date: Wed, 7 Dec 2011 18:07:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207170713.GJ3897@jama.jama.net>
References: <cover.1323148566.git.raj.khem@gmail.com>
	<2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
	<09058d57658d20d3f71f149a879563393f6fb313.1323148566.git.raj.khem@gmail.com>
	<CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
	<CAMKF1sqY=MqqYReQwXiDh5OGSTvRR07H05xiM-duevSU7bfPrw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqY=MqqYReQwXiDh5OGSTvRR07H05xiM-duevSU7bfPrw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/6] cloog-ppl,ppl: Add new recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 17:14:05 -0000
X-Groupsio-MsgNum: 13760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVh9lyqKgK19OcEf"
Content-Disposition: inline

--EVh9lyqKgK19OcEf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 09:03:34AM -0800, Khem Raj wrote:
> On Tue, Dec 6, 2011 at 3:41 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Dec 6, 2011 at 6:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> These are supporting libraries needed if we want
> >> to build gcc with graphite support which does better
> >> job on loop optimizarions.
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> =A0meta/recipes-support/cloog-ppl/cloog-ppl.inc =A0 =A0 =A0 | =A0 =A06=
 +
> >> =A0.../recipes-support/cloog-ppl/cloog-ppl_0.15.11.bb | =A0 13 +
> >> =A0.../ppl/ppl-0.11.2/ppl_autoreconf.patch =A0 =A0 =A0 =A0 =A0 =A0|170=
34 ++++++++++++++++++++
> >> =A0meta/recipes-support/ppl/ppl.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A06 +
> >> =A0meta/recipes-support/ppl/ppl_0.11.2.bb =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 16 +
> >> =A0meta/recipes-support/ppl/ppl_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 17 +
> >> =A06 files changed, 17092 insertions(+), 0 deletions(-)
> >> =A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl.inc
> >> =A0create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl_0.15.11=
=2Ebb
> >> =A0create mode 100644 meta/recipes-support/ppl/ppl-0.11.2/ppl_autoreco=
nf.patch
> >> =A0create mode 100644 meta/recipes-support/ppl/ppl.inc
> >> =A0create mode 100644 meta/recipes-support/ppl/ppl_0.11.2.bb
> >> =A0create mode 100644 meta/recipes-support/ppl/ppl_git.bb
> >
> > While testing this changes I got this from ppl build
> > configure:10654: checking how to link with libgmpxx
> > configure:11127: result: /usr/lib/libgmpxx.so /usr/lib/libgmp.so
> > configure:11173: checking for the GMP library version 4.1.3 or above
> > ...
> > ac_cv_libgmp_cppflags=3D
> > ac_cv_libgmp_libs=3D/usr/lib/libgmp.so
> > ac_cv_libgmp_ltlibs=3D'-L/usr/lib -lgmp'
> > ac_cv_libgmp_prefix=3D/usr
> > ac_cv_libgmpxx_cppflags=3D
> > ac_cv_libgmpxx_libs=3D'/usr/lib/libgmpxx.so /usr/lib/libgmp.so'
> > ac_cv_libgmpxx_ltlibs=3D'-L/usr/lib -lgmpxx -L/usr/lib -lgmp'
> > ac_cv_libgmpxx_prefix=3D/usr
> >
> > OE @ ~/shr-core/tmp-eglibc $ find sysroots/nokia900/usr/lib/ -name libg=
mp\*
> > sysroots/nokia900/usr/lib/libgmp.so.10.0.2
> > sysroots/nokia900/usr/lib/libgmp.la
> > sysroots/nokia900/usr/lib/libgmpxx.a
> > sysroots/nokia900/usr/lib/libgmpxx.so.4
> > sysroots/nokia900/usr/lib/libgmp.so.10
> > sysroots/nokia900/usr/lib/libgmpxx.la
> > sysroots/nokia900/usr/lib/ssl/engines/libgmp.so
> > sysroots/nokia900/usr/lib/libgmp.so
> > sysroots/nokia900/usr/lib/libgmpxx.so.4.2.2
> > sysroots/nokia900/usr/lib/libgmp.a
> > sysroots/nokia900/usr/lib/libgmpxx.so
> >
>=20
> is this when you build gcc for target ?

while building ppl for target, ppl-native was built fine

> > Maybe we should pass --with-gmp-build or improve m4/ac_check_gmp.m4 to
> > detect gmp in sysroot?
>=20
> Thanks for trying it out.
>=20
> Yes I should. I had it for a while but then I removed it for experimenting
> if it will find libs in sysroot and it did and since then I removed it bu=
t I
> forgot that I do not have gmp libs installed locally on build system.
>=20
> I will fix it here and push a new patch to same branch

http://patches.openembedded.org/patch/16301/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVh9lyqKgK19OcEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fnUEACgkQN1Ujt2V2gBw8wACgowzB0y5RyM7RdWuw5FigQauz
bXIAoKPtgIYYA3XQotL7pgpdFWLwllSE
=Ttq+
-----END PGP SIGNATURE-----

--EVh9lyqKgK19OcEf--
