Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A63C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 16:49:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.15927.1654793335138542469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RgZwUrmI;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso7193781wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dr4zblyC45/9+MovPT1IOgBhchjWWuts5KuYoHAVAss=;
        b=RgZwUrmIg6HuqeCy6RJkj7u3Pog22K569Y13YMo505EVpCWUB79olui0YuA8KzRn2S
         mNOScZJ+QfUb1hqw+oBwNYF7hyp/fCvrrRDEm7CSHkmF4e8WhpEBrapVHkZo0/CBEnwH
         6zwtwyunRhg2+2bNFnKzkJkcdK3pOFwY+KgJNdFrYLITmeKhq4ur9usgIWRpNy18B9aN
         pZUPK/JGQtQewZ1TOCm1/Oi/Pp7GO7X0zrteqFSPq1LJP1/QfwGnbXbXfaCV1rEa8V5+
         tYfTYei815yrskIvrQdN6iaWV5xFZlAtm6YjTQkBNlftQxBh16iZ2ZyjLrdsAd01pXhC
         X9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dr4zblyC45/9+MovPT1IOgBhchjWWuts5KuYoHAVAss=;
        b=HIE1Lwrz3E9Kp8qkq9BiYPggF9ZqhMumY2EyivpmW62Bi+v9ilvHYXNG29AyNzIXbQ
         KQMmOJjrnqcpzeM1iPemTQDN1+mKdwNXHLMW2aXzEpUVmjHM4HRVKFNGrSQC0XKi1+5z
         Rj7JhJihsaWZbiC/KbPYjNEoip8azc2uBf+454uvXH9Tb8VCcjhuLyQ9hDydhyYHml95
         u1N2RgU2n2eSfVbsqk97VG+g3YedTQp3qbmLA22Ksh4KMXNewsTGJlSww380b+JlcYDE
         QftYfQgs4vOwbgNlwA7N16s0JMECJNUv1o9nmupamYDK7mm/3vbRifj4UgYjsZcqRqUy
         RtPg==
X-Gm-Message-State: AOAM533oAThvT/AdzVjcSeCyySDuFTtYw+ro1KlGWsS08NgwhKq6SVdD
	Y+n+ypRCWcRiBkfxsx5YQu//qtUCUbf8b5T3G5c=
X-Google-Smtp-Source: 
 ABdhPJzusYe2t+SscEyIs2G9G+w5OYK+U1PDSNkR3Qy3L7UwDfJk6BDD2/LGm5CKRKqY+FmUqjRkJK0PQ4YPK7lUA4c=
X-Received: by 2002:a05:600c:3386:b0:39c:5b81:af9e with SMTP id
 o6-20020a05600c338600b0039c5b81af9emr4235893wmp.2.1654793333464; Thu, 09 Jun
 2022 09:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220606120126.3381438-1-alex@linutronix.de>
 <20220606120126.3381438-18-alex@linutronix.de>
 <CA+chaQfAtrfQttR6rEVgMCV7CrXzRDUyVcW=ujFSc9uic-3CFQ@mail.gmail.com>
 <f5cea24f326b0450d8c5ae14a1edb8a10b2526d1.camel@linuxfoundation.org>
In-Reply-To: 
 <f5cea24f326b0450d8c5ae14a1edb8a10b2526d1.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Jun 2022 18:48:39 +0200
Message-ID: 
 <CA+chaQc2xSfFs76n8irHMR1J1cM_uDQRMRkfT5mF2LUO=QnSww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/21] perl: update 5.34.1 -> 5.36.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000d164b805e1069839"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 16:49:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166786

--000000000000d164b805e1069839
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was reading
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13244
and your e-mail about the make issue in perl, but in my case it looks a bit
different I think.

It was with the make-native dependency, but happens only in
selftest test_ccache_tool:

