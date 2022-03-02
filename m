Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6763C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 00:30:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.2401.1646181001744610668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vh0sy7az;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id m14so36109lfu.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W2Xd3UUtDDTbH49a1SsmBZd6+K3HNO3fvEpmFC/hdxY=;
        b=Vh0sy7azFdSiocKXR4rwmn6ISVPgxWy3dngwhI/iStSRrym1xMR/MlcUZqE9d900KI
         JIyTJlJM4XaUh1kHVdiED36Lv5KMDxjMlzE7pssVLDZYhF2fuC9H3e98Ji64QR9kmq+b
         PL2vpXsa2/TlYGrOV/puCqu68jfQqagFvxe8jE0y4c8i7ybMSYTLpglPpp5t4dzdAsBz
         +5fN8o5TSOhVmevy+iwrf6H/YrUKLqme17Rz0cqr3dkBHuNr3Og2ypkv/KghoK3AH9Df
         dNaCnJynxd0kzPs+qgqAwqB4EdsZzJC3gQ73Aet3gk9kxeTAla83roZSbJ8jqhy+rBqp
         cPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W2Xd3UUtDDTbH49a1SsmBZd6+K3HNO3fvEpmFC/hdxY=;
        b=Ir1Wr2kjI8/Utu55r5Nukdr9mAAuzU6bmho+zIP0D1d0Vex2h1lbnu8nVQ60LRo1Wy
         GG/HCGk+vBf9VbxuhveHM2L2/qYFcQIAmpVRpSyg1htVaih4xQiZP3I6f/yJAGs92lJe
         tGShOq7cpaZ0XTL3lirB/0E8Ob2tFAxIiFCm+8Nrzbl9Rxk9fhfDxBEG0wex1VDCejCh
         8KjxlBtUffHS6jUH6QiviKvQvZzZzGIZKxh0OMPcvygDDMK1Bkt6SyWSaREf89wxLlGr
         EA0vHo5PhzTqK22J9KSbQban/JMCxJ7zXJ0y5VI0o08ot2AhxViGimsTAdh8HynjZU4c
         86rw==
X-Gm-Message-State: AOAM533C49H9uGTZeKD1z0reL8x+rrFZOLkEOIWiRgafLziuLT7TL7ZB
	O0UgvEAp4Yln3JykTSujiuNGyeuVevBYVMxgQK0=
X-Google-Smtp-Source: 
 ABdhPJxbeLkd/Zvw2TMNl/a+3H0bHDEvlr8Xsc5ZoHuGuuG8p2LJcBk8kEsn3JHVJiNdw00lS6L+zhaP5zUraMgtTSI=
X-Received: by 2002:a19:6b15:0:b0:443:b6ae:2ab7 with SMTP id
 d21-20020a196b15000000b00443b6ae2ab7mr16768807lfa.555.1646180999784; Tue, 01
 Mar 2022 16:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20220228163710.44361-1-quaresma.jose@gmail.com>
 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Mar 2022 00:29:48 +0000
Message-ID: 
 <CANPvuR=oEHMR6DBmiQL38M7-FENtUxuRf0122B9i-DVhrvQMNg@mail.gmail.com>
Subject: Re: [PATCH] Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ba6e3605d931610a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 00:30:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162585

--000000000000ba6e3605d931610a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 1/03/2022 =C3=A0(=
s) 04:18:

> this is fixing more than the workaround, e.g. see the patch I sent to
> fix libical, where these flags are not passed to git compiler when
> using cmake
> I am not sure how many such fallouts there will be through out.
>

I have looked on the libcal and I think that it is another issue with
the g-ir-scanner-wrapper
that doesn't use the cmake cflags CMAKE_C_FLAGS.
I can build the libcal with this patch disabling the gobject-introspection
with GI_DATA_ENABLED =3D "False"

Jose


