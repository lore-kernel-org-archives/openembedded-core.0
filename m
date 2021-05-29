Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.16301.1622249074165035896
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 17:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T4pPVAeM;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: joel.winarske@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id w15so7375946ljo.10
        for <Openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=bPLW12D/BTVEIzIw4jeDvO+suhJy9cgfNtMg3sHREXE=;
        b=T4pPVAeMZgYMcb+OdQWICk/4lCziGmU3q0kOF7Atulu9Fq70eIEQRBKrm5bzr9O+EX
         syauwkWR63oX4vb7l4bmOeg7gjFcfaCrY8yIGpzenlH7AN81eSs0gwaGejM7nh95rkko
         hoz5vMAAgB+0dQz4a2OzZfHHjxmDTFkD3+NFKhcqg+EjbNBKXCVxpyf0cP63RAdh/I62
         W301/QG5P+xnxXs4hlu3seWPfXcszH4PUt+yBeoGRyoGes+CJ2YPSr8GRWrT4UYgV2R5
         5ZDW2fwjV9bH6PynTwDdDeWc3FDcxJUdUQKBMQIMrDiILSFFp00c3JhznHB9W/KzdNS6
         UVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bPLW12D/BTVEIzIw4jeDvO+suhJy9cgfNtMg3sHREXE=;
        b=WRQng7QBmfjp1KDVK68t22bqBWV7k/vkva3qzqG8vsi7JRkMhmB7YW4IE8ll3PtsSh
         8LhTTe+uy8TZbDn1k+tKU+oNkFonFL7mlE6GVELC/T8Z2ueBbMonbyfwT34Z42uikZO8
         HhTmM4fk6y/WDDbWCWvHHsp7bLRetaBW2xstU0KpvVt+yRwHSFK8thIaeBy5a2DVpYT9
         vsX4XQBfM0kjy+4jVgQFS2/kNoYW5UTv99hpxw6w2MMSDAib9wcgTU8K/JL41Q5MScBG
         dycatJAvlEViqA8KmxKKcgl8UXHxIN7eS7d3FHZRktISq2P/3lyTG+PziWW1z83531Q/
         L5vg==
X-Gm-Message-State: AOAM530x/vGPKcgLaneus+C9NECcKLePNObQotFngbn5xmkJG+VlZmc0
	jQvAGvLDGZTT/E3jfkOJx+krpilYCGWLOJdwjBeMm/drOC21UQ==
X-Google-Smtp-Source: ABdhPJxG6zDY2ADHcgnNxIgyof8OkOBA9TAto25j07xDOupLAfrLzKSZxU2sJ6le+H4Vsp476FpXEVI+58H+k3zuNnQ=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr8510903lji.273.1622249072006;
 Fri, 28 May 2021 17:44:32 -0700 (PDT)
MIME-Version: 1.0
From: "Joel Winarske" <joel.winarske@gmail.com>
Date: Fri, 28 May 2021 17:44:21 -0700
Message-ID: <CABKMkP+bH=9Hd3uuE3qEMkf6Zy-rj9=kFZ+89spQ=jOwkm0huQ@mail.gmail.com>
Subject: [yocto][poky][master][PATCH} VirGL: depends on virtual/gbm
To: Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac9b0305c36d4b95"

--000000000000ac9b0305c36d4b95
Content-Type: text/plain; charset="UTF-8"

This addresses cases where the platform doesn't depend on Mesa.  The NVIDIA
Tegra is one example.

From 427d6248379bf37f5522d4bb1013b8c0b7a26b5b Mon Sep 17 00:00:00 2001
From: Joel Winarske <joel.winarske@gmail.com>
Date: Fri, 28 May 2021 12:10:46 -0700
Subject: [PATCH] VirGL depends on gbm.h

Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 3991895823..65bd1af942 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://virgil3d.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"

-DEPENDS = "libdrm virtual/libgl libepoxy"
+DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1
\
            file://0001-meson.build-use-python3-directly-for-python.patch \
-- 
2.30.2

--000000000000ac9b0305c36d4b95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This addresses cases where the platform doesn&#39;t depend=
 on Mesa.=C2=A0 The NVIDIA Tegra is one example.<br><br>From 427d6248379bf3=
7f5522d4bb1013b8c0b7a26b5b Mon Sep 17 00:00:00 2001<br>From: Joel Winarske =
&lt;<a href=3D"mailto:joel.winarske@gmail.com">joel.winarske@gmail.com</a>&=
gt;<br>Date: Fri, 28 May 2021 12:10:46 -0700<br>Subject: [PATCH] VirGL depe=
nds on gbm.h<br><br>Signed-off-by: Joel Winarske &lt;<a href=3D"mailto:joel=
.winarske@gmail.com">joel.winarske@gmail.com</a>&gt;<br>---<br>=C2=A0meta/r=
ecipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0.9.1.bb">vir=
glrenderer_0.9.1.bb</a> | 2 +-<br>=C2=A01 file changed, 1 insertion(+), 1 d=
eletion(-)<br><br>diff --git a/meta/recipes-graphics/virglrenderer/<a href=
=3D"http://virglrenderer_0.9.1.bb">virglrenderer_0.9.1.bb</a> b/meta/recipe=
s-graphics/virglrenderer/<a href=3D"http://virglrenderer_0.9.1.bb">virglren=
derer_0.9.1.bb</a><br>index 3991895823..65bd1af942 100644<br>--- a/meta/rec=
ipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0.9.1.bb">virgl=
renderer_0.9.1.bb</a><br>+++ b/meta/recipes-graphics/virglrenderer/<a href=
=3D"http://virglrenderer_0.9.1.bb">virglrenderer_0.9.1.bb</a><br>@@ -8,7 +8=
,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://virgil3d.github.io/">https://vi=
rgil3d.github.io/</a>&quot;<br>=C2=A0LICENSE =3D &quot;MIT&quot;<br>=C2=A0L=
IC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76=
db10&quot;<br>=C2=A0<br>-DEPENDS =3D &quot;libdrm virtual/libgl libepoxy&qu=
ot;<br>+DEPENDS =3D &quot;libdrm virtual/libgl virtual/libgbm libepoxy&quot=
;<br>=C2=A0SRCREV =3D &quot;363915595e05fb252e70d6514be2f0c0b5ca312b&quot;<=
br>=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.org/=
virglrenderer;branch=3Dbranch-0.9.1">anongit.freedesktop.org/virglrenderer;=
branch=3Dbranch-0.9.1</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi=
le://0001-meson.build-use-python3-directly-for-python.patch \<br>-- <br>2.3=
0.2<br><br><br></div>

--000000000000ac9b0305c36d4b95--
