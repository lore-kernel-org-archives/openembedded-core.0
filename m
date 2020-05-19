Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.1808.1589908506531105977
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 10:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=A6ctxYI9;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.49, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f49.google.com with SMTP id l11so289779wru.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ixTyIvAqkVjPL9Wn9PhEfjjkQEULt1vpGdp6ScvqOQ=;
        b=A6ctxYI9qqGPjaVS7J8aC5VaL5rXNStQ8/N2tfSqQJa+XZbce4KeewtQ5XNRNyKCdE
         DMPfanofFIdg56f1lkdptrRi6rIEARhhwbMn+jN7brormUbRl0ndPF77AUywsp+PGiC0
         iBqUNiAyQz2ot2Up+KGXsn8wcifsML4nalaCZ+aqfY5a7Rhwk1uV6q84zR7w6lch7Mj5
         V9KmF5/d1aPpxUOtrmb5kyhJTE+/4en569wACjCF8wbgG5E9MXxbnEtuix/SUi0+IPvH
         /WS0vkmgMg87cr+dmtArWrIIsmhPO+5wNSYj6rGvvYrfNXSCk8OvGlTcENiFAOqAONuW
         Is4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ixTyIvAqkVjPL9Wn9PhEfjjkQEULt1vpGdp6ScvqOQ=;
        b=t/SpqzSd4jTsdIxXnqt1mK+kdYKX8klKl5k0F1FwiOVeL2TrgdXJR4svV4+beztou4
         hInlagbHQCbpO00AviwVnsDLlQ2sEsIYRS9RVhEU48+mnA7RyMfgPyv2BXE4uGPyyHBs
         qLJQ7c1kwrOADWI9iw5CMGUcOk0R2be+cKnaAfLHuxOOZ+JzV/dMCjerkUXaM7dA8Onb
         74RPf5oY4mvz8oUiEdTcUlFECpQ6YwE1CAm0RzaioPThcFNIpzPWMwKrbcuOcnSHLaxA
         WzbsHNeRnFnfONrVcTPR3IjlYkAJils1lGZ5rC+WuxCpjKjR9YrVwqZNqfL/u2c9beUH
         +Qrg==
X-Gm-Message-State: AOAM530JOftx0j3jd8A+Xhguo7NrcDutyBmmcbFr8xjvBDvIkckhfi3f
	Ba8N8RCIuKPApsCPa+Ud34f1p+kKn+KzebfM7Y/vNA==
X-Google-Smtp-Source: ABdhPJznVlrv4JkSCJ0PlaXxaSCuR10aE+Fs0fhI50Qetou9b/0kcPvjWr6NP7Pj2elfTTw1ByWyvmC0CAvcqVfAjJA=
X-Received: by 2002:adf:e388:: with SMTP id e8mr26451955wrm.174.1589908505040;
 Tue, 19 May 2020 10:15:05 -0700 (PDT)
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
 <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com>
In-Reply-To: <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Tue, 19 May 2020 22:44:53 +0530
Message-ID: <CANv91vOT1G9d-bf9o-HOwoEZA+V1JJRS_xVJhv_8CP3mcNq6fA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000ab2d9c05a6036bf5"

