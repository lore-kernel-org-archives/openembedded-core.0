Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.31447.1609067071130532904
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 03:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JEZUol1W;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id p7so4236727vsf.8
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 03:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7wWYIJC8WMUk9voUE1hLGgFzswt2g02WMrzx2+06A84=;
        b=JEZUol1W8anLh29lgzaYYxfUoSGd6cL6M4zCs74UgdO8A2aSXTN2/znmuiXjMZdr1A
         kXr18e4xJe7uXxYwlBHdRoArkL3l147G4i1+E7TNownTcKJ380OX/0c35bzqkIPvO5YP
         5X2amZyoxHuYo+Mu7y9++DHnFC6TecWYaaK9J+yRFo4q3qss6UqfRnH7l2Bbc4eGhwsV
         JN5i9ZS8+bHmN/QtMeUi4rmQ7SwKtqIN33ES2nh1ae9/1FccUrsQc/8fBFzh0f2u4yI1
         eDfHvsdDVw2q4+WWkD6B7Q1BFjLxBBLltw0fkA3LlmTR5QsfcyeqjfuyyZc/4G/yxiv2
         25gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7wWYIJC8WMUk9voUE1hLGgFzswt2g02WMrzx2+06A84=;
        b=iQi0WE5jt6j1GVTinO4glNyEHgwtqtnnZSnn/KQZwOXqfZD16ey4bsBzMW8oNJnQ9z
         9DRFpTJlFK+Utqu1HPzIUkomHoGV1rYbZF6j5pIRXH8kTlTQwbbSu7g40TbDABwHi6RK
         969UYkzaBIkFBBxP4q1X/hH3QksBY5e97XvFXFuJMSdQg/QE0IjeBvp2iJl8y271ERO1
         7pmjdRgqNL2QtoXaUaObrcGoGamh9XEryC/xkdObBw9BtfltUEaLqoWOdt80mbEqfvyr
         ryQgVcOTNqGOiWWm6kR2Wl8xTbkl+ZHU6MZxfKESM3hJ+LEuYInkV5zfOp6gGTfTWlET
         ZKtg==
X-Gm-Message-State: AOAM530G1rF6mPjZgifMFPBt2xOunDMcOQkL0sjXDhuTZtdupPo3GMJT
	QrcnFjcA1tAtns5PZpl5vyp2nX/W4gyeqD/+hZs=
X-Google-Smtp-Source: ABdhPJx7G4TlHQWNy88tvdhgNX/PoXsTyi4kCPbTOgXFtCUOa1X6xzuAj3E7I5c75LU+Gx8gj3GQ41XUKUid1tlcTpU=
X-Received: by 2002:a67:6044:: with SMTP id u65mr25038684vsb.31.1609067070274;
 Sun, 27 Dec 2020 03:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
 <20201226092732.52323-35-alex.kanavin@gmail.com> <CAMKF1sp=O9JCsc3gDJ8Oqh2uXCtVjUZG6kT0syz3sQT7ijVLZg@mail.gmail.com>
In-Reply-To: <CAMKF1sp=O9JCsc3gDJ8Oqh2uXCtVjUZG6kT0syz3sQT7ijVLZg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 27 Dec 2020 06:04:19 -0500
Message-ID: <CANNYZj_TmYr8iurMyEqb_OcrSbgiaa0G0u14P8sBK=qZzyYpTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/48] ell: upgrade 0.33 -> 0.35
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000024c8ef05b7701f21"

--00000000000024c8ef05b7701f21
Content-Type: text/plain; charset="UTF-8"

I think this should be addressed by updating iwd to 1.10?

Alex

On Sun, 27 Dec 2020 at 01:02, Khem Raj <raj.khem@gmail.com> wrote:

