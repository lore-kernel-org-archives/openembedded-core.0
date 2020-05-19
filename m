Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.1296.1589926274439379641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 15:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E0u+OfU5;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id f89so431368qva.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 15:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=36T3LLQctASIQi0XJI5vohFTv5neksIlgOVbGYOJypg=;
        b=E0u+OfU5XVO//rNA4XZDpxS2OnplWdg/zAeKaT1PI1vqklZ8L8R26otU66Ny0qYp9H
         wXn0eK7yLwD6Z2CMln8QsenNkRblY0M+ST8mmcsvtWoPW2av5l5L7H3aForg0TqU4+KF
         38pzosReBzido41PLRyGAx1+pMye79nbfFMjRoHHAsVFC70kOKCwcWxMLZq+sif2VubQ
         vlJspMH4gWN4hyrOLFL9EzMPbKstJ5MLDJQHHzNTmuHabi3D5QHSgYHCbfl/CewVONg/
         CXs2Hi3pljcksAETTKitm6H+J9KM7PD+bmPO2Bcqg3XkHdUNeRBGQg2BJ/U0nrKotHQT
         ycgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=36T3LLQctASIQi0XJI5vohFTv5neksIlgOVbGYOJypg=;
        b=sxCGviDP0cNwkno+Il/egaVBe9Nh5NT//h77zEtVD3bNDzPYraQ/F5/8LCHKNRQPWv
         cRYZwpqSThR0TIfm2cvY65qBgsEa+dy9oChTxAFK8eRfYOndttUKlElcmlY/zmGXUPxj
         ZQicPfsFngRYvkeL5o/pjGCgon+5u6zWm+XQO1rvmn+OOtQpe2ubVgZ4hL7FIN/XAV/O
         APhsHJABNoYvu38Gi/ReZpnR6QhHkW6ocqk8ya2/tsJCLRV4K5Z3baidV1xQ7RChF60h
         ddfidrWn0fSS/3LZE86E5afyqxR8mMRxK6LV5qpKxvbUfCzXmJWAsjWpb+UrGCY1tHJN
         iyLA==
X-Gm-Message-State: AOAM532HZH8zDeOqday01mQUc64NBKq1LR4wF9it9oC36hYq/YfbbLPx
	garkrLv1BicBsCeCn+H3MsG3i7IkFPmBDW1IeO0=
X-Google-Smtp-Source: ABdhPJyTZdj/UbVkrDmSSlLuMPthpREauTrSPYnLTLZCNf7OdzXWljdw7DA4+mItIrmyqm6Pfl1HRMWHoQwKllJ1dyU=
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr1945089qvw.146.1589926273210;
 Tue, 19 May 2020 15:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com> <CANv91vM-SuevnLi--bKzyON3z6YuXUMHUjCc70PKa41woypmTg@mail.gmail.com>
 <9c444c01c7b64ff99ebd3b22516dc052@XBOX03.axis.com> <CANv91vPLcNY+58xx_ZyOOwAviyiH6vD_hPU_KmreXeUj1cikXg@mail.gmail.com>
 <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com> <1a0e97f9-886f-40f1-3b53-d0ac59ebc8c8@windriver.com>
