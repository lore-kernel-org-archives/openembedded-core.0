Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDF3C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:52:02 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.3068.1676490721635416155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 11:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pnKPN+TG;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id b3so44883lfv.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 11:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4o+IcN3T1U25Wypg+20RKsUbgF9BItf9aKSg4sFQ1pE=;
        b=pnKPN+TGmlOL11Y8OYV1ANpJuUCNgX82wk71wPksPoHuZoUWCyZ8RotA13QAhKQb9k
         3dT2qUalzxMgfUKTft4PxZeXb8nRhVBlZcA8JVnszrlILBFmHn7NG0Em4Zxlq6do/Qu6
         wf7PnaMLLp5qfhjMtBxbtHCuFytqBGl2s56/vTRU4z1MQqc5KXY9AyBaDHakqft7iJJG
         iGJ9Q3ef+JKnmPKJIZ793fLt7myMt8yyeQOrjhj4TiTuj8/DGM/3gfFRlA+HkSOiQcIG
         EHp0bb2lz0wBJCR1uBTXOWOirzqECdnG8Rpq0kY8zByHpgx4NiJXnJDoSsuvKJsJstVB
         F+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o+IcN3T1U25Wypg+20RKsUbgF9BItf9aKSg4sFQ1pE=;
        b=B0w6vX3f+IoWK0TX5ygQ++/VAtUp4EkjxEow/EU3gEuCSbhT2GHIgAXkph1Y63bVii
         fVJIfSFhukCChKXe6DsNjRTqGNmsoFQ8WG5LBedst+jQqXRxyuPOwl3h2xBN/seChwNS
         IMw6taQA3ruFk4gl00/OOTCHYWUKtu3dV/sz7VKqLQYjwL5+HH7XFx1g9PrQaOYsotLj
         ss+yLstxECeVq/6axUlmY0IhiDA2D7OsUIgA/mhLX0cPHHPSipvyl7taQ1Slmof2nerH
         fmlttVqFKH1wE9ydUWWMMFPNCTgwXrYI34HxBUP+C1/iQf0exahoCVECfx5GnmeqLADp
         2nrQ==
X-Gm-Message-State: AO0yUKVcJeCzF6bx9ZEUovfvqqPC6E6q6V/AuxIjNuZPpdFIHJ012ur4
	RXrCgAFZaH0wPqbLeTHerLc901cqYrulMPPWJZY=
X-Google-Smtp-Source: AK7set/2M+kFiXurT3u3DhYkrJjSIY7Mb/c0fvo2syvrodpC7ZIvCvOt8EGalv/YtBCNzA6xWIR75LOiHBO/XZiMlNM=
X-Received: by 2002:ac2:4854:0:b0:4db:1999:67a3 with SMTP id
 20-20020ac24854000000b004db199967a3mr886582lfy.13.1676490719598; Wed, 15 Feb
 2023 11:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20230215171832.635085-1-Martin.Jansa@gmail.com> <CAMKF1spS64yaiNdALD5hGKWqH=aOLPrfa1JzCYPoDOpRHpecdQ@mail.gmail.com>
In-Reply-To: <CAMKF1spS64yaiNdALD5hGKWqH=aOLPrfa1JzCYPoDOpRHpecdQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 20:51:48 +0100
Message-ID: <CANNYZj9NM+8vhn9gfsmFju6waM+19+PHRMv5L7wvBCi3Obz6qw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] libssh2: Update patch to apply and fix
 malformed Upstream-Status
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, changqing.li@windriver.com, 
	openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000cf9b2305f4c26944"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 19:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177211

--000000000000cf9b2305f4c26944
Content-Type: text/plain; charset="UTF-8"

Please no. Much less readable without a space.

Alex

