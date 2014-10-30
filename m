Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B970B60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 19:54:53 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Thu, 30 Oct 2014 20:54:53 +0100
From: Tudor Florea <Tudor.Florea@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexandra Safta
	<Alexandra.Safta@enea.com>
Thread-Topic: [OE-core] [PATCH] Valgrind: Remove test apps not building with
	ppc64 and PTEST
Thread-Index: AQHP9GoSkg2e794LJEGUZKT9n6EyypxJC8bg
Date: Thu, 30 Oct 2014 19:54:52 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428ACD1F0@SESTOEX04.enea.se>
References: <1414687599-36822-1-git-send-email-alexandra.safta@enea.com>
	<1414691416.7649.71.camel@ted>
In-Reply-To: <1414691416.7649.71.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Valgrind: Remove test apps not building with ppc64 and PTEST
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
X-List-Received-Date: Thu, 30 Oct 2014 19:54:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Richard Purdie
> Sent: Thursday, October 30, 2014 19:50
> To: Alexandra Safta
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Valgrind: Remove test apps not building wi=
th
> ppc64 and PTEST
>=20
> On Thu, 2014-10-30 at 17:46 +0100, Alexandra Safta wrote:
> > Signed-off-by: Alexandra Safta <alexandra.safta@enea.com>
>=20
> This removes the tests for all architectures? Why is that a good idea?
> At the very least this needs more explanation.
>=20
> Cheers,
>=20
> Richard
>=20

The patch is indented to remove tests that does not compile only for ppc64 =
architecture: changes are only on none/tests/ppc64/Makefile.am file.
The patch is quite similar with the one existing for ppc architecture.

Regards,
  Tudor.


>=20
>=20
>=20
> >  .../valgrind/remove-ppc64-tests-failing-build.patch      | 16
> ++++++++++++++++
> >  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb         |  3 ++-
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-
> ppc64-tests-failing-build.patch
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests=
-
> failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-
> ppc64-tests-failing-build.patch
> > new file mode 100644
> > index 0000000..7bf3a21
> > --- /dev/null
> > +++ b/meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests-
> failing-build.patch
> > @@ -0,0 +1,16 @@
> > +--- a/none/tests/ppc64/Makefile.am	2014-10-22
> 16:33:20.686773392 +0200
> > ++++ b/none/tests/ppc64/Makefile.am	2014-10-23
> 10:31:38.948654523 +0200
> > +@@ -35,11 +35,10 @@
> > +
> > + check_PROGRAMS =3D \
> > + 	allexec \
> > +-	jm-insns lsw round std_reg_imm twi_tdi tw_td power6_bcmp \
> > ++	lsw round std_reg_imm twi_tdi tw_td power6_bcmp \
> > + 	power6_mf_gpr test_isa_2_06_part1 test_isa_2_06_part2 \
> > + 	test_isa_2_06_part3 test_dfp1 test_dfp2 test_dfp3 test_dfp4 \
> > +-	test_dfp5 test_isa_2_07_part1 test_isa_2_07_part2 \
> > +-	test_tm test_touch_tm
> > ++	test_dfp5
> > +
> > + AM_CFLAGS    +=3D @FLAG_M64@
> > + AM_CXXFLAGS  +=3D @FLAG_M64@
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> > index c415e77..f642856 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> > @@ -19,6 +19,7 @@ SRC_URI =3D
> "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> >             file://force-nostabs.patch \
> >             file://remove-arm-variant-specific.patch \
> >             file://remove-ppc-tests-failing-build.patch \
> > +           file://remove-ppc64-tests-failing-build.patch \
> >             file://add-ptest.patch \
> >             file://run-ptest \
> >            "
> > @@ -63,7 +64,7 @@ do_install_ptest() {
> >      #
> >      # The regression tests require scripts and data files that are not
> >      # copied to the build directory.  They must be copied from the
> > -    # source directory.
> > +    # source directory.
> >      saved_dir=3D$PWD
> >      for parent_dir in ${S} ${B} ; do
> >          cd $parent_dir
> > --
> > 1.9.1
> >
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

