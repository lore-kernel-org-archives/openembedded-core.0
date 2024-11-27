Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8509D609AC
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 07:46:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.67118.1732693582373002547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 23:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K3iChoQp;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3823e45339bso4645476f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732693580; x=1733298380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+aOxZg7YVHdfvalXyCa7DAh2R1QfcA0rBIig41h0S8=;
        b=K3iChoQp3V02JzmlqkVBHE/FSEA87qvuZ8BuI7vbW0gnl7NGyCH52BauIvvHyHFFgx
         QC8VCDX2CCrAzxBniXgfyVbGKOOHOxJyg6lugrdR9D6j8hXIKTEWRYAcKo1Ciq7rztt/
         oTgKmg+zepEHVnAiEjMhdmk3XanwETVlug4fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732693580; x=1733298380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+aOxZg7YVHdfvalXyCa7DAh2R1QfcA0rBIig41h0S8=;
        b=o2qTRU4f5bHqttOVNetKGfPtcThNb2je3ZOrxwGB2JQ4jVgyWZa21bRnB1XPVh/J1H
         E0Z6a5PmFZnKxwBbp9wyI1Rf0MODKwmtOfmx6B3O/bd6SzywEPorMZCgvEDMXVwvLzgB
         NZPvUGoAs8YuvVu9ZQcIDWT5nitonfbVQVy2Y4dApOowHGges6wuE8gv0LAny5CIMMtT
         i3n59jSaqs4gYkqpFGTw4KuxRNYYZnujNtGtRt2fpYZPKcd8Req0hx1sSpZ78XPitreR
         yFIx1JpIavipawIqxuZx0Tkps7URE1aKkO8lAJqDK7QDEz+YzG+beU/NantgO9r0445D
         6ydw==
X-Gm-Message-State: AOJu0YxpF4qgIZ6E2mVA9q6tdmLDZbtqnF1DvWZFkI9FctHLph2dEoZc
	KFAcjWvLsuxs5OLUyqolnixn4ei5kTMDZlSnZRf40vftqm3b7HYJsoFZTSeQMlIexvXiarGbubM
	m7jzkhvuhhNeULF6RKO1J7MhtvaoZ1S/Gqwz1dg==
X-Gm-Gg: ASbGncvsgaAM8kuZuF5l5Yog8owOqgvo9odxG30bcha0Fe2pCDY9eZhQkM/aE2k7LbV
	DcY0TTasSPF5YjO0DVhW0zaywourtius=
X-Google-Smtp-Source: AGHT+IE4u7vrJl0jE2paBxfp7E6i+epTDhUYAjwtOGTsJQYhg2tz27hsrelUGaLjirUBqXKF9rCobQlb9duvaOQ9m8M=
X-Received: by 2002:a5d:6d8e:0:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-385c6eb8006mr1440241f8f.5.1732693580473; Tue, 26 Nov 2024
 23:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20241127005121.683644-1-raj.khem@gmail.com>
In-Reply-To: <20241127005121.683644-1-raj.khem@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 27 Nov 2024 08:45:54 +0100
Message-ID: <CAMSfU+42DViLBPptm29kVLHiyAYGmubiexek1YgTmg+4CScrTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] seatd: Create seat user and package systemd service
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e8d420627e0293f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 07:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207916

--0000000000005e8d420627e0293f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mer. 27 nov. 2024 =C3=A0 01:51, Khem Raj via lists.openembedded.org <raj=
.khem=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :

> With latest version seatd does not work properly if
> user access permissions are not correctly set, therefore
> create 'seat' group and package the seatd.service file
> and enable it by default with systemd distro feature
>
> set logind to systemd when using systemd as default init system
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/seatd/seatd_0.9.1.bb | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb
> b/meta/recipes-core/seatd/seatd_0.9.1.bb
> index 8da57acc567..8ee43a3dc8f 100644
> --- a/meta/recipes-core/seatd/seatd_0.9.1.bb
> +++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster \
>  SRCREV =3D "566ffeb032af42865dc1210e48cec08368059bb9"
>  S =3D "${WORKDIR}/git"
>
> -inherit meson pkgconfig update-rc.d
> +inherit meson pkgconfig systemd update-rc.d useradd
>
>  # https://www.openwall.com/lists/musl/2020/01/20/3
>  CFLAGS:append:libc-musl:powerpc64le =3D " -Wno-error=3Doverflow"
> @@ -22,14 +22,21 @@ PACKAGECONFIG ?=3D " \
>  "
>
>  PACKAGECONFIG[libseat-builtin] =3D
> "-Dlibseat-builtin=3Denabled,-Dlibseat-builtin=3Ddisabled"
> -PACKAGECONFIG[systemd] =3D ",,systemd"
> +PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,,systemd"
>
>  do_install:append() {
>          if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
>                  install -Dm755 ${UNPACKDIR}/init
> ${D}/${sysconfdir}/init.d/seatd
> +        else
> +                install -Dm644 ${S}/contrib/systemd/seatd.service
> ${D}${systemd_unitdir}/system/seatd.service
>          fi
>  }
>
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM:${PN} =3D "-r seat"
>