2022-06-09 11:30:21,855 - oe-selftest - INFO - test_ccache_tool
(buildoptions.ImageOptionsTests.test_ccache_tool)
2022-06-09 12:53:41,855 - oe-selftest - INFO - Keepalive message
2022-06-09 14:17:01,856 - oe-selftest - INFO - Keepalive message
2022-06-09 15:40:21,856 - oe-selftest - INFO - Keepalive message
^^ was what triggered me to look where it got stuck.

I can build perl-native fine in my other oe-core nodistro build directory
and now I've built it ok also in regular poky build directory as in:
5f249a407f6 vim: put xxd in its own package

While the selftest was stuck I was checking where exactly it got stuck in
the WORKDIR and
oe_runmake -j 1 installman
'DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0=
-r0/image'
install 2>&1 | tee installman.log
finished fine, while:
oe_runmake -j 2 installman
'DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0=
-r0/image'
install 2>&1  | tee installman.log
was getting stuck:

....
Generating a Unix-style Makefile
Writing Makefile for Sys::Hostname
cd ext/XS-Typemap/ && ../../miniperl_top -I../../lib Makefile.PL \
 INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
 PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
Generating a Unix-style Makefile
Writing Makefile for XS::APItest
Generating a Unix-style Makefile
Writing Makefile for XS::Typemap

With -n, it looks like it got stuck just before building buildtoc:

....
cd ext/XS-APItest/ && ../../miniperl_top -I../../lib Makefile.PL \
 INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
 PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
cd ext/XS-Typemap/ && ../../miniperl_top -I../../lib Makefile.PL \
 INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \
 PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.0 PERL=3D"../../miniperl_top"
./miniperl_top -f pod/buildtoc -q
./miniperl_top installman
--destdir=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.=
0-r0/image

make[1]: Leaving directory
'/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-5=
.36.0'

It didn't start miniperl_top (which itself works fine):
martin@jama
/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-5.=
36.0
$ ./miniperl_top -f pod/buildtoc -q
martin@jama
/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-5.=
36.0
$ echo $?
0

martin   3016692  0.0  0.0  99860  2788 ?        S    17:47   0:00 make -j
40
DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-=
r0/image
install
martin   3016738 99.9  0.0 101440  4184 ?        R    17:47  56:21 make
install.man

Attaching to process 3016738
Reading symbols from
/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/recipe-=
sysroot-native/usr/bin/make...
(No debugging symbols found in
/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/recipe-=
sysroot-native/usr/bin/make)
Reading symbols from
/OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6..=
.
Reading symbols from
/OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/libc=
.so.6...
Reading symbols from
/OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x8=
6-64.so.2...
Reading symbols from
/OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/ld-l=
inux-x86-64.so.2...
(No debugging symbols found in
/OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/ld-l=
inux-x86-64.so.2)
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib64/libthread_db.so.1".
0x000055c946453a1f in ?? ()
(gdb) bt
#0  0x000055c946453a1f in ?? ()
#1  0x000055c946452bf3 in ?? ()
#2  0x000055c946453b98 in ?? ()
#3  0x000055c946452bf3 in ?? ()
#4  0x000055c946453b98 in ?? ()
#5  0x000055c946452bf3 in ?? ()
#6  0x000055c946453b98 in ?? ()
#7  0x000055c946452bf3 in ?? ()
#8  0x000055c946453b98 in ?? ()
#9  0x000055c946452bf3 in ?? ()
#10 0x000055c946453fd6 in update_goal_chain ()
#11 0x000055c946438df3 in main ()
(gdb)

I've reproduced this twice today, so I was assuming it's just new separate
issue from new perl version - that's why I was asking if someone else is
seeing this behavior now.

I'll try to reproduce this with ccache enabled in regular build (I normally
don't use poky nor selftest). If it fails again, I'll enable debug for
make-native (or switch back to make-4.3 from gentoo).

Regards,

