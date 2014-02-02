Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC7706B5B5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 18:46:56 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so6074717pde.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 10:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type;
	bh=Azge0bpOctRtPljgRQSyT/SPAMalRmsNqg13s3VJC9s=;
	b=c79n+rZ/MN/+TRg/sqO4LKT6KqfBSDOuco4b45sku9187ZuzJenfU5mDS45YFciKAh
	ckrIkib0pD4qkueOdswrWF84i9nAtNk7m3G4DTehE35VJ+koy4cS8vkmnk7aX/SKztKa
	L+CLOpO+qC4xcPhm5sigr+ueerYNoIIZTnTowRsTHEf0BpfuHDGvz2YVzVaA6mzDNqa7
	xTtaLbYFBqiHGO6Vr5H30egarnTu3IZeK8ABz7Arr6yYJOpeSd8OE1G83tuDNWUgEImG
	7OantcBGAg7thhGOAAsFgqzd9Psu5F4ICXtw53mceNmx/ZV2GmMFiDeioOZOy8aUg2ON
	gJpQ==
X-Received: by 10.66.139.169 with SMTP id qz9mr33427368pab.16.1391366817315;
	Sun, 02 Feb 2014 10:46:57 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id cz3sm48544184pbc.9.2014.02.02.10.46.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Feb 2014 10:46:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 02 Feb 2014 10:46:42 -0800
