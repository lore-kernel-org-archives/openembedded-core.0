Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A6B3571A0C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 17:38:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u4so10367419wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:mime-version:subject:message-id:date:cc:to;
	bh=bL8Q98OXX9eYEv86h9HCgJyoYj0kSX+OuZ6ijKhAze0=;
	b=XSg2oGHNtRWMDBqaQGUSNa1ldxNvaSq81XYJipZO8plGUy8CVS57qXMZ0iXLG9wsiO
	/f1VoHLcxGkZNee/tX8bGvnMrmuJ8tF5MGc2MdlzaM8P6XLm7diBXIM1pgyzXt959YRp
	sIvIatOHq4c/IxQxl5cWihh9dqWowiCL1VoHp0azTl8urcGej0pHmQa118Ym6E41WvBP
	6mNvEV23WfuFTYzChwnZqCNafdE5R2zsvxrSrVzhpSzDXDZLfwKtQh3ro33o0JLj8H7k
	AF1aUn6ajFH7LtVxWC7++WSDwvwhFj1CHiOWzDUV/SbkB15n1BSHSictwsTJC8A/oDvn
	BY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:mime-version:subject:message-id:date
	:cc:to;
	bh=bL8Q98OXX9eYEv86h9HCgJyoYj0kSX+OuZ6ijKhAze0=;
	b=qVPX1+B6IrSpA6jiKOJZNRvPrfaPSwKFpKnH+mASQWAnKbIv7BZNM4UpR7Ie4piUDd
	XBugehFI0uIMdiKbRDqxcEMKJFl9xbssWGe+Sj9K6eVuEW+6REZ+wVJyA/8fuMOVeCiu
	XDG+CeGZ2GiuA+Nxd2fbTIPcxvybI14n5nmpQBb4taU+H6pg9qDZ6eemghoOTJr61Pl4
	oz3aeOnSddyrHMvvCVNaxSS9bFI9OeLZcyb9icbC0dZktfo/x9+lXG/OCoPCq4y4Z38/
	7qfZ6YdDRdxy1fR7/ijeEJpGlBWwVVBuaunMTF0taSPx/w7Mogdmpo7JpRtn3K8JPDip
	TadA==
X-Gm-Message-State: AJcUukep+bBVyiDA+CVEkKd9lrfq4lA1MlFpdJesCAW3To0FH0uHoFSF
	jVRzgPynL5AtfL/ufOx03gHgLksF
X-Google-Smtp-Source: ALg8bN7v69onqL9mcYNj65HDQ8Rss1HErRrm8OejN1l9Yfzsz9/KTxcZNdmefABGV3ZrLN9+ZDsMAQ==
X-Received: by 2002:adf:83e7:: with SMTP id 94mr43678239wre.278.1549129122942; 
	Sat, 02 Feb 2019 09:38:42 -0800 (PST)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	c14sm5229475wme.13.2019.02.02.09.38.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 09:38:41 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Message-Id: <0912A04B-78C4-4788-B6A0-FDE2E061F0B9@netbsd.org>
Date: Sat, 2 Feb 2019 18:38:40 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3445.102.3)
Subject: do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by both perl-native and extutils-makemaker-perl-native, aborting
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
X-List-Received-Date: Sat, 02 Feb 2019 17:38:43 -0000
X-Groupsio-MsgNum: 120800
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C26FDD1B-7E0F-4815-9854-E562BB0D7E2D";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C26FDD1B-7E0F-4815-9854-E562BB0D7E2D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I'm trying to get some recipes building after perl-update, but I'm =
struggeling for:

ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by =
both perl-native and extutils-makemaker-perl-native, aborting
ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: Function failed: extend_recipe_sysroot
ERROR: Logfile of failure stored in: =
/home/sno/gpw-community-bsp/gpw-yocto-platform/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/plack-middleware-fixmissingbodyinredirect-perl/0.12-r0/te=
mp/log.do_prepare_recipe_sysroot.23078

