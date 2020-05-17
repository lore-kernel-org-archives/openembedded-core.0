Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.28075.1589743091159185447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 12:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=fAMRsLVl;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.50, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f50.google.com with SMTP id k12so7177326wmj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMFeON3Vyj1cFA7lCfhssbuRUNkVpkgIpix9JTRw2j0=;
        b=fAMRsLVlL8Fj2ShSh/Z35vqYwZO2GwhIsVqUXeE/dNEOjDWr1iX6p/qYCZGvFZWOGn
         3nl/bANgx3q3gYGDms2GHn2bL7Kabygh5O8ouwUX22bnXDbrn0e98s83ujJmraZeQ/rw
         i5YjL+PhPeDBIkyHdGinaeqZe3uuUBvTuIS3UYYHze4ED6HLX+LIAqcT3q2chjvTMFuC
         HtYPVjWWrcsjAzWMBwvuggWK9Sl1T7x6bB+2wZI6ZEDvKd6bBzJlhn31BmV+ACKB/06k
         1E5XpfifiOZUyiY3hw+xWxCUyB8MGKlkPUGvL0vilyh+DFRIg0/XBhYJShg2s0Yb9S0+
         CPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMFeON3Vyj1cFA7lCfhssbuRUNkVpkgIpix9JTRw2j0=;
        b=VVOisKAOxy7QiAPN93t4IIAWVAbrOebwi6uNrC97c3CRtCJwi2n+DFcihYg8Vy/1dv
         MEYpRbinP2dVNHBM2f+5sqE1+KxUUuFo/pWwJSOWM5bC6AAVFw0TLa/LLylqIEdBIRLo
         iQ0JFWfFcJ+6Y+Y7thT9fEGGbo5lNnobsfrDmp74Mvs4sO1yQEIffzrJTrAObh0WOOlK
         kZ1Inoi81wwW/mPMYp1hdAHVTtiFXLnvBEJNvhroROEWttNjEDV0/Fn2Ba+POosorova
         cpg6xdtEe4qoofA6bX1G9LrarZZr6xFS+wEXBuXPEjQrWDQi5Vpi4LXSDObeKl4fPElj
         cXNw==
X-Gm-Message-State: AOAM530UsrYTUxW00sOPQLuwAebacnnvMFNOxJ0om7QocgglT8nHtNOf
	O9T5/gauOmlDlZw59oP5ukLnU99Eo6/2bnCJJsRgaA==
X-Google-Smtp-Source: ABdhPJwcsUg0sT4wruuXDV0axWmQG/SlzoTro22YQ2fV7nd+KqG1U1M41EeGbwH5EFyGgYcnZ0h0xl2lH4SJn2pFc/I=
X-Received: by 2002:a1c:8148:: with SMTP id c69mr15721235wmd.144.1589743089665;
 Sun, 17 May 2020 12:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com> <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
In-Reply-To: <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Mon, 18 May 2020 00:47:58 +0530
Message-ID: <CANv91vM-SuevnLi--bKzyON3z6YuXUMHUjCc70PKa41woypmTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000024ddff05a5dce818"

--00000000000024ddff05a5dce818
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

patch has been accepted by bzip2 community with additional changes.
https://sourceware.org/git/?p=bzip2-tests.git;a=commit;h=f9061c030a25de5b6829e1abf373057309c734c0

So I need your suggestion with respect to Yocto.

Since required changes for ptest infrastructure is integrated to the
bzip2-tests.git source code.
So now we can just change the SRCREV with the latest commit instead of
applying the patch to the bzip2-tests.git source code.

And since we are just integrating the bzip2-tests source to the bzip2
recipe and not modifying any file so i think no need to add any License for
it.


Now patch will look like
=====================================================================
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -46,6 +46,7 @@ runtest:
        else echo "FAIL: sample2 decompress"; fi
        @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
decompress";\
        else echo "FAIL: sample3 decompress"; fi
+       ./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"

 install-ptest:
        sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
