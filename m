Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4425DC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:22:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.12479.1636467729875469671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=CH3Q3/De;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 44450835AE;
	Tue,  9 Nov 2021 15:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636467726;
	bh=/RLoG6xWkIUzNro/mOWRKREGbu+s0PbHIhNHcO9a+M0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CH3Q3/DeJf/2jCGb+Gy63prTOY2RPz0K+WhC14GAipItPq0c5V3M5zqva2sYQ43H8
	 NZonzWmFt6OupepWdy0hEAVUH2PcF/uF61YB4G2X8PU+edVXvoYAPnJ2ZaefO7hPS8
	 yT/hzE/B8RUoVj7dvRYz8jFfp9iG7h4/vGWjBYGDcNCzV/aExaiIlKZsXzJVfchqk1
	 ja9w5Gi/GV21HpxAelDQ3NVzkYUFcwipoh/M5IVcOip1GXI3Y9IYmNohufjqUtQ6Fi
	 kb37CdqdmPro2K8arjGyANy4TnNgKx1vxS7CT/QzmThVreErPvlNZPSZQ6hYbGZ9/i
	 Wsub6YkVMXL7w==
Date: Tue, 9 Nov 2021 15:21:59 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "Lee Chee Yang" <chee.yang.lee@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Nathan Rossi
 <nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, "Patches and discussions about the oe-core
 layer" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
Message-ID: <20211109152159.09f15b7c@ktm>
In-Reply-To: 
 <DM6PR11MB41050BCAF7D1ABF5EA7E01F5B9929@DM6PR11MB4105.namprd11.prod.outlook.com>
References: <20211028120020.23276-1-lukma@denx.de>
	<YXxvkWzBlNaHkybQ@piout.net>
	<20211108173107.277af6a0@ktm>
	<DM6PR11MB41050BCAF7D1ABF5EA7E01F5B9929@DM6PR11MB4105.namprd11.prod.outlook.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/oU2nQIUPAMTkddvZXq7x7Aa"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:22:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158019

--Sig_/oU2nQIUPAMTkddvZXq7x7Aa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee Chee,

> Hi,=20
>=20
> I think need to fix this too=20
>=20

Thanks for pointing out those issues.

> AssertionError:
> The following recipes do not have a maintainer assigned to them.
> Please add an entry to meta/conf/distro/include/maintainers.inc file.
> glibc-tests
> (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/=
glibc/glibc-tests_2.34.bb)
>=20
> full log:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2807/st=
eps/15/logs/stdio
>=20
>=20
> also for issue with=20
> "Missing or unbuildable dependency chain was:
> ['nativesdk-ptest-runner']" you may refer to these build for build
> config
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/4598/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/3629/st=
eps/12/logs/stdio
>=20
>=20

I will fix them and prepare v4.

