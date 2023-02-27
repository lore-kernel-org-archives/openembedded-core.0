Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74E8C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:25:21 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.86346.1677489914632411332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WNP+60Du;
 spf=pass (domain: mvista.com, ip: 209.85.208.182, mailfrom: vkumbhar@mvista.com)
Received: by mail-lj1-f182.google.com with SMTP id z5so5693624ljc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz31i+pR/gzRxVGsLC4gE+Xc1syqEMeiFKCKW744qF4=;
        b=WNP+60DuGr2W551I7e6YpdC5IqX2q32njax2xDXPj01s2sB+FwP0BuicQB2ThdRZ4a
         5cSEiLHpHRUkUq/LWH2WNDHSa1IgiKurly2pPpop8H4wyFlasXvmQAO7whOJ+ropZa9O
         jFRnTDNFMhdDlzso6RY6dRnOVUgFH9AcVmf6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tz31i+pR/gzRxVGsLC4gE+Xc1syqEMeiFKCKW744qF4=;
        b=mq3TGEJIVx2B+nXmGabbtgYfTcfxaUi3c+cD1RBe7+6enycpnWxBrmir+q9+gO7T43
         C/aGKx9BlCY+N6iGZe8YahNFJKn23HOqJAS4/8mPwIdgmqWTUTXXFNbhj1kqmGH0racm
         d6A4QSD0iWWbxi4E1DwTQpj79vfPNmPln2+nx7cW3wT8W2JAWibF3ScK4q9/NMuE3i2U
         BPNJGRYjaX3mJk+5H4CDWMyMp98xSdr6wVQyAkUpuLQxMQg+BP12IMnmvlyeJ+QU1tkz
         lssCluT4WtGUp0++fEO2HdwXhI5SGhDskr7lCJhCxLGoyfZvjX99Lnp/TYhxIVTQQ0si
         EPHA==
X-Gm-Message-State: AO0yUKWlC2Kq8xiUdmoqGlfK4k/Ku3xn6NCvGndgEQwW7ZD4sSAGk1iO
	wXzluhXbPB7iAGs6U5ZYAiPvxrB1Gcplw5NDtJ3vn5Kh8W+xkn37
X-Google-Smtp-Source: AK7set80WL59wB+vYvLMD1wdYPA1CP/YlrRHSB55iQH8oVceahdvPsPKUNZNdCZHgpuKLwoZXpoo/2xeK5BadMSCOYA=
X-Received: by 2002:a05:651c:331:b0:295:b9fe:ec2a with SMTP id
 b17-20020a05651c033100b00295b9feec2amr861145ljp.8.1677489912775; Mon, 27 Feb
 2023 01:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227032020.6248-1-vkumbhar@mvista.com> <CANNYZj-KB1_xQuY5gRrrO3FmAE2dqi3=DET5Rs5FkNYmg9CWCQ@mail.gmail.com>
In-Reply-To: <CANNYZj-KB1_xQuY5gRrrO3FmAE2dqi3=DET5Rs5FkNYmg9CWCQ@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 27 Feb 2023 14:55:01 +0530
Message-ID: <CAPun1rEQKyRLJDbsN4P25Hu1FMOhVQ5E=KntGwa0_H9fY8cy=Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] rpm: update 4.17.1 -> 4.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005d945805f5ab0e17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177781

--0000000000005d945805f5ab0e17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay Sure, I will backport the fix only instead of upgrading.

-Thanks,
Vivek

