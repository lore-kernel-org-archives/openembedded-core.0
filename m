Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10027.1589889504694240130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 04:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=Lv1WWcSY;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.42, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f42.google.com with SMTP id z4so2761933wmi.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2OKehc6mp3v3M2GOo1M+eiZtL36dLCFjNMcNFKzFvw=;
        b=Lv1WWcSYKkhd0cngIDt73b7oo6d94AHPJH4GesHQPRb2lFn9VDh1fVsX5nCCAB8LVM
         /9IPrIPsybgDm7U2bPb6nLxlv6/O4N3jB2uz05N+8NgWb+jYBkL+hnCw5JWx34vBmcP4
         TO+vblehPr9Smf/8uX5kC2OYFRSjq/2iTcg26me79a9znbXh/ilIysDs7UwbT3NTsgiQ
         UAymOFOp6tY59a6pxhfpXflsF1MRrgW2pT2bXvFwrgAXK+YnppAOjvJAlvaELMsfIunC
         FpN5zt5TIzqc2HkUsv+BMNjyW7AnKfVShAVLhBAhdewMyAaQ/yvPFcibdTU8S8NVlBmw
         9X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2OKehc6mp3v3M2GOo1M+eiZtL36dLCFjNMcNFKzFvw=;
        b=BatL/uoFZyBcY7LQecp9gZ0P3hT1qmc3iDKwmMeD3u7fVr63WbQ7RwZNAESRLYqtPP
         Gr1dzubM85NVoCY48OdIeH9RHwvQhKHD5HnZsLyeykafJHzMwwf8Slw4HFx9RhQJJFAT
         7bdJfEiVqYUhs6mL1tXPDwuQkiaXa3rAIc0aCQq5hwOqO5tklGu4f6rOfUDcGX73WbTa
         bniLHGPhNtXYa71c+FmV60fkwy0nzDv+XVq04AjEzJMCse4ijyvTEpCmftUIGIqViN1n
         kY2JFN7tJaXu6oghRn0lpVDCMPLD6mNb1GhLWkegy117bi4AWCsjDOjhslZnZ60LI0rc
         YyFg==
X-Gm-Message-State: AOAM531kFmvNtw2PiGVZYrF4UXOl2Jta9KUR6h2m30VzDgvt6sJ6EMGq
	47YRxqtK6b4MK5a/UQEKn4MipCbApPjdAN5TgAmJEQ==
X-Google-Smtp-Source: ABdhPJzWePrySuRGiLz4DNDJDf83HGWtomi+6vSwcexgvZmCMwh3s9IDxKfvkjqyAhj4XWSjZWIShCG/VBOvRxTRno4=
X-Received: by 2002:a1c:8148:: with SMTP id c69mr5288456wmd.144.1589889503148;
 Tue, 19 May 2020 04:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com> <CANv91vM-SuevnLi--bKzyON3z6YuXUMHUjCc70PKa41woypmTg@mail.gmail.com>
 <9c444c01c7b64ff99ebd3b22516dc052@XBOX03.axis.com>
In-Reply-To: <9c444c01c7b64ff99ebd3b22516dc052@XBOX03.axis.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Tue, 19 May 2020 17:28:11 +0530
Message-ID: <CANv91vPLcNY+58xx_ZyOOwAviyiH6vD_hPU_KmreXeUj1cikXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000011832305a5feff9d"

--00000000000011832305a5feff9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

I am sharing a few information related to bzip2-test source and licensing
information.
As per your suggestion and as per my understanding I added License to the
bzip2 recipe file.

bzip2-tests.git source tree structure is given below
(here showing licence related fle, removed other file names )

bzip2-tests.git/
=E2=94=9C=E2=94=80=E2=94=80 commons-compress
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE.txt
=E2=94=82
=E2=94=9C=E2=94=80=E2=94=80 dotnetzip
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 License.txt
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 License.zlib.txt
|
=E2=94=9C=E2=94=80=E2=94=80 go
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 LICENSE
=E2=94=82
=E2=94=9C=E2=94=80=E2=94=80 lbzip2
=E2=94=9C=E2=94=80=E2=94=80 pyflate
=E2=94=9C=E2=94=80=E2=94=80 README
=E2=94=94=E2=94=80=E2=94=80 run-tests.sh

source code link:
https://sourceware.org/git/bzip2-tests.git

