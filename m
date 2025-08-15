Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86481CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 18:53:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.19195.1755284023386613972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 11:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DCPM0k6A;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24458242b33so21617025ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755284023; x=1755888823; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=paJzoEL8KBBNQPSnQUONY18YRWfDzs4HaujtA4Gzqw4=;
        b=DCPM0k6AcyMyKDFGM0FzFOacoSqYEJhJkSHTl8ImHSGDvEwdRWzYVpOnOOtjedG1Zg
         wYNPZMmKYqQlBgQ8XXBQ7s/X9NhG0zXqu2hko4WT1C5yXV9ZnxUtTnCp8dcJVZuoxSae
         eXRn2988us1/2jlLdxrNwbGT9HBEiIzCJPm3VYOlKSpifIZQ3fPazpo3qF+FrMVDYKd2
         8FO1DCYIDiuOL9pvybuCdS+KizGhdh8kXHukYspfCPoLjMNdSt5wh18Yo3FiXaA8EP14
         eRCDw0eLMNImN+EjQnTtvsPCjeV7NQfpUIcNVFciP3kqwhEVJJM82DWirCbFsxqRjMY+
         zyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755284023; x=1755888823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paJzoEL8KBBNQPSnQUONY18YRWfDzs4HaujtA4Gzqw4=;
        b=rL3rv8DkGt0zc/g3/WTul3r0R2RFiwrH1EEFVPdMm2U5zB12vJCnWn5dTxFr+Qcwhq
         qxuFEi6T7sWGgxf9u6cD8csSNYKxZ6/R1gz2KT93g/OUEq7muYtWpc7Xmb1Yfik+ItQZ
         Yvnmulvt8WE13sQsb7jeYl7w9bgLxNZXcCTSYhIuIYFvgWFPNCymmtEpGVKyz3GeFAEn
         rbIkXpSNfQ+aOgnfUHdI9ANeJ7tvM6hsHA2XftuUoruYzu9sLeIBN5f0AcpSUUY9Ap9K
         PXLnvQ0cs+oBuFCNCIE5/QkdtHnSyKc1/gk7pMi0/QQnU8X7RzXT2klvxTuTJyZMdAcG
         Zstw==
X-Gm-Message-State: AOJu0YyT7taVmbxGSh5DkUO+Y0hD/bxm+EJ33bntXg9B4mhsJOrHaDB3
	EP3bhO5YjCvSOc+cRbbu4k286bXd23xoml/Fk+GVH9KdNlCm4+ThF7a+udXrWAvg7ffZ9Fxp/SD
	YremvKNQDeyMTRbh0aDeXKx6Nd8ktTzk=
X-Gm-Gg: ASbGncsxq8BF7au969X+KXw6yZATxaqnGcAimASFlYvZm63NVNo5ByXgpfjez94d16X
	jzsCAWVZEsQCblPuAVH/ab/Ye1MX9QaZ8gW4I7T1lLJgznh+dg1S9mMLwK1H6nhZyI+ZbDjnRiL
	zMpui1oAFM4gLnjdvChsG8CRNxci0W2yi8tjERFqkt0IN6y72yx1GSgJzej9DLUimSGUv5tRRib
	Mmi5oprAdyso97h36DD03QpMFF1o+KxRQoB8xM=
X-Google-Smtp-Source: AGHT+IFIhbobqPIj1U6MxcmIIWEsJNdkUaW6NGiLadAi1qdXV+SS1O/JP4QJydK1sCe9ee0Kl5kymxceOBwjD/bEntA=
X-Received: by 2002:a17:902:f545:b0:235:ea0d:ae23 with SMTP id
 d9443c01a7336-2446d6edb44mr36605595ad.6.1755284022574; Fri, 15 Aug 2025
 11:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250812205050.13599-1-osama.abdelkader@gmail.com> <CANNYZj9LZ+9OFBCh6uND7fPRMEO370ji8koc3sCyWMrepF+vCA@mail.gmail.com>
In-Reply-To: <CANNYZj9LZ+9OFBCh6uND7fPRMEO370ji8koc3sCyWMrepF+vCA@mail.gmail.com>
From: Osama Ahmed <osama.abdelkader@gmail.com>
Date: Fri, 15 Aug 2025 20:53:31 +0200
X-Gm-Features: Ac12FXwUTLT6L_bF9GBRFk1TeIzn5O4ZzYxUoWOpm9O4w8REax8K4nebkHpBgns
Message-ID: <CAEWn9yvuwftd=iYKhEdM1Oq8yaLF1vPzgnORnWwYeXCbDOu6ow@mail.gmail.com>
Subject: Re: [PATCH v2] go-cross-canadian: fix binaries install and GOARCH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5448d063c6be82f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 18:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221992

--000000000000a5448d063c6be82f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex, I will try that.

BR,
Osama