On Wed 15. Feb 2023 at 20.27, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 15, 2023 at 9:18 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * I've noticed this, because patchreview.py reports Malformed
> >   Upstream-Status in this one now, but the QA check in insane.bbclass
> >   wasn't reporting it before
> >
> > * the reason why insane.bbclass doesn't report it is because:
> >   SRC_URI:append:ptest = "
> file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
> >   doesn't work and probably never did as "ptest" is not an override
> >   and patch-status-core checks only the .patch files which are really
> >   in SRC_URI.
> >
> > * I've added it directly to SRC_URI and it also didn't apply:
> >   http://errors.yoctoproject.org/Errors/Details/689955/
> >   as the "endif" at the end was removed in 1.10.0 version:
> >
> https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9db
> >
> >   after updating the patch to apply I got expected patch-status-core
> failure:
> >   http://errors.yoctoproject.org/Errors/Details/689956/
> >   ERROR: QA Issue: Malformed Upstream-Status in patch
> >
>  TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> >   Please correct according to
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
> :
> >   Upstream-Status: Inappropriate[oe specific] [patch-status-core]
> >
> > * so the mystery is solved, but what should be do with this never-used
> >   patch, I think we should just delete it together with
> >   SRC_URI:append:ptest, but please Changqing Li confirm it's not needed
> >
> > * it was originally added by Changqing Li in meta-oe with:
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=d7aa7173405c3b36235af736cd31dbe110708787
> >   then imported to oe-core by Randy MacLeod with:
> >
> https://git.openembedded.org/openembedded-core/commit/?id=57df134b1be56a688f41851e5ff014dd859c0bc3
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
> >  1 file changed, 7 insertions(+), 15 deletions(-)
> >
> > diff --git
> a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > index b1204e49eb..e0000b2658 100644
> > ---
> a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > +++
> b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > @@ -1,24 +1,23 @@
> > -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
> > -From: Your Name <you@example.com>
> > +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> >  Date: Mon, 28 Dec 2020 02:08:03 +0000
> >  Subject: [PATCH] Don't let host enviroment to decide if a test is build
> >
> >  test ssh2.sh need sshd, for cross compile, we need it on target, so
> >  don't use SSHD on host to decide weither to build a test
> >
> > -Upstream-Status: Inappropriate[oe specific]
> > +Upstream-Status: Inappropriate [oe specific]
>
> Since we are already using a special token '[' to separate reason from
> status, I always wondered if having this space before '[' is something
> that could be ignored.
>
> >
> >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > -
> >  ---
> > - tests/Makefile.am | 6 +-----
> > - 1 file changed, 1 insertion(+), 5 deletions(-)
> > + tests/Makefile.am | 4 ----
> > + 1 file changed, 4 deletions(-)
> >
> >  diff --git a/tests/Makefile.am b/tests/Makefile.am
> > -index dc0922f..6cbc35d 100644
> > +index 27ddc2d..13de8ab 100644
> >  --- a/tests/Makefile.am
> >  +++ b/tests/Makefile.am
> > -@@ -1,16 +1,12 @@
> > +@@ -3,16 +3,12 @@ SUBDIRS = ossfuzz
> >   AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include
> -I$(top_builddir)/src
> >   LDADD = ../src/libssh2.la
> >
> > @@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644
> >   check_PROGRAMS = $(ctests)
> >
> >   TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
> > -@@ -38,4 +34,4 @@ if OPENSSL
> > - # EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
> > - # EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
> > - EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
> > --endif
> > -\ No newline at end of file
> > -+endif
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177209):
> https://lists.openembedded.org/g/openembedded-core/message/177209
> Mute This Topic: https://lists.openembedded.org/mt/96987532/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cf9b2305f4c26944
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please no. Much less readable without a space.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 15. Feb 2023 at 20=
.27, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">On Wed, Feb 15, 2023 at 9:18 AM Ma=
rtin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">=
Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * I&#39;ve noticed this, because patchreview.py reports Malformed<br>
&gt;=C2=A0 =C2=A0Upstream-Status in this one now, but the QA check in insan=
e.bbclass<br>
&gt;=C2=A0 =C2=A0wasn&#39;t reporting it before<br>
&gt;<br>
&gt; * the reason why insane.bbclass doesn&#39;t report it is because:<br>
&gt;=C2=A0 =C2=A0SRC_URI:append:ptest =3D &quot; file://0001-Don-t-let-host=
-enviroment-to-decide-if-a-test-is-bui.patch&quot;<br>
&gt;=C2=A0 =C2=A0doesn&#39;t work and probably never did as &quot;ptest&quo=
t; is not an override<br>
&gt;=C2=A0 =C2=A0and patch-status-core checks only the .patch files which a=
re really<br>
&gt;=C2=A0 =C2=A0in SRC_URI.<br>
&gt;<br>
&gt; * I&#39;ve added it directly to SRC_URI and it also didn&#39;t apply:<=
br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/6=
89955/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org=
/Errors/Details/689955/</a><br>
&gt;=C2=A0 =C2=A0as the &quot;endif&quot; at the end was removed in 1.10.0 =
version:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/libssh2/libssh2/commit/ecd6a=
74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbc=
c6db89f217e5943b1de73c81a4f9db" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c5641720=
e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9db</a>=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0after updating the patch to apply I got expected patch-sta=
tus-core failure:<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/6=
89956/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org=
/Errors/Details/689956/</a><br>
&gt;=C2=A0 =C2=A0ERROR: QA Issue: Malformed Upstream-Status in patch<br>
&gt;=C2=A0 =C2=A0TOPDIR/openembedded-core/meta/recipes-support/libssh2/file=
s/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch<br>
&gt;=C2=A0 =C2=A0Please correct according to <a href=3D"https://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations=
:_Upstream-Status" rel=3D"noreferrer" target=3D"_blank">https://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations=
:_Upstream-Status</a> :<br>
&gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate[oe specific] [patch-status-=
core]<br>
&gt;<br>
&gt; * so the mystery is solved, but what should be do with this never-used=
<br>
&gt;=C2=A0 =C2=A0patch, I think we should just delete it together with<br>
&gt;=C2=A0 =C2=A0SRC_URI:append:ptest, but please Changqing Li confirm it&#=
39;s not needed<br>
&gt;<br>
&gt; * it was originally added by Changqing Li in meta-oe with:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembedded/=
commit/?id=3Dd7aa7173405c3b36235af736cd31dbe110708787" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?id=
=3Dd7aa7173405c3b36235af736cd31dbe110708787</a><br>
&gt;=C2=A0 =C2=A0then imported to oe-core by Randy MacLeod with:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D57df134b1be56a688f41851e5ff014dd859c0bc3" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=3D57df134b1be56a688f41851e5ff014dd859c0bc3</a><br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------=
------<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 15 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-en=
viroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/fi=
les/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch<br>
&gt; index b1204e49eb..e0000b2658 100644<br>
&gt; --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviromen=
t-to-decide-if-a-test-is-bui.patch<br>
&gt; +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviromen=
t-to-decide-if-a-test-is-bui.patch<br>
&gt; @@ -1,24 +1,23 @@<br>
&gt; -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Your Name &lt;<a href=3D"mailto:you@example.com" target=3D"_bla=
nk">you@example.com</a>&gt;<br>
&gt; +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 28 Dec 2020 02:08:03 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Don&#39;t let host enviroment to decide if a te=
st is build<br>
&gt;<br>
&gt;=C2=A0 test ssh2.sh need sshd, for cross compile, we need it on target,=
 so<br>
