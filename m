Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992A7C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 17:26:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.3087.1704734765413833688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 09:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iOax5+Qu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33765009941so1715739f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704734764; x=1705339564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+4kWVOVe8U+O+la0J77oDAsyIfSrN4dXJ4qEwUsM/s=;
        b=iOax5+QuHjjljnaS6ABsJEmFWGOeILeGoxby7MkAPxihBZwxJFxVVauUs53eUR6Ijd
         4gLcyrozCXfg6Ryq2YSkLmJzjApokFgh0NzabSmTypWrbZewQq+iJPAnJXlsh6dxQkED
         cxgYPqPXRYXnUGSVR7CwwseXM6Ooms4svqCLgxZGxyPLhs8RSI4XSLiZVJ66ZvTtJRqO
         E5sM19ky47tmSyKZcK0qkQYtyGpb4RtRX5rZi04UvhWnSJ1AxQeY6Uv1wTlwBH6Cllvw
         r4PNPF3bF81lgqOilQ0VyEIQ1Mhb8rLmZtYIEf7qFg5iSUE0+CC0vIf6UVEiikk62ALS
         jipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704734764; x=1705339564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+4kWVOVe8U+O+la0J77oDAsyIfSrN4dXJ4qEwUsM/s=;
        b=jZk0BpIkjuWeHBthInMpvMxLGEPZg6hA9jjKHmUAOlq8RhwGtl47km3MWKLWjG1Zn7
         uW/PrSQh4yTHuLGQywaB2vQjCKUTKw+i0laF0jbo4bFeq7HLIjs6PCKvBbPIvkEBM7tZ
         p6GtxEO3jUimozIm78N1sh0inmX+BxLUqk9OXD2i8p553GnFHAuGlaoNCBC7CBDNoiLj
         GhsV/gq1tIRlAUfc1gFm+tkNn5TCW+88CDnPj93KhrOFXVcvNonjzEnFkQfIkv0QLxxm
         JF/P2izht0f49Xpt4Abr+W5G4awfmH4gFPgeAxGSuTxdpRaCfZHmf5ZQcyRdnvywoheV
         UYkg==
X-Gm-Message-State: AOJu0YzTxvEUMoP9URospNEDtRfTKgCrtiR73zRUDIH+h+H+Riqqym6m
	8kZ+RT76MbbY/y/sOBlpPx+BIQ8J0EgHIeIsj0Q=
X-Google-Smtp-Source: AGHT+IHujLoA2cIUHy/AZQ0qF2ZD54RA4Cr/hCTIs2w/jucVNo+3PM7YnlVYZTyKSC+0geaaCeEgMRCManlil1jP+VU=
X-Received: by 2002:adf:f3cf:0:b0:336:654a:bff2 with SMTP id
 g15-20020adff3cf000000b00336654abff2mr2064669wrp.10.1704734763670; Mon, 08
 Jan 2024 09:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20231226123810.495126-1-festevam@gmail.com> <CA+chaQfLcVr62n8xOCXJoc7TXM2Ut_qkMa_uM5OoscUQCyHnEQ@mail.gmail.com>
 <CAOMZO5Bn23X5T2t++H22VBYS9rF8SUinXFCQ7OXr5L7hG_J6xA@mail.gmail.com>
In-Reply-To: <CAOMZO5Bn23X5T2t++H22VBYS9rF8SUinXFCQ7OXr5L7hG_J6xA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jan 2024 18:25:50 +0100
Message-ID: <CA+chaQeYKWdD0Kz82OpZB_cMeGHPRwKXfcOZBRd4_sSHkOUMKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmscube: Upgrade to latest revision
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="000000000000066258060e727e7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 17:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193428

--000000000000066258060e727e7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 6:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:

