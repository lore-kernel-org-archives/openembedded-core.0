Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.2914.1604433165414562483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q0xuB70K;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id r14so5216660vsa.13
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 11:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5LsqYRirLDLm79wv2yenRfrQYnclTx2CAAwRPiummg=;
        b=Q0xuB70KLQUzsvHHs4O1oelakLIyS1qsc+qUe+MULchAjQQS1wt4WmEn3pB8k2akIE
         iRsZ82yQ3djXqzD+bteiQgbDr1DcA7MClY36k9fZlZzqpAv2IjR3DDvfzxp4eUw6wh2S
         dGVYABdLsejXiY1Ct/5WQqGs6p4Pw/yKGBZ3ayuMZ1aR6P3VAj3i6j7GwbDTp9EYMfSR
         24dUBnloZ+Vr04eDvIagdCOhWfFyAQ47GKVaDIymotklI1K+suDQBLPSS/PXUDMsoDGI
         /iNLtG8IunHSAr5WbE+Rt9wESyTxbeVem5UOqaQiOCVBS3RIc/lRH4HAG7oDaTbmdA93
         9HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5LsqYRirLDLm79wv2yenRfrQYnclTx2CAAwRPiummg=;
        b=OqvMmRVv2xhwybYG0WOWH/7/58VLPxnQfCQE/TVC/zzuP0YCCvCUdwMWYs1TJvxIVo
         psXf+w4PrkaDA+FMeJs7W1HCNpe8oHKeIHTbRMStSWejk+YMqmv8/xB1d19Vnyfh5jQ1
         NhHaYm54mF63pc9RbA0zVydOFq86Ck6KCSFp0sN3/cRiLNx7ALiDdS6fDQGPI/UzKSeD
         UWYfzmKiBtWB+Fj3h+pmvqvHjanpwbN8+inCBZmRm07qEClFhLIwxPFL5wJj+Jf5UefD
         89wXN0tz+sM6jU7u8aoE6vxwAmmK6cGJsYjnW7ZMLnFA1N2OLddhkfhoToonRMMCK5Bh
         hF5w==
X-Gm-Message-State: AOAM531yTgDw4nPkiGpl0SLhDhvWn8eV8/kREEH4y+NEqEqr2bGsur75
	tAUUXQGgX7jekJjzaRfnxTFxHNzZENTeRvrUiiw=
X-Google-Smtp-Source: ABdhPJyvwrYNmJwMlX0Qyns6gpqa+OHxXC1zNQ1belh6Wk2SNvVOyxNVWp2gC8Tgh607OTLvBoC+om5vsSIYeMXbXT8=
X-Received: by 2002:a05:6102:3c8:: with SMTP id n8mr19508301vsq.31.1604433164557;
 Tue, 03 Nov 2020 11:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-70-alex.kanavin@gmail.com> <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
 <CANNYZj8hyJoeQkV_GyM7jXZh-8OVSMK=jp3pQ=nHyiFisYRUfA@mail.gmail.com> <395c85f0-61fe-c39f-fb5d-2aa59f22181e@gmail.com>
In-Reply-To: <395c85f0-61fe-c39f-fb5d-2aa59f22181e@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 3 Nov 2020 20:52:33 +0100
Message-ID: <CANNYZj9b1w4DZAatRVG1jkyprZjov9UFaT=oa5_qbXePfm2N5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000d6e0d505b3393420"

--000000000000d6e0d505b3393420
Content-Type: text/plain; charset="UTF-8"

World builds are only done for x86/x86-64 I think? That would be good to
adjust, and build at least one truly cross-compiled world.

Alex