This new group needs to be added to the static id list
(meta-selftest/files/static-group ?) or will break the reproducibility
tests.
The reproducibility test builds with:
  USERADDEXTENSION =3D "useradd-staticids"
  USERADD_ERROR_DYNAMIC =3D "skip"

Then, with this patch, I get this error:
  ERROR: Nothing PROVIDES 'seatd'
  seatd was skipped: Recipe seatd, package seatd: system groupname "seat"
does not have a static ID defined. USERADD_GID_TABLES file(s) not found in
BBPATH: files/group



> +
>  INITSCRIPT_NAME =3D "seatd"
>  INITSCRIPT_PARAMS =3D "start 9 5 2 . stop 20 0 1 6 ."
>  INHIBIT_UPDATERCD_BBCLASS =3D
> "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1',
> '', d)}"
> +
> +SYSTEMD_SERVICE:${PN} =3D "seatd.service"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207890):
> https://lists.openembedded.org/g/openembedded-core/message/207890
> Mute This Topic: https://lists.openembedded.org/mt/109799901/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000005e8d420627e0293f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 nov. 2024 =C3=A0=C2=A001:51=
, Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">With latest version seatd doe=
s not work properly if<br>
user access permissions are not correctly set, therefore<br>
create &#39;seat&#39; group and package the seatd.service file<br>
and enable it by default with systemd distro feature<br>
<br>
set logind to systemd when using systemd as default init system<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/seatd/<a href=3D"http://seatd_0.9.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">seatd_0.9.1.bb</a> | 11 +++++++++--<br>
=C2=A01 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/seatd/<a href=3D"http://seatd_0.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">seatd_0.9.1.bb</a> b/meta/recipes-core/se=
atd/<a href=3D"http://seatd_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">=
seatd_0.9.1.bb</a><br>
index 8da57acc567..8ee43a3dc8f 100644<br>
--- a/meta/recipes-core/seatd/<a href=3D"http://seatd_0.9.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">seatd_0.9.1.bb</a><br>
+++ b/meta/recipes-core/seatd/<a href=3D"http://seatd_0.9.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">seatd_0.9.1.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.sr.ht/~kenn=
ylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster=
</a> \<br>
=C2=A0SRCREV =3D &quot;566ffeb032af42865dc1210e48cec08368059bb9&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit meson pkgconfig update-rc.d<br>
+inherit meson pkgconfig systemd update-rc.d useradd<br>
<br>
=C2=A0# <a href=3D"https://www.openwall.com/lists/musl/2020/01/20/3" rel=3D=
"noreferrer" target=3D"_blank">https://www.openwall.com/lists/musl/2020/01/=
20/3</a><br>
=C2=A0CFLAGS:append:libc-musl:powerpc64le =3D &quot; -Wno-error=3Doverflow&=
quot;<br>
@@ -22,14 +22,21 @@ PACKAGECONFIG ?=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG[libseat-builtin] =3D &quot;-Dlibseat-builtin=3Denabled,=
-Dlibseat-builtin=3Ddisabled&quot;<br>
-PACKAGECONFIG[systemd] =3D &quot;,,systemd&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dlibseat-logind=3Dsystemd,,systemd&quot;=
<br>
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VIRTUAL-RUNTIME_init_manager=
}&quot; !=3D &quot;systemd&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm75=
5 ${UNPACKDIR}/init ${D}/${sysconfdir}/init.d/seatd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm644 ${S=
}/contrib/systemd/seatd.service ${D}${systemd_unitdir}/system/seatd.service=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+GROUPADD_PARAM:${PN} =3D &quot;-r seat&quot;<br></blockquote><div><br></di=
v><div>This new group needs to be added to the static id list (meta-selftes=
t/files/static-group ?) or will break the reproducibility tests.</div><div>=
The reproducibility test builds with:</div><div>=C2=A0 USERADDEXTENSION =3D=
 &quot;useradd-staticids&quot;<br>=C2=A0 USERADD_ERROR_DYNAMIC =3D &quot;sk=
ip&quot;</div><div><br></div><div>Then, with this patch, I get this error:<=
/div><div>=C2=A0 ERROR: Nothing PROVIDES &#39;seatd&#39;<br>=C2=A0 seatd wa=
s skipped: Recipe seatd, package seatd: system groupname &quot;seat&quot; d=
oes not have a static ID defined. USERADD_GID_TABLES file(s) not found in B=
BPATH: files/group<br></div><div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0INITSCRIPT_NAME =3D &quot;seatd&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 9 5 2 . stop 20 0 1 6 .&quot;<br>
=C2=A0INHIBIT_UPDATERCD_BBCLASS =3D &quot;${@oe.utils.conditional(&#39;VIRT=
UAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;1&#39;, &#39;&#39;, =
d)}&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;seatd.service&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207890" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109799901/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109799901/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000005e8d420627e0293f--

