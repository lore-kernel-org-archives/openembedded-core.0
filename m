Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A92C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 11:55:50 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.99860.1703678147930423112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 03:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcmsoS9K;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e766937ddso2585858e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703678146; x=1704282946; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TssdfAV3vZS6JZGbefL0P91RUHlFR3SkNOuG4kpcZ9k=;
        b=KcmsoS9KP8vnhIqGQTzEyLZCnKXQCKxlE5DOknim0Qd9a/sVQGCc5PA77sgvO5fX+9
         OrrXyIC8OdP2eJiOhavHsDYjZG9OmWaBo/w+4fJAjOXu+K8F4QB4oIzZ6Y0m3WOTpTlW
         lzC/IJ2K+rfjAeTSRn65Zen+faUt/Wzpi57C5X3kOin49BE3Qui8P7m/kANWIlQMYVVL
         oueI532r0y78CBOYV41E883feloeNQAmO/XwpC9P6P67cGywvFNhApruFMr47igBW5XJ
         FJ5MLUcfb3oLo7fJe5eEGYwArK8v2b59cVRT1BZI0ziWSO2yRHV290gpOIQuTqhLAAAw
         mLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703678146; x=1704282946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TssdfAV3vZS6JZGbefL0P91RUHlFR3SkNOuG4kpcZ9k=;
        b=dlX3hYgzEVc+oNjFpnzBrw+ePeyOCR3saJshVUljxaPVpj/MganDSA4Khup8Cp0cg7
         ROZ+b9ncI4WddSi1upwxe+MMv3/g72VV1Ab9FgmBd2SXA/wy7nqH7PgaO+tUmpINULyO
         jV7/+BXkez/Vs+86VRbY6N5ByPIMsta7gYt2GCLIaAxfKGfStMAfvDpAkG7A/FR7nfV8
         AkNvH6AoJ/YfZTMSVES50DzJmCO7e7s6NZHi76VPBRDrOTf6lAkwoz7BFbU761SS9kfI
         bUSs/cosTOzydMz8bBqlUDj+e2+aQEMvb7UYTAnQxps8eugfr1mRq1CfHhteVrWUBF56
         aSUQ==
X-Gm-Message-State: AOJu0YyX2r9K9r77zFRYoDg3ZHmingTTD+czkrfLwmaoBwGWLyY9jBx1
	t4nWUhxeEyjJpM0zzXc1V500ppoUUCxeAmj5Egw=
X-Google-Smtp-Source: AGHT+IG0wbqB34BI4Kh6ys8q/oIWufV1X/Ryrd2b7wQqY34jgRNOaAL+NVD2j1fKUh3P20nSUrWVVEpb1rr9ev8r8qc=
X-Received: by 2002:ac2:596d:0:b0:50e:75ee:ec41 with SMTP id
 h13-20020ac2596d000000b0050e75eeec41mr1826718lfp.25.1703678145304; Wed, 27
 Dec 2023 03:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20231227093756.734651-1-Qi.Chen@windriver.com>
In-Reply-To: <20231227093756.734651-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Dec 2023 13:55:34 +0200
Message-ID: <CANNYZj8RFTRDyS3+t9WvbrRG9ETM=C1NkEMVo3xBFZZgfcO2cw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] dbus: upgrade to 1.15.8
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a99bbd060d7c7a0c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 11:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192936

--000000000000a99bbd060d7c7a0c
Content-Type: text/plain; charset="UTF-8"

Dbus 1.15.x are pre releases. The recipe specifies that via the class
inherit and corresponding latest version check with devtool. Please run
that first.

Alex