>=20
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded- =20
> >core@lists.openembedded.org> On Behalf Of ?ukasz Majewski =20
> >Sent: Tuesday, 9 November, 2021 12:31 AM
> >To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Nathan Rossi
> ><nathan@nathanrossi.com>; Khem Raj <raj.khem@gmail.com>; Adhemerval
> >Zanella <adhemerval.zanella@linaro.org>; Patches and discussions
> >about the oe- core layer <openembedded-core@lists.openembedded.org>
> >Subject: Re: [OE-core] [PATCH v3] glibc: ptest: Add running glibc
> >time related test suite (Y2038) with ptest
> >
> >Hi Alexandre.
> >
> >Sorry for the late reply - I've must overlooked this reply...
> > =20
> >> Hello,
> >>
> >> There is a remaining issue:
> >>
> >> WARNING: Nothing RPROVIDES 'nativesdk-ptest-runner' (but
> >> virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/m
> >> eta/recipes-core/glibc/glibc-tests_2.34.bb
> >> RDEPENDS on or otherwise requires it) NOTE: Runtime target
> >> 'nativesdk-ptest-runner' is unbuildable, removing... Missing or
> >> unbuildable dependency chain was: ['nativesdk-ptest-runner'] =20
> >
> >Could you share your setup?
> >
> >I've been trying to reproduce this problem with:
> >MACHINE=3Dqemuarm64 bitbake core-image-ptest-all -c populate_sdk
> >
> >but no warnings were observed.
> >
> >Thanks in advance.
> > =20
> >>
> >> On 28/10/2021 14:00:20+0200, ?ukasz Majewski wrote: =20
> >> > This patch introduces new recipe - namely 'glibc-tests', which
> >> > builds and installs time related (to check if Y2038 support
> >> > works) glibc test suite to OE/Yocto built image.
> >> >
> >> > It reuses code from already available 'glibc-testsuite' recipe,
> >> > which is run with 'bitbake glibc-testsuite -c check' and uses
> >> > qemu to execute remotely (via SSH) tests on some emulated
> >> > machine.
> >> >
> >> > This recipe installs time related glibc tests on some rootfs
> >> > image. Afterwards, those tests can be executed on the real
> >> > hardware, to facilitate validation of it with Y2038 problem
> >> > compliance.
> >> >
> >> > To test time related subset - one needs to call:
> >> > ptest-runner glibc-tests
> >> > then change the date after Y2038 threshold for 32 bit systems:
> >> > date -s "20 JAN 2038 18:00:00"
> >> > and then run ptest-runner again.
> >> >
> >> > To facilitate debugging, source files are provided by default
> >> > with the unstripped debugging symbols. Such approach would
> >> > reduce the already complex recipe (as it inherits base glibc
> >> > one), so there is no need to also install *-dbg and *-src
> >> > packages.
> >> >
> >> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >> >
> >> > ---
> >> > Changes for v3:
> >> > - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
> >> >   RPROVIDES variables
> >> >
> >> > Changes for v2:
> >> > - Just focus on time related set of tests as those can be run as
> >> >   standalone
> >> > - Reuse of already built tests (from glibc-tests.inc) and depoloy
> >> >   them on the HW target.
> >> > - Provide single 'run-ptest' script.
> >> > - Update the recipe to run with newest poky's -master
> >> > ---
> >> >  .../distro/include/ptest-packagelists.inc     |   1 +
> >> >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 112
> >> > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest
> >> > | 37 ++++++ 3 files changed, 150 insertions(+)  create mode
> >> > 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> >> >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> >> >
> >> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> >> > b/meta/conf/distro/include/ptest-packagelists.inc index
> >> > 2e324f8da4..fd52fa72a4 100644 ---
> >> > a/meta/conf/distro/include/ptest-packagelists.inc +++
> >> > b/meta/conf/distro/include/ptest-packagelists.inc @@ -61,6 +61,7
> >> > @@ PTESTS_FAST =3D "\ slang-ptest \
> >> >      wayland-ptest \
> >> >      zlib-ptest \
> >> > +    glibc-tests-ptest \
> >> >  "
> >> >  PTESTS_FAST:remove:mips64 =3D "qemu-ptest"
> >> >  PTESTS_PROBLEMS:append:mips64 =3D "qemu-ptest"
> >> > diff --git a/meta/recipes-core/glibc/glibc-tests_2.34.bb
> >> > b/meta/recipes-core/glibc/glibc-tests_2.34.bb new file mode
> >> > 100644 index 0000000000..0a6920eef4
> >> > --- /dev/null
> >> > +++ b/meta/recipes-core/glibc/glibc-tests_2.34.bb
> >> > @@ -0,0 +1,112 @@
> >> > +require glibc_${PV}.bb
> >> > +require glibc-tests.inc
> >> > +
> >> > +inherit ptest
> >> > +
> >> > +SRC_URI:append =3D " \
> >> > +	file://run-ptest \
> >> > +"
> >> > +
> >> > +SUMMARY =3D "glibc tests to be run with ptest"
> >> > +
> >> > +# Erase some variables already set by glibc_${PV} python
> >> > +__anonymous() {
> >> > +       # Remove packages provided by glibc build, we only need a
> >> > subset of them
> >> > +       d.setVar("PACKAGES", "${PN} ${PN}-ptest")
> >> > +
> >> > +       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
> >> > +       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
> >> > +
> >> > +       d.setVar("RRECOMMENDS", "")
> >> > +}
> >> > +
> >> > +# Remove any lefovers from original glibc recipe
> >> > RPROVIDES:${PN} =3D +"${PN}"
> >> > +RRECOMMENDS:${PN} =3D ""
> >> > +RDEPENDS:${PN} =3D " glibc sed"
> >> > +DEPENDS:append =3D " sed"
> >> > +
> >> > +# Just build tests for target - do not run them do_check:append
> >> > () +{
> >> > +	oe_runmake -i check run-built-tests=3Dno } addtask
> >> > do_check after +do_compile before do_install_ptest_base
> >> > +
> >> > +glibc_strip_build_directory () {
> >> > +	# Delete all non executable files from build directory
> >> > +	find ${B} ! -executable -type f -delete
> >> > +
> >> > +	# Remove build dynamic libraries and links to them as
> >> > +	# those are already installed in the target device
> >> > +	find ${B} -type f -name "*.so" -delete
> >> > +	find ${B} -type l -name "*.so*" -delete
> >> > +
> >> > +	# Remove headers (installed with glibc)
> >> > +	find ${B} -type f -name "*.h" -delete
> >> > +
> >> > +	find ${B} -type f -name "isomac" -delete
> >> > +	find ${B} -type f -name "annexc" -delete }
> >> > +
> >> > +do_install_ptest_base () {
> >> > +	glibc_strip_build_directory
> >> > +
> >> > +	ls -r ${B}/*/*-time64 > ${B}/tst_time64
> >> > +
> >> > +	# Remove '-time64' suffix - those tests are also time
> >> > related
> >> > +	sed -e "s/-time64$//" ${B}/tst_time64 >
> >> > ${B}/tst_time_tmp
> >> > +	tst_time=3D$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> >> > +
> >> > +	rm ${B}/tst_time_tmp ${B}/tst_time64
> >> > +	echo "${tst_time}"
> >> > +
> >> > +	# Install build test programs to the image
> >> > +	install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> >> > +
> >> > +	for f in "${tst_time}"
> >> > +	do
> >> > +	    cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> >> > +	done
> >> > +
> >> > +	install -d ${D}${PTEST_PATH}
> >> > +	cp ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
> >> > +
> >> > +}
> >> > +
> >> > +# The datadir directory is required to allow core (and reused) #
> >> > +glibc cleanup function to finish correctly, as this directory #
> >> > is +not created for ptests stash_locale_package_cleanup:prepend
> >> > () {
> >> > +	mkdir -p ${PKGD}${datadir}
> >> > +}
> >> > +
> >> > +stash_locale_sysroot_cleanup:prepend () {
> >> > +	mkdir -p ${SYSROOT_DESTDIR}${datadir} }
> >> > +
> >> > +# Prevent the do_package() task to set 'libc6' prefix # for
> >> > glibc +tests related packages python populate_packages:prepend
> >> > () {
> >> > +    if d.getVar('DEBIAN_NAMES'):
> >> > +        d.setVar('DEBIAN_NAMES', '') }
> >> > +
> >> > +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
> >> > +
> >> > +EXCLUDE_FROM_SHLIBS =3D "1"
> >> > +
> >> > +# Install debug data in .debug and sources in /usr/src/debug #
> >> > It +is more handy to have _all_ the sources and symbols in one #
> >> > place +(package) as this recipe will be used for validation and #
> >> > +debugging.
> >> > +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug"
> >> > +
> >> > +# glibc test cases violate by default some Yocto/OE checks
> >> > (staticdev, +# textrel)
> >> > +# 'debug-files' - add everything (including debug) into one
> >> > package +#                 (no need to install/build *-src
> >> > package) +INSANE_SKIP:${PN} +=3D "staticdev textrel debug-files
> >> > rpaths" +
> >> > +deltask do_stash_locale
> >> > +do_install[noexec] =3D "1"
> >> > +do_populate_sysroot[noexec] =3D "1"
> >> > diff --git a/meta/recipes-core/glibc/glibc/run-ptest
> >> > b/meta/recipes-core/glibc/glibc/run-ptest new file mode 100755
> >> > index 0000000000..f637986105
> >> > --- /dev/null
> >> > +++ b/meta/recipes-core/glibc/glibc/run-ptest
> >> > @@ -0,0 +1,37 @@
> >> > +#!/bin/sh
> >> > +# ptest script for glibc - to run time related tests to #
> >> > +facilitate Y2038 validation # Run with 'ptest-runner
> >> > glibc-tests' +
> >> > +output() {
> >> > +  retcode=3D$?
> >> > +  if [ $retcode -eq 0 ]
> >> > +    then echo "PASS: $i"
> >> > +  elif [ $retcode -eq 77 ]
> >> > +    then echo "SKIP: $i"
> >> > +  else echo "FAIL: $i"
> >> > +  fi
> >> > +}
> >> > +
> >> > +# Allow altering time on the target export
> >> > +GLIBC_TEST_ALLOW_TIME_SETTING=3D"1"
> >> > +
> >> > +tst_time64=3D$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
> >> > +
> >> > +# Remove '-time64' suffix - those tests are also time # related
> >> > +tst_time_tmp=3D$(sed -e "s/-time64$//" <<< ${tst_time64})
> >> > +
> >> > +# Run tests supporting only 32 bit time for i in
> >> > ${tst_time_tmp} do
> >> > +	$i >/dev/null 2>&1
> >> > +	output
> >> > +done
> >> > +
> >> > +# Run tests supporting only 64 bit time for i in ${tst_time64}
> >> > do
> >> > +	$i >/dev/null 2>&1
> >> > +	output
> >> > +done
> >> > --
> >> > 2.20.1
> >> > =20
> >> =20
> >> >
> >> > =20
> >>
> >> =20
> >
> >
> >
> >
> >Best regards,
> >
> >Lukasz Majewski
> >
> >--
> >
> >DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> >HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> >Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> >lukma@denx.de =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/oU2nQIUPAMTkddvZXq7x7Aa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmGKhAcACgkQAR8vZIA0
zr0LGAf+Jgvl8faxwa+/dGge+pJrymNJaiVhSHxJv6selermdHdo58UfVJ+/I/pM
AGa43YFM75wG3bS39b4ipdDNgezW0gZ3DiXcLO8NTMYyPxWwA/aflutct/3s41D7
CnmP/hZeuxj14xW9A9tiMlAJAxUZPhb91V4zQqYnPflLeQdAsn03JnIJbyGh1x9r
XHJF8QmP2xA7wnjEjCYcMJbm4bNzdrS0InBatrOOdA6WzfqqlqJdcHS/qwbDu2br
Mee2tODDsBDClbrma6TsP51vGFC4TB76vjxWhutVCYPkr+KaFj5oQPQ1vDkD4FI6
/QwkDRpRYb0KF9fqGFTlOWfY7iOCtg==
=5E3D
-----END PGP SIGNATURE-----

--Sig_/oU2nQIUPAMTkddvZXq7x7Aa--