> regresses iwd builds see
>
> https://errors.yoctoproject.org/Errors/Details/540274/
>
> On Sat, Dec 26, 2020 at 1:29 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...l-add-missing-include-in-dhcp-server.patch | 23 ++++++++++++++++
> >  .../ell/0001-pem.c-do-not-use-rawmemchr.patch | 27 +++++++++++++++++++
> >  .../ell/{ell_0.33.bb => ell_0.35.bb}          |  7 +++--
> >  3 files changed, 55 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> >  create mode 100644
> meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> >  rename meta/recipes-core/ell/{ell_0.33.bb => ell_0.35.bb} (73%)
> >
> > diff --git
> a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> > new file mode 100644
> > index 0000000000..2460d26bdc
> > --- /dev/null
> > +++
> b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> > @@ -0,0 +1,23 @@
> > +From dd350f4e2258b5a638bc8fb26a6193147902d292 Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
> > +Date: Mon, 30 Nov 2020 18:40:33 -0300
> > +Subject: [PATCH] ell: add missing include in dhcp-server.
> > +
> > +Upstream-Status: Backport
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + ell/dhcp-server.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
> > +index c983ed4..144e83e 100644
> > +--- a/ell/dhcp-server.c
> > ++++ b/ell/dhcp-server.c
> > +@@ -24,6 +24,7 @@
> > + #include <config.h>
> > + #endif
> > +
> > ++#include <linux/types.h>
> > + #include <net/ethernet.h>
> > + #include <sys/socket.h>
> > + #include <arpa/inet.h>
> > diff --git
> a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> > new file mode 100644
> > index 0000000000..f0ce6f1364
> > --- /dev/null
> > +++ b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> > @@ -0,0 +1,27 @@
> > +From 277e1eca67fcc23cb31be7b826d83a19d9b89bd2 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Tue, 22 Dec 2020 10:30:54 +0000
> > +Subject: [PATCH] pem.c: do not use rawmemchr()
> > +
> > +This is a glibc-only function, and causes build failures with
> > +alternative libc implementations such as musl.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + ell/pem.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/ell/pem.c b/ell/pem.c
> > +index 790f2c2..237ae02 100644
> > +--- a/ell/pem.c
> > ++++ b/ell/pem.c
> > +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf,
> size_t buf_len,
> > +
> > +               /* Check that each header line has a key and a colon */
> > +               while (start < end) {
> > +-                      const char *lf = rawmemchr(start, '\n');
> > ++                      const char *lf = memchr(start, '\n', end -
> start);
> > +                       const char *colon = memchr(start, ':', lf -
> start);
> > +
> > +                       if (!colon)
> > diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/
> ell_0.35.bb
> > similarity index 73%
> > rename from meta/recipes-core/ell/ell_0.33.bb
> > rename to meta/recipes-core/ell/ell_0.35.bb
> > index 2fa05104fb..ccc54b5ff7 100644
> > --- a/meta/recipes-core/ell/ell_0.33.bb
> > +++ b/meta/recipes-core/ell/ell_0.35.bb
> > @@ -13,8 +13,11 @@ DEPENDS = "dbus"
> >
> >  inherit autotools pkgconfig
> >
> > -SRC_URI = "
> https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> > -SRC_URI[sha256sum] =
> "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
> > +SRC_URI = "
> https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz
> \
> > +           file://0001-ell-add-missing-include-in-dhcp-server.patch \
> > +           file://0001-pem.c-do-not-use-rawmemchr.patch \
> > +           "
> > +SRC_URI[sha256sum] =
> "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
> >
> >  do_configure_prepend () {
> >      mkdir -p ${S}/build-aux
> > --
> > 2.29.2
> >
> >
> > 
> >
>

--00000000000024c8ef05b7701f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this should be addressed by updating iwd to 1=
.10?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 27 Dec 2020 at 01:02, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">regress=
es iwd builds see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/540274/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/540274/</a><br>
<br>
On Sat, Dec 26, 2020 at 1:29 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...l-add-missing-include-in-dhcp-server.patch | 23 ++++++++++++=
++++<br>
&gt;=C2=A0 .../ell/0001-pem.c-do-not-use-rawmemchr.patch | 27 ++++++++++++=
+++++++<br>
&gt;=C2=A0 .../ell/{<a href=3D"http://ell_0.33.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ell_0.33.bb</a> =3D&gt; <a href=3D"http://ell_0.35.bb" rel=3D=
"noreferrer" target=3D"_blank">ell_0.35.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 |=C2=A0 7 +++--<br>
&gt;=C2=A0 3 files changed, 55 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/ell/ell/0001-ell-add-missi=
ng-include-in-dhcp-server.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/ell/ell/0001-pem.c-do-not-=
use-rawmemchr.patch<br>
&gt;=C2=A0 rename meta/recipes-core/ell/{<a href=3D"http://ell_0.33.bb" re=
l=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a> =3D&gt; <a href=3D"http:=
//ell_0.35.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.35.bb</a>} (73%)<=
br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-i=
n-dhcp-server.patch b/meta/recipes-core/ell/ell/0001-ell-add-missing-includ=
e-in-dhcp-server.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2460d26bdc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-=
server.patch<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +From dd350f4e2258b5a638bc8fb26a6193147902d292 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: =3D?UTF-8?q?=3DC3=3D89rico=3D20Nogueira?=3D &lt;<a href=3D"mai=
lto:ericonr@disroot.org" target=3D"_blank">ericonr@disroot.org</a>&gt;<br>
&gt; +Date: Mon, 30 Nov 2020 18:40:33 -0300<br>
&gt; +Subject: [PATCH] ell: add missing include in dhcp-server.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + ell/dhcp-server.c | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c<br>
&gt; +index c983ed4..144e83e 100644<br>
&gt; +--- a/ell/dhcp-server.c<br>
&gt; ++++ b/ell/dhcp-server.c<br>
&gt; +@@ -24,6 +24,7 @@<br>
&gt; + #include &lt;config.h&gt;<br>
&gt; + #endif<br>
&gt; +<br>
&gt; ++#include &lt;linux/types.h&gt;<br>
&gt; + #include &lt;net/ethernet.h&gt;<br>
&gt; + #include &lt;sys/socket.h&gt;<br>
&gt; + #include &lt;arpa/inet.h&gt;<br>
&gt; diff --git a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemch=
r.patch b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..f0ce6f1364<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch=
<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From 277e1eca67fcc23cb31be7b826d83a19d9b89bd2 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 22 Dec 2020 10:30:54 +0000<br>
&gt; +Subject: [PATCH] pem.c: do not use rawmemchr()<br>
&gt; +<br>
&gt; +This is a glibc-only function, and causes build failures with<br>
&gt; +alternative libc implementations such as musl.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + ell/pem.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/ell/pem.c b/ell/pem.c<br>
&gt; +index 790f2c2..237ae02 100644<br>
&gt; +--- a/ell/pem.c<br>
&gt; ++++ b/ell/pem.c<br>
&gt; +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf,=
 size_t buf_len,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that=
 each header line has a key and a colon */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (start =
&lt; end) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *lf =3D rawmemchr(start, &#39;\n&#39;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *lf =3D memchr(start, &#39;\n&#39;, end - start);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *colon =3D memchr(start, &#39;:&#39;, lf - sta=
rt);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (!colon)<br>
&gt; diff --git a/meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a> b/meta/recipes-core/ell/=
<a href=3D"http://ell_0.35.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.3=
5.bb</a><br>
&gt; similarity index 73%<br>
&gt; rename from meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=
=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a><br>
&gt; rename to meta/recipes-core/ell/<a href=3D"http://ell_0.35.bb" rel=3D=
"noreferrer" target=3D"_blank">ell_0.35.bb</a><br>
&gt; index 2fa05104fb..ccc54b5ff7 100644<br>
&gt; --- a/meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=3D"nor=
eferrer" target=3D"_blank">ell_0.33.bb</a><br>
&gt; +++ b/meta/recipes-core/ell/<a href=3D"http://ell_0.35.bb" rel=3D"nor=
eferrer" target=3D"_blank">ell_0.35.bb</a><br>
&gt; @@ -13,8 +13,11 @@ DEPENDS =3D &quot;dbus&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://mirrors.edge.kernel.org/pub/lin=
ux/libs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-$=
{PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d9e40e641164150394b74b719b9726fc734f24b=
2cde679cf5f3be6915c34eded&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://mirrors.edge.kernel.org/pub/lin=
ux/libs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-$=
{PV}.tar.xz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ell-add-missing=
-include-in-dhcp-server.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pem.c-do-not-us=
e-rawmemchr.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2bfe9da7781f65f1cb1595a5a068a3ae74d4b68=
b74f287c6f0c892cfe623913f&quot;<br>
&gt;<br>
&gt;=C2=A0 do_configure_prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir -p ${S}/build-aux<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000024c8ef05b7701f21--
