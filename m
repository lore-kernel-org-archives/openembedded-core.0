Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533CCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 16:21:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.1082.1704730902405718111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 08:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTbhwbXE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3366ddd1eddso2205053f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704730901; x=1705335701; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kwwv4IJstx6T4b7v3KPDGGo/zAIyg7rS1VdomWicfs=;
        b=lTbhwbXEmGT0JIgUYik2vOr2sEt5QBYl2HdBLmotSlCJMyV+OGkHJjr4ekmPBWT91a
         BwaU0jA4HySwsbPDTmmQVfgcWTJUGmS8hO9aJ0atSM0DOErZIywk2fcDC1aT08wBecDV
         mCaw62H75XzQym40uLGmM3BBLS2h1iisI78tPsDwNSM62kHqJfQoYR6/DuZdLa0AcF9X
         id2vSK35/cc9F7Onw5AdYmFjdRZSO37BB0PNMfIv5ludzWIwR2vK+XC1Ss3M5vajstdw
         2N0S7rTRpN8U0EJOrJPb2sVVz2fgL6b+g2gs7rDPu8IP/59l4dR63vTFhCxA2tLS6gg5
         GnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704730901; x=1705335701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kwwv4IJstx6T4b7v3KPDGGo/zAIyg7rS1VdomWicfs=;
        b=hJXJRAq95NigMFAVRYTc2/n0KTi53ySyoMDocwTGkucRNRwIMzBsXmHMg5LiNfdZis
         G1hxFH9vu/Tpw5EAuzMKXROt26qnBNf1tFRJs6qeKtO6aWU4j+92yIn4yyui9QJJa41Q
         Jh1rt6xlirXQYgTAKb6hWyphE5GJdpUX3lSP3e8cRik5/tEbvCYRjBQ+zrXcTuCm2Zht
         ScxooFq/GXwb8W7AwnVQd4SdcRjvlOf8oGbvcE/2HVIChuEg18ESIqMSfb3FjbAma+h2
         oRAMcrrTbpPN6kks5muaEEZbM5mRLSFyqAxmJY4QQoz7uGgdl6DGEs3bVhXWaemHVtbJ
         FxEQ==
X-Gm-Message-State: AOJu0YwmmPz8IX03Wpnvj7wquetl8vBM4uFfZPoidBuIGTBLJrMqDimv
	wryPMpxJJwTjfKv9O5lu5ajwzwDq5d1FZ7U6c1Q=
X-Google-Smtp-Source: AGHT+IHRygfVmuKXE6c7Dwy++iYRPq+bVAywejcOgif1ytvge8T6A5oy5G9kvBs6XPomSx/NDOrJalIq2Xq6+Eu39uQ=
X-Received: by 2002:a05:600c:3d10:b0:40e:4618:ee66 with SMTP id
 bh16-20020a05600c3d1000b0040e4618ee66mr618534wmb.132.1704730900389; Mon, 08
 Jan 2024 08:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20231226123810.495126-1-festevam@gmail.com>
In-Reply-To: <20231226123810.495126-1-festevam@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jan 2024 17:21:28 +0100
Message-ID: <CA+chaQfLcVr62n8xOCXJoc7TXM2Ut_qkMa_uM5OoscUQCyHnEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kmscube: Upgrade to latest revision
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="000000000000c165dd060e7197be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 16:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193422

--000000000000c165dd060e7197be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

can you please set PV to something else than "git"? meson.build
says version : '0.0.1'

The last commit from the new 3 is causing build failure on some setups
without GL/gl.h:

kmscube/git/git $ git log --oneline
ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c..96d63eb59e34c647cda1cbb489265f8c5=
36ae055
96d63eb kmscube: Add gears mode
d93842d es: Update to prepare for gears mode
b076d85 ci: enable MR pipelines

Until "96d63eb kmscube: Add gears mode" it was using only EGL:

kmscube/git/git $ git grep "gl\.h"
common.h:#include <EGL/egl.h>
cube-gears.c:#include <GL/gl.h>
esUtil.h:#include <EGL/egl.h>

Regards,

On Tue, Dec 26, 2023 at 1:38=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Upgrade to the latest kmscube revision.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb
> b/meta/recipes-graphics/kmscube/kmscube_git.bb
> index 4cdc0f06bb8b..aab582281ac3 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtual/=
egl
> libdrm virtual/libgbm"
>
>  LIC_FILES_CHKSUM =3D
> "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff7381=
270dd631fb"
>
> -SRCREV =3D "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
> +SRCREV =3D "96d63eb59e34c647cda1cbb489265f8c536ae055"
>  SRC_URI =3D "git://
> gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;protocol=3Dhttps"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192910):
> https://lists.openembedded.org/g/openembedded-core/message/192910
> Mute This Topic: https://lists.openembedded.org/mt/103368830/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c165dd060e7197be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>can you please set PV to something =
else than &quot;git&quot;?=C2=A0meson.build says=C2=A0version : &#39;0.0.1&=
#39;</div><div><br></div><div>The last commit from the new 3 is causing bui=
ld failure on some setups without=C2=A0GL/gl.h:</div><div><br></div><div>km=
scube/git/git $ git log --oneline ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c.=
.96d63eb59e34c647cda1cbb489265f8c536ae055<br></div><div>96d63eb kmscube: Ad=
d gears mode<br>d93842d es: Update to prepare for gears mode<br>b076d85 ci:=
 enable MR pipelines<br></div><div><br></div><div>Until &quot;96d63eb kmscu=
be: Add gears mode&quot; it was using only EGL:</div><div><br></div><div>km=
scube/git/git $ git grep &quot;gl\.h&quot;<br>common.h:#include &lt;EGL/egl=
.h&gt;<br>cube-gears.c:#include &lt;GL/gl.h&gt;<br>esUtil.h:#include &lt;EG=
L/egl.h&gt;</div><div><br></div><div>Regards,</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 26, 2023 at =
1:38=E2=80=AFPM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">fes=
tevam@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" =
target=3D"_blank">festevam@denx.de</a>&gt;<br>
<br>
Upgrade to the latest kmscube revision.<br>
<br>
Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=
=3D"_blank">festevam@denx.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb=
" rel=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a> b/meta/recipes-gr=
aphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=3D"noreferrer" target=
=3D"_blank">kmscube_git.bb</a><br>
index 4cdc0f06bb8b..aab582281ac3 100644<br>
--- a/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
+++ b/meta/recipes-graphics/kmscube/<a href=3D"http://kmscube_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscube_git.bb</a><br>
@@ -10,7 +10,7 @@ DEPENDS =3D &quot;virtual/libgles3 virtual/libgles2 virtu=
al/egl libdrm virtual/libgbm&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://kmscube.c;beginline=3D1;endline=3D2=
3;md5=3D8b309d4ee67b7315ff7381270dd631fb&quot;<br>
<br>
-SRCREV =3D &quot;ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c&quot;<br>
+SRCREV =3D &quot;96d63eb59e34c647cda1cbb489265f8c536ae055&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/mesa=
/kmscube;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bl=
ank">gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;protocol=3Dhttps</=
a>&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192910): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192910" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192910</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103368830/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103368830/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c165dd060e7197be--

