Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7BAF66AA51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 23:00:02 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id c4so4118268eek.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t4SYyZ6gNr1JGRhAT7CFY65A4J/4Bz17l1gEskIm/dQ=;
	b=ChWJISYP1sVgnHuYICd6PUD6XoE8KrY77Lo9SGDR5FdY9Xm39+dYojefXNGZ6S4qmX
	f0oNVSTW785A2vRYgeOYVWbOw2d9djpOmWAEOAZ96wZTGbMj5d4hawXW0/usyJpDea4q
	Ge1jYxa4YOmvjpyXLfjyuNsBLRiSta5VbGcUV3jH/g8VWhAjZZFAAgh1nAT/Gj1c2E/Q
	Ase9N4vCOPLDyasDyF28hmhOi0AfUU3Bjzf9euWHC6u6S08kmDiU9qdIcA0ZiBDQRG3q
	KLE1sxbyYhV8KaP6LyDzpC7Uz7GqV0RwoletxSh8aZsUDHL6PFj1kDL2QN0BQnYaC2zy
	QdAQ==
X-Received: by 10.14.198.136 with SMTP id v8mr18357504een.68.1370991602239;
	Tue, 11 Jun 2013 16:00:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f9sm15157095eev.9.2013.06.11.16.00.01 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 16:00:01 -0700 (PDT)
Date: Wed, 12 Jun 2013 01:00:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130611230025.GN3233@jama>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
	<1370989876-20531-1-git-send-email-Martin.Jansa@gmail.com>
	<20130611223524.GM3233@jama>
	<D18769ED-F695-463A-83D4-D20A1EB3AC2F@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D18769ED-F695-463A-83D4-D20A1EB3AC2F@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] gcc-4.8: Backport fix for ICE triggered in pixman
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
X-List-Received-Date: Tue, 11 Jun 2013 23:00:03 -0000
X-Groupsio-MsgNum: 40510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hNG1vEeyG8BCaHbQ"
Content-Disposition: inline

--hNG1vEeyG8BCaHbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 03:39:35PM -0700, Khem Raj wrote:
>=20
> On Jun 11, 2013, at 3:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Wed, Jun 12, 2013 at 12:31:16AM +0200, Martin Jansa wrote:
> >> * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57329
> >=20
> > Only RFC, because world build is still running to confirm that it
> > doesn't introduce new issues and that it indeed fixes pixman build for
> > xscalete.
>=20
> can you also test it with rebased on top of gcc 4.8.1 upgrade patch I sen=
t earlier today

It is, that's why I've sent it as reply-to <your-patch>.

And jenkins is indeed testing your 4.8.1 + this one.

> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
> >> .../gcc/gcc-4.8/0036-PR-target-56102.patch         | 83 ++++++++++++++=
++++++++
> >> 2 files changed, 84 insertions(+)
> >> create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56=
102.patch
> >>=20
> >> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devt=
ools/gcc/gcc-4.8.inc
> >> index 6664f1c..bfdb766 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> >> @@ -65,6 +65,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.t=
ar.bz2 \
> >> 	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patc=
h \
> >> 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.p=
atch \
> >> 	   file://0035-wcast-qual-PR-55383.patch \
> >> +	   file://0036-PR-target-56102.patch \
> >> 	   file://gcc-4.8-PR56797.patch \
> >> 	   file://gcc-4.8-build-args.patch \
> >> 	  "
> >> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.pa=
tch b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
> >> new file mode 100644
> >> index 0000000..a9498fc
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
> >> @@ -0,0 +1,83 @@
> >> +From fa049b3584a1cc36c250205e3d5841e6a40ff677 Mon Sep 17 00:00:00 2001
> >> +From: amker <amker@138bc75d-0d04-0410-961f-82ee72b054a4>
> >> +Date: Wed, 27 Mar 2013 08:16:54 +0000
> >> +Subject: [PATCH] PR target/56102
> >> +
> >> +* config/arm/arm.c (thumb1_rtx_costs, thumb1_size_rtx_costs): Fix rtx=
 costs for SET/ASHIFT/ASHIFTRT/LSHIFTRT/ROTATERT patterns with mult-word mo=
de.
> >> +
> >> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@197155 138bc75d-0d04-=
0410-961f-82ee72b054a4
> >> +
> >> +Upstream-Status: Backport
> >> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57329
> >> +
> >> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> +---
> >> + gcc/config/arm/arm.c | 17 ++++++++++++++---
> >> + 1 file changed, 14 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> >> +index 460d333..edf850d 100644
> >> +--- a/gcc/config/arm/arm.c
> >> ++++ b/gcc/config/arm/arm.c
> >> +@@ -7094,7 +7094,7 @@ static inline int
> >> + thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
> >> + {
> >> +   enum machine_mode mode =3D GET_MODE (x);
> >> +-  int total;
> >> ++  int total, words;
> >> +=20
> >> +   switch (code)
> >> +     {
> >> +@@ -7102,6 +7102,8 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, en=
um rtx_code outer)
> >> +     case ASHIFTRT:
> >> +     case LSHIFTRT:
> >> +     case ROTATERT:
> >> ++      return (mode =3D=3D SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSN=
S (2);
> >> ++
> >> +     case PLUS:
> >> +     case MINUS:
> >> +     case COMPARE:
> >> +@@ -7125,7 +7127,10 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, e=
num rtx_code outer)
> >> +       return COSTS_N_INSNS (1) + 16;
> >> +=20
> >> +     case SET:
> >> +-      return (COSTS_N_INSNS (1)
> >> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to=
 get
> >> ++	 the mode.  */
> >> ++      words =3D ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))=
));
> >> ++      return (COSTS_N_INSNS (words)
> >> + 	      + 4 * ((MEM_P (SET_SRC (x)))
> >> + 		     + MEM_P (SET_DEST (x))));
> >> +=20
> >> +@@ -7822,6 +7827,7 @@ static inline int
> >> + thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code oute=
r)
> >> + {
> >> +   enum machine_mode mode =3D GET_MODE (x);
> >> ++  int words;
> >> +=20
> >> +   switch (code)
> >> +     {
> >> +@@ -7829,6 +7835,8 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code cod=
e, enum rtx_code outer)
> >> +     case ASHIFTRT:
> >> +     case LSHIFTRT:
> >> +     case ROTATERT:
> >> ++      return (mode =3D=3D SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSN=
S (2);
> >> ++
> >> +     case PLUS:
> >> +     case MINUS:
> >> +     case COMPARE:
> >> +@@ -7847,7 +7855,10 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code co=
de, enum rtx_code outer)
> >> +       return COSTS_N_INSNS (1);
> >> +=20
> >> +     case SET:
> >> +-      return (COSTS_N_INSNS (1)
> >> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to=
 get
> >> ++	 the mode.  */
> >> ++      words =3D ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))=
));
> >> ++      return (COSTS_N_INSNS (words)
> >> +               + 4 * ((MEM_P (SET_SRC (x)))
> >> +                      + MEM_P (SET_DEST (x))));
> >> +=20
> >> +--=20
> >> +1.8.2.1
> >> +
> >> --=20
> >> 1.8.2.1
> >>=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hNG1vEeyG8BCaHbQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3rAkACgkQN1Ujt2V2gByXGwCZAY8m2Fw2NRs1gXpcKZYT32hQ
W5gAoLQzwu4TdhxKD4pTUZHK8+j/qsdH
=f5q1
-----END PGP SIGNATURE-----

--hNG1vEeyG8BCaHbQ--
