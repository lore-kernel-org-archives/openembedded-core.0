Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7662C433EF
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 16:30:42 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.14819.1641141042111079313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 08:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMY/Ty39;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id c36so28762012uae.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 08:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFQ0BExFPRzNwL3l+OYDJ32Ysum2LeB2j1fAkr3T09g=;
        b=TMY/Ty399LEm7sqIfVG3L/LCOvgCguF+W/1PXSenvIyBD7MywQWahYmenD5G7pfmu9
         L2+yICryA/29sahFjx+g6r4voaicYF9B4/zOnPSU0sR+rb/KA23i9FNIJEwrRB0sHz6G
         r3K293qzA910dmlUfb9JHSXARlVvIMC16XrDcEMLkbGiOzRtAo7WYS8jLOyW2DvYvizA
         0ZMm7l3PLNXRwTCXOhD5naW+TODUGota4K2OZr7MHQFUYOlXq1jOiQ8TA7h2b06jrvqD
         w//PYXryXeBkzQ2B0CYUbKgb/slKA3wfWyqrIuetl9eh3odt3VvLYeFVIVLH+Upt9qNL
         w4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFQ0BExFPRzNwL3l+OYDJ32Ysum2LeB2j1fAkr3T09g=;
        b=a0l0Z1QfKqy1lKoVmXll56yCSqYyqVUaGX7zeZHKkarGNRK1vcOeYXO1jR71p3bPd1
         G/3+1Dve+sMRN+oxNQXvVOt19YAIEkpKm7rR2M3faDZRwjoRawX47955WXO+P+ab8YnP
         39oPqxM1OCSlceY9cwOq1ETF9BTU0zpRxw4kglcfGEkbOJOuXReAZtdkU2Ctu8u/S5dh
         eER/MhlqNH+8m4YH88yknqoQCvrBIc0lhjPltzoGE2PbcbvpCVAAvQtidwJZumosO9RJ
         LTkdccgbv3+o48zta9owqOfLHiB725AaaUUq5TJxt7rFGey3m3DBLP9xjaljCLFlPw2R
         E9EQ==
X-Gm-Message-State: AOAM530RlHeqipv2i64dcAcQFuVXjgPQ1gt+fahrI+o2LXePnTxSVVml
	I8AYgaASmsqT5X+Ooo/ZrsJNzWtkEXPr6Hd5p7Y=
X-Google-Smtp-Source: 
 ABdhPJyHksh0+kfP5rcij4yolUGLfSMG90P5f6f0LKBAN+lqxRXlGaXTONgr2yoEuCkczHIzfzY6B+wJ+eyTO03kw7U=
X-Received: by 2002:a05:6102:3667:: with SMTP id
 bg7mr3919756vsb.81.1641141040159;
 Sun, 02 Jan 2022 08:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-4-alex@linutronix.de>
 <CAGgRHJogKK0dDsu9vE9jVOYMdqUO_frmCkLLRVvDSFJmxs954Q@mail.gmail.com>
In-Reply-To: 
 <CAGgRHJogKK0dDsu9vE9jVOYMdqUO_frmCkLLRVvDSFJmxs954Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Jan 2022 17:30:28 +0100
Message-ID: 
 <CANNYZj-Ezw76g+zB8D-Z_z_5hYnNhpz3Nmmi5WZJrHC0fAh52A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] go-runtime.inc: do not make installation
 set dependent on host
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000b99eb705d49bece4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 16:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160105

--000000000000b99eb705d49bece4
Content-Type: text/plain; charset="UTF-8"

Right, I'll take a closer look at this.

Alex

On Sun, 2 Jan 2022 at 13:40, Matt Madison <matt@madison.systems> wrote:

> On Sat, Jan 1, 2022 at 3:30 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > This cannot be right: what we install for the target should not
> > depend on what host it's being built on. If this was fixing
> > some problem, there needs to be a different solution.
>
> IIRC, I added this because the go toolchain doesn't really do
> host/target separation like gcc does. The runtime packages for both
> host and target get populated during the compilation, and if the
> target architecture matches the build host's architecture, you'd get
> just one copy in the tree. And back then, at least, the go-runtime
> package needed those files, so the check was there to make sure they
> didn't get deleted just because the two architectures were the same.
>
> That's the way things were 5 years ago, though, and the toolchain has
> changed a lot since then. It might not be needed any more.
>
> -Matt
>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-devtools/go/go-runtime.inc | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> > index a08d44dd3a..106017bd89 100644
> > --- a/meta/recipes-devtools/go/go-runtime.inc
> > +++ b/meta/recipes-devtools/go/go-runtime.inc
> > @@ -43,10 +43,8 @@ do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin
> ${B}/pkg"
> >  do_install() {
> >         install -d ${D}${libdir}/go/src
> >         cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> > -       if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
> > -               rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> > -               rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
> > -       fi
> > +       rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> > +       rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
> >         rm -rf ${D}${libdir}/go/pkg/tool
> >         rm -rf ${D}${libdir}/go/pkg/obj
> >         rm -rf ${D}${libdir}/go/pkg/bootstrap
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160097):
> https://lists.openembedded.org/g/openembedded-core/message/160097
> > Mute This Topic: https://lists.openembedded.org/mt/88071321/3618418
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [matt@madison.systems]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000b99eb705d49bece4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I&#39;ll take a closer look at this.</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 2 Jan 2022 at 13:40, Matt Madison &lt=
;matt@madison.systems&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Sat, Jan 1, 2022 at 3:30 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; This cannot be right: what we install for the target should not<br>
&gt; depend on what host it&#39;s being built on. If this was fixing<br>
&gt; some problem, there needs to be a different solution.<br>
<br>
IIRC, I added this because the go toolchain doesn&#39;t really do<br>
host/target separation like gcc does. The runtime packages for both<br>
host and target get populated during the compilation, and if the<br>
target architecture matches the build host&#39;s architecture, you&#39;d ge=
t<br>
just one copy in the tree. And back then, at least, the go-runtime<br>
package needed those files, so the check was there to make sure they<br>
didn&#39;t get deleted just because the two architectures were the same.<br=
>
<br>
That&#39;s the way things were 5 years ago, though, and the toolchain has<b=
r>
changed a lot since then. It might not be needed any more.<br>
<br>
-Matt<br>
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-runtime.inc | 6 ++----<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-de=
vtools/go/go-runtime.inc<br>
&gt; index a08d44dd3a..106017bd89 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-runtime.inc<br>
&gt; @@ -43,10 +43,8 @@ do_compile[cleandirs] +=3D &quot;${GOTMPDIR} ${B}/b=
in ${B}/pkg&quot;<br>
&gt;=C2=A0 do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/go/src<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp --preserve=3Dmode,timestamps -R ${=
B}/pkg ${D}${libdir}/go/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${BUILD_GOTUPLE}&quot; !=3D &qu=
ot;${TARGET_GOTUPLE}&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${l=
ibdir}/go/pkg/${BUILD_GOTUPLE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${l=
ibdir}/go/pkg/obj/${BUILD_GOTUPLE}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPL=
E}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GO=
TUPLE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/tool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/obj<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/go/pkg/bootstrap=
<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#160097): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/160097" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/160097</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88071321=
/3618418" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88071321/3618418</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [matt@madison.systems]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000b99eb705d49bece4--