--000000000000ab2d9c05a6036bf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thank you for the quick response.
I will work on your suggestion.but I need your confirmation on
LIC_FILES_CHKSUM also.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Tue, May 19, 2020 at 9:59 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> The jzlib license is a three clause BSD license, and so is the go/LICENS=
E,
> so you should be able to set LICENSE as:
>
>
>
> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & =
Zlib"
>
>
>
> You also need to add:
>
>
>
> LICENSE_${PN} =3D "bzip2-1.0.6"
>
> LICENSE_${PN}-dev =3D "bzip2-1.0.6"
>
> LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
>
> LICENSE_${PN}-doc =3D "bzip2-1.0.6"
>
> LICENSE_${PN}-src =3D "bzip2-1.0.6"
>
> LICENSE_libbz2 =3D "bzip2-1.0.6"
>
>
>
> so the non-ptest packages are not affected by the licenses for the ptest
> package.
>
>
>
> //Peter
>
>
>
> *From:* Rahul Kumar <rahulk@mvista.com>
> *Sent:* den 19 maj 2020 13:58
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* Randy MacLeod <randy.macleod@windriver.com>; Alexander Kanavin <
> alex.kanavin@gmail.com>; Richard Purdie <
> richard.purdie@linuxfoundation.org>; OE-core <
> openembedded-core@lists.openembedded.org>; Trevor Gamblin <
> trevor.gamblin@windriver.com>
> *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>
>
>
> Hi Peter,
>
> I am sharing a few information related to bzip2-test source and licensin=
g
> information.
> As per your suggestion and as per my understanding I added License to th=
e
> bzip2 recipe file.
>
> bzip2-tests.git source tree structure is given below
> (here showing licence related fle, removed other file names )
>
> bzip2-tests.git/
> =E2=94=9C=E2=94=80=E2=94=80 commons-compress
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE.txt
> =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80 dotnetzip
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 License.txt
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 License.zlib.txt
> |
> =E2=94=9C=E2=94=80=E2=94=80 go
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE
> =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80 lbzip2
> =E2=94=9C=E2=94=80=E2=94=80 pyflate
> =E2=94=9C=E2=94=80=E2=94=80 README
> =E2=94=94=E2=94=80=E2=94=80 run-tests.sh
>
> source code link:
> https://sourceware.org/git/bzip2-tests.git
>
> bzip2-tests.git source contains
> 1) comman-commpress: which is Originally distributed under the Apache
> License Version 2.0.
>
> See LICENSE.txt
>
>
> 2) dotnetzip:
> (i)  The DotNetZip Library is distributed under the MicroSoft Public
> License
>     (Ms-PL) see the License.txt file.
> (ii) The BZ2 related resources are distributed under the licenses in
> License.zlib.txt.
>
> 3) go:
>
>  Go is distributed under a BSD-style license.
>  See the LICENSE file.
>
> 4) lbzip2:
> lbzip2 is free software: you can redistribute it and/or modify it under =
the
> terms of the GNU General Public License as published by the Free Softwar=
e
> Foundation, either version 3 of the License, or (at your option) any lat=
er
> version
>
> 5) pyflate: You may use and distribute this code and documentation under
> any
>             DFSG-compatible license (eg. BSD, GNU GPLv2).
>
> 6) run-tests.sh: you can redistribute it and/or modify it under the term=
s
> of the GNU General Public License (GPL); either
>                  version 3, or (at your option) any later version.
>
>
> SO in recipe I added the License like below
> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD "
> LICENSE_${PN}-ptest =3D "GPLv3+ & Apache-2.0 & MS-PL & BSD"
> LIC_FILES_CHKSUM =3D
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19=
b32df4664
> \
>
> file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9=
479bd8986968f4327
> \ # For comman-commpress (Apache-2.0)
>
> file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e=
8ff352a54f
> \      # For dotnetzip (Ms-PL)
>
> file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5d=
b6b79e6de0a029f
> \   # For dotnetzip  (jzlib +zlib)
>
> file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 =
\
>  # For go (BSD-style license)
>
> here I need few suggestion:
>
> 1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-ptest=
.
>    but not added LIC_FILES_CHKSUM for GPLv3 and BSD because
> bzip2-tests.git source code doesn't have GPLv3 and BSD License text file
> like other
>    directories.
>
> 2) License.zlib.txt: This is a combination of two licence jzlib and zlib=
.
> In meta/files/common-licenses Zlib license is available but not jzlib.
>    In this case how can I proceed?
>
> Kindly comment on this and feel free to point out if i am wrong at any
> place.
>
>
>
> *Thanks & Regards,*
>
> Rahul Kumar
>
> Software Engineer,Linux Solutions Engineering
>
> Group,Montavista Software LLC
>
> Email Id: rahulk@mvista.com
> <https://plus.google.com/+CodeTwoSoftware>
>
>
>
>
>
> On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> As I wrote in my previous mail, when it comes to licenses, it is the
> distribution that is important. So if you build a package (bzip2-ptest)
> that includes code that is GPL-3.0, it does not matter if that code is o=
nly
> used as a binary blob, it is still distributed in the package, and thus =
the
> package needs to be covered by the GPL-3.0 license.
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Rahul Kumar
> *Sent:* den 17 maj 2020 21:18
> *To:* Randy MacLeod <randy.macleod@windriver.com>
> *Cc:* Alexander Kanavin <alex.kanavin@gmail.com>; Richard Purdie <
> richard.purdie@linuxfoundation.org>; OE-core <
> openembedded-core@lists.openembedded.org>; Trevor Gamblin <
> trevor.gamblin@windriver.com>
> *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>
>
>
> Hi Randy,
>
> patch has been accepted by bzip2 community with additional changes.
>
> https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c030=
a25de5b6829e1abf373057309c734c0
>
>
> So I need your suggestion with respect to Yocto.
>
> Since required changes for ptest infrastructure is integrated to the
> bzip2-tests.git source code.
> So now we can just change the SRCREV with the latest commit instead of
> applying the patch to the bzip2-tests.git source code.
>
> And since we are just integrating the bzip2-tests source to the bzip2
> recipe and not modifying any file so i think no need to add any License =
for
> it.
>
>
> Now patch will look like
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -46,6 +46,7 @@ runtest:
>         else echo "FAIL: sample2 decompress"; fi
>         @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
> decompress";\
>         else echo "FAIL: sample3 decompress"; fi
> +       ./bzip2-tests/run-tests.sh --tests-dir=3D"$(PWD)/bzip2-tests"
>
>  install-ptest:
>         sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> @@ -56,6 +57,7 @@ install-ptest:
>         cp $(srcdir)/sample1.bz2        $(DESTDIR)/
>         cp $(srcdir)/sample2.bz2        $(DESTDIR)/
>         cp $(srcdir)/sample3.bz2        $(DESTDIR)/
> +       cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
>         ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2
>
>  install-exec-hook:
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index d58f553..c5aa690 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -8,13 +8,17 @@ LICENSE =3D "bzip2-1.0.6"
>  LIC_FILES_CHKSUM =3D "
> file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b=
32df4664
> "
>
>  SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> +           git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests =
\
>             file://configure.ac;subdir=3D${BP} \
>             file://Makefile.am;subdir=3D${BP} \
>             file://run-ptest \
>             "
> +
>  SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
>  SRC_URI[sha256sum] =3D
> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>
> +SRCREV_bzip2-tests =3D "f9061c030a25de5b6829e1abf373057309c734c0"  *<<
> this commit Id includes latest charges for ptest infrastruct.*
> +
>  UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2/"
>
>  PACKAGES =3D+ "libbz2"
> @@ -39,7 +43,7 @@ do_install_ptest () {
>
>  FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
>
> -RDEPENDS_${PN}-ptest +=3D "make"
> +RDEPENDS_${PN}-ptest +=3D "make bash"
>
>  PROVIDES_append_class-native =3D " bzip2-replacement-native"
>  BBCLASSEXTEND =3D "native nativesdk"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Kindly comment on it and feel free to point out, if i am wrong at any
> place.
>
>
>
> *Thanks & Regards,*
>
> Rahul Kumar
>
> Software Engineer,Linux Solutions Engineering
>
> Group,Montavista Software LLC
>
> Email Id: rahulk@mvista.com
> <https://plus.google.com/+CodeTwoSoftware>
>
>
>
>
>
> On Fri, May 1, 2020 at 6:56 AM Randy MacLeod <randy.macleod@windriver.co=
m>
> wrote:
>
> On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> > You need to first see from the failure page which configuration is
> > failing, for example non-gpl3 is one such.
> >
> > Then you find that configuration in config.json. The below should
> > hopefully be self-explanatory in how you should set up the build?
> >
> > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"], "MACHINE" :
> > "qemux86", "BBTARGETS" : "core-image-minimal core-image-full-cmdline",
> > "extravars" : [ "INCOMPATIBLE_LICENSE =3D '*GPLv3'", "WARN_QA_remove =
=3D
> > 'incompatible-license'" ], "EXTRACMDS" : [
> > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> >
> > |
> >
> > |
> > |
> >
> > |Alex
>
> Hi Rahul,
>
> Sorry for my late reply.
>
> The commit log for v2 is very good now!
> Thanks for incorporating my --pedantic suggestions. ;-)
>
> It seems that you need a perl dependency for something (docs?
>     $ cd .../bzip2.git
>     $ grep -r "perl " *
>     format.pl:#!/usr/bin/perl -w
>     README.XML.STUFF:It uses format.pl, a perl script...
>
> Then we need to figure out how to deal with the GPLv3 issue.
>
> The buildbot output can be tedious to figure out. I haven't really
> spent enough time plugging away at it to be proficient yet either.
> Have you been able to reproduce the problems that Richard reported?
> If not, and you've tried for a bit, then just say so and I'll try to
> help tomorrow or early next week.
>
> It looks like you are packaging the test code/data with the main package
> not in bzip2-ptest. Have a look at:
>     meta/recipes-support/libpcre/libpcre_8.44.bb
> for an example. There are many more.
> Also, if you look at oe-core.git:
>     $ rgrep LICENSE_ *  | grep PN
> you can see many examples of sub-packages with different licenses
> than the main package. One example is:
>     meta/recipes-support/gnutls/gnutls_3.6.13.bb
> I hope that can address the buildbot problem but I haven't tried it
> myself yet.
>
> BTW, Trevor has gotten the YP autobuilder going at Wind River and
> he'll be sending a few documentation updates next week or so.
> That may help in case you want to reproduce the YP AB test
> infrastructure. I expect that you don't _have_ to do so but
> I think it would be good if more contributing organizations did
> have an instance with only limited builders of the YP AB so that
> we can do more testing before Richard runs our changes through
> the main system. Richard has cautioned that the YP AB has lots of
> builders each of which has many cores but I hope that we can at least
> do some AB checking ourselves.
>
> ../Randy
>
>
> > |
> >
> >
> > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <rahulk@mvista.com
> > <mailto:rahulk@mvista.com>> wrote:
> >
> >     Hi Richard/Alexander,
> >
> >     I am not able to understand how I can use the below file.
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/=
config.json
> >
> >     did you mean to say that i have to set MACRO in local.conf based o=
n
> >     this file.
> >
> >     *Thanks & Regards,*
> >     Rahul Kumar
> >     Software Engineer,Linux Solutions Engineering
> >     Group,Montavista Software LLC
> >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >     <https://plus.google.com/+CodeTwoSoftware>
> >
> >
> >     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
> >     <richard.purdie@linuxfoundation.org
> >     <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >
> >         On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin wrote:
> >          > You need to look at configurations defined here:
> >          >
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/=
config.json
> >          > and replicate them locally. Then you can reproduce the
> >         failures that
> >          > the AB gets in those configurations.
> >
> >         That start of the failing logs on the autobuilder also list ou=
t
> the
> >         configuration options for that build.
> >
> >         Cheers,
> >
> >         Richard
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>=20
>

--000000000000ab2d9c05a6036bf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi=C2=A0Peter,</div><div class=3D"gmail_default" =
style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div class=
=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">=
Thank you for the quick response.</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:#0b5394">I will work on your sugg=
estion.but I need your confirmation on LIC_FILES_CHKSUM also.=C2=A0</div><d=
iv class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0=
b5394">=C2=A0</div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><span style=3D"color:rgb(111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19=
, 2020 at 9:59 PM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerste=
dt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV">
<div class=3D"gmail-m_7304195961773794299WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>The jzlib license is a three clause BSD license, and so is the go/LICENSE,=
 so you should be able to set LICENSE as:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apac=
he-2.0 &amp; MS-PL &amp; BSD-3-Clause &amp; Zlib&quot;<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>You also need to add:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_${PN} =3D &quot;bzip2-1.0.6&quot;<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_${PN}-dev =3D &quot;bzip2-1.0.6&quot;<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_${PN}-dbg =3D &quot;bzip2-1.0.6&quot;<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_${PN}-doc =3D &quot;bzip2-1.0.6&quot;<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_${PN}-src =3D &quot;bzip2-1.0.6&quot;<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;=
color:rgb(148,54,52)">LICENSE_libbz2 =3D &quot;bzip2-1.0.6&quot;<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>so the non-ptest packages are not affected by the licenses for the ptest p=
ackage.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-=
left:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border=
-top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" target=3D=
"_blank">rahulk@mvista.com</a>&gt;
<br>
<b>Sent:</b> den 19 maj 2020 13:58<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axi=
s.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com=
" target=3D"_blank">randy.macleod@windriver.com</a>&gt;; Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;; OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.or=
g" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;; Trev=
or Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_b=
lank">trevor.gamblin@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2<u=
></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-fa=
mily:Verdana,sans-serif;color:rgb(11,83,148)">Hi Peter,<br>
<br>
I am sharing a few information related to bzip2-test source and licensing =
information.<br>
As per your suggestion and as per my understanding I added License to the =
bzip2 recipe file.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-fa=
mily:Verdana,sans-serif;color:rgb(11,83,148)">bzip2-tests.git source tree s=
tructure is given below
<br>
(here showing licence related fle, removed other file names )<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)">bzip2-tests.git/<br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> commons-compress<br>
=E2=94=82=C2=A0=C2=A0 </span><span style=3D"font-family:Arial,sans-serif;c=
olor:rgb(11,83,148)">=E2=94=9C</span><span style=3D"font-family:Verdana,san=
s-serif;color:rgb(11,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-=
family:Verdana,sans-serif;color:rgb(11,83,148)"> LICENSE.txt<br>
=E2=94=82<br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> dotnetzip<br>
=E2=94=82=C2=A0=C2=A0 </span><span style=3D"font-family:Arial,sans-serif;c=
olor:rgb(11,83,148)">=E2=94=9C</span><span style=3D"font-family:Verdana,san=
s-serif;color:rgb(11,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-=
family:Verdana,sans-serif;color:rgb(11,83,148)"> License.txt<br>
=E2=94=82=C2=A0=C2=A0 </span><span style=3D"font-family:Arial,sans-serif;c=
olor:rgb(11,83,148)">=E2=94=9C</span><span style=3D"font-family:Verdana,san=
s-serif;color:rgb(11,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-=
family:Verdana,sans-serif;color:rgb(11,83,148)"> License.zlib.txt<br>
|<br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> go<br>
=E2=94=82=C2=A0=C2=A0 </span><span style=3D"font-family:Arial,sans-serif;c=
olor:rgb(11,83,148)">=E2=94=9C</span><span style=3D"font-family:Verdana,san=
s-serif;color:rgb(11,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-=
family:Verdana,sans-serif;color:rgb(11,83,148)"> LICENSE<br>
=E2=94=82=C2=A0=C2=A0 <br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> lbzip2<br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> pyflate<br>
</span><span style=3D"font-family:Arial,sans-serif;color:rgb(11,83,148)">=
=E2=94=9C</span><span style=3D"font-family:Verdana,sans-serif;color:rgb(11=
,83,148)">=E2=94=80=E2=94=80</span><span style=3D"font-family:Verdana,sans-=
serif;color:rgb(11,83,148)"> README<br>
=E2=94=94=E2=94=80=E2=94=80 run-tests.sh<br>
<br>
source code link:<br>
<a href=3D"https://sourceware.org/git/bzip2-tests.git" target=3D"_blank">h=
ttps://sourceware.org/git/bzip2-tests.git</a><br>
<br>
bzip2-tests.git source contains <br>
1) comman-commpress: which is Originally distributed under the Apache Lice=
nse Version 2.0.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)">See LICENSE.txt<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)"><br>
2) dotnetzip: <br>
(i) =C2=A0The DotNetZip Library is distributed under the MicroSoft Public =
License<br>
=C2=A0 =C2=A0 (Ms-PL) see the License.txt file.<br>
(ii) The BZ2 related resources are distributed under the licenses in Licen=
se.zlib.txt.<br>
<br>
3) go:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)">=C2=A0Go is distributed under a BSD-style license.
<br>
=C2=A0See the LICENSE file.<br>
<br>
4) lbzip2: <br>
lbzip2 is free software: you can redistribute it and/or modify it under th=
e<br>
terms of the GNU General Public License as published by the Free Software<=
br>
Foundation, either version 3 of the License, or (at your option) any later=
<br>
version<br>
<br>
5) pyflate: You may use and distribute this code and documentation under a=
ny<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DFSG-compatible license (eg. BSD=
, GNU GPLv2).<br>
<br>
6) run-tests.sh: you can redistribute it and/or modify it under the terms =
of the GNU General Public License (GPL); either<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version 3, o=
r (at your option) any later version.<br>
<br>
<br>
SO in recipe I added the License like below<br>
LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &amp; MS-PL &a=
mp; BSD &quot;<br>
LICENSE_${PN}-ptest =3D &quot;GPLv3+ &amp; Apache-2.0 &amp; MS-PL &amp; BS=
D&quot;<br>
LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=
=3D600af43c50f1fcb82e32f19b32df4664 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd89=
86968f4327 \ # For comman-commpress (Apache-2.0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a=
54f \ =C2=A0 =C2=A0 =C2=A0# For dotnetzip (Ms-PL)
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6=
de0a029f \ =C2=A0 # For dotnetzip =C2=A0(jzlib +zlib)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \ =C2=
=A0 =C2=A0 =C2=A0# For go (BSD-style license)<br>
<br>
here I need few suggestion:<br>
<br>
1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-ptest.<=
br>
=C2=A0 =C2=A0but not added LIC_FILES_CHKSUM for GPLv3 and BSD because bzip=
2-tests.git source code doesn&#39;t have GPLv3 and BSD License text file li=
ke other =C2=A0<br>
=C2=A0 =C2=A0directories.<br>
<br>
2) License.zlib.txt: This is a combination of two licence jzlib and zlib. =
In meta/files/common-licenses Zlib license is available but not jzlib.<br>
=C2=A0 =C2=A0In this case how can I proceed?<br>
<br>
Kindly comment on this and feel free to point out if i am wrong at any pla=
ce.<br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"color:rgb(11,83,148)">Thanks &amp=
; Regards,</span></b><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Software Engin=
eer,Linux Solutions Engineering</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Group,Montavis=
ta Software LLC</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Email Id: </sp=
an><span style=3D"font-size:10pt;color:rgb(11,83,148)"><a href=3D"mailto:ra=
hulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span><a href=3D"h=
ttps://plus.google.com/+CodeTwoSoftware" target=3D"_blank"><span style=3D"f=
ont-size:10pt;font-family:Verdana,sans-serif;color:rgb(42,42,42)"><br>
</span></a><u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;=
border-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:=
4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>As I wrote in my previous mail, when it comes to licenses, it is the distr=
ibution that is important. So if you build a package (bzip2-ptest)
 that includes code that is GPL-3.0, it does not matter if that code is on=
