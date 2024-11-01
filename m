Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57472E6F07E
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:23:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.1261.1730485412650070741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 11:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cgube97n;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f53973fdso2085639e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730485411; x=1731090211; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Sd/zx8ZN+Mq6ZgrN/wL31QhzHuRd88yLrKl122c8=;
        b=Cgube97nDIES7MYpDi+w6eha12uZ24g6Te0D8l6xHPpYaxOtrzvl7oOYCLwDM92etJ
         Wg+qZ0pmDLG09lYUbshfNLozi3XzgQMMMCeVm5M54nvQueNcEEuAWS/UUxTKX8ochcCy
         h8aIOLDf5q+PIdn4Jd1uNlInVEfdJXlgYSrUnvJBm4FUsCuS0z1zACJsGoVYBFFS/Dbv
         7hkvgCSusQ3ElY/LuDJKDyY0nrfJFgCFekHWl8PztDt+XyMg1YGVU/UImUoAKM8jKGAp
         3rs5hHRa+zAm9K4YCUKykjJ5jWaRPL8UuRfmzkB02mOuBeo0Bia97CRnBzIbVnHi5+Gr
         KEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730485411; x=1731090211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cd9Sd/zx8ZN+Mq6ZgrN/wL31QhzHuRd88yLrKl122c8=;
        b=Xop9FqpuOyy8Z1j/5PmcBkG0LGcUZOgShannmbk+ih54ClJ22rvcOCjNJsOxqmvdOv
         E1znwf3Rqw7jLFToqU9kZnhIH5CrSU1VnrRQ71aQpDSgHf4VNPIa2vqat/Gi3SdkMsqi
         +uPmqGgbQKUaOAOpBOTDQc1SSvaLuR1UCeMqiO7VDRNCtp04MJ8dyTn2lH90pDvEqCnJ
         aIg9OwcoFjuXnDRxsy5YnrTrMrE7/VK6hZWBHOBOBu8xHSPh+n5fkw7kKTF0XZDm+JlX
         WxFazQOfQKnh1nrZUnZRA1wGMH+xQ9l66if/5jaEKNX6Hn91Mo7Is8sDTMu1NI+LIvEO
         RxpQ==
X-Gm-Message-State: AOJu0Ywuk0Q7P1UhYyeKHTtMtir7MHAPUkUyD3wBbKY22bo6PGSxo7mz
	KB2iiczSIzpKUB323Pu+KBT59KkVZgM/82gAgPDM63s1eNPvcuMnES55LLDqCKM3hJP33qy9yIm
	LBPcAEj2Kods/EtGgYNdd0uQUehc=
X-Google-Smtp-Source: AGHT+IGsgd6fmDeOlpcYEy6tTYjwp5k1VQss5S56yIX3sYPAWeHfdUx0wfiqj/npUYBnK9LZQ0m0b/1KqWXARGY57V4=
X-Received: by 2002:a05:6512:3343:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53d65dc3a4emr1537471e87.20.1730485410384; Fri, 01 Nov 2024
 11:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241101180802.395269-1-erick.shepherd@ni.com> <20241101180802.395269-2-erick.shepherd@ni.com>
In-Reply-To: <20241101180802.395269-2-erick.shepherd@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 19:23:19 +0100
Message-ID: <CANNYZj8tvyciL2fG_7ou4K=1pXE3U6AQdLSEuiQ+L3s5x1cG+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xorg-font-common: Install fonts after target boots
To: erick.shepherd@ni.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002cd69e0625de08a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 18:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206627

--0000000000002cd69e0625de08a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn=E2=80=99t seem like a correct fix. We do have font cache at root=
s time
so the tools either can=E2=80=99t find it or need the cache to be explicitl=
y
created first.

Ontarget is problematic with read only roots and should be avoided if
possible.

Alex

On Fri 1. Nov 2024 at 19.08, Erick Shepherd via lists.openembedded.org
<erick.shepherd=3Dni.com@lists.openembedded.org> wrote:

> Access to the font cache on the target is required to
> get rid of the "configuration required on target" font
> warnings that appear during rootfs builds.
>
> Signed-off-by: Erick Shepherd <erick.shepherd@ni.com>
> ---
>  meta/recipes-graphics/xorg-font/xorg-font-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> index edf7cf7642..b9c55a95f8 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> +++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> @@ -30,7 +30,7 @@ do_install:append() {
>  FILES:${PN} +=3D " ${libdir}/X11/fonts ${datadir}"
>
>  PACKAGE_WRITE_DEPS +=3D "mkfontdir-native mkfontscale-native"
> -pkg_postinst:${PN} () {
> +pkg_postinst_ontarget:${PN} () {
>          for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
>                  mkfontdir $fontdir
>                  mkfontscale $fontdir
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206626):
> https://lists.openembedded.org/g/openembedded-core/message/206626
> Mute This Topic: https://lists.openembedded.org/mt/109339440/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002cd69e0625de08a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This doesn=E2=80=99t seem like a correct fix. We do have =
font cache at roots time so the tools either can=E2=80=99t find it or need =
the cache to be explicitly created first.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Ontarget is problematic with read only roots and should b=
e avoided if possible.</div><div dir=3D"auto"><br></div><div dir=3D"auto">A=
lex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri 1. Nov 2024 at 19.08, Erick Shepherd via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;erick.shepherd=3D<a h=
ref=3D"mailto:ni.com@lists.openembedded.org">ni.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">Access to the font cache on the ta=
rget is required to<br>
get rid of the &quot;configuration required on target&quot; font<br>
warnings that appear during rootfs builds.<br>
<br>
Signed-off-by: Erick Shepherd &lt;<a href=3D"mailto:erick.shepherd@ni.com" =
target=3D"_blank">erick.shepherd@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-font/xorg-font-common.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/re=
cipes-graphics/xorg-font/xorg-font-common.inc<br>
index edf7cf7642..b9c55a95f8 100644<br>
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc<br>
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc<br>
@@ -30,7 +30,7 @@ do_install:append() {<br>
=C2=A0FILES:${PN} +=3D &quot; ${libdir}/X11/fonts ${datadir}&quot;<br>
<br>
=C2=A0PACKAGE_WRITE_DEPS +=3D &quot;mkfontdir-native mkfontscale-native&quo=
t;<br>
-pkg_postinst:${PN} () {<br>
+pkg_postinst_ontarget:${PN} () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fontdir in `find $D/usr/lib/X11/fonts=
 -type d`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfontdir $fo=
ntdir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfontscale $=
fontdir<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206626): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206626" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206626</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109339440/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109339440/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002cd69e0625de08a3--