&gt;=C2=A0 don&#39;t use SSHD on host to decide weither to build a test<br>
&gt;<br>
&gt; -Upstream-Status: Inappropriate[oe specific]<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
<br>
Since we are already using a special token &#39;[&#39; to separate reason f=
rom<br>
status, I always wondered if having this space before &#39;[&#39; is someth=
ing<br>
that could be ignored.<br>
<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; -<br>
&gt;=C2=A0 ---<br>
&gt; - tests/Makefile.am | 6 +-----<br>
&gt; - 1 file changed, 1 insertion(+), 5 deletions(-)<br>
&gt; + tests/Makefile.am | 4 ----<br>
&gt; + 1 file changed, 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
&gt; -index dc0922f..6cbc35d 100644<br>
&gt; +index 27ddc2d..13de8ab 100644<br>
&gt;=C2=A0 --- a/tests/Makefile.am<br>
&gt;=C2=A0 +++ b/tests/Makefile.am<br>
&gt; -@@ -1,16 +1,12 @@<br>
&gt; +@@ -3,16 +3,12 @@ SUBDIRS =3D ossfuzz<br>
&gt;=C2=A0 =C2=A0AM_CPPFLAGS =3D -I$(top_srcdir)/src -I$(top_srcdir)/includ=
e -I$(top_builddir)/src<br>
&gt;=C2=A0 =C2=A0LDADD =3D ../src/<a href=3D"http://libssh2.la" rel=3D"nore=
ferrer" target=3D"_blank">libssh2.la</a><br>
&gt;<br>
&gt; @@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644<br>
&gt;=C2=A0 =C2=A0check_PROGRAMS =3D $(ctests)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0TESTS_ENVIRONMENT =3D SSHD=3D$(SSHD) EXEEXT=3D$(EXEEXT)<br=
>
&gt; -@@ -38,4 +34,4 @@ if OPENSSL<br>
&gt; - # EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_encrypt=
ed_ed25519_key.c<br>
&gt; - # EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_ed25519=
_key_from_mem.c<br>
&gt; - EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_rsa_opens=
sh_key.c<br>
&gt; --endif<br>
&gt; -\ No newline at end of file<br>
&gt; -+endif<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177209): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177209" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177209</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96987532/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96987532/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cf9b2305f4c26944--