In-Reply-To: <1a0e97f9-886f-40f1-3b53-d0ac59ebc8c8@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 15:10:46 -0700
Message-ID: <CAMKF1sraJ1my83ZJE_U98wqoCtNtufmCjty=1RJMvTe8y58NFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Rahul Kumar <rahulk@mvista.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 2:46 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2020-05-19 12:29 p.m., Peter Kjellerstedt wrote:
> > The jzlib license is a three clause BSD license, and so is the
> > go/LICENSE, so you should be able to set LICENSE as:
> >
> > LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause =
& Zlib"
>
> Peter,
>
> I respectfully disagree.
>
> The only source that is _executed_ in normal use by bzip2-test is
> the run-tests.sh script that is licensed as GPLv3+
>
> The other files, although they came from source packages,
> are *only* used as  test data. The source code has been completely
> stripped out, hasn't it?
>
> If, instead of compressed data,
> someone were to give me an image file covered by a creative common's
> license and the image had a watermark that when extracted produced
> file with source code with a FOO license, would you change the
> package license to include FOO? In fact, we don't even look at
> image file licensing let alone at embedded watermarks.
>
>
> I'm not a lawyer so this is simply my opinion on the matter.
> How do we come to an agreement?
> I'd be happy to add a comment in the recipe explaining our position:
>
> # This package contains a script and test data this is derived from
> # other software packages as explained in the top level README.
> # Although there are COPYING files explaining the license terms
> # for each sub-directory, the files in each directory are only used
> # as test data so the LICENSING terms do not appear to apply to
> # the recipe as we ship it and have therefore NOT been incorporated
> # into the bzip2-ptests recipe licensing tags.

a simple question is, are you distributing this shell script or not.
If you are then you will fall under
the all of the license obligations of the governing license for
distributing it.

As far as image license it concerned, then we generate a separate
license manifest for images
which comprise of package licenses that form the image.