On Thu, Jun 9, 2022 at 6:21 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-06-09 at 14:44 +0200, Martin Jansa wrote:
> > On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin <alex.kanavin@gmail.co=
m>
> wrote:
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../{perlcross_1.3.7.bb =3D> perlcross_1.4.bb}  |  2 +-
> > >  .../perl/files/perl-configpm-switch.patch     |  2 +-
> > >  .../perl/files/perl-dynloader.patch           |  2 +-
> > >  .../perl/files/perl-rdepends.txt              | 49 ++++++++++++-----=
--
> > >  .../perl/{perl_5.34.1.bb =3D> perl_5.36.0.bb}   |  2 +-
> > >  5 files changed, 35 insertions(+), 22 deletions(-)
> > >  rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb =3D>
> perlcross_1.4.bb} (92%)
> > >  rename meta/recipes-devtools/perl/{perl_5.34.1.bb =3D> perl_5.36.0.b=
b}
> (99%)
> > >
> >
> >
> > Have anyone else seen perl.do_install getting stuck with this new shiny
> version as well?
> >
> >  690770 martin      20   0 10020  3700  3196 S   0.0  0.0  0:00.00 =E2=
=94=82
>    =E2=94=94=E2=94=80 /bin/sh
> /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/temp/=
run.do_install.690768
> >  690771 martin      20   0 99860  1948  1364 S   0.0  0.0  0:00.00 =E2=
=94=82
>       =E2=94=94=E2=94=80 make -j 40
> DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.=
0-r0/image
> install
> >  690816 martin      20   0   99M  3340  1428 R 102.1  0.0  3h06:44 =E2=
=94=82
>          =E2=94=94=E2=94=80 make install.man
>
> I've seen perl and the kernel hang in make for some versions, I did try
> and put a warning about the known Fedora issue. Was this with the
> recent make-native dependency added? If so that would indicate it is
> potentially a bug in the current make version :(
>
> Cheers,
>
> Richard
>
>

--000000000000d164b805e1069839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was reading<div><a href=3D"https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D14096">https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D14096</a><br></div><div><a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D13244">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D13244</a><br></div><div>and your e-mail about the make issue in perl, bu=
t in my case it looks a bit different I think.</div><div><br></div><div>It =
was with the make-native dependency, but happens only in selftest=C2=A0test=
_ccache_tool:</div><div><br></div><div>2022-06-09 11:30:21,855 - oe-selftes=
t - INFO - test_ccache_tool (buildoptions.ImageOptionsTests.test_ccache_too=
l)<br>2022-06-09 12:53:41,855 - oe-selftest - INFO - Keepalive message<br>2=
022-06-09 14:17:01,856 - oe-selftest - INFO - Keepalive message<br>2022-06-=
09 15:40:21,856 - oe-selftest - INFO - Keepalive message<br>^^ was what tri=
ggered me to look where it got stuck.<br></div><div><br></div><div>I can bu=
ild perl-native fine in my other oe-core nodistro build directory and now I=
&#39;ve built it ok also in regular poky build directory as in:</div><div>5=
f249a407f6 vim: put xxd in its own package<br></div><div><br></div><div>Whi=
le the selftest was stuck I was checking where exactly it got stuck in the =
WORKDIR and</div><div>oe_runmake -j 1 installman &#39;DESTDIR=3D/OE/build/p=
oky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image&#39; install=
 2&gt;&amp;1=C2=A0| tee installman.log<br></div><div>finished fine, while:<=
/div><div>oe_runmake -j 2 installman &#39;DESTDIR=3D/OE/build/poky/build-st=
/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image&#39; install 2&gt;&amp;1=
=C2=A0=C2=A0| tee installman.log<br></div><div>was getting stuck:</div><div=
><br></div><div>....</div><div>Generating a Unix-style Makefile<br>Writing =
Makefile for Sys::Hostname<br>cd ext/XS-Typemap/ &amp;&amp; ../../miniperl_=
top -I../../lib Makefile.PL \<br>=C2=A0INSTALLDIRS=3Dperl INSTALLMAN1DIR=3D=
none INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.=
5.36.0 PERL=3D&quot;../../miniperl_top&quot;<br>Generating a Unix-style Mak=
efile<br>Writing Makefile for XS::APItest<br>Generating a Unix-style Makefi=
le<br>Writing Makefile for XS::Typemap<br></div><div><br></div><div>With -n=
, it looks like it got stuck just before building buildtoc:</div><div><br><=
/div><div>....</div><div>cd ext/XS-APItest/ &amp;&amp; ../../miniperl_top -=
I../../lib Makefile.PL \<br>=C2=A0INSTALLDIRS=3Dperl INSTALLMAN1DIR=3Dnone =
INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so.5.36.=
0 PERL=3D&quot;../../miniperl_top&quot;<br>cd ext/XS-Typemap/ &amp;&amp; ..=
/../miniperl_top -I../../lib Makefile.PL \<br>=C2=A0INSTALLDIRS=3Dperl INST=
ALLMAN1DIR=3Dnone INSTALLMAN3DIR=3Dnone \<br>=C2=A0PERL_CORE=3D1 LIBPERL_A=
=3Dlibperl.so.5.36.0 PERL=3D&quot;../../miniperl_top&quot;<br>./miniperl_to=
p -f pod/buildtoc -q<br>./miniperl_top installman --destdir=3D/OE/build/pok=
y/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image <br>make[1]: L=
eaving directory &#39;/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-na=
tive/5.36.0-r0/perl-5.36.0&#39;<br></div><div><br></div><div>It didn&#39;t =
start miniperl_top (which itself works fine):</div><div>martin@jama /OE/bui=
ld/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/perl-5.36.0 $ =
./miniperl_top -f pod/buildtoc -q<br>martin@jama /OE/build/poky/build-st/tm=
p/work/x86_64-linux/perl-native/5.36.0-r0/perl-5.36.0 $ echo $?<br>0<br></d=
iv><div><br></div><div>martin =C2=A0 3016692 =C2=A00.0 =C2=A00.0 =C2=A09986=
0 =C2=A02788 ? =C2=A0 =C2=A0 =C2=A0 =C2=A0S =C2=A0 =C2=A017:47 =C2=A0 0:00 =
make -j 40 DESTDIR=3D/OE/build/poky/build-st/tmp/work/x86_64-linux/perl-nat=
ive/5.36.0-r0/image install<br>martin =C2=A0 3016738 99.9 =C2=A00.0 101440 =
=C2=A04184 ? =C2=A0 =C2=A0 =C2=A0 =C2=A0R =C2=A0 =C2=A017:47 =C2=A056:21 ma=
ke install.man<br></div><div><br></div><div>Attaching to process 3016738<br=
>Reading symbols from /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-na=
tive/5.36.0-r0/recipe-sysroot-native/usr/bin/make...<br>(No debugging symbo=
ls found in /OE/build/poky/build-st/tmp/work/x86_64-linux/perl-native/5.36.=
0-r0/recipe-sysroot-native/usr/bin/make)<br>Reading symbols from /OE/build/=
poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6...<br>Readi=
ng symbols from /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux=
/lib/.debug/libc.so.6...<br>Reading symbols from /OE/build/poky/build-st/tm=
p/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2...<br>Reading sy=
mbols from /OE/build/poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/=
.debug/ld-linux-x86-64.so.2...<br>(No debugging symbols found in /OE/build/=
poky/build-st/tmp/sysroots-uninative/x86_64-linux/lib/.debug/ld-linux-x86-6=
4.so.2)<br>[Thread debugging using libthread_db enabled]<br>Using host libt=
hread_db library &quot;/usr/lib64/libthread_db.so.1&quot;.<br>0x000055c9464=
53a1f in ?? ()<br>(gdb) bt<br>#0 =C2=A00x000055c946453a1f in ?? ()<br>#1 =
=C2=A00x000055c946452bf3 in ?? ()<br>#2 =C2=A00x000055c946453b98 in ?? ()<b=
r>#3 =C2=A00x000055c946452bf3 in ?? ()<br>#4 =C2=A00x000055c946453b98 in ??=
 ()<br>#5 =C2=A00x000055c946452bf3 in ?? ()<br>#6 =C2=A00x000055c946453b98 =
in ?? ()<br>#7 =C2=A00x000055c946452bf3 in ?? ()<br>#8 =C2=A00x000055c94645=
3b98 in ?? ()<br>#9 =C2=A00x000055c946452bf3 in ?? ()<br>#10 0x000055c94645=
3fd6 in update_goal_chain ()<br>#11 0x000055c946438df3 in main ()<br>(gdb)<=
/div><div><br></div><div>I&#39;ve reproduced this twice today, so I was ass=
uming it&#39;s just new separate issue from new perl version - that&#39;s w=
hy I was asking if someone else is seeing this behavior now.</div><div><br>=
</div><div>I&#39;ll try to reproduce this with ccache enabled in regular bu=
ild (I normally don&#39;t use poky nor selftest). If it fails again, I&#39;=
ll enable debug for make-native (or switch back to make-4.3 from gentoo).<b=
r></div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 9, 2022 at 6:21 PM Ri=
chard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Thu, 2022-06-09 at 14:44 +0200, Martin Jan=
sa wrote:<br>
&gt; On Mon, Jun 6, 2022 at 2:02 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0.../{<a href=3D"http://perlcross_1.3.7.bb" rel=3D"noreferre=
r" target=3D"_blank">perlcross_1.3.7.bb</a> =3D&gt; <a href=3D"http://perlc=
ross_1.4.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.4.bb</a>}=C2=
=A0 |=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-configpm-switch.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-dynloader.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A0.../perl/files/perl-rdepends.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 49 ++++++++++++-------<br>
&gt; &gt; =C2=A0.../perl/{<a href=3D"http://perl_5.34.1.bb" rel=3D"noreferr=
er" target=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <a href=3D"http://perl_5.3=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.36.0.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt; &gt; =C2=A05 files changed, 35 insertions(+), 22 deletions(-)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/perl-cross/{<a href=3D"http://=
perlcross_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.7.bb=
</a> =3D&gt; <a href=3D"http://perlcross_1.4.bb" rel=3D"noreferrer" target=
=3D"_blank">perlcross_1.4.bb</a>} (92%)<br>
&gt; &gt; =C2=A0rename meta/recipes-devtools/perl/{<a href=3D"http://perl_5=
.34.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.34.1.bb</a> =3D&gt; <=
a href=3D"http://perl_5.36.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_=
5.36.0.bb</a>} (99%)<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Have anyone else seen perl.do_install getting stuck with this new shin=
y version as well?<br>
&gt; <br>
&gt; =C2=A0690770 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 10020 =C2=A03700 =
=C2=A03196 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E2=94=94=E2=94=80 /bin/sh /OE/build/poky/build-st/tmp/work/x86_6=
4-linux/perl-native/5.36.0-r0/temp/run.do_install.690768<br>
&gt; =C2=A0690771 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 99860 =C2=A01948 =
=C2=A01364 S =C2=A0 0.0 =C2=A00.0 =C2=A00:00.00 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =E2=94=94=E2=94=80 make -j 40 DESTDIR=3D/OE/build/poky/bu=
ild-st/tmp/work/x86_64-linux/perl-native/5.36.0-r0/image install<br>
&gt; =C2=A0690816 martin =C2=A0 =C2=A0 =C2=A020 =C2=A0 0 =C2=A0 99M =C2=A03=
340 =C2=A01428 R 102.1 =C2=A00.0 =C2=A03h06:44 =E2=94=82 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=80 make install.man=C2=A0<br=
>
<br>
I&#39;ve seen perl and the kernel hang in make for some versions, I did try=
<br>
and put a warning about the known Fedora issue. Was this with the<br>
recent make-native dependency added? If so that would indicate it is<br>
potentially a bug in the current make version :(<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000d164b805e1069839--