bzip2-tests.git source contains
1) comman-commpress: which is Originally distributed under the Apache
License Version 2.0.
See LICENSE.txt

2) dotnetzip:
(i)  The DotNetZip Library is distributed under the MicroSoft Public Licens=
e
    (Ms-PL) see the License.txt file.
(ii) The BZ2 related resources are distributed under the licenses in
License.zlib.txt.

3) go:
 Go is distributed under a BSD-style license.
 See the LICENSE file.

4) lbzip2:
lbzip2 is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version

5) pyflate: You may use and distribute this code and documentation under an=
y
            DFSG-compatible license (eg. BSD, GNU GPLv2).

6) run-tests.sh: you can redistribute it and/or modify it under the terms
of the GNU General Public License (GPL); either
                 version 3, or (at your option) any later version.


SO in recipe I added the License like below
LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD "
LICENSE_${PN}-ptest =3D "GPLv3+ & Apache-2.0 & MS-PL & BSD"
LIC_FILES_CHKSUM =3D
"file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32=
df4664
\

file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479=
bd8986968f4327
\ # For comman-commpress (Apache-2.0)

file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff=
352a54f
\      # For dotnetzip (Ms-PL)

file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b=
79e6de0a029f
\   # For dotnetzip  (jzlib +zlib)

file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
 # For go (BSD-style license)

here I need few suggestion:

1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-ptest.
   but not added LIC_FILES_CHKSUM for GPLv3 and BSD because bzip2-tests.git
source code doesn't have GPLv3 and BSD License text file like other
   directories.

2) License.zlib.txt: This is a combination of two licence jzlib and zlib.
In meta/files/common-licenses Zlib license is available but not jzlib.
   In this case how can I proceed?

Kindly comment on this and feel free to point out if i am wrong at any
place.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> As I wrote in my previous mail, when it comes to licenses, it is the
> distribution that is important. So if you build a package (bzip2-ptest)
> that includes code that is GPL-3.0, it does not matter if that code is on=
ly
> used as a binary blob, it is still distributed in the package, and thus t=
he
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
> https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c030a=
25de5b6829e1abf373057309c734c0
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
> recipe and not modifying any file so i think no need to add any License f=
or
> it.
>
>
> Now patch will look like
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b3=
2df4664
> "
>
>  SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> +           git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests \
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
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
> On Fri, May 1, 2020 at 6:56 AM Randy MacLeod <randy.macleod@windriver.com=
>
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
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/c=
onfig.json
> >
> >     did you mean to say that i have to set MACRO in local.conf based on
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
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/c=
onfig.json
> >          > and replicate them locally. Then you can reproduce the
> >         failures that
> >          > the AB gets in those configurations.
> >
> >         That start of the failing logs on the autobuilder also list out
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
>

--00000000000011832305a5feff9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Peter,<br><br>I am sharing a few information r=
elated to bzip2-test source and licensing information.<br>As per your sugge=
stion and as per my understanding I added License to the bzip2 recipe file.=
<br><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,san=
s-serif;color:#0b5394">bzip2-tests.git source tree structure is given below=
 <br>(here showing licence related fle, removed other file names )<br><br><=
/div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;c=
olor:#0b5394">bzip2-tests.git/<br>=E2=94=9C=E2=94=80=E2=94=80 commons-compr=
ess<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 LICENSE.txt<br>=E2=
=94=82<br>=E2=94=9C=E2=94=80=E2=94=80 dotnetzip<br>=E2=94=82=C2=A0=C2=A0 =
=E2=94=9C=E2=94=80=E2=94=80 License.txt<br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=
=E2=94=80=E2=94=80 License.zlib.txt<br>|<br>=E2=94=9C=E2=94=80=E2=94=80 go<=
br>=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 LICENSE<br>=E2=94=82=
=C2=A0=C2=A0 <br>=E2=94=9C=E2=94=80=E2=94=80 lbzip2<br>=E2=94=9C=E2=94=80=
=E2=94=80 pyflate<br>=E2=94=9C=E2=94=80=E2=94=80 README<br>=E2=94=94=E2=94=
=80=E2=94=80 run-tests.sh<br><br>source code link:<br><a href=3D"https://so=
urceware.org/git/bzip2-tests.git">https://sourceware.org/git/bzip2-tests.gi=
t</a><br><br>bzip2-tests.git source contains <br>1) comman-commpress: which=
 is Originally distributed under the Apache License Version 2.0.</div><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b53=