>
> I can consult with some intellectual property experts that I know
> about this particular case if you like.
>
> ../Randy
>
>
> >
> > You also need to add:
> >
> > LICENSE_${PN} =3D "bzip2-1.0.6"
> >
> > LICENSE_${PN}-dev =3D "bzip2-1.0.6"
> >
> > LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
> >
> > LICENSE_${PN}-doc =3D "bzip2-1.0.6"
> >
> > LICENSE_${PN}-src =3D "bzip2-1.0.6"
> >
> > LICENSE_libbz2 =3D "bzip2-1.0.6"
> >
> > so the non-ptest packages are not affected by the licenses for the pte=
st
> > package.
> >
> > //Peter
> >
> > *From:*Rahul Kumar <rahulk@mvista.com>
> > *Sent:* den 19 maj 2020 13:58
> > *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > *Cc:* Randy MacLeod <randy.macleod@windriver.com>; Alexander Kanavin
> > <alex.kanavin@gmail.com>; Richard Purdie
> > <richard.purdie@linuxfoundation.org>; OE-core
> > <openembedded-core@lists.openembedded.org>; Trevor Gamblin
> > <trevor.gamblin@windriver.com>
> > *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
> >
> > Hi Peter,
> >
> > I am sharing a few information related to bzip2-test source and
> > licensing information.
> > As per your suggestion and as per my understanding I added License to
> > the bzip2 recipe file.
> >
> > bzip2-tests.git source tree structure is given below
> > (here showing licence related fle, removed other file names )
> >
> > bzip2-tests.git/
> > =E2=94=9C=E2=94=80=E2=94=80commons-compress
> > =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE.txt
> > =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80dotnetzip
> > =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.txt
> > =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.zlib.txt
> > |
> > =E2=94=9C=E2=94=80=E2=94=80go
> > =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE
> > =E2=94=82
> > =E2=94=9C=E2=94=80=E2=94=80lbzip2
> > =E2=94=9C=E2=94=80=E2=94=80pyflate
> > =E2=94=9C=E2=94=80=E2=94=80README
> > =E2=94=94=E2=94=80=E2=94=80 run-tests.sh
> >
> > source code link:
> > https://sourceware.org/git/bzip2-tests.git
> >
> > bzip2-tests.git source contains
> > 1) comman-commpress: which is Originally distributed under the Apache
> > License Version 2.0.
> >
> > See LICENSE.txt
> >
> >
> > 2) dotnetzip:
> > (i)  The DotNetZip Library is distributed under the MicroSoft Public L=
icense
> >      (Ms-PL) see the License.txt file.
> > (ii) The BZ2 related resources are distributed under the licenses in
> > License.zlib.txt.
> >
> > 3) go:
> >
> >   Go is distributed under a BSD-style license.
> >   See the LICENSE file.
> >
> > 4) lbzip2:
> > lbzip2 is free software: you can redistribute it and/or modify it unde=
r the
> > terms of the GNU General Public License as published by the Free Softw=
are
> > Foundation, either version 3 of the License, or (at your option) any l=
ater
> > version
> >
> > 5) pyflate: You may use and distribute this code and documentation und=
er any
> >              DFSG-compatible license (eg. BSD, GNU GPLv2).
> >
> > 6) run-tests.sh: you can redistribute it and/or modify it under the
> > terms of the GNU General Public License (GPL); either
> >                   version 3, or (at your option) any later version.
> >
> >
> > SO in recipe I added the License like below
> > LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD "
> > LICENSE_${PN}-ptest =3D "GPLv3+ & Apache-2.0 & MS-PL & BSD"
> > LIC_FILES_CHKSUM =3D
> > "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f=
19b32df4664
> > \
> >
> > file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324=
c9479bd8986968f4327
> > \ # For comman-commpress (Apache-2.0)
> >
> > file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc=
7e8ff352a54f
> > \      # For dotnetzip (Ms-PL)
> >
> > file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e=
5db6b79e6de0a029f
> > \   # For dotnetzip  (jzlib +zlib)
> >
> > file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd7470=
7 \
> >       # For go (BSD-style license)
> >
> > here I need few suggestion:
> >
> > 1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-pte=
st.
> >     but not added LIC_FILES_CHKSUM for GPLv3 and BSD because
> > bzip2-tests.git source code doesn't have GPLv3 and BSD License text fi=
le
> > like other
> >     directories.
> >
> > 2) License.zlib.txt: This is a combination of two licence jzlib and
> > zlib. In meta/files/common-licenses Zlib license is available but not =
jzlib.
> >     In this case how can I proceed?
> >
> > Kindly comment on this and feel free to point out if i am wrong at any
> > place.
> >
> > *Thanks & Regards,*
> >
> > Rahul Kumar
> >
> > Software Engineer,Linux Solutions Engineering
> >
> > Group,Montavista Software LLC
> >
> > Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> > <https://plus.google.com/+CodeTwoSoftware>
> >
> > On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wro=
te:
> >
> >     As I wrote in my previous mail, when it comes to licenses, it is t=
he
> >     distribution that is important. So if you build a package
> >     (bzip2-ptest) that includes code that is GPL-3.0, it does not matt=
er
> >     if that code is only used as a binary blob, it is still distribute=
d
> >     in the package, and thus the package needs to be covered by the
> >     GPL-3.0 license.
> >
> >     //Peter
> >
> >     *From:*openembedded-core@lists.openembedded.org
> >     <mailto:openembedded-core@lists.openembedded.org>
> >     <openembedded-core@lists.openembedded.org
> >     <mailto:openembedded-core@lists.openembedded.org>> *On Behalf Of
> >     *Rahul Kumar
> >     *Sent:* den 17 maj 2020 21:18
> >     *To:* Randy MacLeod <randy.macleod@windriver.com
> >     <mailto:randy.macleod@windriver.com>>
> >     *Cc:* Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>; Richard Purdie
> >     <richard.purdie@linuxfoundation.org
> >     <mailto:richard.purdie@linuxfoundation.org>>; OE-core
> >     <openembedded-core@lists.openembedded.org
> >     <mailto:openembedded-core@lists.openembedded.org>>; Trevor Gamblin
> >     <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com=
>>
> >     *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip=
2
> >
> >     Hi Randy,
> >
> >     patch has been accepted by bzip2 community with additional changes=
.
> >     https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df90=
61c030a25de5b6829e1abf373057309c734c0
> >
> >
> >     So I need your suggestion with respect to Yocto.
> >
> >     Since required changes for ptest infrastructure is integrated to t=
he
> >     bzip2-tests.git source code.
> >     So now we can just change the SRCREV with the latest commit instea=
d
> >     of applying the patch to the bzip2-tests.git source code.
> >
> >     And since we are just integrating the bzip2-tests source to the
> >     bzip2 recipe and not modifying any file so i think no need to add
> >     any License for it.
> >
> >
> >     Now patch will look like
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> >     +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> >     @@ -46,6 +46,7 @@ runtest:
> >              else echo "FAIL: sample2 decompress"; fi
> >              @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
> >     decompress";\
> >              else echo "FAIL: sample3 decompress"; fi
> >     +       ./bzip2-tests/run-tests.sh --tests-dir=3D"$(PWD)/bzip2-tes=
ts"
> >
> >       install-ptest:
> >              sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!=
p}' \
> >     @@ -56,6 +57,7 @@ install-ptest:
> >              cp $(srcdir)/sample1.bz2        $(DESTDIR)/
> >              cp $(srcdir)/sample2.bz2        $(DESTDIR)/
> >              cp $(srcdir)/sample3.bz2        $(DESTDIR)/
> >     +       cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
> >              ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2
> >
> >       install-exec-hook:
> >     diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> >     <http://bzip2_1.0.8.bb> b/meta/recipes-extended/bzip2/bzip2_1.0.8.=
bb
> >     <http://bzip2_1.0.8.bb>
> >     index d58f553..c5aa690 100644
> >     --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0=
.8.bb>
> >     +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0=
.8.bb>
> >     @@ -8,13 +8,17 @@ LICENSE =3D "bzip2-1.0.6"
> >       LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82=
e32f19b32df4664"
> >
> >       SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.=
gz
> >     <https://sourceware.org/pub/$%7bBPN%7d/$%7bBPN%7d-$%7bPV%7d.tar.gz=
> \
> >     +
> >     git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests
> >     <http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests> \
> >                  file://configure.ac <http://configure.ac>;subdir=3D${=
BP} \
> >                  file://Makefile.am;subdir=3D${BP} \
> >                  file://run-ptest \
> >                  "
> >     +
> >       SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
> >       SRC_URI[sha256sum] =3D
> >     "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
> >
> >     +SRCREV_bzip2-tests =3D "f9061c030a25de5b6829e1abf373057309c734c0"=
 *<<
