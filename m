Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.9258.1626560283637931878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jul 2021 15:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UOiwCqDd;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id c68so7926691qkf.9
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jul 2021 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YbwTjbaf//W9M+Ppd9b/hQmODoQHbN6ZYFzmzJFIxyw=;
        b=UOiwCqDd+IUZSEW4ehr2pc9IrovSu+iheilczSXN+/5IOjphMGEtVsDfcCIvzfrHxS
         ZAoQC+QGtQbrFCgTUKY425OjD1ImekvlA8V3F6ROyMtOfrGfLlC+i+3ybb6I6wDA9AuV
         tbIYImdQNco+J/kh0AZcOoH5GRPL7AXBcfbNCO7FF6NDNfKxwvFmGTlOGkawD/SXmt/V
         f3zHHvnJZs6bOkLNQq+W89Kp1noF1CrEv8HFNVCu/1UhCm7v0aViIrwYqCtoGiQWiqIv
         HtR/EO5dieUqQll6+mrJLj/l/PmfYj6l5C/psMFUhttLgHe21TMQW/PtD4lZ03vflFKg
         xF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YbwTjbaf//W9M+Ppd9b/hQmODoQHbN6ZYFzmzJFIxyw=;
        b=O5fToQbfzQzuMiO2ryOOAI0JZr55MKzdaXqxc0axs4/qGP6pTt3vsngGKOGDuYD5if
         6Fi7as/7qTj2oUaiI5K5IEwy66Yoce7kIhedQkTnB2ywo+KwKh8pfymL3etgEBk3d8cM
         hXzeL7cpoK4mnS8WJb1avO7Qs3UqjGeeALxGL3hYuiN2HwKTUvzgM7t+bAY6zj30oxym
         AZ2jmsIfsJwZroRf3OZS4dCaRNgZ357hRBhLkDe67QkUv3HkhVb8Kv6EFpOunObVmjiX
         SVtfmcQc8Jbtorf//NL9RbD/NLUzc9wvjBluKboBOUVjpj1FEOL9UBL1L+xwLRgyfA8X
         hhwQ==
X-Gm-Message-State: AOAM533ARxScBa+TMxPZCoIMq5MK5koZlSQ1cENlTPjVnUv3KqzjvGL+
	/TxX9Owrmrw0ZXAyDlOQvBgB2ME6QSIkOZ1ZvMk=
X-Google-Smtp-Source: ABdhPJwUQvVYfFgmlpXAAoTlj16fTa2KcthuiHl+ulzgz5XHCmGfm8u1yYIgaqvxuV7L9jqZn9g/WRUuDjO6wouIbvc=
X-Received: by 2002:a37:5d3:: with SMTP id 202mr9616624qkf.125.1626560282774;
 Sat, 17 Jul 2021 15:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210714021322.1245535-1-raj.khem@gmail.com> <fa50037d-6482-8aeb-b710-d2c8a532ff80@gmail.com>
In-Reply-To: <fa50037d-6482-8aeb-b710-d2c8a532ff80@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 17 Jul 2021 15:17:52 -0700
Message-ID: <CAMKF1srXj-4-b-EzsW0LSLR0JU46PviNsR7jSocg+imLshp_+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libseccomp: Update to main branch
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dc4edb05c75913bc"

--000000000000dc4edb05c75913bc
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 17, 2021 at 2:30 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/13/21 7:13 PM, Khem Raj wrote:
> > Get RV32 imlementation
>
> The subject is miss leading. You are replacing the upstream url with
> your github version to make riscv easier. Is this the preferred method
> of supporting new Architectures?


No. You are looking at obsolete patch please review v2 and the patches are
already submitted upstream as well


