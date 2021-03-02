Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.6134.1614676752219095330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 01:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BWMTkaze;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a9so6556720uat.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqrRHbP+SatAFKKgfqGee3QK1ylkV29OAhGf1+2ghqo=;
        b=BWMTkazeoy026h2bscV9tvjvd4SIovp1cgSIjHkBGHeZ2QfU29O3L2pXjFNyP+ivvR
         wQjIowAIj4MthifJfDDeptHw7DkG1EnWJgYmyOeCL8xuNOvPSAmg/DA/BcKHvC+0auyw
         1J2yk3MOmtLLchqI+WodZDWGTyeNVTuHMBG4IE/pfMAl0nomBaEBM3EhPG1rRaTfsSD4
         ExGQWpz8yQIrpVdvOPOZQOU1kiXPJGlXpkhyY6PucnDZhpxVlpnI69y6ORYgVcOms4AX
         c4uMKi09KFwATkQ8QMzGFBZiymHlLN6qLOxUFPtczrtzY5TlbByTA3kAOzJMq138+NH8
         cGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqrRHbP+SatAFKKgfqGee3QK1ylkV29OAhGf1+2ghqo=;
        b=uZ1fIhZvoAN0b79ixZ8fCt5pbt794i265w9S13K5lRgBgkIDJXKgHaudxWv8rMl077
         awY4jXIW1KvzaYw8gdbWlAJIzUm+sX0EtzG5pqFq1RGW9dAswnDUEX9UWK/PdkX43lrN
         PweV8v1YyJf6SuVvXcXxH8BsJ/pKrPJstnlZHddvnVKmSuZ9guqkfLu9RU8szUUaCiIf
         GBnssrR3+76tEs4ej8Ev7GqqrwTdPHwKjcFBtL2Ll8+Aoa/bRuYA4ELSOTqeSgChUaWb
         3vf0OzesMWkeQqTMfTtTegvjNVqvmtHnlRQOqcVz2iIwW3fuXbLZZRjQCPsjGWyzNb7H
         0KyQ==
X-Gm-Message-State: AOAM533xFAkOL2j9ZifPXpohtwtKy6eHE1xls1oSw5ajONUJe7fvakX3
	FewDZpg9vKVMZU7y/soe6Eg1T1bKydVDQ7VSAas=
X-Google-Smtp-Source: ABdhPJy3fnCyEbv8Xa5GeRNcDTh13RO7aQNN4+O7hLQKwIk94mfo7OvFeewDUv0gKmrt1IDEJIut89N56Pzy4NHP9ak=
X-Received: by 2002:ab0:29d2:: with SMTP id i18mr5924679uaq.71.1614676751216;
 Tue, 02 Mar 2021 01:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-11-alex.kanavin@gmail.com> <CAMKF1sqm_E3Yc46E9D6+hFo3KWEhJ1n8hY02Dn9YY0yixZiDUg@mail.gmail.com>
 <CAMKF1spZBYs96j5oh91H4_f1BauF__Fu7RZf6LbeqhvcSwrxHA@mail.gmail.com>
In-Reply-To: <CAMKF1spZBYs96j5oh91H4_f1BauF__Fu7RZf6LbeqhvcSwrxHA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Mar 2021 10:19:00 +0100
Message-ID: <CANNYZj96eu6_Q86rK5Epu4onFdMVCr1eo9=XvJfSchrP63bKNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/24] perl: update 5.32.0 -> 5.32.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002ef35005bc8a3aaa"

--0000000000002ef35005bc8a3aaa
Content-Type: text/plain; charset="UTF-8"

Yes, I was surprised as well this change happened in a point release, but
couldn't find the specific setting to revert it. 'perl -I .' works as well.

Alex

On Mon, 1 Mar 2021 at 23:41, Khem Raj <raj.khem@gmail.com> wrote:

