Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.2274.1604431084487417950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tqgnV1EE;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id 128so7277443vso.7
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 11:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yavtQx+WFnhBk+PSzkJU3360+KogaAGrIPon1xdyOdU=;
        b=tqgnV1EE2jH2ehsQVQCIH8/LYByOY3mKC/FmnNWnU8rn0tIz13S2eyVwXtCUNHPJCH
         FTkuIklmdohQV+g2MgYH6dcWVUmiE2AzxfdioTmOKKE2TZarKE+ySCc07EYY7gUg9NjH
         A0D9we/1CBN9TrIqrOMLMiMC3j1SExpUZ2gswGUI9hFVJ4qnz5quz695ChUDrqpUnPjG
         DWt/ix+ggP1F7QCDK4WTPiw+coHDepF+V6RIT0vyHc/MbC0yhdouRHZubQWsAwkApM8q
         bVlk1tJbRwZcR2BehFfk1SZyA6xGc+tRJqPVBbk5ozDK4UcSFWVvwct2AbZyRbb1ZgPR
         nR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yavtQx+WFnhBk+PSzkJU3360+KogaAGrIPon1xdyOdU=;
        b=PTQcY8AEHlhB4UF4GdeJ/iwuXZJyPPD/Ih7LNEHL43Ugh6XBbKzvNvSfksVOHGJNoz
         boPzt5xTKhbpeysgrXw1MoVL8gAqT1iobOi2tpZNwi4JDlGODMR61+UY+Pc6dbxXQyvT
         qMaK8oHBH7q9rgNSnzj5pnEYgtW9g8G68vSFZx/N+Ht2mf99bHxXwu7DCSQ9oAFnHQQ0
         I3Q6XeOkhfe/Nc2uwUj6o4/VPhlM6ZRbdaWSgzTVj5QrxonM12q03kASI6pBiWWQW2NN
         LGm1FQbpBc040o8mxvbgAyy+0vqVJNZyxxgkd0Jn7R7S3MefECGLOBhRvW4GdOurfVGc
         wm+w==
X-Gm-Message-State: AOAM533P0Hi5l2ZhT2s7q83wP/DF3bm0TIDM+KiuYgiOEnzaNBfvU3Oa
	aW+UGgF+Yqfu/xFjK6BeeTkQimlUTA/xthv6kow=
X-Google-Smtp-Source: ABdhPJxiiQhDqU8LbO0N2YvApGnIfNlYND6Tk90ga9yqFEduZXvhahgFhxG4xr9mqPQSRY+7LIvwQ0BzQFVCXPtvU+s=
X-Received: by 2002:a67:403:: with SMTP id 3mr17513965vse.54.1604431083644;
 Tue, 03 Nov 2020 11:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-70-alex.kanavin@gmail.com> <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
In-Reply-To: <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 3 Nov 2020 20:17:51 +0100
Message-ID: <CANNYZj8hyJoeQkV_GyM7jXZh-8OVSMK=jp3pQ=nHyiFisYRUfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ceac6705b338b898"

--000000000000ceac6705b338b898
Content-Type: text/plain; charset="UTF-8"

Can you send a patch for this please?

Alex

On Tue, 3 Nov 2020 at 19:43, Khem Raj <raj.khem@gmail.com> wrote:

> rt-tests now have added code which only works for x86/x86_64/ppc64 in
> src/oslat/oslat.c, so either that will need fixing for other arches or
> limit this recipe to above said arches. see a failure here e.g.
>
> https://errors.yoctoproject.org/Errors/Details/511500/
>
> On 11/2/20 8:48 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7 ++++---
> >   .../rt-tests/{hwlatdetect_1.8.bb => hwlatdetect_1.9.bb}    | 0
> >   meta/recipes-rt/rt-tests/rt-tests.inc                      | 2 +-
> >   .../rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb}          | 0
> >   4 files changed, 5 insertions(+), 4 deletions(-)
> >   rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb =>
> hwlatdetect_1.9.bb} (100%)
> >   rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb}
> (100%)
> >
> > diff --git
> a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> > index c18928ed02..8fd94b176c 100644
> > ---
> a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> > +++
> b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> > @@ -1,4 +1,4 @@
> > -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17 00:00:00 2001
> > +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17 00:00:00 2001
> >   From: Randy Witt <randy.e.witt@intel.com>
> >   Date: Fri, 16 Oct 2020 16:54:30 -0700
> >   Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
> > @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
> >   Signed-off-by: Randy Witt <randy.e.witt@intel.com>
> >
> >   Upstream-Status: Inappropriate [other]
> > +
> >   ---
> >    Makefile | 4 ++--
> >    1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >   diff --git a/Makefile b/Makefile
> > -index 05fc5ed..7a289c8 100644
> > +index c3ebbd7..2176835 100644
> >   --- a/Makefile
> >   +++ b/Makefile
> >   @@ -1,6 +1,6 @@
> > - VERSION = 1.8
> > + VERSION = 1.9
> >   -CC = $(CROSS_COMPILE)gcc
> >   -AR = $(CROSS_COMPILE)ar
> >   +CC ?= $(CROSS_COMPILE)gcc
> > diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
> b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> > similarity index 100%
> > rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
> > rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> > diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
> b/meta/recipes-rt/rt-tests/rt-tests.inc
> > index 5d28c7e63e..2dd890cf95 100644
> > --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> > +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> > @@ -1,5 +1,5 @@
> >   # Version 1.8
> > -SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
> > +SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
> >   PE = "1"
> >
> >   SRC_URI = "git://
> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
> "
> > diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
> b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> > similarity index 100%
> > rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
> > rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> >
> >
> >
> > 
> >
>