> >     this commit Id includes latest charges for ptest infrastruct.*
> >     +
> >       UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2/"
> >
> >       PACKAGES =3D+ "libbz2"
> >     @@ -39,7 +43,7 @@ do_install_ptest () {
> >
> >       FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
> >
> >     -RDEPENDS_${PN}-ptest +=3D "make"
> >     +RDEPENDS_${PN}-ptest +=3D "make bash"
> >
> >       PROVIDES_append_class-native =3D " bzip2-replacement-native"
> >       BBCLASSEXTEND =3D "native nativesdk"
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >     Kindly comment on it and feel free to point out, if i am wrong at
> >     any place.
> >
> >     *Thanks & Regards,*
> >
> >     Rahul Kumar
> >
> >     Software Engineer,Linux Solutions Engineering
> >
> >     Group,Montavista Software LLC
> >
> >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >     <https://plus.google.com/+CodeTwoSoftware>
> >
> >     On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
> >     <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>>
> >     wrote:
> >
> >         On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> >          > You need to first see from the failure page which
> >         configuration is
> >          > failing, for example non-gpl3 is one such.
> >          >
> >          > Then you find that configuration in config.json. The below
> >         should
> >          > hopefully be self-explanatory in how you should set up the =
build?
> >          >
> >          > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"],
> >         "MACHINE" :
> >          > "qemux86", "BBTARGETS" : "core-image-minimal
> >         core-image-full-cmdline",
> >          > "extravars" : [ "INCOMPATIBLE_LICENSE =3D '*GPLv3'",
> >         "WARN_QA_remove =3D
> >          > 'incompatible-license'" ], "EXTRACMDS" : [
> >          > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> >          >
> >          > |
> >          >
> >          > |
> >          > |
> >          >
> >          > |Alex
> >
> >         Hi Rahul,
> >
> >         Sorry for my late reply.
> >
> >         The commit log for v2 is very good now!
> >         Thanks for incorporating my --pedantic suggestions. ;-)
> >
> >         It seems that you need a perl dependency for something (docs?
> >              $ cd .../bzip2.git
> >              $ grep -r "perl " *
> >              format.pl:#!/usr/bin/perl -w
> >              README.XML.STUFF:It uses format.pl <http://format.pl>, a
> >         perl script...
> >
> >         Then we need to figure out how to deal with the GPLv3 issue.
> >
> >         The buildbot output can be tedious to figure out. I haven't re=
ally
> >         spent enough time plugging away at it to be proficient yet eit=
her.
> >         Have you been able to reproduce the problems that Richard repo=
rted?
> >         If not, and you've tried for a bit, then just say so and I'll =
try to
> >         help tomorrow or early next week.
> >
> >         It looks like you are packaging the test code/data with the ma=
in
> >         package
> >         not in bzip2-ptest. Have a look at:
> >              meta/recipes-support/libpcre/libpcre_8.44.bb
> >         <http://libpcre_8.44.bb>
> >         for an example. There are many more.
> >         Also, if you look at oe-core.git:
> >              $ rgrep LICENSE_ *  | grep PN
> >         you can see many examples of sub-packages with different licen=
ses
> >         than the main package. One example is:
> >              meta/recipes-support/gnutls/gnutls_3.6.13.bb
> >         <http://gnutls_3.6.13.bb>
> >         I hope that can address the buildbot problem but I haven't tri=
ed it
> >         myself yet.
> >
> >         BTW, Trevor has gotten the YP autobuilder going at Wind River =
and
> >         he'll be sending a few documentation updates next week or so.
> >         That may help in case you want to reproduce the YP AB test
> >         infrastructure. I expect that you don't _have_ to do so but
> >         I think it would be good if more contributing organizations di=
d
> >         have an instance with only limited builders of the YP AB so th=
at
> >         we can do more testing before Richard runs our changes through
> >         the main system. Richard has cautioned that the YP AB has lots=
 of
> >         builders each of which has many cores but I hope that we can a=
t
> >         least
> >         do some AB checking ourselves.
> >
> >         ../Randy
> >
> >
> >          > |
> >          >
> >          >
> >          > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.co=
m
> >         <mailto:rahulk@mvista.com>
> >          > <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>> wrot=
e:
> >          >
> >          >     Hi Richard/Alexander,
> >          >
> >          >     I am not able to understand how I can use the below fil=
e.
> >          >
> >         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-he=
lper/tree/config.json
> >          >
> >          >     did you mean to say that i have to set MACRO in
> >         local.conf based on
> >          >     this file.
> >          >
> >          >     *Thanks & Regards,*
> >          >     Rahul Kumar
> >          >     Software Engineer,Linux Solutions Engineering
> >          >     Group,Montavista Software LLC
> >          >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >         <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>
> >          >     <https://plus.google.com/+CodeTwoSoftware>
> >          >
> >          >
> >          >     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
> >          >     <richard.purdie@linuxfoundation.org
> >         <mailto:richard.purdie@linuxfoundation.org>
> >          >     <mailto:richard.purdie@linuxfoundation.org
> >         <mailto:richard.purdie@linuxfoundation.org>>> wrote:
> >          >
> >          >         On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavi=
n
> >         wrote:
> >          >          > You need to look at configurations defined here:
> >          >          >
> >          >
> >         http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-he=
lper/tree/config.json
> >          >          > and replicate them locally. Then you can reprodu=
ce the
> >          >         failures that
> >          >          > the AB gets in those configurations.
> >          >
> >          >         That start of the failing logs on the autobuilder
> >         also list out the
> >          >         configuration options for that build.
> >          >
> >          >         Cheers,
> >          >
> >          >         Richard
> >          >
> >          >
> >          >
> >          >
> >
> >
> >         --
> >         # Randy MacLeod
> >         # Wind River Linux
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>=20