>
> -armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++++
> >  .../libseccomp/libseccomp_2.5.1.bb            |  7 +++--
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> >  create mode 100644
> meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> >
> > diff --git
> a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> > new file mode 100644
> > index 0000000000..f30ca77465
> > --- /dev/null
> > +++
> b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> > @@ -0,0 +1,26 @@
> > +From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 8 Jun 2021 23:13:20 -0700
> > +Subject: [PATCH] configure.ac: Bump version to 2.5.99
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + configure.ac | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 3e87734..48e796f 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -19,7 +19,7 @@ dnl #
> > + dnl ####
> > + dnl libseccomp defines
> > + dnl ####
> > +-AC_INIT([libseccomp], [0.0.0])
> > ++AC_INIT([libseccomp], [2.5.99])
> > +
> > + dnl ####
> > + dnl autoconf configuration
> > +--
> > +2.32.0
> > +
> > diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> > index 8fe1023901..5f79f3dbcb 100644
> > --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> > +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> > @@ -7,14 +7,13 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
> >
> >  DEPENDS += "gperf-native"
> >
> > -SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> > +SRCREV = "${AUTOREV}"
> >
> > -SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> > +SRC_URI = "git://github.com/kraj/libseccomp.git;branch=riscv32 \
> > +           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
> >             file://run-ptest \
> >             "
> >
> > -COMPATIBLE_HOST_riscv32 = "null"
> > -
> >  S = "${WORKDIR}/git"
> >
> >  inherit autotools-brokensep pkgconfig ptest features_check
> >
> > 
> >
>
>

--000000000000dc4edb05c75913bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 17, 2021 at 2:30 PM akuster808 &lt;<a href=3D"=
mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
On 7/13/21 7:13 PM, Khem Raj wrote:<br>
&gt; Get RV32 imlementation<br>
<br>
The subject is miss leading. You are replacing the upstream url with<br>
your github version to make riscv easier. Is this the preferred method<br>
of supporting new Architectures?</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">No. You are looking at obsolete patch please review v2 and=
 the patches are already submitted upstream as well=C2=A0</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
-armin<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-configure.ac-Bump-version-to-2.5.99.patch | 26 ++++++++++++=
+++++++<br>
&gt;=C2=A0 .../libseccomp/<a href=3D"http://libseccomp_2.5.1.bb" rel=3D"no=
referrer" target=3D"_blank">libseccomp_2.5.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++--<br>
&gt;=C2=A0 2 files changed, 29 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/libseccomp/files/0001-c=
onfigure.ac-Bump-version-to-2.5.99.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libseccomp/files/0001-configure.ac-=
Bump-version-to-2.5.99.patch b/meta/recipes-support/libseccomp/files/0001-c=
onfigure.ac-Bump-version-to-2.5.99.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f30ca77465<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-ve=
rsion-to-2.5.99.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 8 Jun 2021 23:13:20 -0700<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a>: Bump version to 2.5.99<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 3e87734..48e796f 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; +@@ -19,7 +19,7 @@ dnl #<br>
&gt; + dnl ####<br>
&gt; + dnl libseccomp defines<br>
&gt; + dnl ####<br>
&gt; +-AC_INIT([libseccomp], [0.0.0])<br>
&gt; ++AC_INIT([libseccomp], [2.5.99])<br>
&gt; + <br>
&gt; + dnl ####<br>
&gt; + dnl autoconf configuration<br>
&gt; +-- <br>
&gt; +2.32.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libseccomp/<a href=3D"http://libsec=
comp_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a>=
 b/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.5.1.bb" r=
el=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
&gt; index 8fe1023901..5f79f3dbcb 100644<br>
&gt; --- a/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
&gt; +++ b/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
&gt; @@ -7,14 +7,13 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=
=
=3D0;endline=3D1;md5=3D8eac08d22113880357c<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS +=3D &quot;gperf-native&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;4bf70431a339a2886ab8c82e9a45378f30c6e6c7&quot;<br>
&gt; +SRCREV =3D &quot;${AUTOREV}&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/seccomp/libsecc=
omp.git;branch=3Drelease-2.5" rel=3D"noreferrer" target=3D"_blank">github.c=
om/seccomp/libseccomp.git;branch=3Drelease-2.5</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/kraj/libseccomp=
.git;branch=3Driscv32" rel=3D"noreferrer" target=3D"_blank">github.com/kraj=
/libseccomp.git;branch=3Driscv32</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Bu=
mp-version-to-2.5.99.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -COMPATIBLE_HOST_riscv32 =3D &quot;null&quot;<br>
&gt; -<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools-brokensep pkgconfig ptest features_check<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000dc4edb05c75913bc--
