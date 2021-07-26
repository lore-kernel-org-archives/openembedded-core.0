Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.28160.1627296106254212409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 03:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S7MleNZI;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id f4so1905798vkb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jul 2021 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=grweVHadv5I4AGZ0W5/aG/xP7ZYSQycsou22RSZW4zU=;
        b=S7MleNZITxQvhiztzy+puSztGkbT06RxCWmn7uPYDuwWjHhZKqBqV1WUeWksrYQD8x
         jbNnynN/o0xK98MiOgcN6GndV5NsP4fTE/Vljj7bH1NuMDAV40vSQY5kAK7FDru+RLxa
         1CcUhBctiQVsCeHgD+sC03lBmZhcU/OLLsHYwKFqtkP9Mcp+OQe4QLdVxMD0HYGvof5M
         TXftb48c8wIXHvVzRHDmCfln0D65Sl7IRHSkyYfIFb38Gu/ANBj3UHOUwSxw4iW66lnA
         DejSu35yHPLZwv9g0R/5m56lgTUYPUjNuQWy3Xp2fg0hkSpzPC3JIfg8Atr1AnawbNoS
         rK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=grweVHadv5I4AGZ0W5/aG/xP7ZYSQycsou22RSZW4zU=;
        b=IUDB7Qi5lmJcBPgX0CVSkcPUd7BjyKxNcCmgkF4E1LLlyLtEtRNQQ2AZ3IEHKdi1wL
         de65SJwFfOoM4Cr7qGFk7V5SWNxpzh7qV0IITXxRumXg2ZtfIWDCV/ZDUYxKrG9Zjded
         TTCmTaS8VaMXtre8U9UUEm+AXynqIVMfsDAjoyiLVig8qx+Tec0oEpT0DbWYKEyQBF29
         CjQ7cEoRFw2eA7KCy/36mj/woodu+JZzcqA0imtmfGhuRvCFFvzU76inVCCqp/Q+B6cd
         6/XOtVRE9Rty7KtRKBToB3UoBqj5qLR39ytxMH4CldMVvx7WHFtUKv4tXPCWTpaDUInX
         5xEA==
X-Gm-Message-State: AOAM532GKgolVBgAwFtSh49ChFieyhOnmFvIeT74lLXgQnjKlrqvaX5m
	xGr9NASulfGRzAJCvUaGIjZ0M6rd4PaVgwZoz04=
X-Google-Smtp-Source: ABdhPJxjGQCfnqvm3gueNfvB0/QwZ8ULsDhghXfBXGzsgM9clvhkrkG2e5IN9HYSw8+jNdUo+rM5Y5I2QVT1gnaqBDI=
X-Received: by 2002:ac5:cd50:: with SMTP id n16mr9757247vkm.7.1627296105395;
 Mon, 26 Jul 2021 03:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
 <20210722224508.51967-5-alex.kanavin@gmail.com> <YPvwHs6o9qCOlty8@piout.net>
In-Reply-To: <YPvwHs6o9qCOlty8@piout.net>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 26 Jul 2021 12:41:34 +0200
Message-ID: <CANNYZj95QYZ7TMmKXAyjBPtNiWo-1ZeMcrt_6hyVkuQUgbQ6Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/8] mtools: update 4.0.32 -> 4.0.33
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004e77ef05c80466a1"

--0000000000004e77ef05c80466a1
Content-Type: text/plain; charset="UTF-8"

Thanks, I think this is fixed by an even newer version. I'll resubmit the
update.

Alex

