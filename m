Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24284C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:47:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.4576.1676494016795232514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 12:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ck86YWg7;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id n33so66852wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Omgwohg4RYnOOxMBGHvt48DUMGd6roOH2g713scxBNE=;
        b=Ck86YWg7jk17wyTVjKtYy8cSSg/A2Ns5H+GLmbRjh5bHOGbY/wame+HYweb4FHIrqH
         J712XHy7umBXyRM9vEd03HuOwr5doqbu+dJws+3qCku1e4U7C+4zWdMO0q0jPlfL7u/B
         NReWOs6GGJUmw963MIZ79JnuW1/a3v28hh1fP4PnFVOacu2oh9xjGXDXyxwL3baZstPw
         l0x+K1yAwRdwdJK4JYRKvrxTtn8ogJtTI5E1EwaNrxaIlmPXMJxJSx2ueDdTDZ2GXk29
         hjRLeBF1+yDKiGapnIwr1VwUsYxvgQa9GzVR6CEENPsrLn7cpD5axKhmIeCuWeaGGJs1
         ilBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Omgwohg4RYnOOxMBGHvt48DUMGd6roOH2g713scxBNE=;
        b=yIcbQmfxk/ip2h+hgLKxhicBRSGeqQfhHF4AmLt2o81mdiIZTx1vVoM1OsSBNH41eY
         WzksVcd51BBXHutCfgj3dQrqnXLwZUBm1K7RpM9/EtgKUHD5LmI4zo4uEdBgmRPi0Ipx
         OlarqWeQMYgeyJQs2xTs5eNyHafWYJEpXliLJ5ieIi4QXez1tBU3K0FTylHc0cwIGblN
         t46YWyGL32xONb02IJ/LLx3gClFyRxQKC8cc2Dx3Tdz2GTz8l1eIOTr0es9Qi1vAu7bh
         wz/GWaZvEFu8+JB/wR/qqGq6aX5fkXyxNpNXhCDnE+4u6ycOdgrOu/ddiGh9Cl5bWlvJ
         73Vg==
X-Gm-Message-State: AO0yUKV60+54TJG5NSDsOC7AVHBKhDkVLn+Bs8M6Ycr0R0hzLzzU08K9
	S/CZ0annQL3BcTkjlPjGCMzM0FhjedG0KZ138sM=
X-Google-Smtp-Source: AK7set83vWH1df8VxMoQca653orQI0olU06Y4Y3uSeGnflwPNbv3iwoUPKzsfh396MZeT0GnOU69NNz1W2GBMQvaF9Y=
X-Received: by 2002:a05:600c:cc5:b0:3dc:546c:b2ec with SMTP id
 fk5-20020a05600c0cc500b003dc546cb2ecmr371024wmb.32.1676494015100; Wed, 15 Feb
 2023 12:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20230215171832.635085-1-Martin.Jansa@gmail.com>
 <CAMKF1spS64yaiNdALD5hGKWqH=aOLPrfa1JzCYPoDOpRHpecdQ@mail.gmail.com> <CAMKF1sp6qoGq3tqgs7V8qthxv7cW2iVav8w21za3OrKTxjvEjA@mail.gmail.com>
In-Reply-To: <CAMKF1sp6qoGq3tqgs7V8qthxv7cW2iVav8w21za3OrKTxjvEjA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2023 21:46:40 +0100
Message-ID: <CA+chaQdfJsKcc5aXp44QF1Uu+6YDRBnuTVfUQ0Tm2v7=WxFhJg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] libssh2: Update patch to apply and fix
 malformed Upstream-Status
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	changqing.li@windriver.com
Content-Type: multipart/alternative; boundary="0000000000003cfb6505f4c32e5e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 20:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177214

--0000000000003cfb6505f4c32e5e
Content-Type: text/plain; charset="UTF-8"

patchreview.py will care about the space (like insane.bbclass does) if
https://lists.openembedded.org/g/openembedded-core/message/177207 is merged