94">See LICENSE.txt</div><div class=3D"gmail_default" style=3D"font-family:=
verdana,sans-serif;color:#0b5394"><br>2) dotnetzip: <br>	(i) =C2=A0The DotN=
etZip Library is distributed under the MicroSoft Public License<br>	 =C2=A0=
 =C2=A0 (Ms-PL) see the License.txt file.<br>	(ii) The BZ2 related resource=
s are distributed under the licenses in License.zlib.txt.<br><br>3) go:</di=
v><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;colo=
r:#0b5394">=C2=A0Go is distributed under a BSD-style license. <br>=C2=A0See=
 the LICENSE file.<br><br>4) lbzip2: <br>	lbzip2 is free software: you can =
redistribute it and/or modify it under the<br>terms of the GNU General Publ=
ic License as published by the Free Software<br>Foundation, either version =
3 of the License, or (at your option) any later<br>version<br><br>5) pyflat=
e: You may use and distribute this code and documentation under any<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DFSG-compatible license (eg. BSD, GN=
U GPLv2).<br><br>6) run-tests.sh: you can redistribute it and/or modify it =
under the terms of the GNU General Public License (GPL); either<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version 3, or (at yo=
ur option) any later version.<br><br><br>SO in recipe I added the License l=
ike below<br>LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &a=
mp; MS-PL &amp; BSD &quot;<br>LICENSE_${PN}-ptest =3D &quot;GPLv3+ &amp; Ap=
ache-2.0 &amp; MS-PL &amp; BSD&quot;<br>LIC_FILES_CHKSUM =3D &quot;file://L=
ICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664 \<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi=
le://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd=
8986968f4327 \ # For comman-commpress (Apache-2.0)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://${WORKDIR}/git/dotn=
etzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a54f \	 =C2=A0 =C2=A0 =
=C2=A0# For dotnetzip (Ms-PL)	<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://${WORKDIR}/git/dotnetzip/License.zlib.t=
xt;md5=3Dcc421ccd22eeb2e5db6b79e6de0a029f \ =C2=A0 # For dotnetzip =C2=A0(j=
zlib +zlib)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0=
dd74707 \		 =C2=A0 =C2=A0 =C2=A0# For go (BSD-style license)<br><br>here I =
need few suggestion:<br><br>1) I added the BSD and GPLv3+ license in LICENS=
E and LICENSE_${PN}-ptest.<br>=C2=A0 =C2=A0but not added LIC_FILES_CHKSUM f=
or GPLv3 and BSD because bzip2-tests.git source code doesn&#39;t have GPLv3=
 and BSD License text file like other =C2=A0<br>=C2=A0 =C2=A0directories.<b=
r><br>2) License.zlib.txt: This is a combination of two licence jzlib and z=
lib. In meta/files/common-licenses Zlib license is available but not jzlib.=
<br>=C2=A0 =C2=A0In this case how can I proceed?<br><br>Kindly comment on t=
his and feel free to point out if i am wrong at any place.<br clear=3D"all"=
></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif=
;color:#0b5394"><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><span style=3D"color:rgb(111,168,220)">	=09
  =09
 =20
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b>=
</span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"col=
or:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><sp=
an style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"c=
olor:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an></span></div><div><span style=3D"color:rgb(11,83,148)">Software Engineer=
,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,8=
3,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"colo=
r:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mailt=
o:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span><=
span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener" =
target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:1=
0pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18,=
 2020 at 1:18 AM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellersted=
t@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SV">
<div class=3D"gmail-m_7562713933880528653WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
As I wrote in my previous mail, when it comes to licenses, it is the distri=
bution that is important. So if you build a package (bzip2-ptest) that incl=
udes code that is
 GPL-3.0, it does not matter if that code is only used as a binary blob, it=
 is still distributed in the package, and thus the package needs to be cove=
red by the GPL-3.0 license.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Rahul Kumar<br>
<b>Sent:</b> den 17 maj 2020 21:18<br>
<b>To:</b> Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com"=
 target=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;; Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;; OE-core &lt;<a href=3D"mailto:openembedd=
