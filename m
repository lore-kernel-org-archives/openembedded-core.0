Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B00C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 12:40:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.100749.1703680813204864270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 04:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bl16s6ur;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7e1ddaddso1929607e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703680811; x=1704285611; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmJBf6HuhL5ySnCuZQiOwVxjrIAweRC8ejXOZTZC7jU=;
        b=bl16s6urtr5P55t+Rxyhzsu3v4jFDao9I5YIZetDQcShKg7AyjlAgRyLbXrBIvYYDT
         kEhbKsfzbOzU/D4ugybNA17vTNdRH3i/o+Ve7ljFf+MQRHIgYiOO81o8gt56vywmFK74
         +YhVlcJOsRHwUdp5uSxRsn58f+/izKWa78Or22cPDcwKGnF1vy1qiEE+L5Y+t85LRtdK
         b8i2Wohrkun655XDLIyht0Px7rr7+Y50PjwDKN9/5OCzUX26EGTgSlmRSXZ7Pais3Uzs
         dxjpxy7wlpmx0LMG97lbsRrrxFx7FCH3Wbc3IHdAOZl1ZUrJ5wvnnwRSSQ7DflhnXNst
         2tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703680811; x=1704285611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmJBf6HuhL5ySnCuZQiOwVxjrIAweRC8ejXOZTZC7jU=;
        b=G06oLDn+CBFSxjOke1XdtCt1soWX+9pvPW53+qUiFVo/1ZyB6qPjYTmhmrGT/LHDK/
         LV4LTXS3ToePxrgOWvSgZ0wa0mbZXWmEmbZwPZYjmEFHwvTbWN+nubR8pjMH2QfKvOCy
         zaq9K3gs6/3o3t9IVx1kR3xpY0VuWWGql75ZLLs7gtpY8wLlBJagX4Amhs1ktOFINg4W
         9Rplix6I6XeENQ7omXsRybadL83xg7f15AMuv4CfddnJaypihcfOk/ZdyfhaIi4IHYFV
         J2dddUfN37OxLWqiVUlaJjPsPkzkn1kpxjaoHB4b9WsKkxuweeI8JzrfJ9PrzisrLkyn
         1T5w==
X-Gm-Message-State: AOJu0YxhL63SKvkfpEc8DE84uQHA4hOpUcfYH9zHL8/m1ZPlQB4Vzhfi
	WKPS2csik9vdjQWaTst8kYsbyW57yBiyY3rE8TA=
X-Google-Smtp-Source: AGHT+IF/tImUQf2MB2n1ICGCAnRL7P7Q2qE2WcsxNAdUQBnAKBzfJGDtwRRqC9qbclLvuqyTU6xfatw5kyGwXRYPv1s=
X-Received: by 2002:a05:6512:2204:b0:50e:7e15:a935 with SMTP id
 h4-20020a056512220400b0050e7e15a935mr1644165lfu.47.1703680810692; Wed, 27 Dec
 2023 04:40:10 -0800 (PST)
MIME-Version: 1.0
References: <80fad6f6fdc85ee3b2ad7ab81f1f4c574c42b53c.1703679576.git.joerg.sommer@navimatix.de>
In-Reply-To: <80fad6f6fdc85ee3b2ad7ab81f1f4c574c42b53c.1703679576.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Dec 2023 14:39:59 +0200
Message-ID: <CANNYZj8MpYUkXd1NoWoD84G6NuDb_4ywCKgOY4Ja9DmLRGzakQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] i2cdev: New recipe with i2c tools
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000883353060d7d19d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 12:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192941

--000000000000883353060d7d19d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn=E2=80=99t seem core enough, perhaps meta-oe is a better home for=
 the
recipe?

Alex

