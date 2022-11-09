Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722A6C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 21:04:47 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.418.1668027879146416316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 13:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=it7mXpnV;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id l127so20174373oia.8
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 13:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P9k1Qi06L4DSS5sQZblbHl5mj/NMkkVC8YAw5d6EQQ4=;
        b=it7mXpnV29I6PK/iDeDtHq7Bl7NY/MgUZPZq9OIpvjz0iS0qCsGjGWNXhvxSLS3pGz
         uF4Yo+qzeV77wRK2Iz0cyARYR8zF+CwXffmWI37GYDgXwA+i+56SUUCKFVPYTq2h19Ay
         3HcxqzpsqqCxAbHvj1GSY9ecbD4949z3QURusLmkbpSZtrS91SPltFqhv25bBjDm3ZN2
         naN4bPC8P/nmP+G8ZOjS/ZO8BK3cODZVuXnA+tjCR324651jg38fWM2tecpNdRje94cV
         p7P7yepL2DPiknAwb6JAmFJEGLvBfylpECH33e5u9nSo8lm2XZeSwISDQCQFchxlo9cC
         /mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9k1Qi06L4DSS5sQZblbHl5mj/NMkkVC8YAw5d6EQQ4=;
        b=DM2QG/9mybufJALoqGvQ0a5Lrr6+/db+blpmD0kGPAGiNZuSyl75Y2RVk20WuEApqF
         TMCBgr99fmULToalZY5Qyyho2Il9/RUCKZvLVXbgEORD/+fgyOSwpgJJncV2E+crLSb5
         PIN9JSnG/Q3ZiFkzrTWwTfgKrOKkpJdQbdU0UKzA6fb+M0Upi9fk+SVX9P3QzFvMYm3h
         becJXOYkHHL98jjJLPSe/FXRkVmuupCTVIkwLB4hJoN3cEcHBoXDSOgV6LY4IBfqk5T2
         8HObPOLFwTqNQgaOLy3XGDOxVAsbHaM8lrup8O/XlzKAILgXVQqcUkFUPWg0tKcRvMr/
         yLVQ==
X-Gm-Message-State: ACrzQf2ZrQNylp/0rGJ6vs/5ALNCaAHGAXVH5Dlnd2evQHyE4/YiZijK
	gQpVY6X+hSJWJCHcD7wCfSDDtKaQwXMyVxA36l8=
X-Google-Smtp-Source: AMsMyM4C65luWuPPAvV4slmeWAfwNb90t1aWYPrbmSjWd219cHw0B/9YIui5qbASPGRdTqk6zZCBOYOoutQ8scrQ7AU=
X-Received: by 2002:a05:6808:1246:b0:351:9c1a:cad3 with SMTP id
 o6-20020a056808124600b003519c1acad3mr33482101oiv.290.1668027877486; Wed, 09
 Nov 2022 13:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20221109030444.2414546-1-maxime.roussinbelanger@gmail.com> <Y2wSG33M67Rgxf/s@mail.local>
In-Reply-To: <Y2wSG33M67Rgxf/s@mail.local>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Wed, 9 Nov 2022 16:04:11 -0500
Message-ID: <CAE=T-s6tviRYp8CdVmnHyRLbx3UK2EzdMfkcxLJ7si5obc-bXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: fix runpath with native llvm-config in
 target sysroot
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001cf6da05ed1001ca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 21:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173058

--0000000000001cf6da05ed1001ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, (sorry for 2nd message Alex, forgot to cc the list)

On Wed, Nov 9, 2022 at 3:48 PM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> On 08/11/2022 22:04:44-0500, Maxime Roussin-B=C3=A9langer wrote:
> > From: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.com>
> >
> > llvm-config is copied from native to target sysroot, it shouldn't be
> > allowed to use target shared libraries when it loads.
> >
> > Remove all runpath so it uses shared library from host system since
> > native llvm-config is compiled with hosttools compiler.
> >
>
> I believe this is the cause of:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/st=
eps/32/logs/stdio


The patch does fix that problem on my end.


>
>
> I'm currently checking
>
> > Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gma=
il.com
> >
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index 67cfb4f6c1..abc2c3f4c4 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -61,6 +61,7 @@ do_configure:prepend () {
> >       if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}
> ]; then
> >               cp
> ${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR=
}
> >               cp ${STAGING_BINDIR_NATIVE}/llvm-config ${STAGING_BINDIR}
> > +             chrpath -d ${STAGING_BINDIR}/llvm-config
> >       fi
> >  }
> >
> > --
> > 2.36.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173009):
> https://lists.openembedded.org/g/openembedded-core/message/173009
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

--0000000000001cf6da05ed1001ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, (sorry for 2nd message Alex, forgot to cc the lis=
t)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Nov 9, 2022 at 3:48 PM Alexandre Belloni &lt;<a href=3D"mailto:al=
exandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 08/11/2022 22:04:44-0500, Maxime Roussin-B=C3=A9langer wrote:<br>
&gt; From: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussi=
nbelanger@gmail.com" target=3D"_blank">maxime.roussinbelanger@gmail.com</a>=
&gt;<br>
&gt; <br>
&gt; llvm-config is copied from native to target sysroot, it shouldn&#39;t =
be<br>
&gt; allowed to use target shared libraries when it loads.<br>
&gt; <br>
&gt; Remove all runpath so it uses shared library from host system since<br=
>
&gt; native llvm-config is compiled with hosttools compiler.<br>
&gt; <br>
<br>
I believe this is the cause of:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/72/build=
s/6139/steps/32/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6139/steps/32/logs/=
stdio</a></blockquote><div><br></div><div>The patch does fix that problem o=
n my end.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
I&#39;m currently checking<br>
<br>
&gt; Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxi=
me.roussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbelanger@gmai=
l.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc<br>
&gt; index 67cfb4f6c1..abc2c3f4c4 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -61,6 +61,7 @@ do_configure:prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${STAGING_BINDIR_NATIVE}/llvm-config=
${MESA_LLVM_RELEASE} ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${STAGING_BIN=
DIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE} ${STAGING_BINDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${STAGING_BIN=
DIR_NATIVE}/llvm-config ${STAGING_BINDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chrpath -d ${STAGING_=
BINDIR}/llvm-config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.36.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#173009): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/173009" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/173009</a><br>
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

--0000000000001cf6da05ed1001ca--