@@ -56,6 +57,7 @@ install-ptest:
        cp $(srcdir)/sample1.bz2        $(DESTDIR)/
        cp $(srcdir)/sample2.bz2        $(DESTDIR)/
        cp $(srcdir)/sample3.bz2        $(DESTDIR)/
+       cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
        ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2

 install-exec-hook:
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index d58f553..c5aa690 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -8,13 +8,17 @@ LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM =
"file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"

 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            "
+
 SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] =
"ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"

+SRCREV_bzip2-tests = "f9061c030a25de5b6829e1abf373057309c734c0"  *<< this
commit Id includes latest charges for ptest infrastruct.*
+
 UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"

 PACKAGES =+ "libbz2"
@@ -39,7 +43,7 @@ do_install_ptest () {

 FILES_libbz2 = "${libdir}/lib*${SOLIBS}"

-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make bash"

 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
=================================================================================

Kindly comment on it and feel free to point out, if i am wrong at any place.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Fri, May 1, 2020 at 6:56 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> > You need to first see from the failure page which configuration is
> > failing, for example non-gpl3 is one such.
> >
> > Then you find that configuration in config.json. The below should
> > hopefully be self-explanatory in how you should set up the build?
> >
> > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"], "MACHINE" :
> > "qemux86", "BBTARGETS" : "core-image-minimal core-image-full-cmdline",
> > "extravars" : [ "INCOMPATIBLE_LICENSE = '*GPLv3'", "WARN_QA_remove =
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
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
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
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json
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

--00000000000024ddff05a5dce818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Randy,<br><br>patch has been accepted by bzip2=
 community with additional changes.<br><a href=3D"https://sourceware.org/gi=
t/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c030a25de5b6829e1abf373057309c73=
4c0">https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dcommit;h=3Df9061c0=
30a25de5b6829e1abf373057309c734c0</a><br></div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>So I need your =
suggestion with respect to Yocto.<br><br>Since required changes for ptest i=
nfrastructure is integrated to the bzip2-tests.git source code.<br>So now w=
e can just change the SRCREV with the latest commit instead of applying the=
 patch to the bzip2-tests.git source code.<br><br>And since we are just int=
egrating the bzip2-tests source to the bzip2 recipe and not modifying any f=
ile so i think no need to add any License for it.<br><br><br>Now patch will=
 look like <br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>+++ b/meta/r=
ecipes-extended/bzip2/bzip2/Makefile.am<br>@@ -46,6 +46,7 @@ runtest:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else echo &quot;FAIL: sample2 decompress&quot;=
; fi<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp sample3.tst sample3.ref; then e=
cho &quot;PASS: sample3 decompress&quot;;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
lse echo &quot;FAIL: sample3 decompress&quot;; fi<br>+ =C2=A0 =C2=A0 =C2=A0=
 ./bzip2-tests/run-tests.sh --tests-dir=3D&quot;$(PWD)/bzip2-tests&quot;<br=
>=C2=A0<br>=C2=A0install-ptest:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed =C2=A0-n=
 &#39;/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}&#39; \<br>@@ -56,6=
 +57,7 @@ install-ptest:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample=
1.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cp $(srcdir)/sample2.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/<br>=C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 cp $(srcdir)/sample3.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$=
(DESTDIR)/<br>+ =C2=A0 =C2=A0 =C2=A0 cp -rf $(srcdir)/../git =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 $(DESTDIR)/bzip2-tests<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s =
$(bindir)/bzip2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/bzip2<br>=C2=
=A0<br>=C2=A0install-exec-hook:<br>diff --git a/meta/recipes-extended/bzip=
2/<a href=3D"http://bzip2_1.0.8.bb">bzip2_1.0.8.bb</a> b/meta/recipes-exten=
ded/bzip2/<a href=3D"http://bzip2_1.0.8.bb">bzip2_1.0.8.bb</a><br>index d58=
f553..c5aa690 100644<br>--- a/meta/recipes-extended/bzip2/<a href=3D"http:/=
/bzip2_1.0.8.bb">bzip2_1.0.8.bb</a><br>+++ b/meta/recipes-extended/bzip2/<a=
 href=3D"http://bzip2_1.0.8.bb">bzip2_1.0.8.bb</a><br>@@ -8,13 +8,17 @@ LIC=
ENSE =3D &quot;bzip2-1.0.6&quot;<br>=C2=A0LIC_FILES_CHKSUM =3D &quot;file:/=
/LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664&=
quot;<br>=C2=A0<br>=C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.or=
g/pub/${BPN}/${BPN}-${PV}.tar.gz">https://sourceware.org/pub/${BPN}/${BPN}-=
${PV}.tar.gz</a> \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D=
"http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests">sourceware.o=
rg/git/bzip2-tests.git;name=3Dbzip2-tests</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 file://<a href=3D"http://configure.ac">configure.ac</a>;=
subdir=3D${BP} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefi=
le.am;subdir=3D${BP} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
run-ptest \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>+<br>=C2=
=
=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f7500d0e5&quot;<br>=C2=
=
=A0SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d3f0fa90e381da478ddae4059181=
53cca248e682cd0c4a2269&quot;<br>=C2=A0<br>+SRCREV_bzip2-tests =3D &quot;f90=
61c030a25de5b6829e1abf373057309c734c0&quot; =C2=A0<b>&lt;&lt; this commit I=
d includes latest charges for ptest infrastruct.</b><br>+<br>=C2=A0UPSTREAM=
_CHECK_URI =3D &quot;<a href=3D"https://www.sourceware.org/pub/bzip2/">http=
s://www.sourceware.org/pub/bzip2/</a>&quot;<br>=C2=A0<br>=C2=A0PACKAGES =3D=
+ &quot;libbz2&quot;<br>@@ -39,7 +43,7 @@ do_install_ptest () {<br>=C2=A0<b=
r>=C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>=C2=A0<br>-=
RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>+RDEPENDS_${PN}-ptest +=3D &q=
uot;make bash&quot;<br>=C2=A0<br>=C2=A0PROVIDES_append_class-native =3D &qu=
ot; bzip2-replacement-native&quot;<br>=C2=A0BBCLASSEXTEND =3D &quot;native =
nativesdk&quot;<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>Kindly comment on it =
and feel free to point out, if i am wrong at any place.<br clear=3D"all"></=
div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;co=
lor:#0b5394"><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><span style=3D"color:rgb(111,168,220)">	=09
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
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 1,=
 2020 at 6:56 AM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windrive=
r.com">randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 2020-04-27 3:39 p.m., Alexander Kanavi=
n wrote:<br>
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
=C2=A0 =C2=A0 README.XML.STUFF:It uses <a href=3D"http://format.pl" rel=3D=
"noreferrer" target=3D"_blank">format.pl</a>, a perl script...<br>
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
bb" rel=3D"noreferrer" target=3D"_blank">libpcre_8.44.bb</a><br>
for an example. There are many more.<br>
Also, if you look at oe-core.git:<br>
=C2=A0 =C2=A0 $ rgrep LICENSE_ *=C2=A0 | grep PN<br>
you can see many examples of sub-packages with different licenses<br>
than the main package. One example is:<br>
=C2=A0 =C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.=
bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.6.13.bb</a><br>
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
k@mvista.com" target=3D"_blank">rahulk@mvista.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rah=
ulk@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Richard/Alexander,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I am not able to understand how I can use the belo=
w file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/yocto-autobuilder-helper/tree/config.json" rel=3D"noreferrer" target=3D"=
_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/=
tree/config.json</a><br>
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
tware" rel=3D"noreferrer" target=3D"_blank">https://plus.google.com/+CodeTw=
oSoftware</a>&gt;<br>
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
rg/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json" rel=3D"noreferr=
er" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autob=
uilder-helper/tree/config.json</a><br>
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
# Wind River Linux<br>
</blockquote></div>

--00000000000024ddff05a5dce818--