On Mon, Feb 27, 2023 at 2:51=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> You have to backport the fix I'm afraid. Stable releases do not allow
> major upgrades like that.
>
> Alex
>
> On Mon, 27 Feb 2023 at 04:20, vkumbhar <vkumbhar@mvista.com> wrote:
> >
> > (From OE-Core rev: 5bef402da334595ed9302b8bca1acdf5e88bfe11)
> >
> > This will fix #CVE-2021-35938 rpm: races with chown/chmod/capabilities
> calls during installation
> >
> > upstream branch=3Drpm-4.18: git://github.com/rpm-software-management/rp=
m
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  ...When-cross-installing-execute-package-scriptlets-wit.patch | 2 +-
> >  .../rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch | 3 +--
> >  meta/recipes-devtools/rpm/{rpm_4.17.1.bb =3D> rpm_4.18.bb}      | 4 ++=
--
> >  3 files changed, 4 insertions(+), 5 deletions(-)
> >  rename meta/recipes-devtools/rpm/{rpm_4.17.1.bb =3D> rpm_4.18.bb} (99%=
)
> >
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > index 2a0069cafe..13d01faa0e 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-pack=
age-scriptlets-wit.patch
> > @@ -53,7 +53,7 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >
> >       if (rc !=3D RPMRC_FAIL) {
> >         if (script_type & RPMSCRIPTLET_EXEC) {
> > --          rc =3D runExtScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > +-          rc =3D runExtScript(plugins, prefixes, script->descr, lvl,
> scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
> >  +          if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") !=3D NULL) {
> >  +              rpmChrootOut();
> >  +              rc =3D runExtScript(plugins, prefixes, script->descr, l=
vl,
> scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> > diff --git
> a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> > index 9783396639..cab54c3fb6 100644
> > ---
> a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> > +++
> b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-ca=
se.patch
> > @@ -20,11 +20,10 @@ diff --git a/tools/elfdeps.c b/tools/elfdeps.c
> >  index d205935bb..3a8945b33 100644
> >  --- a/tools/elfdeps.c
> >  +++ b/tools/elfdeps.c
> > -@@ -5,10 +5,14 @@
> > +@@ +5,14 @@
> >   #include <unistd.h>
> >   #include <stdlib.h>
> >   #include <fcntl.h>
> > --#include <error.h>
> >   #include <errno.h>
> >   #include <popt.h>
> >   #include <gelf.h>
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.18.bb
> > similarity index 99%
> > rename from meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > rename to meta/recipes-devtools/rpm/rpm_4.18.bb
> > index 9b6446f265..724dbbe70a 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.18.bb
> > @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b4=
8a43f"
> >
> > -SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;protocol=3Dhtt=
ps \
> > +SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;protocol=3Dhtt=
ps \
> >             file://environment.d-rpm.sh \
> >
>  file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
> >             file://0001-Do-not-read-config-files-from-HOME.patch \
> > @@ -43,7 +43,7 @@ SRC_URI =3D "git://
> github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc
> >             "
> >
> >  PE =3D "1"
> > -SRCREV =3D "5bef402da334595ed9302b8bca1acdf5e88bfe11"
> > +SRCREV =3D "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177769):
> https://lists.openembedded.org/g/openembedded-core/message/177769
> > Mute This Topic: https://lists.openembedded.org/mt/97259257/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005d945805f5ab0e17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Okay Sure, I will backport the fix only instead of up=
grading.</div><div><br></div><div>-Thanks,</div><div>Vivek<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Feb 27, 2023 at 2:51=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">You have to backport the fix I&=
#39;m afraid. Stable releases do not allow<br>
major upgrades like that.<br>
<br>
Alex<br>
<br>
On Mon, 27 Feb 2023 at 04:20, vkumbhar &lt;<a href=3D"mailto:vkumbhar@mvist=
a.com" target=3D"_blank">vkumbhar@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; (From OE-Core rev: 5bef402da334595ed9302b8bca1acdf5e88bfe11)<br>
&gt;<br>
&gt; This will fix #CVE-2021-35938 rpm: races with chown/chmod/capabilities=
 calls during installation<br>
&gt;<br>
&gt; upstream branch=3Drpm-4.18: git://<a href=3D"http://github.com/rpm-sof=
tware-management/rpm" rel=3D"noreferrer" target=3D"_blank">github.com/rpm-s=
oftware-management/rpm</a><br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...When-cross-installing-execute-package-scriptlets-wit.patch | =
2 +-<br>
&gt;=C2=A0 .../rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch | =
3 +--<br>
&gt;=C2=A0 meta/recipes-devtools/rpm/{<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a> =3D&gt; <a href=3D"http=
://rpm_4.18.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_4.17.1.b=
b" rel=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a> =3D&gt; <a href=
=3D"http://rpm_4.18.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.bb</a=
>} (99%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installin=
g-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/00=
01-When-cross-installing-execute-package-scriptlets-wit.patch<br>
&gt; index 2a0069cafe..13d01faa0e 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execu=
te-package-scriptlets-wit.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execu=
te-package-scriptlets-wit.patch<br>
&gt; @@ -53,7 +53,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc !=3D RPMRC_FAIL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (script_type &amp; RPMSCRIPTLET_EX=
EC) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript(plugins, pref=
ixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg1, ar=
g2, &amp;script-&gt;nextFileFunc);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtScript(plugins, pref=
ixes, script-&gt;descr, lvl, scriptFd, &amp;args, script-&gt;body, arg1, ar=
g2, script-&gt;nextFileFunc);<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (getenv(&quot;RPM_NO_CHRO=
OT_FOR_SCRIPTS&quot;) !=3D NULL) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmChrootOut()=
;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D runExtS=
cript(plugins, prefixes, script-&gt;descr, lvl, scriptFd, &amp;args, script=
-&gt;body, arg1, arg2, &amp;script-&gt;nextFileFunc);<br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-fo=
r-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-err=
or.h-for-non-glibc-case.patch<br>
&gt; index 9783396639..cab54c3fb6 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-g=
libc-case.patch<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-g=
libc-case.patch<br>
&gt; @@ -20,11 +20,10 @@ diff --git a/tools/elfdeps.c b/tools/elfdeps.c<br>
&gt;=C2=A0 index d205935bb..3a8945b33 100644<br>
&gt;=C2=A0 --- a/tools/elfdeps.c<br>
&gt;=C2=A0 +++ b/tools/elfdeps.c<br>
&gt; -@@ -5,10 +5,14 @@<br>
&gt; +@@ +5,14 @@<br>
&gt;=C2=A0 =C2=A0#include &lt;unistd.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;stdlib.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;fcntl.h&gt;<br>
&gt; --#include &lt;error.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;errno.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;popt.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;gelf.h&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb=
" rel=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a> b/meta/recipes-dev=
tools/rpm/<a href=3D"http://rpm_4.18.bb" rel=3D"noreferrer" target=3D"_blan=
k">rpm_4.18.bb</a><br>
&gt; similarity index 99%<br>
&gt; rename from meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; rename to meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.18.bb</a><br>
&gt; index 9b6446f265..724dbbe70a 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.17.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.17.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.bb" rel=3D"=
noreferrer" target=3D"_blank">rpm_4.18.bb</a><br>
&gt; @@ -24,7 +24,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.rpm.org" re=
l=3D"noreferrer" target=3D"_blank">http://www.rpm.org</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc4eec0c20c6034b9=
407a09945b48a43f&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-man=
agement/rpm;branch=3Drpm-4.17.x;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.17.x;prot=
ocol=3Dhttps</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-man=
agement/rpm;branch=3Drpm-4.18.x;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.18.x;prot=
ocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http:=
//environment.d-rpm.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-=
rpm.sh</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-add-=
an-unsatisfiable-dependency-when-building.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-read=
-config-files-from-HOME.patch \<br>
&gt; @@ -43,7 +43,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/rpm-software-management/rpm;branch=3Drpm-4.17.x;protoc" rel=3D"noreferrer"=
 target=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.17=
.x;protoc</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; -SRCREV =3D &quot;5bef402da334595ed9302b8bca1acdf5e88bfe11&quot;<br>
&gt; +SRCREV =3D &quot;ea0d77c52e176e2876fdb1d07ad41e9e2635a93e&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#177769): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/177769" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/177769</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97259257=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97259257/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000005d945805f5ab0e17--