Message-ID: <6959900.Yh9R1GnLEU@leo>
Organization: Himvis LLC
X-Face: "r2#Te[Vd[r&41P}v3a{\jUcEEz4&|KRK5|)5HC&!!$q5nGWwa.D_?oxdsx1~me-5G$n}g
	*fLiTNxg"wR4~UUl3NN~Ru/un!"UQt%M5%+(NUYxFxw(vcF.@Poe\&K9jFrC'v=A/;
	KGGF 7?b>`5Ehi,RB\-_t{J;
	bdUatO'v?{A}hIsi?tJg3rk.E"EM-VhpPxUH-'5$&/Ap*i!CCTh
	L:,oj1O_K7FFGdo/^i4IL<_ZwA]W#9hRXp&T$+SYBB~7k\#:+NnU*FQ7TjQE~mVm<P
User-Agent: KMail/4.12.1 (Linux/3.13.0-6-generic; KDE/4.12.1; x86_64; ; )
In-Reply-To: <1391335353.28575.145.camel@ted>
References: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
	<316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
	<1391335353.28575.145.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wireless-tools: Upgrade 29 -> 30.pre9
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
X-List-Received-Date: Sun, 02 Feb 2014 18:46:59 -0000
X-Groupsio-MsgNum: 49773
Content-Type: multipart/signed; boundary="nextPart3654947.AqypvgXcRs";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart3654947.AqypvgXcRs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday, February 02, 2014 10:02:33 AM Richard Purdie wrote:
> On Sat, 2014-02-01 at 01:00 -0800, Khem Raj wrote:
> > This also fixes the underlinking problems that
> > are unearthed with newer binutils 2.24
> > where one of the wireless-tools libraries is asking
> > for symbols from libm but all the symbols it asks
> > for are unfortunately weak and they do not let new
> > linker convince enough to link libm even though -lm
> > is on cmdline since we are using --as-needed by default
> > in linker, which means we end up with errors like
> >=20
> > | make: *** [iwconfig] Error 1
> > | libiw.so.30: undefined reference to `ceil'
> > | libiw.so.30: undefined reference to `pow'
> > | libiw.so.30: undefined reference to `log10'
> > | libiw.so.30: undefined reference to `floor'
> > | collect2: error: ld returned 1 exit status
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../wireless-tools/wireless-tools/man.patch        | 24 ++++++++++=
=2D---------
> >  ...eless-tools_29.bb =3D> wireless-tools_30.pre9.bb} | 26 ++++++++=
+++-----------
> >  2 files changed, 25 insertions(+), 25 deletions(-)
> >  rename meta/recipes-connectivity/wireless-tools/{wireless-tools_29=
.bb =3D> wireless-tools_30.pre9.bb} (79%)
> >=20
> > diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tool=
s/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/m=
an.patch
> > index 8e16215..6a757da 100644
> > --- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.p=
atch
> > +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.p=
atch
> > @@ -1,15 +1,15 @@
> >  Upstream-Status: Inappropriate [configuration]
> > =20
> > ---- wireless_tools.26/Makefile.orig=092003-06-18 03:38:58.00000000=
0 +0200
> > -+++ wireless_tools.26/Makefile=092004-07-03 23:35:29.000000000 +02=
00
> > -@@ -57,8 +57,8 @@
> > - # Install directories
> > - INSTALL_DIR=3D $(PREFIX)/sbin/
> > - INSTALL_LIB=3D $(PREFIX)/lib/
> > --INSTALL_INC=3D $(PREFIX)/include/
> > --INSTALL_MAN=3D $(PREFIX)/man/
> > -+INSTALL_INC=3D $(PREFIX)/usr/include/
> > -+INSTALL_MAN=3D $(PREFIX)/usr/share/man/
> > +Index: wireless_tools.30/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- wireless_tools.30.orig/Makefile=092014-02-01 00:21:04.14846338=
2 -0800
> > ++++ wireless_tools.30/Makefile=092014-02-01 00:23:35.448072279 -08=
00
> > +@@ -76,7 +76,7 @@
> > + INSTALL_DIR=3D $(PREFIX)/sbin
> > + INSTALL_LIB=3D $(PREFIX)/lib
> > + INSTALL_INC=3D $(PREFIX)/include
> > +-INSTALL_MAN=3D $(PREFIX)/man
> > ++INSTALL_MAN=3D $(PREFIX)/share/man
> >  =20
> > - # Use local header if the version of wireless extensions is speci=
fied
> > - ifdef FORCE_WEXT_VERSION
> > + # Various commands
> > + RM =3D rm -f
> > diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tool=
s_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pr=
e9.bb
> > similarity index 79%
> > rename from meta/recipes-connectivity/wireless-tools/wireless-tools=
_29.bb
> > rename to meta/recipes-connectivity/wireless-tools/wireless-tools_3=
0.pre9.bb
> > index 3aef24e..bae22a0 100644
> > --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb=

> > +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pr=
e9.bb
> > @@ -6,20 +6,19 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d=
512a9ba36caa9b7df079bae19f \
> >  =09=09=09file://iwevent.c;beginline=3D59;endline=3D72;md5=3Dd66a10=
026d4394f0a5b1c5587bce4537 \
> >  =09=09=09file://sample_enc.c;beginline=3D1;endline=3D4;md5=3D83837=
2be07874260b566bae2f6ed33b6"
> >  SECTION =3D "base"
> > -PE =3D "1"
> > -PR =3D "r4"
> > =20
> > -SRC_URI =3D "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/=
wireless_tools.29.tar.gz \
> > -=09   file://remove.ldconfig.call.patch \
> > -=09   file://man.patch \
> > -=09   file://wireless-tools.if-pre-up \
> > -=09   file://zzz-wireless.if-pre-up \
> > -=09   file://avoid_strip.patch \
> > -=09   file://ldflags.patch"
> > +SRC_URI =3D "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/=
wireless_tools.${PV}.tar.gz \
> > +           file://wireless-tools.if-pre-up \
> > +           file://zzz-wireless.if-pre-up \
> > +           file://remove.ldconfig.call.patch \
> > +           file://man.patch \
> > +           file://avoid_strip.patch \
> > +           file://ldflags.patch \
> > +=09  "
> > +SRC_URI[md5sum] =3D "ca91ba7c7eff9bfff6926b1a34a4697d"
> > +SRC_URI[sha256sum] =3D "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1=
be27c6241a564948f34c63"
> > =20
> > -SRC_URI[md5sum] =3D "e06c222e186f7cc013fd272d023710cb"
> > -SRC_URI[sha256sum] =3D "6fb80935fe208538131ce2c4178221bab1078a1656=
306bce8909c19887e2e5a1"
> > -S =3D "${WORKDIR}/wireless_tools.29"
> > +S =3D "${WORKDIR}/wireless_tools.30"
> > =20
> >  CFLAGS =3D+ "-I${S}"
> >  EXTRA_OEMAKE =3D "-e 'BUILD_SHARED=3Dy' \
> > @@ -29,7 +28,8 @@ EXTRA_OEMAKE =3D "-e 'BUILD_SHARED=3Dy' \
> >  =09=09'INSTALL_MAN=3D${D}${mandir}'"
> > =20
> >  do_compile() {
> > -=09oe_runmake all libiw.a
> > +=09oe_runmake libiw.a
> > +=09oe_runmake all
> >  }
>=20
> Why the change to do_compile?
>=20

I tested by removing above hunk and it worked all fine.
additionally I removed PE accidentally which I put back again. The rewo=
rked patch is push on to the pull branch.

> Cheers,
>=20
> Richard
>=20
>=20

=2D-=20
=2DKhem

--nextPart3654947.AqypvgXcRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlLukpIACgkQuwUzVZGdMxTwMgCgkAKbKFJRvVIVJdpqUZv1lxZa
qGgAnjOfdkYf9/PP2KYBLHxiPNUVSnR0
=5aX6
-----END PGP SIGNATURE-----

--nextPart3654947.AqypvgXcRs--