> On Mon, Feb 28, 2022 at 8:37 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > This reverts commit 47594d59ec4ab82fcf87d3c590caf7c46a6bfdff.
> >
> > This patch was introduced 5 years ago as a temporary workaround
> > to fix an upstream bug.
> >
> > Currently with that patch the following flags are duplicated:
> >  OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> >  OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CPPFLAGS} ${LDFLAGS}"
> >  OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CXXFLAGS} ${LDFLAGS}"
> >
> > The duplicated flags is used in the toolchain.cmake:
> >  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
> >  set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> >  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING
> "LDFLAGS" )
> >
> > CC: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/cmake.bbclass | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> > index fac7bbca7a..d9bcddbdbb 100644
> > --- a/meta/classes/cmake.bbclass
> > +++ b/meta/classes/cmake.bbclass
> > @@ -31,8 +31,6 @@ OECMAKE_C_FLAGS_RELEASE ?=3D "-DNDEBUG"
> >  OECMAKE_CXX_FLAGS_RELEASE ?=3D "-DNDEBUG"
> >  OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CPPFLAGS} ${LDFLAGS}"
> >  OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CXXFLAGS} ${LDFLAGS}"
> > -CXXFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> > -CFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> >
> >  def oecmake_map_compiler(compiler, d):
> >      args =3D d.getVar(compiler).split()
> > --
> > 2.35.1
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ba6e3605d931610a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 1/03/2=
022 =C3=A0(s) 04:18:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">this is fixing more than the workaround, e.g. see the patch I sent to<=
br>
fix libical, where these flags are not passed to git compiler when<br>
using cmake<br>
I am not sure how many such fallouts there will be through out.<br></blockq=
uote><div><br></div><div>I have looked on the libcal and I think that it is=
 another issue with the=C2=A0g-ir-scanner-wrapper</div><div>that doesn&#39;=
t=C2=A0use the cmake cflags CMAKE_C_FLAGS.<br></div><div>I can build the li=
bcal with this patch disabling=C2=A0the=C2=A0gobject-introspection</div><di=
v>with GI_DATA_ENABLED =3D &quot;False&quot;</div><div><br></div><div>Jose<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Mon, Feb 28, 2022 at 8:37 AM Jose Quaresma &lt;<a href=3D"mailto:quaresm=
a.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; This reverts commit 47594d59ec4ab82fcf87d3c590caf7c46a6bfdff.<br>
&gt;<br>
&gt; This patch was introduced 5 years ago as a temporary workaround<br>
&gt; to fix an upstream bug.<br>
&gt;<br>
&gt; Currently with that patch the following flags are duplicated:<br>
&gt;=C2=A0 OECMAKE_C_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} =
${CFLAGS}&quot;<br>
&gt;=C2=A0 OECMAKE_C_LINK_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTI=
ONS} ${CPPFLAGS} ${LDFLAGS}&quot;<br>
&gt;=C2=A0 OECMAKE_CXX_LINK_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OP=
TIONS} ${CXXFLAGS} ${LDFLAGS}&quot;<br>
&gt;<br>
&gt; The duplicated flags is used in the toolchain.cmake:<br>
&gt;=C2=A0 set( CMAKE_C_FLAGS &quot;${OECMAKE_C_FLAGS}&quot; CACHE STRING &=
quot;CFLAGS&quot; )<br>
&gt;=C2=A0 set( CMAKE_CXX_FLAGS &quot;${OECMAKE_CXX_FLAGS}&quot; CACHE STRI=
NG &quot;CXXFLAGS&quot; )<br>
&gt;=C2=A0 set( CMAKE_CXX_LINK_FLAGS &quot;${OECMAKE_CXX_LINK_FLAGS}&quot; =
CACHE STRING &quot;LDFLAGS&quot; )<br>
&gt;<br>
&gt; CC: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cmake.bbclass | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass<b=
r>
&gt; index fac7bbca7a..d9bcddbdbb 100644<br>
&gt; --- a/meta/classes/cmake.bbclass<br>
&gt; +++ b/meta/classes/cmake.bbclass<br>
&gt; @@ -31,8 +31,6 @@ OECMAKE_C_FLAGS_RELEASE ?=3D &quot;-DNDEBUG&quot;<br=
>
&gt;=C2=A0 OECMAKE_CXX_FLAGS_RELEASE ?=3D &quot;-DNDEBUG&quot;<br>
&gt;=C2=A0 OECMAKE_C_LINK_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTI=
ONS} ${CPPFLAGS} ${LDFLAGS}&quot;<br>
&gt;=C2=A0 OECMAKE_CXX_LINK_FLAGS ?=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OP=
TIONS} ${CXXFLAGS} ${LDFLAGS}&quot;<br>
&gt; -CXXFLAGS +=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}&quot;<br>
&gt; -CFLAGS +=3D &quot;${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}&quot;<br>
&gt;<br>
&gt;=C2=A0 def oecmake_map_compiler(compiler, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 args =3D d.getVar(compiler).split()<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000ba6e3605d931610a--

