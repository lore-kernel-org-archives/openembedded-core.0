Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.876.1589924808831612798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04JLjCuj007988
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 19 May 2020 14:45:33 -0700
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 19 May
 2020 14:45:09 -0700
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Rahul Kumar
	<rahulk@mvista.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        OE-core
	<openembedded-core@lists.openembedded.org>,
        Trevor Gamblin
	<trevor.gamblin@windriver.com>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
 <CANv91vM-SuevnLi--bKzyON3z6YuXUMHUjCc70PKa41woypmTg@mail.gmail.com>
 <9c444c01c7b64ff99ebd3b22516dc052@XBOX03.axis.com>
 <CANv91vPLcNY+58xx_ZyOOwAviyiH6vD_hPU_KmreXeUj1cikXg@mail.gmail.com>
 <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <1a0e97f9-886f-40f1-3b53-d0ac59ebc8c8@windriver.com>
Date: Tue, 19 May 2020 17:45:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com>
X-Originating-IP: [172.25.44.3]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 04JLjCuj007988
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-05-19 12:29 p.m., Peter Kjellerstedt wrote:
> The jzlib license is a three clause BSD license, and so is the=20
> go/LICENSE, so you should be able to set LICENSE as:
>=20
> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause &=
 Zlib"

Peter,

I respectfully disagree.

The only source that is _executed_ in normal use by bzip2-test is
the run-tests.sh script that is licensed as GPLv3+

The other files, although they came from source packages,
are *only* used as  test data. The source code has been completely
stripped out, hasn't it?

If, instead of compressed data,
someone were to give me an image file covered by a creative common's
license and the image had a watermark that when extracted produced
file with source code with a FOO license, would you change the
package license to include FOO? In fact, we don't even look at
image file licensing let alone at embedded watermarks.


I'm not a lawyer so this is simply my opinion on the matter.
How do we come to an agreement?
I'd be happy to add a comment in the recipe explaining our position:

# This package contains a script and test data this is derived from
# other software packages as explained in the top level README.
# Although there are COPYING files explaining the license terms
# for each sub-directory, the files in each directory are only used
# as test data so the LICENSING terms do not appear to apply to
# the recipe as we ship it and have therefore NOT been incorporated
# into the bzip2-ptests recipe licensing tags.

I can consult with some intellectual property experts that I know
about this particular case if you like.

../Randy


>=20
> You also need to add:
>=20
> LICENSE_${PN} =3D "bzip2-1.0.6"
>=20
> LICENSE_${PN}-dev =3D "bzip2-1.0.6"
>=20
> LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
>=20
> LICENSE_${PN}-doc =3D "bzip2-1.0.6"
>=20
> LICENSE_${PN}-src =3D "bzip2-1.0.6"
>=20
> LICENSE_libbz2 =3D "bzip2-1.0.6"
>=20
> so the non-ptest packages are not affected by the licenses for the ptes=
t=20
> package.
>=20
> //Peter
>=20
> *From:*Rahul Kumar <rahulk@mvista.com>
> *Sent:* den 19 maj 2020 13:58
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* Randy MacLeod <randy.macleod@windriver.com>; Alexander Kanavin=20
> <alex.kanavin@gmail.com>; Richard Purdie=20
> <richard.purdie@linuxfoundation.org>; OE-core=20
> <openembedded-core@lists.openembedded.org>; Trevor Gamblin=20
> <trevor.gamblin@windriver.com>
> *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>=20
> Hi Peter,
>=20
> I am sharing a few information related to bzip2-test source and=20
> licensing information.
> As per your suggestion and as per my understanding I added License to=20
> the bzip2 recipe file.
>=20
> bzip2-tests.git source tree structure is given below
> (here showing licence related fle, removed other file names )
>=20
> bzip2-tests.git/
> =E2=94=9C=E2=94=80=E2=94=80commons-compress
> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE.txt
> =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80dotnetzip
> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.txt
> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.zlib.txt
> |
> =E2=94=9C=E2=94=80=E2=94=80go
> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE
> =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80lbzip2
> =E2=94=9C=E2=94=80=E2=94=80pyflate
> =E2=94=9C=E2=94=80=E2=94=80README
> =E2=94=94=E2=94=80=E2=94=80 run-tests.sh
>=20
> source code link:
> https://sourceware.org/git/bzip2-tests.git
>=20
> bzip2-tests.git source contains
> 1) comman-commpress: which is Originally distributed under the Apache=20
> License Version 2.0.
>=20
> See LICENSE.txt
>=20
>=20
> 2) dotnetzip:
> (i) =C2=A0The DotNetZip Library is distributed under the MicroSoft Publ=
ic License
>  =C2=A0 =C2=A0 (Ms-PL) see the License.txt file.
> (ii) The BZ2 related resources are distributed under the licenses in=20
> License.zlib.txt.
>=20
> 3) go:
>=20
>  =C2=A0Go is distributed under a BSD-style license.
>  =C2=A0See the LICENSE file.
>=20
> 4) lbzip2:
> lbzip2 is free software: you can redistribute it and/or modify it under=
 the