On Wed, Feb 15, 2023 at 9:35 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 15, 2023 at 11:26 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Feb 15, 2023 at 9:18 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> > >
> > > * I've noticed this, because patchreview.py reports Malformed
> > >   Upstream-Status in this one now, but the QA check in insane.bbclass
> > >   wasn't reporting it before
> > >
> > > * the reason why insane.bbclass doesn't report it is because:
> > >   SRC_URI:append:ptest = "
> file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
> > >   doesn't work and probably never did as "ptest" is not an override
> > >   and patch-status-core checks only the .patch files which are really
> > >   in SRC_URI.
> > >
> > > * I've added it directly to SRC_URI and it also didn't apply:
> > >   http://errors.yoctoproject.org/Errors/Details/689955/
> > >   as the "endif" at the end was removed in 1.10.0 version:
> > >
> https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9db
> > >
> > >   after updating the patch to apply I got expected patch-status-core
> failure:
> > >   http://errors.yoctoproject.org/Errors/Details/689956/
> > >   ERROR: QA Issue: Malformed Upstream-Status in patch
> > >
>  TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > >   Please correct according to
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
> :
> > >   Upstream-Status: Inappropriate[oe specific] [patch-status-core]
> > >
> > > * so the mystery is solved, but what should be do with this never-used
> > >   patch, I think we should just delete it together with
> > >   SRC_URI:append:ptest, but please Changqing Li confirm it's not needed
> > >
> > > * it was originally added by Changqing Li in meta-oe with:
> > >
> https://git.openembedded.org/meta-openembedded/commit/?id=d7aa7173405c3b36235af736cd31dbe110708787
> > >   then imported to oe-core by Randy MacLeod with:
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=57df134b1be56a688f41851e5ff014dd859c0bc3
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
> > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > >
> > > diff --git
> a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > > index b1204e49eb..e0000b2658 100644
> > > ---
> a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > > +++
> b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> > > @@ -1,24 +1,23 @@
> > > -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
> > > -From: Your Name <you@example.com>
> > > +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
> > > +From: Changqing Li <changqing.li@windriver.com>
> > >  Date: Mon, 28 Dec 2020 02:08:03 +0000
> > >  Subject: [PATCH] Don't let host enviroment to decide if a test is
> build
> > >
> > >  test ssh2.sh need sshd, for cross compile, we need it on target, so
> > >  don't use SSHD on host to decide weither to build a test
> > >
> > > -Upstream-Status: Inappropriate[oe specific]
> > > +Upstream-Status: Inappropriate [oe specific]
> >
> > Since we are already using a special token '[' to separate reason from
> > status, I always wondered if having this space before '[' is something
> > that could be ignored.
> >
>
> I see that scripts/contrib/patchreview.py does not care for space,
> that answers my question. Maybe it would be
> good to tabulate reason as well perhaps.
>
> > >
> > >  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > -
> > >  ---
> > > - tests/Makefile.am | 6 +-----
> > > - 1 file changed, 1 insertion(+), 5 deletions(-)
> > > + tests/Makefile.am | 4 ----
> > > + 1 file changed, 4 deletions(-)
> > >
> > >  diff --git a/tests/Makefile.am b/tests/Makefile.am
> > > -index dc0922f..6cbc35d 100644
> > > +index 27ddc2d..13de8ab 100644
> > >  --- a/tests/Makefile.am
> > >  +++ b/tests/Makefile.am
> > > -@@ -1,16 +1,12 @@
> > > +@@ -3,16 +3,12 @@ SUBDIRS = ossfuzz
> > >   AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include
> -I$(top_builddir)/src
> > >   LDADD = ../src/libssh2.la
> > >
> > > @@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644
> > >   check_PROGRAMS = $(ctests)
> > >
> > >   TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
> > > -@@ -38,4 +34,4 @@ if OPENSSL
> > > - # EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
> > > - # EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
> > > - EXTRA_DIST +=
> test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
> > > --endif
> > > -\ No newline at end of file
> > > -+endif
> > > --
> > > 2.39.2
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#177204):
> https://lists.openembedded.org/g/openembedded-core/message/177204
> > > Mute This Topic: https://lists.openembedded.org/mt/96987532/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