ly used as a binary blob, it is still distributed in the package, and thus =
the package needs to be covered by the GPL-3.0 license.</span><u></u><u></u=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>//Peter</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)"=
>=C2=A0</span><u></u><u></u></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-=
left:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border=
-top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US">
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:open=
embedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@l=
ists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Rahul Kumar<br>
<b>Sent:</b> den 17 maj 2020 21:18<br>
<b>To:</b> Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com=
" target=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;; Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;; OE-core &lt;<a href=3D"mailto:openembed=
ded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.=
openembedded.org</a>&gt;;
 Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=
=
=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2</=
span><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)">Hi Randy,<br>
<br>
patch has been accepted by bzip2 community with additional changes.<br>
<a href=3D"https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3D=
f9061c030a25de5b6829e1abf373057309c734c0" target=3D"_blank">https://sourcew=
are.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c030a25de5b6829e1abf37=
3057309c734c0</a></span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)"><br>
So I need your suggestion with respect to Yocto.<br>
<br>
Since required changes for ptest infrastructure is integrated to the bzip2=
-tests.git source code.<br>
So now we can just change the SRCREV with the latest commit instead of app=
lying the patch to the bzip2-tests.git source code.<br>
<br>
And since we are just integrating the bzip2-tests source to the bzip2 reci=
pe and not modifying any file so i think no need to add any License for it.=
<br>
<br>
<br>
Now patch will look like <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
@@ -46,6 +46,7 @@ runtest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample2 decompress&quot;=
; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp sample3.tst sample3.ref; then echo &qu=
ot;PASS: sample3 decompress&quot;;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample3 decompress&quot;=
; fi<br>
+ =C2=A0 =C2=A0 =C2=A0 ./bzip2-tests/run-tests.sh --tests-dir=3D&quot;$(PW=
D)/bzip2-tests&quot;<br>
=C2=A0<br>
=C2=A0install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed =C2=A0-n &#39;/^runtest:/,/^install-ptest:=
/{/^install-ptest:/!p}&#39; \<br>
@@ -56,6 +57,7 @@ install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample1.bz2 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0$(DESTDIR)/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample2.bz2 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0$(DESTDIR)/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample3.bz2 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0$(DESTDIR)/<br>
+ =C2=A0 =C2=A0 =C2=A0 cp -rf $(srcdir)/../git =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 $(DESTDIR)/bzip2-tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s $(bindir)/bzip2 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 $(DESTDIR)/bzip2<br>
=C2=A0<br>
=C2=A0install-exec-hook:<br>
diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb"=
 target=3D"_blank">bzip2_1.0.8.bb</a> b/meta/recipes-extended/bzip2/<a href=