> terms of the GNU General Public License as published by the Free Softwa=
re
> Foundation, either version 3 of the License, or (at your option) any la=
ter
> version
>=20
> 5) pyflate: You may use and distribute this code and documentation unde=
r any
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DFSG-compatible license (eg.=
 BSD, GNU GPLv2).
>=20
> 6) run-tests.sh: you can redistribute it and/or modify it under the=20
> terms of the GNU General Public License (GPL); either
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =
3, or (at your option) any later version.
>=20
>=20
> SO in recipe I added the License like below
> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD "
> LICENSE_${PN}-ptest =3D "GPLv3+ & Apache-2.0 & MS-PL & BSD"
> LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f1=
9b32df4664=20
> \
>                     =20
> file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c=
9479bd8986968f4327=20
> \ # For comman-commpress (Apache-2.0)
>                     =20
> file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7=
e8ff352a54f=20
> \ =C2=A0 =C2=A0 =C2=A0# For dotnetzip (Ms-PL)
>                     =20
> file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5=
db6b79e6de0a029f=20
> \ =C2=A0 # For dotnetzip =C2=A0(jzlib +zlib)
>                     =20
> file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707=
 \=20
>  =C2=A0 =C2=A0 =C2=A0# For go (BSD-style license)
>=20
> here I need few suggestion:
>=20
> 1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-ptes=
t.
>  =C2=A0 =C2=A0but not added LIC_FILES_CHKSUM for GPLv3 and BSD because=20
> bzip2-tests.git source code doesn't have GPLv3 and BSD License text fil=
e=20
> like other
>  =C2=A0 =C2=A0directories.
>=20
> 2) License.zlib.txt: This is a combination of two licence jzlib and=20
> zlib. In meta/files/common-licenses Zlib license is available but not j=
zlib.
>  =C2=A0 =C2=A0In this case how can I proceed?
>=20
> Kindly comment on this and feel free to point out if i am wrong at any=20
> place.
>=20
> *Thanks & Regards,*
>=20
> Rahul Kumar
>=20
> Software Engineer,Linux Solutions Engineering
>=20
> Group,Montavista Software LLC
>=20
> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> <https://plus.google.com/+CodeTwoSoftware>
>=20
> On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt=20
> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wrot=
e:
>=20
>     As I wrote in my previous mail, when it comes to licenses, it is th=
e
>     distribution that is important. So if you build a package
>     (bzip2-ptest) that includes code that is GPL-3.0, it does not matte=
r
>     if that code is only used as a binary blob, it is still distributed
>     in the package, and thus the package needs to be covered by the
>     GPL-3.0 license.
>=20
>     //Peter
>=20
>     *From:*openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     <openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>> *On Behalf Of
>     *Rahul Kumar
>     *Sent:* den 17 maj 2020 21:18
>     *To:* Randy MacLeod <randy.macleod@windriver.com
>     <mailto:randy.macleod@windriver.com>>
>     *Cc:* Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>; Richard Purdie
>     <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>; OE-core
>     <openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>>; Trevor Gamblin
>     <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>=
>
>     *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>=20
>     Hi Randy,
>=20
>     patch has been accepted by bzip2 community with additional changes.
>     https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df906=
1c030a25de5b6829e1abf373057309c734c0
>=20
>=20
>     So I need your suggestion with respect to Yocto.
>=20
>     Since required changes for ptest infrastructure is integrated to th=
e
>     bzip2-tests.git source code.
>     So now we can just change the SRCREV with the latest commit instead
>     of applying the patch to the bzip2-tests.git source code.
>=20
>     And since we are just integrating the bzip2-tests source to the
>     bzip2 recipe and not modifying any file so i think no need to add
>     any License for it.
>=20
>=20
>     Now patch will look like
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     @@ -46,6 +46,7 @@ runtest:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo "FAIL: sample2 decompress"; =
fi
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp sample3.tst sample3.ref; then =
echo "PASS: sample3
>     decompress";\
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo "FAIL: sample3 decompress"; =
fi
>     + =C2=A0 =C2=A0 =C2=A0 ./bzip2-tests/run-tests.sh --tests-dir=3D"$(=
PWD)/bzip2-tests"
>=20
>      =C2=A0install-ptest:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed =C2=A0-n '/^runtest:/,/^install-pt=
est:/{/^install-ptest:/!p}' \
>     @@ -56,6 +57,7 @@ install-ptest:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample1.bz2 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(DESTDIR)/
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample2.bz2 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(DESTDIR)/
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample3.bz2 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(DESTDIR)/
>     + =C2=A0 =C2=A0 =C2=A0 cp -rf $(srcdir)/../git =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 $(DESTDIR)/bzip2-tests
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s $(bindir)/bzip2 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $(DESTDIR)/bzip2
>=20
>      =C2=A0install-exec-hook:
>     diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb> b/meta/recipes-extended/bzip2/bzip2_1.0.8.b=
b
>     <http://bzip2_1.0.8.bb>
>     index d58f553..c5aa690 100644
>     --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0.=
8.bb>
>     +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0.=
8.bb>
>     @@ -8,13 +8,17 @@ LICENSE =3D "bzip2-1.0.6"
>      =C2=A0LIC_FILES_CHKSUM =3D
>     "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e=
32f19b32df4664"
>=20
>      =C2=A0SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.=
tar.gz
>     <https://sourceware.org/pub/$%7bBPN%7d/$%7bBPN%7d-$%7bPV%7d.tar.gz>=
 \