On Tue, 3 Nov 2020 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 11/3/20 11:17 AM, Alexander Kanavin wrote:
> > Can you send a patch for this please?
> >
>
> thats fine,
>
> Richard,
>
> How does this not get detected in world builds ?
>
> > Alex
> >
> > On Tue, 3 Nov 2020 at 19:43, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     rt-tests now have added code which only works for x86/x86_64/ppc64 in
> >     src/oslat/oslat.c, so either that will need fixing for other arches
> or
> >     limit this recipe to above said arches. see a failure here e.g.
> >
> >     https://errors.yoctoproject.org/Errors/Details/511500/
> >
> >     On 11/2/20 8:48 AM, Alexander Kanavin wrote:
> >      > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >      > ---
> >      >   ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7
> >     ++++---
> >      >   .../rt-tests/{hwlatdetect_1.8.bb <http://hwlatdetect_1.8.bb> =>
> >     hwlatdetect_1.9.bb <http://hwlatdetect_1.9.bb>}    | 0
> >      >   meta/recipes-rt/rt-tests/rt-tests.inc                      | 2
> +-
> >      >   .../rt-tests/{rt-tests_1.8.bb <http://rt-tests_1.8.bb> =>
> >     rt-tests_1.9.bb <http://rt-tests_1.9.bb>}          | 0
> >      >   4 files changed, 5 insertions(+), 4 deletions(-)
> >      >   rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb
> >     <http://hwlatdetect_1.8.bb> => hwlatdetect_1.9.bb
> >     <http://hwlatdetect_1.9.bb>} (100%)
> >      >   rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb
> >     <http://rt-tests_1.8.bb> => rt-tests_1.9.bb
> >     <http://rt-tests_1.9.bb>} (100%)
> >      >
> >      > diff --git
> >
>  a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> >
>  b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> >      > index c18928ed02..8fd94b176c 100644
> >      > ---
> >
>  a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> >      > +++
> >
>  b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> >      > @@ -1,4 +1,4 @@
> >      > -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17
> >     00:00:00 2001
> >      > +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17
> >     00:00:00 2001
> >      >   From: Randy Witt <randy.e.witt@intel.com
> >     <mailto:randy.e.witt@intel.com>>
> >      >   Date: Fri, 16 Oct 2020 16:54:30 -0700
> >      >   Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
> >      > @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
> >      >   Signed-off-by: Randy Witt <randy.e.witt@intel.com
> >     <mailto:randy.e.witt@intel.com>>
> >      >
> >      >   Upstream-Status: Inappropriate [other]
> >      > +
> >      >   ---
> >      >    Makefile | 4 ++--
> >      >    1 file changed, 2 insertions(+), 2 deletions(-)
> >      >
> >      >   diff --git a/Makefile b/Makefile
> >      > -index 05fc5ed..7a289c8 100644
> >      > +index c3ebbd7..2176835 100644
> >      >   --- a/Makefile
> >      >   +++ b/Makefile
> >      >   @@ -1,6 +1,6 @@
> >      > - VERSION = 1.8
> >      > + VERSION = 1.9
> >      >   -CC = $(CROSS_COMPILE)gcc
> >      >   -AR = $(CROSS_COMPILE)ar
> >      >   +CC ?= $(CROSS_COMPILE)gcc
> >      > diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
> >     <http://hwlatdetect_1.8.bb>
> >     b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> >     <http://hwlatdetect_1.9.bb>
> >      > similarity index 100%
> >      > rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
> >     <http://hwlatdetect_1.8.bb>
> >      > rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> >     <http://hwlatdetect_1.9.bb>
> >      > diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
> >     b/meta/recipes-rt/rt-tests/rt-tests.inc
> >      > index 5d28c7e63e..2dd890cf95 100644
> >      > --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> >      > +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> >      > @@ -1,5 +1,5 @@
> >      >   # Version 1.8
> >      > -SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
> >      > +SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
> >      >   PE = "1"
> >      >
> >      >   SRC_URI =
> >     "git://
> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
> >     <
> http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
> >"
> >      > diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
> >     <http://rt-tests_1.8.bb> b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> >     <http://rt-tests_1.9.bb>
> >      > similarity index 100%
> >      > rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
> >     <http://rt-tests_1.8.bb>
> >      > rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> >     <http://rt-tests_1.9.bb>
> >      >
> >      >
> >      >
> >      > 
> >      >
> >
>

--000000000000d6e0d505b3393420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>World builds are only done for x86/x86-64 I think? Th=
at would be good to adjust, and build at least one truly cross-compiled wor=
ld.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Nov 2020 at 20:25,=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/3/20 11:17 AM, Alexander Kanavin wrote:<br>
&gt; Can you send a patch for this please?<br>
&gt; <br>
<br>
thats fine,<br>
<br>
Richard,<br>
<br>
How does this not get detected in world builds ?<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 3 Nov 2020 at 19:43, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0rt-tests now have added code which only works for =
x86/x86_64/ppc64 in<br>
&gt;=C2=A0 =C2=A0 =C2=A0src/oslat/oslat.c, so either that will need fixing=
 for other arches or<br>
&gt;=C2=A0 =C2=A0 =C2=A0limit this recipe to above said arches. see a fail=
ure here e.g.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://errors.yoctoproject.org/Errors/=
Details/511500/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctop=
roject.org/Errors/Details/511500/</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/2/20 8:48 AM, Alexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Alexander Kanavin &lt;<a href=
=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0...001-Makefile-Allow-for-CC-and=
-AR-to-be-overridden.patch | 7<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0.../rt-tests/{<a href=3D"http://=
hwlatdetect_1.8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.8.bb=
</a> &lt;<a href=3D"http://hwlatdetect_1.8.bb" rel=3D"noreferrer" target=3D=
"_blank">http://hwlatdetect_1.8.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://hwlatdetect_1.9.bb" rel=3D"noref=
errer" target=3D"_blank">hwlatdetect_1.9.bb</a> &lt;<a href=3D"http://hwlat=
detect_1.9.bb" rel=3D"noreferrer" target=3D"_blank">http://hwlatdetect_1.9.=
bb</a>&gt;}=C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/recipes-rt/rt-tests/rt-test=
s.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0.../rt-tests/{<a href=3D"http://=
rt-tests_1.8.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.8.bb</a> &=
lt;<a href=3D"http://rt-tests_1.8.bb" rel=3D"noreferrer" target=3D"_blank">=
http://rt-tests_1.8.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rt-tests_1.9.bb" rel=3D"noreferr=
er" target=3D"_blank">rt-tests_1.9.bb</a> &lt;<a href=3D"http://rt-tests_1.=
9.bb" rel=3D"noreferrer" target=3D"_blank">http://rt-tests_1.9.bb</a>&gt;}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A04 files changed, 5 insertions(+)=
, 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0rename meta/recipes-rt/rt-tests/=
{<a href=3D"http://hwlatdetect_1.8.bb" rel=3D"noreferrer" target=3D"_blank"=
>hwlatdetect_1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.8.bb</a>&gt; =3D&gt; <a h=
ref=3D"http://hwlatdetect_1.9.bb" rel=3D"noreferrer" target=3D"_blank">hwla=
tdetect_1.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.9.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0rename meta/recipes-rt/rt-tests/=
{<a href=3D"http://rt-tests_1.8.bb" rel=3D"noreferrer" target=3D"_blank">rt=
-tests_1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.8.bb</a>&gt; =3D&gt; <a href=3D=
"http://rt-tests_1.9.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_1.9.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.9.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-rt/rt-tests/files/0001-Makefile-All=
ow-for-CC-and-AR-to-be-overridden.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-rt/rt-tests/files/0001-Makefile-All=
ow-for-CC-and-AR-to-be-overridden.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index c18928ed02..8fd94b176c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-rt/rt-tests/files/0001-Makefile-All=
ow-for-CC-and-AR-to-be-overridden.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-rt/rt-tests/files/0001-Makefile-All=
ow-for-CC-and-AR-to-be-overridden.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From caaa142826504ad0375f9d21c558f10f31305c=
db Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From f89d6d6d23e0dacfd0008f686a457d536edc40=
6a Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0From: Randy Witt &lt;<a href=3D"=
mailto:randy.e.witt@intel.com" target=3D"_blank">randy.e.witt@intel.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:randy.e.witt@intel.co=
m" target=3D"_blank">randy.e.witt@intel.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Date: Fri, 16 Oct 2020 16:54:30 =
-0700<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Subject: [PATCH] Makefile: Allow=
 for CC and AR to be overridden<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b=
816a46998f0827ab6e6eb.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Signed-off-by: Randy Witt &lt;<a=
 href=3D"mailto:randy.e.witt@intel.com" target=3D"_blank">randy.e.witt@inte=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:randy.e.witt@intel.co=
m" target=3D"_blank">randy.e.witt@intel.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate [=
other]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 Makefile | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+)=
, 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0diff --git a/Makefile b/Makefile=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 05fc5ed..7a289c8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index c3ebbd7..2176835 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0--- a/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0+++ b/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0@@ -1,6 +1,6 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - VERSION =3D 1.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + VERSION =3D 1.9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0-CC =3D $(CROSS_COMPILE)gcc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0-AR =3D $(CROSS_COMPILE)ar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0+CC ?=3D $(CROSS_COMPILE)gcc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-rt/rt-tests/<a hre=
f=3D"http://hwlatdetect_1.8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatd=
etect_1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-rt/rt-tests/<a href=3D"http://hwlat=
detect_1.9.bb" rel=3D"noreferrer" target=3D"_blank">hwlatdetect_1.9.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from meta/recipes-rt/rt-tests/<a href=
=
=3D"http://hwlatdetect_1.8.bb" rel=3D"noreferrer" target=3D"_blank">hwlatd=
etect_1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to meta/recipes-rt/rt-tests/<a href=
=3D"http://hwlatdetect_1.9.bb" rel=3D"noreferrer" target=3D"_blank">hwlatd=
etect_1.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://hwlatdetect_1.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://hwlatdetect_1.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-rt/rt-tests/rt-tes=
ts.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 5d28c7e63e..2dd890cf95 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-rt/rt-tests/rt-tests.inc<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-rt/rt-tests/rt-tests.inc<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0# Version 1.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -SRCREV =3D &quot;9f78b91f057e63b0c241012ce3=
6b57168133eefb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRCREV =3D &quot;21c1df7d2ee199ac619cbb1806=
a38d15e7e95c09&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0PE =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://git.kernel.org/pub/s=
cm/utils/rt-tests/rt-tests.git;branch=3Dunstable/devel/latest" rel=3D"noref=
errer" target=3D"_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git=
;branch=3Dunstable/devel/latest</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.kernel.org/pub/scm/utils=
/rt-tests/rt-tests.git;branch=3Dunstable/devel/latest" rel=3D"noreferrer" t=
arget=3D"_blank">http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;=
branch=3Dunstable/devel/latest</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-rt/rt-tests/<a hre=
f=3D"http://rt-tests_1.8.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_=
1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.8.bb</a>&gt; b/meta/recipes-rt/=
rt-tests/<a href=3D"http://rt-tests_1.9.bb" rel=3D"noreferrer" target=3D"_b=
lank">rt-tests_1.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from meta/recipes-rt/rt-tests/<a href=
=
=3D"http://rt-tests_1.8.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_=
1.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to meta/recipes-rt/rt-tests/<a href=
=3D"http://rt-tests_1.9.bb" rel=3D"noreferrer" target=3D"_blank">rt-tests_=
1.9.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://rt-tests_1.9.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://rt-tests_1.9.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
</blockquote></div>

--000000000000d6e0d505b3393420--