On Sat, 24 Jul 2021 at 12:49, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> On 23/07/2021 00:45:05+0200, Alexander Kanavin wrote:
> > Drop no-x11.gplv3.patch (the libraries are now
> > dynamically enabled from configure.in).
> >
>
> This update causes failures with wic because mcopy fails with:
> mcopy: No directory slots
>
> Full log here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3686/steps/11/logs/stdio
>
> 12 builds failed so this should be easily reproducible.
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../mtools/disable-hardcoded-configs.patch     |  4 ++--
> >  .../mtools/mtools/no-x11.gplv3.patch           | 18 ------------------
> >  .../{mtools_4.0.32.bb => mtools_4.0.33.bb}     |  3 +--
> >  3 files changed, 3 insertions(+), 22 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> >  rename meta/recipes-devtools/mtools/{mtools_4.0.32.bb =>
> mtools_4.0.33.bb} (91%)
> >
> > diff --git
> a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> > index 81d76d060e..90573dcb1a 100644
> > --- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> > +++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> > @@ -1,4 +1,4 @@
> > -From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
> > +From 7efdb47246413f938e3b2d8378ce9c363d98b371 Mon Sep 17 00:00:00 2001
> >  From: Ed Bartosh <ed.bartosh@linux.intel.com>
> >  Date: Tue, 13 Jun 2017 14:55:52 +0300
> >  Subject: [PATCH] Disabled reading host configs.
> > @@ -12,7 +12,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >   1 file changed, 8 deletions(-)
> >
> >  diff --git a/config.c b/config.c
> > -index bb13682..9186c77 100644
> > +index 173eae0..0654cc1 100644
> >  --- a/config.c
> >  +++ b/config.c
> >  @@ -836,14 +836,6 @@ void read_config(void)
> > diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> b/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> > deleted file mode 100644
> > index 9cb3e39f5c..0000000000
> > --- a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -Disable building with X11 support.
> > -
> > -Upstream-Status: Inappropriate [disable feature]
> > -
> > -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> > -
> > -diff -urN mtools-4.0.15.orig//Makefile.in mtools-4.0.15//Makefile.in
> > ---- mtools-4.0.15.orig//Makefile.in  2010-10-17 08:41:09.000000000 -0700
> > -+++ mtools-4.0.15//Makefile.in       2010-11-23 13:59:49.258258374 -0800
> > -@@ -146,7 +146,7 @@
> > - CXXFLAGS  = $(CPPFLAGS) $(DEFS) $(MYCXXFLAGS) -I. @extraincludedir@
> -I@srcdir@ $(USERCFLAGS)
> > - LINK      = $(CC) $(LDFLAGS) $(USERLDFLAGS) @extralibdir@
> > - ALLLIBS   = $(USERLDLIBS) $(MACHDEPLIBS) $(SHLIB) $(LIBS)
> > --X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) -lXau -lX11 $(LIBS)
> > -+X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) $(LIBS)
> > - X_CCFLAGS = $(X_CFLAGS) $(CFLAGS)
> > -
> > - all:    mtools $(LINKS) mkmanifest @FLOPPYD@ mtools.1 mtools.5
> > diff --git a/meta/recipes-devtools/mtools/mtools_4.0.32.bb
> b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/mtools/mtools_4.0.32.bb
> > rename to meta/recipes-devtools/mtools/mtools_4.0.33.bb
> > index 501875037a..fd9febb01d 100644
> > --- a/meta/recipes-devtools/mtools/mtools_4.0.32.bb
> > +++ b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
> > @@ -24,11 +24,10 @@ RRECOMMENDS_${PN}_libc-glibc = "\
> >       glibc-gconv-ibm866 \
> >       glibc-gconv-ibm869 \
> >       "
> > -SRC_URI[sha256sum] =
> "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
> > +SRC_URI[sha256sum] =
> "1cb10f8e1e20302f86eaa9c5db262f4559d1dc94bd11fdda7692bc2d1beab954"
> >
> >  SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
> >             file://mtools-makeinfo.patch \
> > -           file://no-x11.gplv3.patch \
> >             file://clang_UNUSED.patch \
> >             "
> >
> > --
> > 2.31.1
> >
>
> >
> > 
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000004e77ef05c80466a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I think this is fixed by an even newer versio=
n. I&#39;ll resubmit the update.</div><div><br></div><div>Alex<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, 24 Jul 2021 at 12:49, Alexandre Belloni &lt;<a href=3D"mailto:alexandr=
e.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 23/07/2021 00:45:05+0200, Alexander Kanavin wrote:<br>
&gt; Drop no-x11.gplv3.patch (the libraries are now<br>
&gt; dynamically enabled from <a href=3D"http://configure.in" rel=3D"noref=
errer" target=3D"_blank">configure.in</a>).<br>
&gt; <br>
<br>
This update causes failures with wic because mcopy fails with:<br>
mcopy: No directory slots<br>
<br>
Full log here:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/58/buil=
ds/3686/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3686/steps/11/logs=
/stdio</a><br>
<br>
12 builds failed so this should be easily reproducible.<br>
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../mtools/disable-hardcoded-configs.patch=C2=A0 =C2=A0 =C2=A0|=
=
=C2=A0 4 ++--<br>
&gt;=C2=A0 .../mtools/mtools/no-x11.gplv3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 18 ------------------<br>
&gt;=C2=A0 .../{<a href=3D"http://mtools_4.0.32.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mtools_4.0.32.bb</a> =3D&gt; <a href=3D"http://mtools_4.0.33=
.bb" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.33.bb</a>}=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 3 +--<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 22 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/mtools/mtools/no-x11.g=
plv3.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/mtools/{<a href=3D"http://mtools_4=
.0.32.bb" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.32.bb</a> =3D&gt;=
 <a href=3D"http://mtools_4.0.33.bb" rel=3D"noreferrer" target=3D"_blank">m=
tools_4.0.33.bb</a>} (91%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-co=
nfigs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs=
.patch<br>
&gt; index 81d76d060e..90573dcb1a 100644<br>
&gt; --- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.p=
atch<br>
&gt; +++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.p=
atch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 7efdb47246413f938e3b2d8378ce9c363d98b371 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.c=
om" target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 13 Jun 2017 14:55:52 +0300<br>
&gt;=C2=A0 Subject: [PATCH] Disabled reading host configs.<br>
&gt; @@ -12,7 +12,7 @@ Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.=
bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 8 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/config.c b/config.c<br>
&gt; -index bb13682..9186c77 100644<br>
&gt; +index 173eae0..0654cc1 100644<br>
&gt;=C2=A0 --- a/config.c<br>
&gt;=C2=A0 +++ b/config.c<br>
&gt;=C2=A0 @@ -836,14 +836,6 @@ void read_config(void)<br>
&gt; diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch b=
/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9cb3e39f5c..0000000000<br>
&gt; --- a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,18 +0,0 @@<br>
&gt; -Disable building with X11 support.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [disable feature]<br>
&gt; -<br>
&gt; -Signed-off-by: Scott Garman &lt;<a href=3D"mailto:scott.a.garman@int=
el.com" target=3D"_blank">scott.a.garman@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff -urN mtools-4.0.15.orig//Makefile.in mtools-4.0.15//Makefile.in=
<br>
&gt; ---- mtools-4.0.15.orig//Makefile.in=C2=A0 2010-10-17 08:41:09.000000=
000 -0700<br>
&gt; -+++ mtools-4.0.15//Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A02010-11-23 =
13:59:49.258258374 -0800<br>
&gt; -@@ -146,7 +146,7 @@<br>
&gt; - CXXFLAGS=C2=A0 =3D $(CPPFLAGS) $(DEFS) $(MYCXXFLAGS) -I. @extraincl=
udedir@ -I@srcdir@ $(USERCFLAGS)<br>
&gt; - LINK=C2=A0 =C2=A0 =C2=A0 =3D $(CC) $(LDFLAGS) $(USERLDFLAGS) @extra=
libdir@<br>
&gt; - ALLLIBS=C2=A0 =C2=A0=3D $(USERLDLIBS) $(MACHDEPLIBS) $(SHLIB) $(LIB=
S)<br>
&gt; --X_LDFLAGS =3D $(X_EXTRA_LIBS) $(X_LIBS) -lXau -lX11 $(LIBS)<br>
&gt; -+X_LDFLAGS =3D $(X_EXTRA_LIBS) $(X_LIBS) $(LIBS)<br>
&gt; - X_CCFLAGS =3D $(X_CFLAGS) $(CFLAGS)<br>
&gt; - <br>
&gt; - all:=C2=A0 =C2=A0 mtools $(LINKS) mkmanifest @FLOPPYD@ mtools.1 mto=
ols.5<br>
&gt; diff --git a/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.=
0.32.bb" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.32.bb</a> b/meta/r=
ecipes-devtools/mtools/<a href=3D"http://mtools_4.0.33.bb" rel=3D"noreferre=
r" target=3D"_blank">mtools_4.0.33.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0=
.32.bb" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.32.bb</a><br>
&gt; rename to meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.3=
3.bb" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.33.bb</a><br>
&gt; index 501875037a..fd9febb01d 100644<br>
&gt; --- a/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.32.bb=
" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.32.bb</a><br>
&gt; +++ b/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.33.bb=
" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.33.bb</a><br>
&gt; @@ -24,11 +24,10 @@ RRECOMMENDS_${PN}_libc-glibc =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-ibm866 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-ibm869 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;62498cd51ae7c79a27c879a45f0d2a8c44e1404=
cbb901372d09b02735ef5ad89&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;1cb10f8e1e20302f86eaa9c5db262f4559d1dc9=
4bd11fdda7692bc2d1beab954&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mtools-makeinfo=
.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-x11.gplv3.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clang_UNUSED.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.31.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
</blockquote></div>

--0000000000004e77ef05c80466a1--
