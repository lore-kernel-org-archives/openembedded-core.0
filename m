Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 853036CB7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 23:19:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 21 Jan 2014 15:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; 
	d="asc'?scan'208";a="462527669"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.24.1.180]) ([10.24.1.180])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2014 15:19:14 -0800
Message-ID: <1390346352.13672.18.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2014 15:19:12 -0800
In-Reply-To: <20140121225520.GL4100@jama>
References: <cover.1390342768.git.dvhart@linux.intel.com>
	<67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
	<20140121225520.GL4100@jama>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Richard Purdie <richard.purdie@intel.com>, Poky <poky@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/15] x86: Replace ia32 with x86 when referring to the generic architecture
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
X-List-Received-Date: Tue, 21 Jan 2014 23:19:15 -0000
X-Groupsio-MsgNum: 49313
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-eoNrDzCFRYk0F/7XbfRo"

--=-eoNrDzCFRYk0F/7XbfRo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-01-21 at 23:55 +0100, Martin Jansa wrote:
> On Tue, Jan 21, 2014 at 02:39:47PM -0800, Darren Hart wrote:
> > ia32 implies 32bit, while these files provide descriptions for IA32,
> > X86_64, and X32 architectures. The term "x86" fits this used better
> > without resorting to using the term "Intel" which isn't quite right as
> > it excludes things like the tune-c3 file describing a Via CPU.
> >=20
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > Cc: Richard Purdie <richard.purdie@intel.com>
> > Cc: Paul Eggleton <paul.eggleton@intel.com>
> > Cc: Tom Zanussi <tom.zanussi@intel.com>
> > Cc: Nitin Kamble <nitin.a.kamble@intel.com>
> > Cc: Mark Hatle <mark.hatle@windriver.com>
> > Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> >  meta/conf/machine/include/tune-c3.inc              |    2 +-
> >  meta/conf/machine/include/tune-i586.inc            |    2 +-
> >  meta/conf/machine/include/tune-x86_64.inc          |    2 +-
> >  .../include/{ia32-base.inc =3D> x86-base.inc}        |   16 ++++++++--=
------
> >  meta/conf/machine/include/{ia32 =3D> x86}/README     |    6 +++---
> >  .../{ia32/arch-ia32.inc =3D> x86/arch-x86.inc}       |    2 +-
> >  6 files changed, 15 insertions(+), 15 deletions(-)
> >  rename meta/conf/machine/include/{ia32-base.inc =3D> x86-base.inc} (75=
%)
> >  rename meta/conf/machine/include/{ia32 =3D> x86}/README (81%)
> >  rename meta/conf/machine/include/{ia32/arch-ia32.inc =3D> x86/arch-x86=
.inc} (97%)
> >=20
> > diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/=
include/tune-c3.inc
> > index 18865b7..fafc28a 100644
> > --- a/meta/conf/machine/include/tune-c3.inc
> > +++ b/meta/conf/machine/include/tune-c3.inc
> > @@ -1,4 +1,4 @@
> > -require conf/machine/include/ia32/arch-ia32.inc
> > +require conf/machine/include/x86/arch-x86.inc
> > =20
> >  TUNEVALID[c3] =3D "VIA Cyrix III or VIA C3 specific optimizations"
> >  TUNECONFLICTS[c3] =3D "m64 mx32"
> > diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machin=
e/include/tune-i586.inc
> > index 4542b9b..a315b35 100644
> > --- a/meta/conf/machine/include/tune-i586.inc
> > +++ b/meta/conf/machine/include/tune-i586.inc
> > @@ -1,6 +1,6 @@
> >  DEFAULTTUNE ?=3D "i586"
> > =20
> > -require conf/machine/include/ia32/arch-ia32.inc
> > +require conf/machine/include/x86/arch-x86.inc
> > =20
> >  # Extra tune features
> >  TUNEVALID[i586] =3D "Enable i586 specific processor optimizations"
> > diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/mach=
ine/include/tune-x86_64.inc
> > index 31e06da..ae48124 100644
> > --- a/meta/conf/machine/include/tune-x86_64.inc
> > +++ b/meta/conf/machine/include/tune-x86_64.inc
> > @@ -1,4 +1,4 @@
> >  DEFAULTTUNE ?=3D "x86-64"
> > =20
> > -require conf/machine/include/ia32/arch-ia32.inc
> > +require conf/machine/include/x86/arch-x86.inc
> > =20
> > diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machin=
e/include/x86-base.inc
> > similarity index 75%
> > rename from meta/conf/machine/include/ia32-base.inc
> > rename to meta/conf/machine/include/x86-base.inc
> > index e15f927..421bdee 100644
> > --- a/meta/conf/machine/include/ia32-base.inc
> > +++ b/meta/conf/machine/include/x86-base.inc
> > @@ -1,5 +1,5 @@
> >  #
> > -# base machine settings for ia32-architecture BSPs
> > +# Base machine settings for Intel architecture BSPs
>=20
> does it apply for AMD, Cyrix as well?

Blarg, yes it does. Apologies. I had originally done some of this in
meta-intel and was persuaded it was better to do this in oe-core. I
missed removing some of the intel-isms. Thanks for catching this.

Replacing INTEL with X86 for everything that isn't a specific recipe
name (xf86-video-intel). Thanks Martin.

Will include in the inevitable v2.

--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-eoNrDzCFRYk0F/7XbfRo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAABAgAGBQJS3wBwAAoJEKbMaAwKp364AXQH/A98Fe2nzwPt+QF9lwcQ99lr
APwIhQW1ZZ7uFwOaNMqFa8WNnwbtFGOmhB0g0kjD5LdqczE6gi0PoAJC7GnuUEdX
JiJcGxNAl/9mum/PG+Mms3RFzxAMBJ/m9Vr3J7y6r3YKEaKWqlzvK7kwSSFBbPut
HDn+vR5vHnWPQHuljevlKYT5DgYqIwuLQSALdZCYHPfGJtkxu/A+5JozHzZJbJ4l
SziHp/1B2VgipDskxvvmYrDeWO/FoEPafCL5KpfnkumwM2bKH+JGnB+YvQguK/wg
GFt5nuEl/IhAqHaj+lTpyq/OwSYCOKsjmsJdHESVQnx5Oc19+6JNiZo/XIAAddU=
=8Nb4
-----END PGP SIGNATURE-----

--=-eoNrDzCFRYk0F/7XbfRo--