On Thu 14. Aug 2025 at 1:26=E2=80=AFPM, Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> This has now merged. I have also sent a followup that would build and
> install go toolchain into SDKs in yocto CI (so issues like this should
> not reoccur):
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20250814105604.3=
586651-1-alex.kanavin@gmail.com/
>
> Another followup would be to add sdk/runtime tests that actually
> exercise the toolchain and check that it works properly (we have that
> for rust and gcc, but not for go):
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15953
>
> If you can add such tests, would be very appreciated!
>
> Alex
>
> On Tue, 12 Aug 2025 at 22:52, Osama Abdelkader
> <osama.abdelkader@gmail.com> wrote:
> >
> > set GOARCH to HOST_GOARCH which is set from SDKMACHINE,
> > since GOARCH defaults to TARGET_GOARCH, which is set from MACHINE (wron=
g
> arch).
> >
> > Also fix do_install to correctly install all binaries from
> > ${GO_BUILD_BINDIR} by using 'find -type f' to avoid issues when the
> > directory contains subdirectories (e.g. "linux_arm").
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> > v2:
> > - Fixed commit message
> > ---
> >  meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc
> b/meta/recipes-devtools/go/go-cross-canadian.inc
> > index 39330fc98b..4a6f2f4c36 100644
> > --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> > +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> > @@ -5,6 +5,8 @@ DEPENDS =3D "go-native virtual/${HOST_PREFIX}go
> virtual/nativesdk-${HOST_PREFIX}go
> >             virtual/nativesdk-compilerlibs"
> >  PN =3D "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> >
> > +GOARCH =3D "${HOST_GOARCH}"
> > +
> >  # it uses gcc on build machine during go-cross-canadian bootstrap, but
> >  # the gcc version may be old and not support option '-fmacro-prefix-ma=
p'
> >  # which is one of default values of DEBUG_PREFIX_MAP
> > @@ -51,7 +53,7 @@ do_install() {
> >         install -d ${D}${libdir}/go/pkg/tool
> >         cp --preserve=3Dmode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE=
}
> ${D}${libdir}/go/pkg/tool/
> >         install -d ${D}${bindir} ${D}${libdir}/go/bin
> > -       for f in ${B}/${GO_BUILD_BINDIR}/*
> > +       for f in $(find ${B}/${GO_BUILD_BINDIR} -type f)
> >         do
> >                 base=3D`basename $f`
> >                 install -m755 $f ${D}${libdir}/go/bin
> > --
> > 2.43.0
> >
>

--000000000000a5448d063c6be82f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div><div><div><div dir=3D"auto">Thanks Alex, I will try that.<br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">BR,</div><div dir=3D"a=
uto">Osama</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><di=
v><div class=3D"gmail_quote"></div></div></div></div></div></div></div><div=
><div><div><div><div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu 14. Aug 2025 at 1:26=E2=80=AFPM, Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">This has now merged. I=
 have also sent a followup that would build and<br>
install go toolchain into SDKs in yocto CI (so issues like this should<br>
not reoccur):<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/2025081=
4105604.3586651-1-alex.kanavin@gmail.com/" rel=3D"noreferrer" target=3D"_bl=
ank">https://patchwork.yoctoproject.org/project/oe-core/patch/2025081410560=
4.3586651-1-alex.kanavin@gmail.com/</a><br>
<br>
Another followup would be to add sdk/runtime tests that actually<br>
exercise the toolchain and check that it works properly (we have that<br>
for rust and gcc, but not for go):<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15953" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D15953</a><br>
<br>
If you can add such tests, would be very appreciated!<br>
<br>
Alex<br>
<br>
On Tue, 12 Aug 2025 at 22:52, Osama Abdelkader<br>
&lt;<a href=3D"mailto:osama.abdelkader@gmail.com" target=3D"_blank">osama.a=
bdelkader@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; set GOARCH to HOST_GOARCH which is set from SDKMACHINE,<br>
&gt; since GOARCH defaults to TARGET_GOARCH, which is set from MACHINE (wro=
ng arch).<br>
&gt;<br>
&gt; Also fix do_install to correctly install all binaries from<br>
&gt; ${GO_BUILD_BINDIR} by using &#39;find -type f&#39; to avoid issues whe=
n the<br>
&gt; directory contains subdirectories (e.g. &quot;linux_arm&quot;).<br>
&gt;<br>
&gt; Signed-off-by: Osama Abdelkader &lt;<a href=3D"mailto:osama.abdelkader=
@gmail.com" target=3D"_blank">osama.abdelkader@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt; - Fixed commit message<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/rec=
ipes-devtools/go/go-cross-canadian.inc<br>
&gt; index 39330fc98b..4a6f2f4c36 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-cross-canadian.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-cross-canadian.inc<br>
&gt; @@ -5,6 +5,8 @@ DEPENDS =3D &quot;go-native virtual/${HOST_PREFIX}go v=
irtual/nativesdk-${HOST_PREFIX}go<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/nativesdk-compi=
lerlibs&quot;<br>
&gt;=C2=A0 PN =3D &quot;go-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;<b=
r>
&gt;<br>
&gt; +GOARCH =3D &quot;${HOST_GOARCH}&quot;<br>
&gt; +<br>
&gt;=C2=A0 # it uses gcc on build machine during go-cross-canadian bootstra=
p, but<br>
&gt;=C2=A0 # the gcc version may be old and not support option &#39;-fmacro=
-prefix-map&#39;<br>
&gt;=C2=A0 # which is one of default values of DEBUG_PREFIX_MAP<br>
&gt; @@ -51,7 +53,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/go/pkg/tool<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp --preserve=3Dmode,timestamps -R ${=
B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir} ${D}${libdir=
}/go/bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in ${B}/${GO_BUILD_BINDIR}/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in $(find ${B}/${GO_BUILD_BINDIR} -t=
ype f)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base=3D`b=
asename $f`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
m755 $f ${D}${libdir}/go/bin<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div></div></div></div></div></div>
</div>

--000000000000a5448d063c6be82f--