On Wed 27. Dec 2023 at 14.20, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The main part is the tool lsi2c to scan the i2c bus, like lspci and lsusb
> do.
>
> This recipe also ships a static library *libi2cdev.a*. Because this libra=
ry
> contains the file *smbus.c* which is *GPL v2+,* and a static library can'=
t
> be linked dynamically to satisfy the LGPL, the whole recipe is marked
> as *GPL-2.0-or-later.*
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../i2cdev/i2cdev/fix-lsi2c-makefile.patch    | 28 +++++++++++++++++++
>  meta/recipes-bsp/i2cdev/i2cdev_git.bb         | 26 +++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.pat=
ch
>  create mode 100644 meta/recipes-bsp/i2cdev/i2cdev_git.bb
>
> diff --git a/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
> b/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
> new file mode 100644
> index 0000000000..4df7527205
> --- /dev/null
> +++ b/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
> @@ -0,0 +1,28 @@
> +From 57c09727220e00ab961325a2c85f5611bd1770d6 Mon Sep 17 00:00:00 2001
> +Message-Id: <
> 57c09727220e00ab961325a2c85f5611bd1770d6.1701984646.git.joerg.sommer@navi=
matix.de
> >
> +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.d=
e>
> +Date: Thu, 7 Dec 2023 22:29:40 +0100
> +Subject: [PATCH] lsi2c/Makefile: Use builddir to refer to libi2cdev.a
> +
> +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Upstream-Status: Submitted
> https://github.com/costad2/i2cdev/pull/2/commits/43f15e97d869797dbfeaacaf=
a13216aaaf353426
> +---
> + lsi2c/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lsi2c/Makefile.am b/lsi2c/Makefile.am
> +index 6defc1f..0d81d01 100644
> +--- a/lsi2c/Makefile.am
> ++++ b/lsi2c/Makefile.am
> +@@ -14,7 +14,7 @@ bin_PROGRAMS=3Dlsi2c
> + lsi2c_SOURCES =3D lsi2c.c
> +
> + # Linker options for lsi2c
> +-lsi2c_LDADD =3D $(top_srcdir)/libi2cdev/libi2cdev.a
> ++lsi2c_LDADD =3D $(top_builddir)/libi2cdev/libi2cdev.a
> +
> + # Compiler options for lsi2c
> + lsi2c_CFLAGS =3D -I$(top_srcdir)/include -std=3Dc99 -fPIC
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/i2cdev/i2cdev_git.bb
> b/meta/recipes-bsp/i2cdev/i2cdev_git.bb
> new file mode 100644
> index 0000000000..b1f8a7f805
> --- /dev/null
> +++ b/meta/recipes-bsp/i2cdev/i2cdev_git.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "i2c dev tools for Linux"
> +DESCRIPTION =3D "\
> +    This package contains an I2C dev library and the i2c bus scanning \
> +    utility lsi2c. \
> +"
> +AUTHOR =3D "Danielle Costantino"
> +HOMEPAGE =3D "https://github.com/costad2/i2cdev"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "\
> +    file://COPYING;md5=3D768997ba510a952bef1775c50bc22b00 \
> +
> file://include/libi2cdev.h;beginline=3D12;endline=3D25;md5=3D72486a5e192d=
6ac5c7e55a4a95e380a6
> \
> +
> file://libi2cdev/smbus.c;beginline=3D9;endline=3D22;md5=3Dd9a0de5a611b960=
fa75912ded6c60096
> \
> +
> file://lsi2c/lsi2c.c;beginline=3D11;endline=3D24;md5=3D72486a5e192d6ac5c7=
e55a4a95e380a6
> \
> +"
> +
> +PR =3D "git${SRCPV}"
> +
> +SRC_URI =3D "\
> +    git://github.com/costad2/i2cdev.git;protocol=3Dhttps;branch=3Dmaster=
 \
> +    file://fix-lsi2c-makefile.patch \
> +"
> +SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192939):
> https://lists.openembedded.org/g/openembedded-core/message/192939
> Mute This Topic: https://lists.openembedded.org/mt/103383581/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000883353060d7d19d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This doesn=E2=80=99t seem core enough, perhaps meta-oe is=
 a better home for the recipe?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed 27. Dec 2023 at 14.20, J=C3=B6rg Sommer via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.som=