=
=3D"http://bzip2_1.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>
index d58f553..c5aa690 100644<br>
--- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=
=
=3D"_blank">bzip2_1.0.8.bb</a><br>
+++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=
=
=3D"_blank">bzip2_1.0.8.bb</a><br>
@@ -8,13 +8,17 @@ LICENSE =3D &quot;bzip2-1.0.6&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;beginline=3D4;endline=
=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664</a>&quot;<br>
=C2=A0<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/$%7bBPN%7d/$=
%7bBPN%7d-$%7bPV%7d.tar.gz" target=3D"_blank">https://sourceware.org/pub/${=
BPN}/${BPN}-${PV}.tar.gz</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://sourceware.or=
g/git/bzip2-tests.git;name=3Dbzip2-tests" target=3D"_blank">sourceware.org/=
git/bzip2-tests.git;name=3Dbzip2-tests</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://configu=
re.ac" target=3D"_blank">configure.ac</a>;subdir=3D${BP} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am;subdir=3D${BP=
} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f7500d0e5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d3f0fa90e381da478ddae4059=
18153cca248e682cd0c4a2269&quot;<br>
=C2=A0<br>
+SRCREV_bzip2-tests =3D &quot;f9061c030a25de5b6829e1abf373057309c734c0&quo=
t; =C2=A0<b>&lt;&lt; this commit Id includes latest charges for ptest infra=
struct.</b><br>
+<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.sourceware.org/p=
ub/bzip2/" target=3D"_blank">https://www.sourceware.org/pub/bzip2/</a>&quot=
;<br>
=C2=A0<br>
=C2=A0PACKAGES =3D+ &quot;libbz2&quot;<br>
@@ -39,7 +43,7 @@ do_install_ptest () {<br>
=C2=A0<br>
=C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
=C2=A0<br>
-RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
=C2=A0<br>
=C2=A0PROVIDES_append_class-native =3D &quot; bzip2-replacement-native&quo=
t;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Kindly comment on it and feel free to point out, if i am wrong at any plac=
e.<br clear=3D"all">
</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color=
:rgb(11,83,148)">=C2=A0</span><u></u><u></u></p>
</div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"color:rgb(11,83,148)">Thanks &amp=
; Regards,</span></b><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Software Engin=
eer,Linux Solutions Engineering</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Group,Montavis=
ta Software LLC</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Email Id:
</span><span style=3D"font-size:10pt;color:rgb(11,83,148)"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span><a href=
=
=3D"https://plus.google.com/+CodeTwoSoftware" target=3D"_blank"><span styl=
e=3D"font-size:10pt;font-family:Verdana,sans-serif;color:rgb(42,42,42)"><br=
>
</span></a><u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, May 1, 2020 at 6:56 AM Randy MacLeod &lt;<a=
 href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleo=
d@windriver.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;=
border-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0=
cm 5pt 4.8pt">
<p class=3D"MsoNormal">On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:<b=
r>
&gt; You need to first see from the failure page which configuration is <b=
r>
&gt; failing, for example non-gpl3 is one such.<br>
&gt; <br>
&gt; Then you find that configuration in config.json. The below should <br=
>
&gt; hopefully be self-explanatory in how you should set up the build?<br>
&gt; <br>
&gt; |&quot;non-gpl3&quot; : { &quot;NEEDREPOS&quot; : [&quot;poky&quot;, =
&quot;meta-gplv2&quot;], &quot;MACHINE&quot; : <br>
&gt; &quot;qemux86&quot;, &quot;BBTARGETS&quot; : &quot;core-image-minimal=
 core-image-full-cmdline&quot;, <br>
&gt; &quot;extravars&quot; : [ &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&=
#39;&quot;, &quot;WARN_QA_remove =3D <br>
&gt; &#39;incompatible-license&#39;&quot; ], &quot;EXTRACMDS&quot; : [ <br=
>
&gt; &quot;../../yocto-autobuilder-helper/scripts/check-gplv3&quot; ] },<b=
r>
&gt; <br>
&gt; |<br>
&gt; <br>
&gt; |<br>
&gt; |<br>
&gt; <br>
&gt; |Alex<br>
<br>
Hi Rahul,<br>
<br>
Sorry for my late reply.<br>
<br>
The commit log for v2 is very good now!<br>
Thanks for incorporating my --pedantic suggestions. ;-)<br>
<br>
It seems that you need a perl dependency for something (docs?<br>
=C2=A0 =C2=A0 $ cd .../bzip2.git<br>
=C2=A0 =C2=A0 $ grep -r &quot;perl &quot; *<br>
=C2=A0 =C2=A0 format.pl:#!/usr/bin/perl -w<br>
=C2=A0 =C2=A0 README.XML.STUFF:It uses <a href=3D"http://format.pl" target=
=
=3D"_blank">format.pl</a>, a perl script...<br>
<br>
Then we need to figure out how to deal with the GPLv3 issue.<br>
<br>
The buildbot output can be tedious to figure out. I haven&#39;t really<br>
spent enough time plugging away at it to be proficient yet either.<br>
Have you been able to reproduce the problems that Richard reported?<br>
If not, and you&#39;ve tried for a bit, then just say so and I&#39;ll try =
to<br>
help tomorrow or early next week.<br>
<br>
It looks like you are packaging the test code/data with the main package <=
br>
not in bzip2-ptest. Have a look at:<br>
=C2=A0 =C2=A0 meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.44.=
bb" target=3D"_blank">libpcre_8.44.bb</a><br>
for an example. There are many more.<br>
Also, if you look at oe-core.git:<br>
=C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN<br>
you can see many examples of sub-packages with different licenses<br>
than the main package. One example is:<br>
=C2=A0 =C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.=
bb" target=3D"_blank">gnutls_3.6.13.bb</a><br>
I hope that can address the buildbot problem but I haven&#39;t tried it<br=
>
myself yet.<br>
<br>
BTW, Trevor has gotten the YP autobuilder going at Wind River and<br>
he&#39;ll be sending a few documentation updates next week or so.<br>
That may help in case you want to reproduce the YP AB test<br>
infrastructure. I expect that you don&#39;t _have_ to do so but<br>
I think it would be good if more contributing organizations did<br>
have an instance with only limited builders of the YP AB so that<br>
we can do more testing before Richard runs our changes through<br>
the main system. Richard has cautioned that the YP AB has lots of<br>
builders each of which has many cores but I hope that we can at least<br>
do some AB checking ourselves.<br>
<br>
../Randy<br>
<br>
<br>
&gt; |<br>
&gt; <br>
&gt; <br>
&gt; On Mon, 27 Apr 2020 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahul=
k@mvista.com" target=3D"_blank">rahulk@mvista.com</a>
<br>
&gt; &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rah=
ulk@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use the belo=
w file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/yocto-autobuilder-helper/tree/config.json" target=3D"_blank">http://git.=
yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json</a=
><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0did you mean to say that i have to set MACRO in lo=
cal.conf based on<br>
&gt;=C2=A0 =C2=A0 =C2=A0this file.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*Thanks &amp; Regards,*<br>
&gt;=C2=A0 =C2=A0 =C2=A0Rahul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0Software Engineer,Linux Solutions Engineering<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group,Montavista Software LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0Email Id: <a href=3D"mailto:rahulk@mvista.com" tar=
get=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mv=
ista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://plus.google.com/+CodeTwoSof=
tware" target=3D"_blank">https://plus.google.com/+CodeTwoSoftware</a>&gt;<b=
r>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, A=
lexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; You need to look at configurat=
ions defined here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.o=
rg/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json" target=3D"_blan=
k">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/=
config.json</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; and replicate them locally. Th=
en you can reproduce the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failures that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; the AB gets in those configura=
tions.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing logs on th=
e autobuilder also list out the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration options for that build=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

<br>
</blockquote></div>

--000000000000ab2d9c05a6036bf5--
