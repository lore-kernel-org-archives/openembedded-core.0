Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 59ADF60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:57:33 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so18249335wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QbqN4jmLNRDcgG9KgJUusNbnfsY/AfGci5qKFPwqGPo=;
	b=euydMl4MWSyvi3gmirUJv1ICynJsoOovyhWkglPo9e3cffue5z2kD8SaKXptCnAAur
	eLYZCGwgBOZ2SEMSBnPwjOshGbyEOGv9Ss6EEQCAIh5Uh/ceU1t8Fye+0HxSb8Bzmv6p
	voOIsF3yL8FZNiDNCOsBlZMIA7CO09siYyLJGRIOl/sRY1+jGVnDydUygQMJYGYpX1HA
	cbt7VzaYuSw2mDYgxeRWH0QKq6f3kX1GV0A++biykvvNz9/0wKtc6MUP1/y6bmvsOKvC
	1RLb0BXIogXIJAY5bZ588jaqcAdS8bP63rlcs6lER4V7dSVZJzbJGXn99vhO8JIdC+Em
	yJtQ==
X-Received: by 10.180.72.35 with SMTP id a3mr6630435wiv.21.1440169053249;
	Fri, 21 Aug 2015 07:57:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pe1sm3284385wic.20.2015.08.21.07.57.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 07:57:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Aug 2015 16:58:05 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150821145805.GC2442@jama>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<20150818080317.GC2458@jama>
	<CAHiDW_HCSh-FquWyhib9WDSHxpTVB6iHu-5DP40ugP2=D3O3gw@mail.gmail.com>
	<20150821120618.GA2442@jama> <55D7364C.7090508@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55D7364C.7090508@gmail.com>
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
X-List-Received-Date: Fri, 21 Aug 2015 14:57:34 -0000
X-Groupsio-MsgNum: 69816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2015 at 07:31:40AM -0700, akuster808 wrote:
>=20
>=20
> On 08/21/2015 05:06 AM, Martin Jansa wrote:
> > On Fri, Aug 21, 2015 at 11:48:30AM +0300, Jussi Kukkonen wrote:
> >> On 18 August 2015 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >>> On Sun, Aug 09, 2015 at 10:58:21AM +0530, Armin Kuster wrote:
> >>>> adding the license definitions on the few packages that
> >>>> deviate from the overall package license.
> >>>>
> >>>> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyrig=
ht
> >>>> and spot checking files.
> >>>>
> >>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>>> ---
> >>>>   meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
> >>>>   1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/reci=
pes-support/nettle/nettle_2.7.1.bb
> >>>> index f53afcc..f9d331f 100644
> >>>> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> >>>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> >>>> @@ -2,6 +2,15 @@ SUMMARY =3D "A low level cryptographic library"
> >>>>   HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> >>>>   SECTION =3D "libs"
> >>>>   LICENSE =3D "LGPLv2.1 & GPLv2"
> >>>
> >>> It would be nice to package GPLv2 files in separate package as well (=
or
> >>> LGPLv2.1 library in seprate package) if you have time to do that.
> >>
> >> Forgot to answer this, sorry.
> >>
> >> For 2.7.1 what you suggest may work -- there may be some tools that
> >> are GPLv2 that we could separate. But for the new version the strange
> >> " "LGPLv3+ | GPLv2+" license combo is _not_ a result of the library
> >> being LGPL and some utilities being GPL: the library itself (like a
> >> lot of GNU stuff nowadays) is dual licensed like that.
> >
> > This means that we need to preserve nettle 2.7.1 for people who cannot
> > use LGPLv3 (and GPLv2 for libraries).
>=20
> ok. SO if I resubmit the update, it should be an addition not=20
> replacement. Would I define PREFERRED_VERSION then as well?

You don't need PREFERRED_VERSION.

Latest will be used by default and setups with incompatible license will
skip the latest and use 2.7.1 one.

>=20
> - armin
> >
> >> It seems weird but actually makes sense for GNU: It forces all users
> >> to comply with LGPLv3, except the GPLv2 programs that can't easily be
> >> relicensed to GPLv3. Those GPLv2 programs would be incompatible with
> >> the newer LGPLv3 libraries but this dual-licensing lets them off the
> >> hook.
> >>
> >> Jussi
> >>
> >>
> >>
> >>>> +LICENSE_${PN}-cast =3D "CC0"
> >>>> +LICENSE_${PN}-gosthash =3D "MIT"
> >>>> +
> >>>> +# both public and GPL license listed
> >>>> +LICENSE_${PN}-md2 =3D "CC0 & LGPLv2.1+"
> >>>> +LICENSE_${PN}-md4 =3D "CC0 & LGPLv2.1+"
> >>>> +
> >>>> +
> >>>>   LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef=
8f17206a5b0a1 \
> >>>>                       file://serpent-decrypt.c;beginline=3D53;endlin=
e=3D67;md5=3Dbcfd4745d53ca57f82907089898e390d \
> >>>>                       file://serpent-set-key.c;beginline=3D56;endlin=
e=3D70;md5=3Dbcfd4745d53ca57f82907089898e390d"
> >>>> --
> >>>> 2.3.5
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>> --
> >>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXXPHwACgkQN1Ujt2V2gBz3SACcCNITm2+jeJ1YOko8mPbNXSrl
EeEAoLSJ6YSSxVs9HfQKdt0xf5HJwi83
=Usk/
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