--0000000000003cfb6505f4c32e5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">patchreview.py will care about the space (like insane.bbcl=
ass does) if=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-=
core/message/177207">https://lists.openembedded.org/g/openembedded-core/mes=
sage/177207</a> is merged</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Feb 15, 2023 at 9:35 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 15, 2023 at =
11:26 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Feb 15, 2023 at 9:18 AM Martin Jansa &lt;<a href=3D"mailto:Mar=
tin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; * I&#39;ve noticed this, because patchreview.py reports Malformed=
<br>
&gt; &gt;=C2=A0 =C2=A0Upstream-Status in this one now, but the QA check in =
insane.bbclass<br>
&gt; &gt;=C2=A0 =C2=A0wasn&#39;t reporting it before<br>
&gt; &gt;<br>
&gt; &gt; * the reason why insane.bbclass doesn&#39;t report it is because:=
<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI:append:ptest =3D &quot; file://0001-Don-t-let=
-host-enviroment-to-decide-if-a-test-is-bui.patch&quot;<br>
&gt; &gt;=C2=A0 =C2=A0doesn&#39;t work and probably never did as &quot;ptes=
t&quot; is not an override<br>
&gt; &gt;=C2=A0 =C2=A0and patch-status-core checks only the .patch files wh=
ich are really<br>
&gt; &gt;=C2=A0 =C2=A0in SRC_URI.<br>
&gt; &gt;<br>
&gt; &gt; * I&#39;ve added it directly to SRC_URI and it also didn&#39;t ap=
ply:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/689955/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojec=
t.org/Errors/Details/689955/</a><br>
&gt; &gt;=C2=A0 =C2=A0as the &quot;endif&quot; at the end was removed in 1.=
10.0 version:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/libssh2/libssh2/commit/=
ecd6a74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b9=
59bbcc6db89f217e5943b1de73c81a4f9db" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c56=
41720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9d=
b</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0after updating the patch to apply I got expected patc=
h-status-core failure:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/689956/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojec=
t.org/Errors/Details/689956/</a><br>
&gt; &gt;=C2=A0 =C2=A0ERROR: QA Issue: Malformed Upstream-Status in patch<b=
r>
&gt; &gt;=C2=A0 =C2=A0TOPDIR/openembedded-core/meta/recipes-support/libssh2=
/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch<br>
&gt; &gt;=C2=A0 =C2=A0Please correct according to <a href=3D"https://www.op=
enembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommenda=
tions:_Upstream-Status" rel=3D"noreferrer" target=3D"_blank">https://www.op=
enembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommenda=
tions:_Upstream-Status</a> :<br>
&gt; &gt;=C2=A0 =C2=A0Upstream-Status: Inappropriate[oe specific] [patch-st=
atus-core]<br>
&gt; &gt;<br>
&gt; &gt; * so the mystery is solved, but what should be do with this never=
-used<br>
&gt; &gt;=C2=A0 =C2=A0patch, I think we should just delete it together with=
<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI:append:ptest, but please Changqing Li confirm=
 it&#39;s not needed<br>
