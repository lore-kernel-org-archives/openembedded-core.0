Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F307C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 21:43:21 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.378.1668030195187108397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 13:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhPjTP5x;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13c569e5ff5so259109fac.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/FT/zFUJxDynDCV1GOwPrqqUEDboJR+W+DAeazAp48Y=;
        b=FhPjTP5xYOPt/NzLeLn/xXnSKkvoJKDzTfCLw5n3uGPkzXfBDK4l/XfEOy0Byp8AVh
         1tYzL0wHljtDiYuUHm0PS1cjS4svnXgqBd8diyJMa7JnT2M1K1avkRs/mcJE3C//lYJf
         2tT5QqaWLRXMQhEpO+2G2vPoPXZfjTjjcP0W8GV1ZMddY8JUrDbEvOPYenGzhKa5GiuK
         oHyYAiJKsMWp+e5cO85lyc1E6TxnK1sWMxO6YitZFEJ/sFxcXHsajOCetzzNwlLslvba
         bA2NloLFcW/MA9e7EV/aMdTuGHP03JRuKpZE9n/mM1lAP/ALv8jxObzK0Tr36qIb9/FN
         dMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FT/zFUJxDynDCV1GOwPrqqUEDboJR+W+DAeazAp48Y=;
        b=qpARQndChCWcTKz5FaSyz8kpiBecP7EASHtkmrCZau7atrvOKtiAnaB1GGfwhyynqW
         Oi0LZEnfEpqngcu4GleY95ljGSm6WnkJfp+aOUss5Evk83B4QoqVyfYkL/u9JrJ1/N/Z
         JBNWgLymYzDGORcERrBmpXFrGGH/4P6RVkCjyIrFxN+ZLM0jtTITSc+b4czRYMs6Z/fp
         if9sdJa4agb7zi0q0gEaN0K0d6KFgoEaJ39qG4a06RACpSxL4HUI1m8N7f5hlUpymS25
         I/H5li/jOcoACHv7Rq5Rw355QQPlltYUt4OB7JM+WLXV82A51kXPLOmaRAOtkE8lZ+KC
         ZZyA==
X-Gm-Message-State: ACrzQf3RGuFUDnvWk+APSjqkXe/O6VbmvukbohFtSYmXMq5A4W3dCBMg
	7MkfFS07UNNQn5Bs7tdN/tLV2uVUZVwtoouuUrQ=
X-Google-Smtp-Source: AMsMyM4eqURS7cNwHMPSJen4mW1XuP2b00w1FeuOtPpbG5xLKTVUTHoR5ew+hmMVDax1li/VtOA6L4s6khJ3pTp16Ik=
X-Received: by 2002:a05:6870:b254:b0:13c:d654:7bdf with SMTP id
 b20-20020a056870b25400b0013cd6547bdfmr33699995oam.290.1668030194328; Wed, 09
 Nov 2022 13:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com>
 <Y2wSG33M67Rgxf/s@mail.local> <CAE=T-s6tviRYp8CdVmnHyRLbx3UK2EzdMfkcxLJ7si5obc-bXA@mail.gmail.com>
 <Y2waa1aWSsc5z82P@mail.local>
In-Reply-To: <Y2waa1aWSsc5z82P@mail.local>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Wed, 9 Nov 2022 16:42:48 -0500
Message-ID: <CAE=T-s6xPvw_o_-_cODzb8BL2Xx3Dwi3T41_R4+xSqmJtG8rjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: fix runpath with native llvm-config in
 target sysroot
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003529f305ed108be0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 21:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173060

--0000000000003529f305ed108be0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 9, 2022 at 4:23 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 09/11/2022 16:04:11-0500, Maxime Roussin-B=C3=A9langer wrote:
> > Hi, (sorry for 2nd message Alex, forgot to cc the list)
> >
> > On Wed, Nov 9, 2022 at 3:48 PM Alexandre Belloni <
> > alexandre.belloni@bootlin.com> wrote:
> >
> > > Hello,
> > >
> > > On 08/11/2022 22:04:44-0500, Maxime Roussin-B=C3=A9langer wrote:
> > > > From: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.co=
m>
> > > >
> > > > llvm-config is copied from native to target sysroot, it shouldn't b=
e
> > > > allowed to use target shared libraries when it loads.
> > > >
> > > > Remove all runpath so it uses shared library from host system since
> > > > native llvm-config is compiled with hosttools compiler.
> > > >
> > >
> > > I believe this is the cause of:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/st=
eps/32/logs/stdio
> >
> >
> > The patch does fix that problem on my end.
> >
>
> Well, it doesn't seem to be the cause but it doesn't fix it either...
> I'm going to run it again using the same worker.
>

