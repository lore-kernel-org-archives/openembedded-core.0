Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7A77B65C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:35:31 +0000 (UTC)
Received: by wijp15 with SMTP id p15so93931713wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R+xAZIKVEea/s4QrZGF4K5kHMrDGjgN1f7qaEtwq2y4=;
	b=TpmtTIM4A8MuWTpOFUk26/RFowf82mNOEnMH7niSR9gyzR9lQH6Px59c27eM1+Swuz
	mFs84rMC4D5ExZ5L8lzfVzFBn1x1isT9QwfERaoFtPewuCFJlXQVVAFyggLjGdIRkRzW
	Ptbt/NEQAf1be8pp2L6lBDuM67u/48t5d65OwRL4xZHDUqvZorkHiITs5U+2cOg1rAc3
	l+pOFvyCUESMBnpQYDOND2CB8cIeZVcSygXNAZtM+GmtVCbZdxrjgO8RXVVueNWkhfuc
	eQgWT0dQvD8Ssz3UJ0fhE1PzdaYlkE7apGpl9Tebbrs+4cJYy1DBoK6Q7F6WtN8/rBMa
	g36g==
X-Received: by 10.180.91.107 with SMTP id cd11mr39593090wib.51.1439886931571; 
	Tue, 18 Aug 2015 01:35:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bd9sm20316627wib.18.2015.08.18.01.35.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 01:35:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 10:35:34 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20150818083534.GD2458@jama>
References: <CAHiDW_EGaGer0d0RVaqzT6ats9aqDEpzMieUxwbgYffVRYADbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EGaGer0d0RVaqzT6ats9aqDEpzMieUxwbgYffVRYADbA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gnutls/nettle/gmp licensing and versions
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
X-List-Received-Date: Tue, 18 Aug 2015 08:35:32 -0000
X-Groupsio-MsgNum: 69556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline

--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2015 at 03:42:45PM +0300, Jussi Kukkonen wrote:
> On 12 August 2015 at 17:14, Jussi Kukkonen <jussi.kukkonen@intel.com> wro=
te:
> > Hi,
> >
> > I realise I'm a bit late (with the commit in master already) but I'm
> > looking at upgrading this recipe and had some questions on this patch
> > and the recipe in general.
> >
> > On 9 August 2015 at 08:28, Armin Kuster <akuster808@gmail.com> wrote:
> >> adding the license definitions on the few packages that
> >> deviate from the overall package license.
> >>
> >> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
> >> and spot checking files.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipe=
s-support/nettle/nettle_2.7.1.bb
> >> index f53afcc..f9d331f 100644
> >> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> >> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> >> @@ -2,6 +2,15 @@ SUMMARY =3D "A low level cryptographic library"
> >>  HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> >>  SECTION =3D "libs"
> >>  LICENSE =3D "LGPLv2.1 & GPLv2"
> >
> > I think this is wrong, whichever version you look at -- our current
> > version is just "LGPLv2.1+", the current upstream release is "LGPLv3+
> > | GPLv2+"
> >
> > I'm going to send a patch upgrading the recipe to the current upstream
> > release (and setting license to "LGPLv3+ | GPLv2+"): it might seem
> > like this makes gnutls effectively LGPLv3 but that actually happened
> > last year with the gmp upgrade. Comments on this welcome.
>=20
> Alexander just pointed out to me that there was a discussion on gnutls
> and nettle already in July (which I missed in my
> back-from-holiday-email-binge). It seems that the consensus was to
> preserve LGPLv2 versions.
>=20
> This is what the current situation looks to me -- please correct if I'm w=
rong:
> * gmp is "GPLv2+ | LGPLv3+"
> * nettle is "LGPLv2.1+" but depends on gmp
> * gnutls "LGPLv2.1+" but depends on nettle
>=20
> This effectively makes gnutls "GPLv2+ | LGPLv3+" as far as I can see.
> If we want to preserve a LGPLv2 gnutls, we need to bring back an older
> version of gmp (I think 4.2.1).

I agree, recently we had to downgrade gmp to 4.2.1 in our layer to pass
our license check. Similarly we had to check that all nettle libraries
used in our image are LGPLv2.1 not GPLv2.0 - that's why I've suggested
to package them separately, so that we'll see only LGPLv2.1 nettle
package in our image.

Regards,

> >> +LICENSE_${PN}-cast =3D "CC0"
> >> +LICENSE_${PN}-gosthash =3D "MIT"
> >> +
> >> +# both public and GPL license listed
> >> +LICENSE_${PN}-md2 =3D "CC0 & LGPLv2.1+"
> >> +LICENSE_${PN}-md4 =3D "CC0 & LGPLv2.1+"
> >
> > From the reference I had the impression this "LICENSE_something"
> > construct would imply there is a package "something". But the nettle
> > recipe does not produce "nettle-cast" or any of these. What is the
> > purpose here?
> >
> > Thanks,
> >  Jussi
> >
> >> +
> >> +
> >>  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1 \
> >>                      file://serpent-decrypt.c;beginline=3D53;endline=
=3D67;md5=3Dbcfd4745d53ca57f82907089898e390d \
> >>                      file://serpent-set-key.c;beginline=3D56;endline=
=3D70;md5=3Dbcfd4745d53ca57f82907089898e390d"
> >> --
> >> 2.3.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXS7lUACgkQN1Ujt2V2gBwoqgCeLjgNyeBrDZz4HZDTAgAH81Ak
+QwAnjHAfGaxnu1B9U10I0J/qFWIfpOR
=1RUI
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