&gt; &gt;<br>
&gt; &gt; * it was originally added by Changqing Li in meta-oe with:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-openembe=
dded/commit/?id=3Dd7aa7173405c3b36235af736cd31dbe110708787" rel=3D"noreferr=
er" target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit=
/?id=3Dd7aa7173405c3b36235af736cd31dbe110708787</a><br>
&gt; &gt;=C2=A0 =C2=A0then imported to oe-core by Randy MacLeod with:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-=
core/commit/?id=3D57df134b1be56a688f41851e5ff014dd859c0bc3" rel=3D"noreferr=
er" target=3D"_blank">https://git.openembedded.org/openembedded-core/commit=
/?id=3D57df134b1be56a688f41851e5ff014dd859c0bc3</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++--=
-----------<br>
&gt; &gt;=C2=A0 1 file changed, 7 insertions(+), 15 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-ho=
st-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libss=
h2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch<br=
>
&gt; &gt; index b1204e49eb..e0000b2658 100644<br>
&gt; &gt; --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-envi=
roment-to-decide-if-a-test-is-bui.patch<br>
&gt; &gt; +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-envi=
roment-to-decide-if-a-test-is-bui.patch<br>
&gt; &gt; @@ -1,24 +1,23 @@<br>
&gt; &gt; -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Your Name &lt;<a href=3D"mailto:you@example.com" target=3D=
"_blank">you@example.com</a>&gt;<br>
&gt; &gt; +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 Date: Mon, 28 Dec 2020 02:08:03 +0000<br>
&gt; &gt;=C2=A0 Subject: [PATCH] Don&#39;t let host enviroment to decide if=
 a test is build<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 test ssh2.sh need sshd, for cross compile, we need it on ta=
rget, so<br>
&gt; &gt;=C2=A0 don&#39;t use SSHD on host to decide weither to build a tes=
t<br>
&gt; &gt;<br>
&gt; &gt; -Upstream-Status: Inappropriate[oe specific]<br>
&gt; &gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt;<br>
&gt; Since we are already using a special token &#39;[&#39; to separate rea=
son from<br>
&gt; status, I always wondered if having this space before &#39;[&#39; is s=
omething<br>
&gt; that could be ignored.<br>
&gt;<br>
<br>
I see that scripts/contrib/patchreview.py does not care for space,<br>
that answers my question. Maybe it would be<br>
good to tabulate reason as well perhaps.<br>
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 ---<br>
&gt; &gt; - tests/Makefile.am | 6 +-----<br>
&gt; &gt; - 1 file changed, 1 insertion(+), 5 deletions(-)<br>
&gt; &gt; + tests/Makefile.am | 4 ----<br>
&gt; &gt; + 1 file changed, 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
&gt; &gt; -index dc0922f..6cbc35d 100644<br>
&gt; &gt; +index 27ddc2d..13de8ab 100644<br>
&gt; &gt;=C2=A0 --- a/tests/Makefile.am<br>
&gt; &gt;=C2=A0 +++ b/tests/Makefile.am<br>
&gt; &gt; -@@ -1,16 +1,12 @@<br>
&gt; &gt; +@@ -3,16 +3,12 @@ SUBDIRS =3D ossfuzz<br>
&gt; &gt;=C2=A0 =C2=A0AM_CPPFLAGS =3D -I$(top_srcdir)/src -I$(top_srcdir)/i=
nclude -I$(top_builddir)/src<br>
&gt; &gt;=C2=A0 =C2=A0LDADD =3D ../src/<a href=3D"http://libssh2.la" rel=3D=
"noreferrer" target=3D"_blank">libssh2.la</a><br>
&gt; &gt;<br>
&gt; &gt; @@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644<br>
&gt; &gt;=C2=A0 =C2=A0check_PROGRAMS =3D $(ctests)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0TESTS_ENVIRONMENT =3D SSHD=3D$(SSHD) EXEEXT=3D$(EXEEX=
T)<br>
&gt; &gt; -@@ -38,4 +34,4 @@ if OPENSSL<br>
&gt; &gt; - # EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_en=
crypted_ed25519_key.c<br>
&gt; &gt; - # EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_ed=
25519_key_from_mem.c<br>
&gt; &gt; - EXTRA_DIST +=3D test_public_key_auth_succeeds_with_correct_rsa_=
openssh_key.c<br>
&gt; &gt; --endif<br>
&gt; &gt; -\ No newline at end of file<br>
&gt; &gt; -+endif<br>
&gt; &gt; --<br>
&gt; &gt; 2.39.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#177204): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/177204" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/177204</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/969=
87532/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/96987532/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000003cfb6505f4c32e5e--