> it would be good to mention it in notes that you might need  to export
> PERL_USE_UNSAFE_INC = "1"
> if a perl module still relies on using unsafe include dirs like ( . )
> etc. Otherwise this change can break happy users.
>
>
> On Mon, Mar 1, 2021 at 12:03 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > seeing few failures
> >
> > https://errors.yoctoproject.org/Errors/Build/117607/
> >
> > On Sun, Feb 28, 2021 at 7:37 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Drop perl-cross-makefile.patch as it is merged upstream.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  .../perl/files/perl-cross-makefile.patch      | 29 -------------------
> > >  .../perl/{perl_5.32.0.bb => perl_5.32.1.bb}   |  7 ++---
> > >  2 files changed, 3 insertions(+), 33 deletions(-)
> > >  delete mode 100644
> meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> > >  rename meta/recipes-devtools/perl/{perl_5.32.0.bb => perl_5.32.1.bb}
> (98%)
> > >
> > > diff --git
> a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> > > deleted file mode 100644
> > > index 5d3f998200..0000000000
> > > --- a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
> > > +++ /dev/null
> > > @@ -1,29 +0,0 @@
> > > -Makefile: Avoid continual rebuilds of miniperl and associated races
> > > -
> > > -In the Yocto Project, when we run "make install" we notice miniperl
> > > -rebuilding multiple times. Usually this is harmless however sometimes
> > > -race issues occur such as miniperl not being executable.
> > > -
> > > -The issue is that crosspatch is a phony target so it always rebuilds.
> > > -Adding this as a dependency of miniperl means miniperl always rebuilds
> > > -too.
> > > -
> > > -Avoid this by injecting a direct dependency avoiding the phony target.
> > > -miniperl is then only rebuilt when its input changes as desired.
> > > -
> > > -Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
> > > -Upstream-Status: Submitted [
> https://github.com/arsv/perl-cross/pull/95]
> > > -
> > > -Index: perl-5.32.0/Makefile
> > > -===================================================================
> > > ---- perl-5.32.0.orig/Makefile
> > > -+++ perl-5.32.0/Makefile
> > > -@@ -56,7 +56,7 @@ crosspatch: $(CROSSPATCHED)
> > > -
> > > - # A minor fix for buildroot, force crosspatching when running "make
> perl modules"
> > > - # instead of "make all".
> > > --miniperlmain$O: crosspatch
> > > -+miniperlmain$O: $(CROSSPATCHED)
> > > -
> > > - # Original versions are not saved anymore; patch generally takes
> care of this,
> > > - # and if that fails, reaching for the source tarball is the safest
> option.
> > > diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb
> b/meta/recipes-devtools/perl/perl_5.32.1.bb
> > > similarity index 98%
> > > rename from meta/recipes-devtools/perl/perl_5.32.0.bb
> > > rename to meta/recipes-devtools/perl/perl_5.32.1.bb
> > > index 7d88c65322..1fafc0a8c9 100644
> > > --- a/meta/recipes-devtools/perl/perl_5.32.0.bb
> > > +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> > > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
> "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
> > >
> > >
> > >  SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> > > -
> https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.tar.gz;name=perl-cross
> \
> > > +
> https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross
> \
> > >             file://perl-rdepends.txt \
> > >
>  file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> > >
>  file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
> > > @@ -21,7 +21,6 @@ SRC_URI = "
> https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
> > >
>  file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
> > >             file://0002-Constant-Fix-up-shebang.patch \
> > >             file://determinism.patch  \
> > > -           file://perl-cross-makefile.patch \
> > >             "
> > >  SRC_URI_append_class-native = " \
> > >             file://perl-configpm-switch.patch \
> > > @@ -30,8 +29,8 @@ SRC_URI_append_class-target = " \
> > >             file://encodefix.patch \
> > >  "
> > >
> > > -SRC_URI[perl.sha256sum] =
> "efeb1ce1f10824190ad1cadbcccf6fdb8a5d37007d0100d2d9ae5f2b5900c0b4"
> > > -SRC_URI[perl-cross.sha256sum] =
> "755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba"
> > > +SRC_URI[perl.sha256sum] =
> "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
> > > +SRC_URI[perl-cross.sha256sum] =
> "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
> > >
> > >  S = "${WORKDIR}/perl-${PV}"
> > >
> > > --
> > > 2.29.2
> > >
> > >
> > > 
> > >
>

--0000000000002ef35005bc8a3aaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I was surprised as well this change happened in =
a point release, but couldn&#39;t find the specific setting to revert it. &=
#39;perl -I .&#39; works as well.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 1 Mar 2021 at 23:41, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">it would be good to mention it in notes that you might=
 need=C2=A0 to export<br>
PERL_USE_UNSAFE_INC =3D &quot;1&quot;<br>
if a perl module still relies on using unsafe include dirs like ( . )<br>
etc. Otherwise this change can break happy users.<br>
<br>
<br>
On Mon, Mar 1, 2021 at 12:03 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; seeing few failures<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/117607/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/B=
uild/117607/</a><br>
&gt;<br>
&gt; On Sun, Feb 28, 2021 at 7:37 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop perl-cross-makefile.patch as it is merged upstream.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../perl/files/perl-cross-makefile.patch=C2=A0 =C2=A0 =C2=
=A0 | 29 -------------------<br>
&gt; &gt;=C2=A0 .../perl/{<a href=3D"http://perl_5.32.0.bb" rel=3D"norefer=
rer" target=3D"_blank">perl_5.32.0.bb</a> =3D&gt; <a href=3D"http://perl_5.=
32.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a>}=C2=A0 =C2=
=
=A0|=C2=A0 7 ++---<br>
&gt; &gt;=C2=A0 2 files changed, 3 insertions(+), 33 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/perl/files/perl-c=
ross-makefile.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/perl/{<a href=3D"http://perl_=
5.32.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.0.bb</a> =3D&gt; =
<a href=3D"http://perl_5.32.1.bb" rel=3D"noreferrer" target=3D"_blank">perl=
_5.32.1.bb</a>} (98%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/perl/files/perl-cross-makefil=
e.patch b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 5d3f998200..0000000000<br>
&gt; &gt; --- a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch=
<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,29 +0,0 @@<br>
&gt; &gt; -Makefile: Avoid continual rebuilds of miniperl and associated r=
aces<br>
&gt; &gt; -<br>
&gt; &gt; -In the Yocto Project, when we run &quot;make install&quot; we n=
otice miniperl<br>
&gt; &gt; -rebuilding multiple times. Usually this is harmless however som=
etimes<br>
&gt; &gt; -race issues occur such as miniperl not being executable.<br>
&gt; &gt; -<br>
&gt; &gt; -The issue is that crosspatch is a phony target so it always reb=
uilds.<br>
&gt; &gt; -Adding this as a dependency of miniperl means miniperl always r=
ebuilds<br>
&gt; &gt; -too.<br>
&gt; &gt; -<br>
&gt; &gt; -Avoid this by injecting a direct dependency avoiding the phony =
target.<br>
&gt; &gt; -miniperl is then only rebuilt when its input changes as desired=
.<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Richard Purdie <a href=3D"mailto:richard.purdie@=
linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</=
a><br>
&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/arsv/=
perl-cross/pull/95" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/arsv/perl-cross/pull/95</a>]<br>
&gt; &gt; -<br>
&gt; &gt; -Index: perl-5.32.0/Makefile<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; ---- perl-5.32.0.orig/Makefile<br>
&gt; &gt; -+++ perl-5.32.0/Makefile<br>
&gt; &gt; -@@ -56,7 +56,7 @@ crosspatch: $(CROSSPATCHED)<br>
&gt; &gt; -<br>
&gt; &gt; - # A minor fix for buildroot, force crosspatching when running =
&quot;make perl modules&quot;<br>
&gt; &gt; - # instead of &quot;make all&quot;.<br>
&gt; &gt; --miniperlmain$O: crosspatch<br>
&gt; &gt; -+miniperlmain$O: $(CROSSPATCHED)<br>
&gt; &gt; -<br>
&gt; &gt; - # Original versions are not saved anymore; patch generally tak=
es care of this,<br>
&gt; &gt; - # and if that fails, reaching for the source tarball is the sa=
fest option.<br>
&gt; &gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5=
.32.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.0.bb</a> b/meta/re=
cipes-devtools/perl/<a href=3D"http://perl_5.32.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">perl_5.32.1.bb</a><br>
&gt; &gt; similarity index 98%<br>
&gt; &gt; rename from meta/recipes-devtools/perl/<a href=3D"http://perl_5.=
32.0.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/perl/<a href=3D"http://perl_5.32=
.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a><br>
&gt; &gt; index 7d88c65322..1fafc0a8c9 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.0.b=
b" rel=3D"noreferrer" target=3D"_blank">perl_5.32.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.32.1.b=
b" rel=3D"noreferrer" target=3D"_blank">perl_5.32.1.bb</a><br>
&gt; &gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://Copying;md5=3D=
5b122a36d0f6dc55279a0ebc69f3c60b \<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://www.cpan.org/src/5.0/=
perl-$%7BPV%7D.tar.gz;name=3Dperl" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl</a> \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git=
hub.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.tar.gz;nam=
e=3Dperl-cross" rel=3D"noreferrer" target=3D"_blank">https://github.com/ars=
v/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.tar.gz;name=3Dperl-cr=
oss</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git=
hub.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;nam=
e=3Dperl-cross" rel=3D"noreferrer" target=3D"_blank">https://github.com/ars=
v/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=3Dperl-cr=
oss</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://perl-rdepe=
nds.txt \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-confi=
gure_tool.sh-do-not-quote-the-argument-to-comma.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ExtUt=
ils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \<br>
&gt; &gt; @@ -21,7 +21,6 @@ SRC_URI =3D &quot;<a href=3D"https://www.cpan.=
org/src/5.0/perl-$%7BPV%7D.tar.gz;name=3Dperl" rel=3D"noreferrer" target=3D=
"_blank">https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl</a> \<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-confi=
gure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Const=
ant-Fix-up-shebang.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://determinis=
m.patch=C2=A0 \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://perl-cross-make=
file.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 SRC_URI_append_class-native =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://perl-confi=
gpm-switch.patch \<br>
&gt; &gt; @@ -30,8 +29,8 @@ SRC_URI_append_class-target =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://encodefix.=
patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[perl.sha256sum] =3D &quot;efeb1ce1f10824190ad1cadbcccf6=
fdb8a5d37007d0100d2d9ae5f2b5900c0b4&quot;<br>
&gt; &gt; -SRC_URI[perl-cross.sha256sum] =3D &quot;755aa0ca8141a942188a269=
564f86c3c82349f82c346ed5c992495d7f35138ba&quot;<br>
&gt; &gt; +SRC_URI[perl.sha256sum] =3D &quot;03b693901cd8ae807231b1787798c=
f1f2e0b8a56218d07b7da44f784a7caeb2c&quot;<br>
&gt; &gt; +SRC_URI[perl-cross.sha256sum] =3D &quot;91c66f6b2b99fccfd4fee14=
660b677380b0c98f9456359e91449798c2ad2ef25&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/perl-${PV}&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.29.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
</blockquote></div>

--0000000000002ef35005bc8a3aaa--