mer=3D<a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: J=C3=
=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de" target=3D"_bl=
ank">joerg.sommer@navimatix.de</a>&gt;<br>
<br>
The main part is the tool lsi2c to scan the i2c bus, like lspci and lsusb<b=
r>
do.<br>
<br>
This recipe also ships a static library *libi2cdev.a*. Because this library=
<br>
contains the file *smbus.c* which is *GPL=C2=A0v2+,* and a static library c=
an&#39;t<br>
be linked dynamically to satisfy the LGPL, the whole recipe is marked<br>
as *GPL-2.0-or-later.*<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0.../i2cdev/i2cdev/fix-lsi2c-makefile.patch=C2=A0 =C2=A0 | 28 ++++++++=
+++++++++++<br>
=C2=A0meta/recipes-bsp/i2cdev/<a href=3D"http://i2cdev_git.bb" rel=3D"noref=
errer" target=3D"_blank">i2cdev_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 26 +++++++++++++++++<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.=
patch<br>
=C2=A0create mode 100644 meta/recipes-bsp/i2cdev/<a href=3D"http://i2cdev_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">i2cdev_git.bb</a><br>
<br>
diff --git a/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch b/meta=
/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch<br>
new file mode 100644<br>
index 0000000000..4df7527205<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch<br>
@@ -0,0 +1,28 @@<br>
+From 57c09727220e00ab961325a2c85f5611bd1770d6 Mon Sep 17 00:00:00 2001<br>
+Message-Id: &lt;<a href=3D"mailto:57c09727220e00ab961325a2c85f5611bd1770d6=
.1701984646.git.joerg.sommer@navimatix.de" target=3D"_blank">57c09727220e00=
ab961325a2c85f5611bd1770d6.1701984646.git.joerg.sommer@navimatix.de</a>&gt;=
<br>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D &lt;<a href=3D"mailto:joerg=
.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<b=
r>
+Date: Thu, 7 Dec 2023 22:29:40 +0100<br>
+Subject: [PATCH] lsi2c/Makefile: Use builddir to refer to libi2cdev.a<br>
+<br>
+Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimat=
ix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
+Upstream-Status: Submitted <a href=3D"https://github.com/costad2/i2cdev/pu=
ll/2/commits/43f15e97d869797dbfeaacafa13216aaaf353426" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/costad2/i2cdev/pull/2/commits/43f15e97d=
869797dbfeaacafa13216aaaf353426</a><br>
+---<br>
+ lsi2c/Makefile.am | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/lsi2c/Makefile.am b/lsi2c/Makefile.am<br>
+index 6defc1f..0d81d01 100644<br>
+--- a/lsi2c/Makefile.am<br>
++++ b/lsi2c/Makefile.am<br>
+@@ -14,7 +14,7 @@ bin_PROGRAMS=3Dlsi2c<br>
+ lsi2c_SOURCES =3D lsi2c.c<br>
+ <br>
+ # Linker options for lsi2c<br>
+-lsi2c_LDADD =3D $(top_srcdir)/libi2cdev/libi2cdev.a<br>
++lsi2c_LDADD =3D $(top_builddir)/libi2cdev/libi2cdev.a<br>
+ <br>
+ # Compiler options for lsi2c<br>
+ lsi2c_CFLAGS =3D -I$(top_srcdir)/include -std=3Dc99 -fPIC<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-bsp/i2cdev/<a href=3D"http://i2cdev_git.bb" rel=
=3D"noreferrer" target=3D"_blank">i2cdev_git.bb</a> b/meta/recipes-bsp/i2cd=
ev/<a href=3D"http://i2cdev_git.bb" rel=3D"noreferrer" target=3D"_blank">i2=
cdev_git.bb</a><br>
new file mode 100644<br>
index 0000000000..b1f8a7f805<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/i2cdev/<a href=3D"http://i2cdev_git.bb" rel=3D"noref=
errer" target=3D"_blank">i2cdev_git.bb</a><br>
@@ -0,0 +1,26 @@<br>
+SUMMARY =3D &quot;i2c dev tools for Linux&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 This package contains an I2C dev library and the i2c bus sca=
nning \<br>
+=C2=A0 =C2=A0 utility lsi2c. \<br>
+&quot;<br>
+AUTHOR =3D &quot;Danielle Costantino&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/costad2/i2cdev" rel=3D"no=
referrer" target=3D"_blank">https://github.com/costad2/i2cdev</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://COPYING;md5=3D768997ba510a952bef1775c50bc22b00 \<br>
+=C2=A0 =C2=A0 file://include/libi2cdev.h;beginline=3D12;endline=3D25;md5=
=3D72486a5e192d6ac5c7e55a4a95e380a6 \<br>
+=C2=A0 =C2=A0 file://libi2cdev/smbus.c;beginline=3D9;endline=3D22;md5=3Dd9=
a0de5a611b960fa75912ded6c60096 \<br>
+=C2=A0 =C2=A0 file://lsi2c/lsi2c.c;beginline=3D11;endline=3D24;md5=3D72486=
a5e192d6ac5c7e55a4a95e380a6 \<br>
+&quot;<br>
+<br>
+PR =3D &quot;git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/costad2/i2cdev.git;protoc=
ol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com=
/costad2/i2cdev.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 file://fix-lsi2c-makefile.patch \<br>
+&quot;<br>
+SRCREV =3D &quot;ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192939): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192939" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192939</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103383581/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103383581/1686489</a><br>
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

--000000000000883353060d7d19d6--