On Wed 27. Dec 2023 at 11.38, Chen Qi via lists.openembedded.org <Qi.Chen=
windriver.com@lists.openembedded.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> License-Update:
> ===============
> The license checksums are changed, but the license remains the same.
> The contents change are only about description changes, e.g., not
> copying the whole licenses and instead telling people to go check them.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../dbus/{dbus_1.14.10.bb => dbus_1.15.8.bb}           | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-core/dbus/{dbus_1.14.10.bb => dbus_1.15.8.bb} (94%)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb
> b/meta/recipes-core/dbus/dbus_1.15.8.bb
> similarity index 94%
> rename from meta/recipes-core/dbus/dbus_1.14.10.bb
> rename to meta/recipes-core/dbus/dbus_1.15.8.bb
> index 2a256beabf..4ff115186c 100644
> --- a/meta/recipes-core/dbus/dbus_1.14.10.bb
> +++ b/meta/recipes-core/dbus/dbus_1.15.8.bb
> @@ -6,8 +6,8 @@ SECTION = "base"
>  inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
>
>  LICENSE = "AFL-2.1 | GPL-2.0-or-later"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
> -
> file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8
> \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb0ffc69a965797a3d6686baa153ef05 \
> +
> file://dbus/dbus.h;beginline=6;endline=22;md5=df4251a6c6e15e6a9e3c77b2ac30065d
> \
>                      "
>
>  SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
> @@ -16,7 +16,7 @@ SRC_URI = "
> https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
>             file://dbus-1.init \
>             "
>
> -SRC_URI[sha256sum] =
> "ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
> +SRC_URI[sha256sum] =
> "84fc597e6ec82f05dc18a7d12c17046f95bad7be99fc03c15bc254c4701ed204"
>
>  EXTRA_OECONF = "--disable-xml-docs \
>                  --disable-doxygen-docs \
> @@ -160,8 +160,8 @@ do_install() {
>         # Remove empty testexec directory as we don't build tests
>         rm -rf ${D}${libdir}/dbus-1.0/test
>
> -       # Remove /var/run as it is created on startup
> -       rm -rf ${D}${localstatedir}/run
> +       # Remove /var/run and /run as it is created on startup
> +       rm -rf ${D}${localstatedir}/run rm -rf ${D}/run
>  }
>
>  do_install:class-native() {
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192933):
> https://lists.openembedded.org/g/openembedded-core/message/192933
> Mute This Topic: https://lists.openembedded.org/mt/103382494/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a99bbd060d7c7a0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Dbus 1.15.x are pre releases. The recipe specifies that v=
ia the class inherit and corresponding latest version check with devtool. P=
lease run that first.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Al=
ex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed 27. Dec 2023 at 11.38, Chen Qi via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:=
windriver.com@lists.openembedded.org">windriver.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">From: Chen Qi &lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br=
>
<br>
License-Update:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The license checksums are changed, but the license remains the same.<br>
The contents change are only about description changes, e.g., not<br>
copying the whole licenses and instead telling people to go check them.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../dbus/{<a href=3D"http://dbus_1.14.10.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dbus_1.14.10.bb</a> =3D&gt; <a href=3D"http://dbus_1.15.8.bb" =
rel=3D"noreferrer" target=3D"_blank">dbus_1.15.8.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta/recipes-core/dbus/{<a href=3D"http://dbus_1.14.10.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_1.14.10.bb</a> =3D&gt; <a href=3D"ht=
tp://dbus_1.15.8.bb" rel=3D"noreferrer" target=3D"_blank">dbus_1.15.8.bb</a=
>} (94%)<br>
<br>
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.14.10.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_1.14.10.bb</a> b/meta/recipes-core/d=
bus/<a href=3D"http://dbus_1.15.8.bb" rel=3D"noreferrer" target=3D"_blank">=
dbus_1.15.8.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-core/dbus/<a href=3D"http://dbus_1.14.10.bb" rel=
=3D"noreferrer" target=3D"_blank">dbus_1.14.10.bb</a><br>
rename to meta/recipes-core/dbus/<a href=3D"http://dbus_1.15.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">dbus_1.15.8.bb</a><br>
index 2a256beabf..4ff115186c 100644<br>
--- a/meta/recipes-core/dbus/<a href=3D"http://dbus_1.14.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">dbus_1.14.10.bb</a><br>
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus_1.15.8.bb" rel=3D"noref=
errer" target=3D"_blank">dbus_1.15.8.bb</a><br>
@@ -6,8 +6,8 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0inherit autotools pkgconfig gettext upstream-version-is-even ptest-gn=
ome<br>
<br>
=C2=A0LICENSE =3D &quot;AFL-2.1 | GPL-2.0-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6423dcd74d7be9715b0db247fd=
889da3 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D866739837ccd835350af94dccd6=
457d8 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Deb0ffc69a965797a3d6686baa1=
53ef05 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://dbus/dbus.h;beginline=3D6;endline=3D22;md5=3Ddf4251a6c6e15e6a9e3c77b2ac3=
0065d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dbus.freedesktop.org/releases/db=
us/dbus-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://dbus=
.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz</a> \<br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://dbus.freedesktop.org=
/releases/dbus/dbus-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dbus-1.init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73d=
a24f49ab9df1e36a50f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;84fc597e6ec82f05dc18a7d12c17046f95bad7be99fc0=
3c15bc254c4701ed204&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-xml-docs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-dox=
ygen-docs \<br>
@@ -160,8 +160,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty testexec directory as we don&#39=
;t build tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${libdir}/dbus-1.0/test<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run as it is created on startup<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove /var/run and /run as it is created on =
startup<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${localstatedir}/run rm -rf ${D}/run=
<br>
=C2=A0}<br>
<br>
=C2=A0do_install:class-native() {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192933): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192933" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192933</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103382494/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103382494/1686489</a><br>
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

--000000000000a99bbd060d7c7a0c--