--000000000000ceac6705b338b898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you send a patch for this please?</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, 3 Nov 2020 at 19:43, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">rt-tests now have added c=
ode which only works for x86/x86_64/ppc64 in <br>
src/oslat/oslat.c, so either that will need fixing for other arches or <br=
>
limit this recipe to above said arches. see a failure here e.g.<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/511500/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/511500/</a><br>
<br>
On 11/2/20 8:48 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patc=
h | 7 ++++---<br>
&gt;=C2=A0 =C2=A0.../rt-tests/{<a href=3D"http://hwlatdetect_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">hwlatdetect_1.8.bb</a> =3D&gt; <a href=
=3D"http://hwlatdetect_1.9.bb" rel=3D"noreferrer" target=3D"_blank">hwlatd=
etect_1.9.bb</a>}=C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A0meta/recipes-rt/rt-tests/rt-tests.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0.../rt-tests/{<a href=3D"http://rt-tests_1.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">rt-tests_1.8.bb</a> =3D&gt; <a href=3D"http://=
rt-tests_1.9.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.9.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A04 files changed, 5 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-rt/rt-tests/{<a href=3D"http://hwlatd=
etect_1.8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.8.bb</a> =
=3D&gt; <a href=3D"http://hwlatdetect_1.9.bb" rel=3D"noreferrer" target=3D=
"_blank">hwlatdetect_1.9.bb</a>} (100%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-rt/rt-tests/{<a href=3D"http://rt-tes=
ts_1.8.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.8.bb</a> =3D&gt;=
 <a href=3D"http://rt-tests_1.9.bb" rel=3D"noreferrer" target=3D"_blank">rt=
-tests_1.9.bb</a>} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-C=
C-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makef=
ile-Allow-for-CC-and-AR-to-be-overridden.patch<br>
&gt; index c18928ed02..8fd94b176c 100644<br>
&gt; --- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-A=
R-to-be-overridden.patch<br>
&gt; +++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-A=
R-to-be-overridden.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17 00:00:00 20=
01<br>
&gt; +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 =C2=A0From: Randy Witt &lt;<a href=3D"mailto:randy.e.witt@intel=
.com" target=3D"_blank">randy.e.witt@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Fri, 16 Oct 2020 16:54:30 -0700<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Makefile: Allow for CC and AR to be over=
ridden<br>
&gt; @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.<br=
>
&gt;=C2=A0 =C2=A0Signed-off-by: Randy Witt &lt;<a href=3D"mailto:randy.e.w=
itt@intel.com" target=3D"_blank">randy.e.witt@intel.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate [other]<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 Makefile | 4 ++--<br>
&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/Makefile b/Makefile<br>
&gt; -index 05fc5ed..7a289c8 100644<br>
&gt; +index c3ebbd7..2176835 100644<br>
&gt;=C2=A0 =C2=A0--- a/Makefile<br>
&gt;=C2=A0 =C2=A0+++ b/Makefile<br>
&gt;=C2=A0 =C2=A0@@ -1,6 +1,6 @@<br>
&gt; - VERSION =3D 1.8<br>
&gt; + VERSION =3D 1.9<br>
&gt;=C2=A0 =C2=A0-CC =3D $(CROSS_COMPILE)gcc<br>
&gt;=C2=A0 =C2=A0-AR =3D $(CROSS_COMPILE)ar<br>
&gt;=C2=A0 =C2=A0+CC ?=3D $(CROSS_COMPILE)gcc<br>
&gt; diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1=
.8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.8.bb</a> b/meta/r=
ecipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.9.bb" rel=3D"noreferrer"=
 target=3D"_blank">hwlatdetect_1.9.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.=
8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.8.bb</a><br>
&gt; rename to meta/recipes-rt/rt-tests/<a href=3D"http://hwlatdetect_1.9.=
bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.9.bb</a><br>
&gt; diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/=
rt-tests/rt-tests.inc<br>
&gt; index 5d28c7e63e..2dd890cf95 100644<br>
&gt; --- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
&gt; +++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 =C2=A0# Version 1.8<br>
&gt; -SRCREV =3D &quot;9f78b91f057e63b0c241012ce36b57168133eefb&quot;<br>
&gt; +SRCREV =3D &quot;21c1df7d2ee199ac619cbb1806a38d15e7e95c09&quot;<br>
&gt;=C2=A0 =C2=A0PE =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/=
pub/scm/utils/rt-tests/rt-tests.git;branch=3Dunstable/devel/latest" rel=3D"=
noreferrer" target=3D"_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-test=
s.git;branch=3Dunstable/devel/latest</a>&quot;<br>
&gt; diff --git a/meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_1.8.=
bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.8.bb</a> b/meta/recipes=
-rt/rt-tests/<a href=3D"http://rt-tests_1.9.bb" rel=3D"noreferrer" target=
=3D"_blank">rt-tests_1.9.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_1.8.b=
b" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.8.bb</a><br>
&gt; rename to meta/recipes-rt/rt-tests/<a href=3D"http://rt-tests_1.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">rt-tests_1.9.bb</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000ceac6705b338b898--
