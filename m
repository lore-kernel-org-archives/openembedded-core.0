Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EFCBA6D02F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 04:07:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 20:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; 
	d="asc'?scan'208";a="442666134"
Received: from unknown (HELO [10.255.13.10]) ([10.255.13.10])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 20:07:29 -0800
Message-ID: <1390363648.13672.33.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2014 20:07:28 -0800
In-Reply-To: <20140122010255.GP4100@jama>
References: <cover.1390351667.git.dvhart@linux.intel.com>
	<e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
	<20140122010255.GP4100@jama>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Poky <poky@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCH 01/19] x86: Replace ia32 with x86 when referring to the generic architecture
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
X-List-Received-Date: Wed, 22 Jan 2014 04:07:30 -0000
X-Groupsio-MsgNum: 49353
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-TBmo3iIHEsOSeHXm7HZ/"

--=-TBmo3iIHEsOSeHXm7HZ/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2014-01-22 at 02:02 +0100, Martin Jansa wrote:
> > --- a/meta/conf/machine/include/ia32/README
> > +++ b/meta/conf/machine/include/x86/README
> > @@ -1,12 +1,12 @@
> >  2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
> >   - Initial version
> > =20
> > -Most of the items for the IA architecture are defined in the
> single=20
> > -arch-ia32 file.
> > +Most of the items for the Intel architectures are defined in the
> single=20
> > +arch-x86 file.
>=20
> still few intel-isms left

Right you are - at least this time it wasn't made any worse ;-) Fixed
though.

>=20
> >  Three ABIs are define, m32, mx32 and m64.
> > =20
> > -The following is the list of ia32 specific variables:
> > +The following is the list of intel specific variables:
>=20
> still few intel-isms left

Oi, thanks Martin - I appreciate the careful review.


I've pushed the following to the same contrib branch.

$ git diff origin/dvhart/x86-tune-ng-v2
diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/inclu=
de/x86/READ
index d8b6793..2b6c46c 100644
--- a/meta/conf/machine/include/x86/README
+++ b/meta/conf/machine/include/x86/README
@@ -1,12 +1,12 @@
 2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
  - Initial version
=20
-Most of the items for the Intel architectures are defined in the single=
=20
+Most of the items for the X86 architectures are defined in the single
 arch-x86 file.
=20
 Three ABIs are define, m32, mx32 and m64.
=20
-The following is the list of intel specific variables:
+The following is the list of X86 specific variables:
=20
 X86ARCH32 - This is the 32-bit architecture GNU canonical arch, TUNE_ARCH.


--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-TBmo3iIHEsOSeHXm7HZ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAABAgAGBQJS30QAAAoJEKbMaAwKp364hnwH/38K5tHsuJH5mE6I8N0x1wnL
DjBGX6LpFNlTF2pk8nx2GPcA3HMpUjVh+GDEfqjtbuofeXgQ2Il8zeOR2XiyAxnU
yUJbDecIa7AQUGmA3BBx3LikkHq3z7Gxwo1Ui0lc/jQVWMXnqqkEpHC6MC8jLVwd
AVrk6gS+QQYqDjCgRHidTidnhGK4u7oDFoQPahaqsisTqj0MlYTxUugp5m2WmiKH
tdvSQZO5avQsbqeiFRT8ylFYzUNhnQILVb/ibzf3kf3gik81uLViRC6dAcHkaKby
Qyx9+lSSKmYPTKH0/rTEfL+i0R5CskULfUpt4e0kHas/Z7F6pUCM60xGbIGYf20=
=/fni
-----END PGP SIGNATURE-----

--=-TBmo3iIHEsOSeHXm7HZ/--