From what I gathered when debugging this, llvm-config was loading shared
libraries of the target sysroot because
of runpath. When mesa is configuring with gallium it invokes llvm-config
which can fail for illegal instructions because
of shared libraries of the target sysroot.

By removing runpath from the binary it should load libraries from thost
where native llvm-config is built from.

Max.


>
> >
> > >
> > >
> > > I'm currently checking
> > >
> > > > Signed-off-by: Maxime Roussin-B=C3=A9langer <
> maxime.roussinbelanger@gmail.com
> > > >
> > > > ---
> > > >  meta/recipes-graphics/mesa/mesa.inc | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > > b/meta/recipes-graphics/mesa/mesa.inc
> > > > index 67cfb4f6c1..abc2c3f4c4 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > > @@ -61,6 +61,7 @@ do_configure:prepend () {
> > > >       if [ -e
> ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}
> > > ]; then
> > > >               cp
> > > ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}
> ${STAGING_BINDIR}
> > > >               cp ${STAGING_BINDIR_NATIVE}/llvm-config
> ${STAGING_BINDIR}
> > > > +             chrpath -d ${STAGING_BINDIR}/llvm-config
> > > >       fi
> > > >  }
> > > >
> > > > --
> > > > 2.36.0
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173058):
> https://lists.openembedded.org/g/openembedded-core/message/173058
> > Mute This Topic: https://lists.openembedded.org/mt/94906155/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000003529f305ed108be0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9, 2022 at 4:23 PM Alexan=
dre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.=
belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 09/11/2022 16:04:11-0500, Maxime Roussin-B=C3=A9lange=
r wrote:<br>
&gt; Hi, (sorry for 2nd message Alex, forgot to cc the list)<br>
&gt; <br>
&gt; On Wed, Nov 9, 2022 at 3:48 PM Alexandre Belloni &lt;<br>
&gt; <a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">ale=
xandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; On 08/11/2022 22:04:44-0500, Maxime Roussin-B=C3=A9langer wrote:<=
br>
&gt; &gt; &gt; From: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:max=
ime.roussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbelanger@gma=
il.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; llvm-config is copied from native to target sysroot, it shou=
ldn&#39;t be<br>
&gt; &gt; &gt; allowed to use target shared libraries when it loads.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Remove all runpath so it uses shared library from host syste=
m since<br>
&gt; &gt; &gt; native llvm-config is compiled with hosttools compiler.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I believe this is the cause of:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/72/builds/6139/steps/32/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/step=
s/32/logs/stdio</a><br>
&gt; <br>
&gt; <br>
&gt; The patch does fix that problem on my end.<br>
&gt; <br>
<br>
Well, it doesn&#39;t seem to be the cause but it doesn&#39;t fix it either.=
..<br>
I&#39;m going to run it again using the same worker.<br></blockquote><div><=
br></div><div>From what I gathered when debugging this, llvm-config was loa=
ding shared libraries of the target sysroot because</div><div>of runpath. W=
hen mesa is configuring with gallium it invokes llvm-config which can fail =
for illegal instructions because</div><div>of shared libraries of the targe=
t sysroot.</div><div><br></div><div>By removing runpath=C2=A0from the binar=
y it should load libraries from thost where native llvm-config is built fro=
m.</div><div><br></div><div>Max.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m currently checking<br>
&gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"m=
ailto:maxime.roussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbel=
anger@gmail.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; &gt; index 67cfb4f6c1..abc2c3f4c4 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; &gt; @@ -61,6 +61,7 @@ do_configure:prepend () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${STAGING_BINDIR_NATIVE}/l=
lvm-config${MESA_LLVM_RELEASE}<br>
&gt; &gt; ]; then<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp<br>
&gt; &gt; ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGIN=
G_BINDIR}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S=
TAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chrpath -d =
${STAGING_BINDIR}/llvm-config<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.36.0<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_bla=
nk">https://bootlin.com</a><br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#173058): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/173058" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/173058</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94906155=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94906155/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000003529f305ed108be0--

