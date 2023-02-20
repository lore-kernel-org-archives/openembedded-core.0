Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA44C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:51:12 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.23706.1676922669818069837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 11:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F98pSmLb;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id f23so1549414vsa.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 11:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1eM/dBRYSoid6pqYugI5dNjW3Cnxurh2Q0ZJ1vFF8=;
        b=F98pSmLbx8wDDUD7nuxYJU0RjuPBJNOBJijZVHwazOhZYoWj4l3fvo6v5XG1tjJgvJ
         VAAheZOBuIsDRsWpoSzTgCwtTPVH74DYizygxCX7qin3Kpsr1my/c65fuYhw0RNPHtIZ
         ELuF1WETxbJPpdYWMkZjDGaSI5bko6kzSn4LTT9oOSO9jVVbVHmr8pqXMyVJ6cHdQjJ3
         hLfi61Gi5rEywKrQYfVg6pYZZUcxZmAs77reUHxXILiZICEh5oP6TenYO+2nYqElmek/
         VTPFM4WjB4H6CQnhuzIbu5xd0b8CS27JgBB7zV5j8EVpZBpSRcitB6/8Le9GAxB1lx8D
         eWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9F1eM/dBRYSoid6pqYugI5dNjW3Cnxurh2Q0ZJ1vFF8=;
        b=G2rxd4DiGyosND5J7O5a+H8FmK1lrIQxrDvlNKR8HLjo3FRv1P1RbexkPDG4SsAuBZ
         ryyUn8Q3Orj8b0yv1vQLTJJru0pCjoROjhkQGc4/DKPBzMLIc5DgmsvGQFN7z1ZSBYe1
         hQhKN/0KTdFdckywuBBsJbMKmozGW43TVowX9ds6d7Tb+86q/6Pll579rboAFGMtfXch
         b8ebuyK7mkFgSYO9X82lUTl1vYkatWHBrozfFHlD9iMriX6yVOeOOEu1k2GTlOow/rwV
         OnWVp9q6F9azroVF+5rUiKdWwakfQabe/D4Gmc7WXBKSgp+U3b3pxSMa+v/JGn1dd/qG
         TSpg==
X-Gm-Message-State: AO0yUKWmuCOkFHl0S+AbVUgt4Vb5rRgEVLRXLK+6nXPDfrFAlxJAk0Ur
	Eupsfmhz/31DLX8fDjBIZmpbXN4xIqKqbj5dSWA=
X-Google-Smtp-Source: AK7set9D69HWZjjEubY8rIYOOM+Fh4NilOOTb7itSWSfkUNI3px5qo51T/DcDVfoPILSpecF6LiDason52km8vGRBe0=
X-Received: by 2002:a67:c48f:0:b0:3f0:be66:8037 with SMTP id
 d15-20020a67c48f000000b003f0be668037mr378582vsk.80.1676922668882; Mon, 20 Feb
 2023 11:51:08 -0800 (PST)
MIME-Version: 1.0
References: <17459935AC7D45FF.17041@lists.openembedded.org>
In-Reply-To: <17459935AC7D45FF.17041@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Feb 2023 19:50:58 +0000
Message-ID: <CANPvuRmnbZyTsFVtR1Dz3UEOftWBrdkmctEa-98063LfbtRUiQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-ti][kirkstone][PATCH] ti-img-rogue-umlibs: drop
 unused patch
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000fe9da805f526fb24"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 19:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177458

--000000000000fe9da805f526fb24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong mailing list! Sorry, please drop this patch

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia segunda, 20/02/2023 =C3=
=A0(s)
17:41:

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...kefile-handle-firmware-with-usrmerge.patch | 32 -------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644
> meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-ha=
ndle-firmware-with-usrmerge.patch
>
> diff --git
> a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> deleted file mode 100644
> index 92c1b362..00000000
> ---
> a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-=
handle-firmware-with-usrmerge.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
> -From: Jose Quaresma <jose.quaresma@foundries.io>
> -Date: Tue, 24 Jan 2023 12:39:30 +0000
> -Subject: [PATCH] Makefile: handle firmware with usrmerge
> -
> -Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ----
> - Makefile | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 48f9b9c..04b4154 100755
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1,4 +1,5 @@
> - DESTDIR ?=3D ${DISCIMAGE}
> -+FWDIR ?=3D lib
> - TARGET_PRODUCT ?=3D j721e_linux
> - BUILD ?=3D release
> - WINDOW_SYSTEM ?=3D nulldrmws
> -@@ -13,7 +14,7 @@ all:
> - install:
> -       mkdir -p ${DESTDIR}/${etcdir}
> -       mkdir -p ${DESTDIR}/${usrdir}
> --      mkdir -p ${DESTDIR}/${fwdir}
> -+      mkdir -p ${DESTDIR}/${FWDIR}
> -       cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
> -       cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
> --      cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
> -+      cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
> ---
> -2.34.1
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177448):
> https://lists.openembedded.org/g/openembedded-core/message/177448
> Mute This Topic: https://lists.openembedded.org/mt/97091203/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fe9da805f526fb24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Wrong mailing list! Sorry=
, please drop this patch</span><div style=3D"color:rgb(0,0,0)"><br></div><d=
iv style=3D"color:rgb(0,0,0)">Jose</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; escreveu no dia segunda, 20/02/2023 =C3=A0(s) 17:41:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Jose Qua=
resma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">j=
ose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0...kefile-handle-firmware-with-usrmerge.patch | 32 ------------------=
-<br>
=C2=A01 file changed, 32 deletions(-)<br>
=C2=A0delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-=
umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch<br>
<br>
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-=
Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-graphics=
/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.pa=
tch<br>
deleted file mode 100644<br>
index 92c1b362..00000000<br>
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefil=
e-handle-firmware-with-usrmerge.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001<br>
-From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" targ=
et=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
-Date: Tue, 24 Jan 2023 12:39:30 +0000<br>
-Subject: [PATCH] Makefile: handle firmware with usrmerge<br>
-<br>
-Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries=
.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
----<br>
- Makefile | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 48f9b9c..04b4154 100755<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -1,4 +1,5 @@<br>
- DESTDIR ?=3D ${DISCIMAGE}<br>
-+FWDIR ?=3D lib<br>
- TARGET_PRODUCT ?=3D j721e_linux<br>
- BUILD ?=3D release<br>
- WINDOW_SYSTEM ?=3D nulldrmws<br>
-@@ -13,7 +14,7 @@ all:<br>
- install:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${DESTDIR}/${etcdir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${DESTDIR}/${usrdir}<br>
--=C2=A0 =C2=A0 =C2=A0 mkdir -p ${DESTDIR}/${fwdir}<br>
-+=C2=A0 =C2=A0 =C2=A0 mkdir -p ${DESTDIR}/${FWDIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdi=
r}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdi=
r}<br>
--=C2=A0 =C2=A0 =C2=A0 cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}<br>
-+=C2=A0 =C2=A0 =C2=A0 cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}<br>
---<br>
-2.34.1<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177448" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97091203/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97091203/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000fe9da805f526fb24--

