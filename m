Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCA060557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 12:05:45 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so14387360wid.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HKYk4IYyWWzHTD3ICtIixD9z3BKxRPyaPhiN0S/0Edg=;
	b=Xc7jyRd6rvFopTgbMWhU9PpDUV41qdpTRDmis3c/GOiOp8oLES7vKOwoUv2HQmrkpt
	V4eih04FFz5QeLqfVrFnv17l1h9xV0mX3c0BwSjJHXAFIGIunfwomL98jHsBZhMwCUw1
	PTHwWwbmjHEF6rUwXQb4FgAyfKmAoNhByUS6paOiwfv96Io5ojKlj6AlEShBJX8q/oko
	/ThswqVqLghXEAfwNns13wCYM5BIfQpnnq8m0kKkG6cfZUM13axRVrnWbH2RI3l8cTcy
	qRsrJmH6NjiQdtx/s4UTR9d49bXeW4AtyTi+7qOPSOuxw6m93USwxEIOtjZGiYab2OP2
	66Aw==
X-Received: by 10.194.2.9 with SMTP id 9mr14533215wjq.95.1440158745951;
	Fri, 21 Aug 2015 05:05:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bm9sm2690029wib.10.2015.08.21.05.05.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 05:05:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Aug 2015 14:06:18 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20150821120618.GA2442@jama>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<20150818080317.GC2458@jama>
	<CAHiDW_HCSh-FquWyhib9WDSHxpTVB6iHu-5DP40ugP2=D3O3gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HCSh-FquWyhib9WDSHxpTVB6iHu-5DP40ugP2=D3O3gw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Fri, 21 Aug 2015 12:05:47 -0000
X-Groupsio-MsgNum: 69801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 11:48:30AM +0300, Jussi Kukkonen wrote:
> On 18 August 2015 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Sun, Aug 09, 2015 at 10:58:21AM +0530, Armin Kuster wrote:
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
> > It would be nice to package GPLv2 files in separate package as well (or
> > LGPLv2.1 library in seprate package) if you have time to do that.
>=20
> Forgot to answer this, sorry.
>=20
> For 2.7.1 what you suggest may work -- there may be some tools that
> are GPLv2 that we could separate. But for the new version the strange
> " "LGPLv3+ | GPLv2+" license combo is _not_ a result of the library
> being LGPL and some utilities being GPL: the library itself (like a
> lot of GNU stuff nowadays) is dual licensed like that.

This means that we need to preserve nettle 2.7.1 for people who cannot
use LGPLv3 (and GPLv2 for libraries).

> It seems weird but actually makes sense for GNU: It forces all users
> to comply with LGPLv3, except the GPLv2 programs that can't easily be
> relicensed to GPLv3. Those GPLv2 programs would be incompatible with
> the newer LGPLv3 libraries but this dual-licensing lets them off the
> hook.
>=20
> Jussi
>=20
>=20
>=20
> >> +LICENSE_${PN}-cast =3D "CC0"
> >> +LICENSE_${PN}-gosthash =3D "MIT"
> >> +
> >> +# both public and GPL license listed
> >> +LICENSE_${PN}-md2 =3D "CC0 & LGPLv2.1+"
> >> +LICENSE_${PN}-md4 =3D "CC0 & LGPLv2.1+"
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
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXXFDkACgkQN1Ujt2V2gBzExQCgoYDDgJpc9rQR3bc6Sl2riJfT
464AoJRpQn0h+J6OyL3e29B9bx+VYclo
=BcUr
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