> Hi Martin,
>
> On Mon, Jan 8, 2024 at 1:21=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om>
> wrote:
> >
> > Hi,
> >
> > can you please set PV to something else than "git"? meson.build says
> version : '0.0.1'
>
> Yes, I can do that.
>
> > The last commit from the new 3 is causing build failure on some setups
> without GL/gl.h:
> >
> > kmscube/git/git $ git log --oneline
> ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c..96d63eb59e34c647cda1cbb489265f8=
c536ae055
> > 96d63eb kmscube: Add gears mode
> > d93842d es: Update to prepare for gears mode
> > b076d85 ci: enable MR pipelines
> >
> > Until "96d63eb kmscube: Add gears mode" it was using only EGL:
> >
> > kmscube/git/git $ git grep "gl\.h"
> > common.h:#include <EGL/egl.h>
> > cube-gears.c:#include <GL/gl.h>
> > esUtil.h:#include <EGL/egl.h>
>
> Does the change below fix (add virtual/libgl to DEPENDS) the problem?
>
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -6,7 +6,7 @@ OpenGL or OpenGL ES."
>  HOMEPAGE =3D "https://cgit.freedesktop.org/mesa/kmscube/"
>  LICENSE =3D "MIT"
>  SECTION =3D "graphics"
> -DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm
> virtual/libgbm"
> +DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/egl libdrm
> virtual/libgbm virtual/libgl"
>
>  LIC_FILES_CHKSUM =3D
>
> "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff7381=
270dd631fb"
>

On this platform it doesn't as GL/gl.h is not available, but it builds fine
after replacing GL/gl.h with GLES3/gl3.h (for GL_DEPTH24_STENCIL8).

--000000000000066258060e727e7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 8, 2024 at 6:02=E2=80=AFPM Fa=
bio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Martin,<br>
<br>
On Mon, Jan 8, 2024 at 1:21=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; can you please set PV to something else than &quot;git&quot;? meson.bu=
ild says version : &#39;0.0.1&#39;<br>
<br>
Yes, I can do that.<br>
<br>
&gt; The last commit from the new 3 is causing build failure on some setups=
 without GL/gl.h:<br>
&gt;<br>
&gt; kmscube/git/git $ git log --oneline ea6c5d1eeefbfb0a1c27ab74a6e4621f1d=
9adf4c..96d63eb59e34c647cda1cbb489265f8c536ae055<br>
&gt; 96d63eb kmscube: Add gears mode<br>
&gt; d93842d es: Update to prepare for gears mode<br>
&gt; b076d85 ci: enable MR pipelines<br>
&gt;<br>
&gt; Until &quot;96d63eb kmscube: Add gears mode&quot; it was using only EG=
L:<br>
&gt;<br>
&gt; kmscube/git/git $ git grep &quot;gl\.h&quot;<br>
&gt; common.h:#include &lt;EGL/egl.h&gt;<br>
&gt; cube-gears.c:#include &lt;GL/gl.h&gt;<br>
&gt; esUtil.h:#include &lt;EGL/egl.h&gt;<br>
<br>
Does the change below fix (add virtual/libgl to DEPENDS) the problem?<br>
<br>
--- a/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
+++ b/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
@@ -6,7 +6,7 @@ OpenGL or OpenGL ES.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://cgit.freedesktop.org/mesa/kmscu=
be/" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/mesa=
/kmscube/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0SECTION =3D &quot;graphics&quot;<br>
-DEPENDS =3D &quot;virtual/libgles3 virtual/libgles2 virtual/egl libdrm vir=
tual/libgbm&quot;<br>
+DEPENDS =3D &quot;virtual/libgles3 virtual/libgles2 virtual/egl libdrm<br>
virtual/libgbm virtual/libgl&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D<br>
&quot;file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff7=
381270dd631fb&quot;<br></blockquote><div><br></div><div>On this platform it=
 doesn&#39;t as GL/gl.h is not available, but it builds fine after replacin=
g GL/gl.h with GLES3/gl3.h (for GL_DEPTH24_STENCIL8).</div></div></div>

--000000000000066258060e727e7f--

