Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C05CE79DE
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:46:42 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.41663.1695221196635347391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsUHWGv6;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bc9c01e154so536482a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695221196; x=1695825996; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYOAQI8EE7VvUfk6o3wgg5UemnkiwdGi9PaL8q4Kze4=;
        b=bsUHWGv6KrZ8emoQ4OnWO+OX26OaVy1PVSqjPX5kY20jXAtHX/p69jYhGmrKo7AX+N
         k+5pNxe+036nBCoU973Vyg2GGOD9SFBd+BMEkxWvEaMLgg7Yf090Icq/AepSTbE1qdY2
         hP8UTFtFARyc1c6P65xHfHVzalx2RNTy34OGhhbI6ZJxmYm2rbXcyFwmn16XO/SGXaJ9
         loPGyhbHyqsAQNjiP4DrxsE6mp46qOb+vXZfyF0b40gtWureFGjgKs2vH5kOi35ALpbz
         JJrSRiP/u/UU/H8qVoa4Kd7sjOjpSMLJwTmEA/7JvBEriLuHdapAaIYjqqJd88c8k7aX
         fi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695221196; x=1695825996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYOAQI8EE7VvUfk6o3wgg5UemnkiwdGi9PaL8q4Kze4=;
        b=F4eZnMlcaYU1r+LMtjl+P6yMhnfCLzqlWDPGwhR3tEX4/lEhjJOOIxDxCb0rUl5qTh
         7R3Av6E5fICdG38F9TWLnDWuRBiszpK4nIM87XJdZPXNbrBlu7sIAz1YOhSHIeOHUb1F
         JaIx62bdmTArGTWFKOBdTX55mFufQGLWR7qZ7mimnylvi6QU+bNh8JcIHGx5HeyfBHlD
         ZVG+1+uaIlC9Ayv9+qcHfOjFp+pyC7cE2K1QSMSgM3dgUSZrNcmd/sU4PXjFqTP+6404
         IT55fxpZR5UdJsQluUpxWvw1LQAh+n+tRp66e5iPtX5W6MbXDBN1bJSyCjVMunBDQ5+6
         o+NA==
X-Gm-Message-State: AOJu0Yzqfe7FDsu6KHdzY5ygKss9qWdVKNn8bXaYcsnmW5Df/uRYJGFv
	UCpWR49jHtZguvyyN3/+BX3GHuMCViaB9If1c+c=
X-Google-Smtp-Source: AGHT+IGIsPZTe0lNyTtyU+hS66GjbKd0zE9n0N91nN5sqDe9+tU48n+yamW63qvZOIv/jC2Lr9UF9ijMlYamTnDK8fg=
X-Received: by 2002:a05:6871:612:b0:1bf:f50f:6e2 with SMTP id
 w18-20020a056871061200b001bff50f06e2mr3814939oan.10.1695221195770; Wed, 20
 Sep 2023 07:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230920054733.2852549-1-raj.khem@gmail.com> <4b37b846473fdd68aba377018638086590307722.camel@linuxfoundation.org>
In-Reply-To: <4b37b846473fdd68aba377018638086590307722.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2023 07:46:25 -0700
Message-ID: <CAMKF1sqSqdU-1Ndw-+UGd==Q4S3vZuG3i9wPuVN7YwF0JWmMXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gettext: Disable error_at_line detection for musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000308f950605cb718c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 14:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187928

--000000000000308f950605cb718c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 12:54 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-09-19 at 22:47 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/gettext/gettext_0.22.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/gettext/gettext_0.22.bb
> b/meta/recipes-core/gettext/gettext_0.22.bb
> > index f5290ac0e44..91db6627748 100644
> > --- a/meta/recipes-core/gettext/gettext_0.22.bb
> > +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> > @@ -53,6 +53,7 @@ EXTRA_OECONF:append:class-target =3D " \
> >                   gt_cv_locale_de_utf8=3Dde_DE \
> >                   gt_cv_locale_de=3Dde_DE.ISO-8859-1 \
> >  "
> > +EXTRA_OECONF:append:libc-musl =3D " ac_cv_lib_error_at_line=3Dno"
> >
> >  PACKAGECONFIG ??=3D "croco glib libxml"
> >  PACKAGECONFIG:class-native =3D ""
>
> Is this something which should be in the musl site file?


I was thinking on same lines but then I wanted to see how many packages
would need it. It seems it=E2=80=99s packaged using gnulib that need it but=
 then
not all. Adding to site files is a bigger hammer I want to see the length
and breadth of its impact

I will refactor the bsd-headers patch to keep the error.h a bit more



>
> Cheers,
>
> Richard
>

--000000000000308f950605cb718c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Sep 20, 2023 at 12:54 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2023-=
09-19 at 22:47 -0700, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/gettext/<a href=3D"http://gettext_0.22.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.22.=
bb" rel=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a> b/meta/recipes=
-core/gettext/<a href=3D"http://gettext_0.22.bb" rel=3D"noreferrer" target=
=3D"_blank">gettext_0.22.bb</a><br>
&gt; index f5290ac0e44..91db6627748 100644<br>
&gt; --- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.22.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a><br>
&gt; +++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.22.bb" rel=
=3D"noreferrer" target=3D"_blank">gettext_0.22.bb</a><br>
&gt; @@ -53,6 +53,7 @@ EXTRA_OECONF:append:class-target =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gt=
_cv_locale_de_utf8=3Dde_DE \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gt=
_cv_locale_de=3Dde_DE.ISO-8859-1 \<br>
&gt;=C2=A0 &quot;<br>
&gt; +EXTRA_OECONF:append:libc-musl =3D &quot; ac_cv_lib_error_at_line=3Dno=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;croco glib libxml&quot;<br>
&gt;=C2=A0 PACKAGECONFIG:class-native =3D &quot;&quot;<br>
<br>
Is this something which should be in the musl site file?</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I was thinking on same lines but th=
en I wanted to see how many packages would need it. It seems it=E2=80=99s p=
ackaged using gnulib that need it but then not all. Adding to site files is=
 a bigger hammer I want to see the length and breadth of its impact=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">I will refactor the bsd-h=
eaders patch to keep the error.h a bit more</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><=
br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000308f950605cb718c--