Logfile contains:
DEBUG: Executing python function do_prepare_recipe_sysroot
DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are =
['virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-dev=
tools/qemu/qemu_3.1.0.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/perl-sanit=
y/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-cr=
oss_8.2.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-deve=
l/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb:do_populate_sysr=
oot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-ru=
ntime_8.2.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-core/glibc/glibc_2.=
29.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devt=
ools/perl-sanity/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/qemu/qemu-=
helper-native_1.0.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-www/=
http-message-perl/http-message-perl_6.18.bb:do_populate_sysroot']
ERROR: The file /usr/bin/instmodsh is installed by both perl-native and =
extutils-makemaker-perl-native, aborting
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Python function do_prepare_recipe_sysroot finished
ERROR: Function failed: extend_recipe_sysroot

Typically such an issue is fixed by:

poky:

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb =
b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 71653feb53..f66f96919e 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -168,6 +168,39 @@ perl_package_preprocess () {
             ${PKGD}${libdir}/perl5/config.sh
 }

+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY =3D "100"
+
+ALTERNATIVE_${PN} =3D "corelist cpan enc2xs encguess h2ph h2xs =
instmodsh json_pp libnetcfg \
+                     piconv pl2pm pod2html pod2man pod2text pod2usage =
podchecker podselect \
+                     prove ptar ptardiff ptargrep shasum splain xsubpp =
zipdetails"
+ALTERNATIVE_LINK_NAME[corelist] =3D "${bindir}/corelist"
+ALTERNATIVE_LINK_NAME[cpan] =3D "${bindir}/cpan"
+ALTERNATIVE_LINK_NAME[enc2xs] =3D "${bindir}/enc2xs"
+ALTERNATIVE_LINK_NAME[encguess] =3D "${bindir}/encguess"
+ALTERNATIVE_LINK_NAME[h2ph] =3D "${bindir}/h2ph"
+ALTERNATIVE_LINK_NAME[h2xs] =3D "${bindir}/h2xs"
+ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
+ALTERNATIVE_LINK_NAME[json_pp] =3D "${bindir}/json_pp"
+ALTERNATIVE_LINK_NAME[libnetcfg] =3D "${bindir}/libnetcfg"
+ALTERNATIVE_LINK_NAME[piconv] =3D "${bindir}/piconv"
+ALTERNATIVE_LINK_NAME[pl2pm] =3D "${bindir}/pl2pm"
+ALTERNATIVE_LINK_NAME[pod2html] =3D "${bindir}/pod2html"
+ALTERNATIVE_LINK_NAME[pod2man] =3D "${bindir}/pod2man"
+ALTERNATIVE_LINK_NAME[pod2text] =3D "${bindir}/pod2text"
+ALTERNATIVE_LINK_NAME[pod2usage] =3D "${bindir}/pod2usage"
+ALTERNATIVE_LINK_NAME[podchecker] =3D "${bindir}/podchecker"
+ALTERNATIVE_LINK_NAME[podselect] =3D "${bindir}/podselect"
+ALTERNATIVE_LINK_NAME[prove] =3D "${bindir}/prove"
+ALTERNATIVE_LINK_NAME[ptar] =3D "${bindir}/ptar"
+ALTERNATIVE_LINK_NAME[ptardiff] =3D "${bindir}/ptardiff"
+ALTERNATIVE_LINK_NAME[ptargrep] =3D "${bindir}/ptargrep"
+ALTERNATIVE_LINK_NAME[shasum] =3D "${bindir}/shasum"
+ALTERNATIVE_LINK_NAME[splain] =3D "${bindir}/splain"
+ALTERNATIVE_LINK_NAME[xsubpp] =3D "${bindir}/xsubpp"
+ALTERNATIVE_LINK_NAME[zipdetails] =3D "${bindir}/zipdetails"
+
 require perl-ptest.inc

 FILES_${PN} =3D "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} =
${libdir}/libperl.so* \

meta-cpan:

diff --git =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
index a9d21b1..7a958ed 100644
--- =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
+++ =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
@@ -41,4 +41,11 @@ do_install_prepend_class-native() {
        export PERL5LIB=3D"${PERL_ARCHLIB}"
 }

+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY =3D "90"
+
+ALTERNATIVE_${PN} =3D "instmodsh"
+ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
+
 BBCLASSEXTEND =3D "native"

But unfortunately it doesn't show any effect.

Any ideas?

Best regards
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_C26FDD1B-7E0F-4815-9854-E562BB0D7E2D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlxV1aAACgkQRJmWrtzl
Cp3JQQ//QRjBykSIr4nqa2vl2jo+2zT/m+Ja12iu4scmaLkJe/cWPZEJFRFtfxhU
SvblaCLnLPcO3Abbmh3bSuvs8nbaR0QSxhnvwlFva4v8swSMkq9vAmDnK5a3BkJB
dh/yYD9rPD1eNcAs4iHINdz6tuFweN0Bmg+7oE1gT/Tam7jTns/LQPE03j3Smnit
px7UTzmwnaf9Y+a8FrkkdGd1jo9Sm+4X9OtRTsaAXFGxtf1v3GVQlqwhjHUB2F2t
YyERn2SdcfEJJs7ODC0jTOIymDEKdjJzonKQUsajvDIS+sDlD9eY7XNZAHHhNuAF
NY2Jz0Bm2RpOYswLz/UH/rAVLaoN34wpWrLvLu2VgSMSUjLVe4o43dBOCxr5MMU0
6fzInF8QTpy4DOWZvvlzgC3EM5W/VRHos2FiCcmEp6mT4Sosm1gRSq3s2Wxj9Zoz
OoU5Rew5sU8GXwNR9RdDyppKHj3DVqqvw/XqVS1JUZLPHPm9V59RnPjma2KCs1it
dxQpRK7jqEJFpxGvyMcnGmPLuT8/yFUF7k9SsQFOhUSWkm9ibp4v4eoOUwJm4/o8
qLE+3e0M7lP5TWgq0UrhOwaIOGlH/lH4/HfpwcW22OoiOD7qSO6I8GG3LAFR958g
3SYetuXYjXcF7IlV1XuDL6PyA8yrQifqXBHtjoR2vV0zwDIiru0=
=Q75i
-----END PGP SIGNATURE-----

--Apple-Mail=_C26FDD1B-7E0F-4815-9854-E562BB0D7E2D--