ed-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.o=
penembedded.org</a>&gt;; Trevor Gamblin &lt;<a href=3D"mailto:trevor.gambli=
n@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2<u>=
</u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color:=
rgb(11,83,148)">Hi Randy,<br>
<br>
patch has been accepted by bzip2 community with additional changes.<br>
<a href=3D"https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df=
9061c030a25de5b6829e1abf373057309c734c0" target=3D"_blank">https://sourcewa=
re.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c030a25de5b6829e1abf373=
057309c734c0</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color:=
rgb(11,83,148)"><br>
So I need your suggestion with respect to Yocto.<br>
<br>
Since required changes for ptest infrastructure is integrated to the bzip2-=
tests.git source code.<br>
So now we can just change the SRCREV with the latest commit instead of appl=
ying the patch to the bzip2-tests.git source code.<br>
<br>
And since we are just integrating the bzip2-tests source to the bzip2 recip=
e and not modifying any file so i think no need to add any License for it.<=
br>
<br>
<br>
Now patch will look like <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
@@ -46,6 +46,7 @@ runtest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample2 decompress&quot;;=
 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp sample3.tst sample3.ref; then echo &quo=
t;PASS: sample3 decompress&quot;;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample3 decompress&quot;;=
 fi<br>
+ =C2=A0 =C2=A0 =C2=A0 ./bzip2-tests/run-tests.sh --tests-dir=3D&quot;$(PWD=
)/bzip2-tests&quot;<br>
=C2=A0<br>
=C2=A0install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed =C2=A0-n &#39;/^runtest:/,/^install-ptest:/=
{/^install-ptest:/!p}&#39; \<br>
@@ -56,6 +57,7 @@ install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample1.bz2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(DESTDIR)/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample2.bz2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(DESTDIR)/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample3.bz2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(DESTDIR)/<br>
+ =C2=A0 =C2=A0 =C2=A0 cp -rf $(srcdir)/../git =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(DESTDIR)/bzip2-tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s $(bindir)/bzip2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(DESTDIR)/bzip2<br>
=C2=A0<br>
=C2=A0install-exec-hook:<br>
diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" =
target=3D"_blank">bzip2_1.0.8.bb</a> b/meta/recipes-extended/bzip2/<a href=
=3D"http://bzip2_1.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>
index d58f553..c5aa690 100644<br>
--- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=
=3D"_blank">bzip2_1.0.8.bb</a><br>
+++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=
=3D"_blank">bzip2_1.0.8.bb</a><br>
@@ -8,13 +8,17 @@ LICENSE =3D &quot;bzip2-1.0.6&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;beginline=3D4;endline=3D=
37;md5=3D600af43c50f1fcb82e32f19b32df4664</a>&quot;<br>
=C2=A0<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/$%7bBPN%7d/$%=
7bBPN%7d-$%7bPV%7d.tar.gz" target=3D"_blank">https://sourceware.org/pub/${B=
PN}/${BPN}-${PV}.tar.gz</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://sourceware.org=
/git/bzip2-tests.git;name=3Dbzip2-tests" target=3D"_blank">sourceware.org/g=
it/bzip2-tests.git;name=3Dbzip2-tests</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://configur=
e.ac" target=3D"_blank">configure.ac</a>;subdir=3D${BP} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am;subdir=3D${BP}=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f7500d0e5&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d3f0fa90e381da478ddae40591=
8153cca248e682cd0c4a2269&quot;<br>
=C2=A0<br>
+SRCREV_bzip2-tests =3D &quot;f9061c030a25de5b6829e1abf373057309c734c0&quot=
; =C2=A0<b>&lt;&lt; this commit Id includes latest charges for ptest infras=
truct.</b><br>
+<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.sourceware.org/pu=
b/bzip2/" target=3D"_blank">https://www.sourceware.org/pub/bzip2/</a>&quot;=
<br>
=C2=A0<br>
=C2=A0PACKAGES =3D+ &quot;libbz2&quot;<br>
@@ -39,7 +43,7 @@ do_install_ptest () {<br>
=C2=A0<br>
=C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
=C2=A0<br>
-RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
=C2=A0<br>
=C2=A0PROVIDES_append_class-native =3D &quot; bzip2-replacement-native&quot=
;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
<br>
Kindly comment on it and feel free to point out, if i am wrong at any place=
.<br clear=3D"all">
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Verdana,sans-serif;color:=
rgb(11,83,148)"><u></u>=C2=A0<u></u></span></p>
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
<p class=3D"MsoNormal"><b><span style=3D"color:rgb(11,83,148)">Thanks &amp;=
 Regards,</span></b><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Software Engine=
er,Linux Solutions Engineering</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Group,Montavist=
a Software LLC</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(11,83,148)">Email Id: </spa=
n><span style=3D"font-size:10pt;color:rgb(11,83,148)"><a href=3D"mailto:rah=
ulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span><a href=3D"ht=
tps://plus.google.com/+CodeTwoSoftware" target=3D"_blank"><span style=3D"fo=
nt-size:10pt;font-family:Verdana,sans-serif;color:rgb(42,42,42)"><br>
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
<p class=3D"MsoNormal">On Fri, May 1, 2020 at 6:56 AM Randy MacLeod &lt;<a =
href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod=
@windriver.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:<br=
>
&gt; You need to first see from the failure page which configuration is <br=
>
&gt; failing, for example non-gpl3 is one such.<br>
&gt; <br>
&gt; Then you find that configuration in config.json. The below should <br>
&gt; hopefully be self-explanatory in how you should set up the build?<br>
&gt; <br>
&gt; |&quot;non-gpl3&quot; : { &quot;NEEDREPOS&quot; : [&quot;poky&quot;, &=
quot;meta-gplv2&quot;], &quot;MACHINE&quot; : <br>
&gt; &quot;qemux86&quot;, &quot;BBTARGETS&quot; : &quot;core-image-minimal =
core-image-full-cmdline&quot;, <br>
&gt; &quot;extravars&quot; : [ &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#=
39;&quot;, &quot;WARN_QA_remove =3D <br>
&gt; &#39;incompatible-license&#39;&quot; ], &quot;EXTRACMDS&quot; : [ <br>
&gt; &quot;../../yocto-autobuilder-helper/scripts/check-gplv3&quot; ] },<br=
>
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
=3D"_blank">format.pl</a>, a perl script...<br>
<br>
Then we need to figure out how to deal with the GPLv3 issue.<br>
<br>
The buildbot output can be tedious to figure out. I haven&#39;t really<br>
spent enough time plugging away at it to be proficient yet either.<br>
Have you been able to reproduce the problems that Richard reported?<br>
If not, and you&#39;ve tried for a bit, then just say so and I&#39;ll try t=
o<br>
help tomorrow or early next week.<br>
<br>
It looks like you are packaging the test code/data with the main package <b=
r>
not in bzip2-ptest. Have a look at:<br>
=C2=A0 =C2=A0 meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.44.b=
b" target=3D"_blank">libpcre_8.44.bb</a><br>
for an example. There are many more.<br>
Also, if you look at oe-core.git:<br>
=C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN<br>
you can see many examples of sub-packages with different licenses<br>
than the main package. One example is:<br>
=C2=A0 =C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.b=
b" target=3D"_blank">gnutls_3.6.13.bb</a><br>
I hope that can address the buildbot problem but I haven&#39;t tried it<br>
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
&gt; On Mon, 27 Apr 2020 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahulk=
@mvista.com" target=3D"_blank">rahulk@mvista.com</a>
<br>
&gt; &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahu=
lk@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use the below=
 file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cg=
i/yocto-autobuilder-helper/tree/config.json" target=3D"_blank">http://git.y=
octoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json</a>=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0did you mean to say that i have to set MACRO in loc=
al.conf based on<br>
&gt;=C2=A0 =C2=A0 =C2=A0this file.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*Thanks &amp; Regards,*<br>
&gt;=C2=A0 =C2=A0 =C2=A0Rahul Kumar<br>
&gt;=C2=A0 =C2=A0 =C2=A0Software Engineer,Linux Solutions Engineering<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group,Montavista Software LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0Email Id: <a href=3D"mailto:rahulk@mvista.com" targ=
et=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mvi=
sta.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://plus.google.com/+CodeTwoSoft=
ware" target=3D"_blank">https://plus.google.com/+CodeTwoSoftware</a>&gt;<br=
>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, Al=
exander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; You need to look at configurati=
ons defined here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.or=
g/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json" target=3D"_blank=
">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/c=
onfig.json</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; and replicate them locally. The=
n you can reproduce the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failures that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; the AB gets in those configurat=
ions.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That start of the failing logs on the=
 autobuilder also list out the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration options for that build.=
<br>
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

</blockquote></div>

--00000000000011832305a5feff9d--