>     +         =20
>     git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests
>     <http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests> \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.ac <htt=
p://configure.ac>;subdir=3D${BP} \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am;subdi=
r=3D${BP} \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     +
>      =C2=A0SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
>      =C2=A0SRC_URI[sha256sum] =3D
>     "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>=20
>     +SRCREV_bzip2-tests =3D "f9061c030a25de5b6829e1abf373057309c734c0" =
*<<
>     this commit Id includes latest charges for ptest infrastruct.*
>     +
>      =C2=A0UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2=
/"
>=20
>      =C2=A0PACKAGES =3D+ "libbz2"
>     @@ -39,7 +43,7 @@ do_install_ptest () {
>=20
>      =C2=A0FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
>=20
>     -RDEPENDS_${PN}-ptest +=3D "make"
>     +RDEPENDS_${PN}-ptest +=3D "make bash"
>=20
>      =C2=A0PROVIDES_append_class-native =3D " bzip2-replacement-native"
>      =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>     Kindly comment on it and feel free to point out, if i am wrong at
>     any place.
>=20
>     *Thanks & Regards,*
>=20
>     Rahul Kumar
>=20
>     Software Engineer,Linux Solutions Engineering
>=20
>     Group,Montavista Software LLC
>=20
>     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
>     <https://plus.google.com/+CodeTwoSoftware>
>=20
>     On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
>     <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>>
>     wrote:
>=20
>         On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
>          > You need to first see from the failure page which
>         configuration is
>          > failing, for example non-gpl3 is one such.
>          >
>          > Then you find that configuration in config.json. The below
>         should
>          > hopefully be self-explanatory in how you should set up the b=
uild?
>          >
>          > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"],
>         "MACHINE" :
>          > "qemux86", "BBTARGETS" : "core-image-minimal
>         core-image-full-cmdline",
>          > "extravars" : [ "INCOMPATIBLE_LICENSE =3D '*GPLv3'",
>         "WARN_QA_remove =3D
>          > 'incompatible-license'" ], "EXTRACMDS" : [
>          > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
>          >
>          > |
>          >
>          > |
>          > |
>          >
>          > |Alex
>=20
>         Hi Rahul,
>=20
>         Sorry for my late reply.
>=20
>         The commit log for v2 is very good now!
>         Thanks for incorporating my --pedantic suggestions. ;-)
>=20
>         It seems that you need a perl dependency for something (docs?
>          =C2=A0 =C2=A0 $ cd .../bzip2.git
>          =C2=A0 =C2=A0 $ grep -r "perl " *
>          =C2=A0 =C2=A0 format.pl:#!/usr/bin/perl -w
>          =C2=A0 =C2=A0 README.XML.STUFF:It uses format.pl <http://forma=
t.pl>, a
>         perl script...
>=20
>         Then we need to figure out how to deal with the GPLv3 issue.
>=20
>         The buildbot output can be tedious to figure out. I haven't rea=
lly
>         spent enough time plugging away at it to be proficient yet eith=
er.
>         Have you been able to reproduce the problems that Richard repor=
ted?
>         If not, and you've tried for a bit, then just say so and I'll t=
ry to
>         help tomorrow or early next week.
>=20
>         It looks like you are packaging the test code/data with the mai=
n
>         package
>         not in bzip2-ptest. Have a look at:
>          =C2=A0 =C2=A0 meta/recipes-support/libpcre/libpcre_8.44.bb
>         <http://libpcre_8.44.bb>
>         for an example. There are many more.
>         Also, if you look at oe-core.git:
>          =C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN
>         you can see many examples of sub-packages with different licens=
es
>         than the main package. One example is:
>          =C2=A0 =C2=A0 meta/recipes-support/gnutls/gnutls_3.6.13.bb
>         <http://gnutls_3.6.13.bb>
>         I hope that can address the buildbot problem but I haven't trie=
d it
>         myself yet.
>=20
>         BTW, Trevor has gotten the YP autobuilder going at Wind River a=
nd
>         he'll be sending a few documentation updates next week or so.
>         That may help in case you want to reproduce the YP AB test
>         infrastructure. I expect that you don't _have_ to do so but
>         I think it would be good if more contributing organizations did
>         have an instance with only limited builders of the YP AB so tha=
t
>         we can do more testing before Richard runs our changes through
>         the main system. Richard has cautioned that the YP AB has lots =
of
>         builders each of which has many cores but I hope that we can at
>         least
>         do some AB checking ourselves.
>=20
>         ../Randy
>=20
>=20
>          > |
>          >
>          >
>          > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com
>         <mailto:rahulk@mvista.com>
>          > <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>> wrote=
:
>          >
>          >=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,
>          >
>          >=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use=
 the below file.
>          >
>         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-hel=
per/tree/config.json
>          >
>          >=C2=A0 =C2=A0 =C2=A0did you mean to say that i have to set MA=
CRO in
>         local.conf based on
>          >=C2=A0 =C2=A0 =C2=A0this file.
>          >
>          >=C2=A0 =C2=A0 =C2=A0*Thanks & Regards,*
>          >=C2=A0 =C2=A0 =C2=A0Rahul Kumar
>          >=C2=A0 =C2=A0 =C2=A0Software Engineer,Linux Solutions Enginee=
ring
>          >=C2=A0 =C2=A0 =C2=A0Group,Montavista Software LLC
>          >=C2=A0 =C2=A0 =C2=A0Email Id: rahulk@mvista.com <mailto:rahul=
k@mvista.com>
>         <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>
>          >=C2=A0 =C2=A0 =C2=A0<https://plus.google.com/+CodeTwoSoftware=
>
>          >
>          >
>          >=C2=A0 =C2=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard =
Purdie
>          >=C2=A0 =C2=A0 =C2=A0<richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>          >=C2=A0 =C2=A0 =C2=A0<mailto:richard.purdie@linuxfoundation.or=
g
>         <mailto:richard.purdie@linuxfoundation.org>>> wrote:
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30=
 +0200, Alexander Kanavin
>         wrote:
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > You need to look at conf=
igurations defined here:
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 >
>          >
>         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-hel=
per/tree/config.json
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > and replicate them local=
ly. Then you can reproduce the
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failures that
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 > the AB gets in those con=
figurations.
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing l=
ogs on the autobuilder
>         also list out the
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration options for t=
hat build.
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,
>          >
>          >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard
>          >
>          >
>          >
>          >
>=20
>=20
>         --=20
>         # Randy MacLeod
>         # Wind River Linux
>=20


--=20
# Randy MacLeod
# Wind River Linux
