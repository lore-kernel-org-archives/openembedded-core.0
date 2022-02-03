Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E234EC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 22:11:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.1182.1643926304052121402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 14:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K2lvXPFe;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 13so3234257qkd.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 14:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1xLj/lrpJ4vNdfMdzskwuNTDjTojrS+hmWZvGafZOgY=;
        b=K2lvXPFezfEjM8deiRcOGnPsXXADuCq+UduVN+XETxr/Z2f7CNh31Zyc6ORQBZgcLQ
         Vr+gQhzaWn0H8tsQXqUeddsHdP749S9dusLJJSPc4Al1Xu5aNbIqJf0MRO3zSNnKbSkg
         lhDdW1AXIT+1UXmXxNjLfGbzzT9L2Ai5JbU93pwJB/kOpG17g/B2wIGLU4pKSHUKd0uH
         qoiBjU0LvI3YyjnQK88lqVQ3rfUHA4i4eLRtnvLXfOxZee5TZsQtpLszDbIhcCME4+42
         ic2rh4qKJcazFVn9x5lcMM/7kk8ZPAznG5SZOxOcJRql0ENZbO1mISBhpJ+ky/UlKTa7
         U86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1xLj/lrpJ4vNdfMdzskwuNTDjTojrS+hmWZvGafZOgY=;
        b=pGWhIauFbldmuVvz6VTFyBbVgs8FRLfNCgfFfzeXWX4RKBtB3yjiOHjEKxNGBoKDdr
         lZ3dR+pLcourR2qW5zxJ+AUuOpPsPGd8uuqszvPjf1wgqNExvG/Y2bio3IzY/9w8c/0d
         Wz9Aiq38j0u/TAgmoERG9EGqlprJhE0NQp0anyI3sfoZHZc5sQfYWadHVw3wFnX3HCJL
         uiLxZ4IfFrJ3VeQpw89TMjZk/7Q69LyrM3Y67Rdsk3JNBjQObEh4beCDU2UrYJL7/Pqk
         a9j1NXPhmnarfghMCREaallJ3EXTIylY5zNdRYm/zyV/4sjmQ23Z/77a1iRSsyDZ8OAk
         66Yw==
X-Gm-Message-State: AOAM533awTgYPvz7Cq5aVawZZp2vAO/WnUbAcUjs+hgXCIG0lDtmtuaz
	NEq2pURk1ZYe49cMyZLT3bqLR1xwmTaAzh63Bug=
X-Google-Smtp-Source: 
 ABdhPJxg41wlM1P1dN3RTwQTtI+cCZUC8qColRAf/ZR42Ulf27zAeGWdaelHAvBaPY6r7ETj9TralSfyt3caGTnFmTE=
X-Received: by 2002:a05:620a:152b:: with SMTP id
 n11mr67736qkk.463.1643926303095;
 Thu, 03 Feb 2022 14:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
In-Reply-To: 
 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Feb 2022 14:11:32 -0800
Message-ID: 
 <CAMKF1sr8jxeNZk2svzkLYD+4HF8ehXUg2tm86X5X_dKkTU6+Hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000553e1b05d7246b21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 22:11:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161327

--000000000000553e1b05d7246b21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2022 at 1:59 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-02-03 at 18:26 +0100, Enrico Scholz via
> lists.openembedded.org
> wrote:
> > gcc-10+ supports zstd compression of LTO bytecode.  Install the
> > corresponding package to enable this feature in a deterministic way.
> >
> > NOTE: previously built LTO object files (without this compression)
> > must be regenerated; gcc will fail else with
> >
> >   | lto1: internal compiler error: original not compressed with zstd
> >
> > in this case.
> >
> > NOTE: it seems to be possible that zstd support is enabled non
> > deterministically (perhaps by host system pollution).
> >
> > I had the problem that the SDK gcc was built with zstd while the
> > cross gcc was built without it.  Libraries (built by cross gcc and
> > uncompressed hence) could not be used with the SDK gcc.
> >
> > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > ---
> >  meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc
> b/meta/recipes-devtools/gcc/gcc-11.2.inc
> > index f07a5be507b3..62db035760aa 100644
> > --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> > @@ -11,7 +11,7 @@ BINV =3D "11.2.0"
> >  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport=
:"
> >
> >  DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> > -NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native
> flex-native"
> > +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native
> flex-native zstd-native"
> >
> >  LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> >
>
> Should we be passing some flag to gcc explicitly to configure this
> deterministicly?


Perhaps use =E2=80=94with-zstd configure switch maybe via package config bu=
t it=E2=80=99s
better to enable it always

>
>
> Cheers,
>
> Richard
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161323):
> https://lists.openembedded.org/g/openembedded-core/message/161323
> Mute This Topic: https://lists.openembedded.org/mt/88888010/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000553e1b05d7246b21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 3, 2022 at 1:59 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2022-=
02-03 at 18:26 +0100, Enrico Scholz via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; gcc-10+ supports zstd compression of LTO bytecode.=C2=A0 Install the<b=
r>
&gt; corresponding package to enable this feature in a deterministic way.<b=
r>
&gt; <br>
&gt; NOTE: previously built LTO object files (without this compression)<br>
&gt; must be regenerated; gcc will fail else with<br>
&gt; <br>
&gt;=C2=A0 =C2=A0| lto1: internal compiler error: original not compressed w=
ith zstd<br>
&gt; <br>
&gt; in this case.<br>
&gt; <br>
&gt; NOTE: it seems to be possible that zstd support is enabled non<br>
&gt; deterministically (perhaps by host system pollution).<br>
&gt; <br>
&gt; I had the problem that the SDK gcc was built with zstd while the<br>
&gt; cross gcc was built without it.=C2=A0 Libraries (built by cross gcc an=
d<br>
&gt; uncompressed hence) could not be used with the SDK gcc.<br>
&gt; <br>
&gt; Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma=
-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-dev=
tools/gcc/gcc-11.2.inc<br>
&gt; index f07a5be507b3..62db035760aa 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-11.2.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc<br>
&gt; @@ -11,7 +11,7 @@ BINV =3D &quot;11.2.0&quot;<br>
&gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/g=
cc/backport:&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot;<br>
&gt; -NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native&quot;<br>
&gt; +NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native zstd-native&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<b=
r>
&gt;=C2=A0 <br>
<br>
Should we be passing some flag to gcc explicitly to configure this<br>
deterministicly?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
Perhaps use =E2=80=94with-zstd configure switch maybe via package config bu=
t it=E2=80=99s better to enable it always=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161323): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161323" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161323</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88888010/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88888010/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000553e1b05d7246b21--

