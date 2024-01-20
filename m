Return-Path: <vishal.bhoj@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AC2C47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 06:54:04 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.16900.1705733638121718409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 22:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xASXNhAQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.173, mailfrom: vishal.bhoj@linaro.org)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbbc6e51d0so843739b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 22:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705733637; x=1706338437; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WTGJnPWNClmJJnkq4oil7tVBISzzEhWOqVVUwuo9NYk=;
        b=xASXNhAQgXt/Xa7egFAwrY8r6eRu6B/eDwORR/hmXT4Bur6DNl0/fSFsd/Lwq3koAN
         beBOs+gZYnrE8cTvfS+FKwPTU8mVTtbU+U9w7CNdb1czjYsj5Ww5YnWo6/ElidbfcO1P
         p9agFKSb7bpSKE0WmpBRniucYqNS/di8XgViutTr/jmRmkqIZDwR2TmY9s6o+cZcYztT
         iPCWrn2kwd8pSktXXzkRCzphVNsNzRrTPu5zoFuDtW8BvxMBxBAG2+5q9OKuay5H1/55
         147R/4zaVi1Pbz++wICS0NaFKttSI86LQ9lEA+dkR02fJAB4sD7IIw6APwQToiqiapeu
         K0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705733637; x=1706338437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTGJnPWNClmJJnkq4oil7tVBISzzEhWOqVVUwuo9NYk=;
        b=wTwwzT1YdDp1PKa/cIjSx9PjwNde2tTYgobdEPbUA4mSS7Utk+3vsBq9KLWwh13R+U
         wKJvIKbwIlVItVnBo3EwXaWTTF414NVkVEmlmfvNH3wjja8C4xBOvhZHC0nFvTjt+sK5
         FtxLY63Hs5kOXwB0Q894T6y5ViFnOxVKt6H0F9LFR/kY3SIe1bbdE7WA/nMF8J9GnE8q
         4WLz/lV5XsIPYYtYEGLCuyCBGcy8C8doINBqdq4hgHdPZc20neobst4i4Y2iXIVykqQ/
         y8M8qkG9a6BUAFIheHi0ZBS8Y/56Vl8z2MAWs0GmwgFeynl7UW8CwnPSHJcPMK3eGYUC
         Z3/w==
X-Gm-Message-State: AOJu0YwXErM2DqdndqBYKduZEBlQum2w7oxVM3hwi0vAD51AcfSpTu6I
	xOMavSfNdQnPBG5X9A05oV0QfcAV+K5CUw7stqMcpziaCJj596sdY4nY5UAiBJg+TNghNxM/QJX
	Ptb5kef//GABso1vkLA8HPm5KlyAnPkfvAKC32g==
X-Google-Smtp-Source: AGHT+IEK+fObvG645PbzNOYTteu/UKj4lz+yJUN+KOZnE9wmaATE2ilwx6okZX/faonUXdv5Y9F/nvuEYtoASSfheiI=
X-Received: by 2002:a05:6808:4286:b0:3bd:a967:631c with SMTP id
 dq6-20020a056808428600b003bda967631cmr961801oib.68.1705733637181; Fri, 19 Jan
 2024 22:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20240119124323.3823059-1-alex@linutronix.de>
In-Reply-To: <20240119124323.3823059-1-alex@linutronix.de>
From: Vishal Bhoj <vishal.bhoj@linaro.org>
Date: Sat, 20 Jan 2024 12:23:46 +0530
Message-ID: <CAKdWgSwM6p9Z4ePHpx=9zsVhvLKODhGrRn7XivfzHoVm8d+szw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: replace static linking with dynamic
 libraries in a custom location and bundled with shadow
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000086a9c0060f5b0f73"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 06:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194080

--00000000000086a9c0060f5b0f73
Content-Type: text/plain; charset="UTF-8"

I can confirm that this patch fixes the problem reported here:
https://lists.openembedded.org/g/openembedded-core/message/193907

We tried it on three sets of 8 builds, and all of them passed successfully:
https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects/vishal/plans/2bBF73bS9lx2GFzroGyjf8NmGMx
https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects/vishal/plans/2bChSfD6NDgyJWFfXxMQnpk3hjh
https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects/vishal/plans/2bCru4v7ocE8yHgmh9GMdb0jDmr


On Fri, 19 Jan 2024 at 18:13, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Despite our efforts to make static linking work, there have
> been new reports of bizarre build failures:
> https://lists.openembedded.org/g/openembedded-core/message/194006
> https://lists.openembedded.org/g/openembedded-core/message/193907
>
> This commit changes back to dynamic linking, but places
> the libraries in a custom location, per RP's suggestion.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/no-static-libs.inc |  5 -----
>  meta/recipes-extended/shadow/shadow.inc     | 24 ++++++++++++---------
>  2 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc
> b/meta/conf/distro/include/no-static-libs.inc
> index 8898d53d756..75359928a14 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -21,11 +21,6 @@ DISABLE_STATIC:pn-libusb1-native = ""
>  # needed by rust
>  DISABLE_STATIC:pn-musl = ""
>
> -# needed by shadow-native to build static executables, particularly
> useradd
> -DISABLE_STATIC:pn-attr-native = ""
> -DISABLE_STATIC:pn-libbsd-native = ""
> -DISABLE_STATIC:pn-libmd-native = ""
> -
>  EXTRA_OECONF:append = "${DISABLE_STATIC}"
>
>  EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 43f456251a5..b8e5e285c45 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -47,16 +47,6 @@ EXTRA_OECONF += "--without-libcrack \
>
>  CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
>
> -# Force static linking of utilities so we can use from the sysroot/sstate
> for useradd
> -# without worrying about the dependency libraries being available
> -LDFLAGS:append:class-native = " -no-pie"
> -do_compile:prepend:class-native () {
> -       sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a
> ${STAGING_LIBDIR}/libmd.a#g' \
> -              -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a
> ${STAGING_LIBDIR}/libmd.a#g' \
> -              -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g'
> \
> -               ${B}/lib/Makefile ${B}/src/Makefile
> -}
> -
>  NSCDOPT = ""
>  NSCDOPT:class-native = "--without-nscd"
>  NSCDOPT:class-nativesdk = "--without-nscd"
> @@ -161,6 +151,20 @@ do_install:append() {
>         touch ${D}${sysconfdir}/subgid
>  }
>
> +# Make executables look for dynamically linked libraries in a custom
> location, and install
> +# the needed libraries there. That way we can use them from sstate
> +# in setscene tasks without worrying about the dependency libraries being
> available.
> +do_install:append:class-native() {
> +        binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/
> ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
> +        chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
> +        mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +        install ${STAGING_LIBDIR_NATIVE}/libattr.so.*
> ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.*
> ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +        install ${D}${libdir}/*.so.*
> ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +}
> +
> +SYSROOT_DIRS:append:class-native = "
> ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
> +INSANE_SKIP:${PN}:class-native = "already-stripped"
> +
>  PACKAGES =+ "${PN}-base"
>  FILES:${PN}-base = "\
>      ${base_bindir}/login.shadow \
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194041):
> https://lists.openembedded.org/g/openembedded-core/message/194041
> Mute This Topic: https://lists.openembedded.org/mt/103828721/3616781
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vishal.bhoj@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 

*Vishal Bhoj*

Tech Lead  - Microservices CI Team

Mob: +91 9886656306

--00000000000086a9c0060f5b0f73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm that this patch fixes the problem reported h=
ere:<div><a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/193907" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/193907</a><br></div><div><br></div><div>We=
 tried it on three sets of 8 builds, and all of them passed successfully:</=
div><div><a href=3D"https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects=
/vishal/plans/2bBF73bS9lx2GFzroGyjf8NmGMx" target=3D"_blank">https://tuxapi=
.tuxsuite.com/v1/groups/tuxsuite/projects/vishal/plans/2bBF73bS9lx2GFzroGyj=
f8NmGMx</a><br></div><div><a href=3D"https://tuxapi.tuxsuite.com/v1/groups/=
tuxsuite/projects/vishal/plans/2bChSfD6NDgyJWFfXxMQnpk3hjh" target=3D"_blan=
k">https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects/vishal/plans/2bC=
hSfD6NDgyJWFfXxMQnpk3hjh</a><br></div><div><a href=3D"https://tuxapi.tuxsui=
te.com/v1/groups/tuxsuite/projects/vishal/plans/2bCru4v7ocE8yHgmh9GMdb0jDmr=
" target=3D"_blank">https://tuxapi.tuxsuite.com/v1/groups/tuxsuite/projects=
/vishal/plans/2bCru4v7ocE8yHgmh9GMdb0jDmr</a><br></div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, 19 Jan 2024 at 18:13, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Despite our efforts t=
o make static linking work, there have<br>
been new reports of bizarre build failures:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19400=
6" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/194006</a><br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19390=
7" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/193907</a><br>
<br>
This commit changes back to dynamic linking, but places<br>
the libraries in a custom location, per RP&#39;s suggestion.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/no-static-libs.inc |=C2=A0 5 -----<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0| 24 +++++=
+++++++---------<br>
=C2=A02 files changed, 14 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro=
/include/no-static-libs.inc<br>
index 8898d53d756..75359928a14 100644<br>
--- a/meta/conf/distro/include/no-static-libs.inc<br>
+++ b/meta/conf/distro/include/no-static-libs.inc<br>
@@ -21,11 +21,6 @@ DISABLE_STATIC:pn-libusb1-native =3D &quot;&quot;<br>
=C2=A0# needed by rust<br>
=C2=A0DISABLE_STATIC:pn-musl =3D &quot;&quot;<br>
<br>
-# needed by shadow-native to build static executables, particularly userad=
d<br>
-DISABLE_STATIC:pn-attr-native =3D &quot;&quot;<br>
-DISABLE_STATIC:pn-libbsd-native =3D &quot;&quot;<br>
-DISABLE_STATIC:pn-libmd-native =3D &quot;&quot;<br>
-<br>
=C2=A0EXTRA_OECONF:append =3D &quot;${DISABLE_STATIC}&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE:append:pn-libical =3D &quot; -DSHARED_ONLY=3DTrue&quot;=
<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index 43f456251a5..b8e5e285c45 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -47,16 +47,6 @@ EXTRA_OECONF +=3D &quot;--without-libcrack \<br>
<br>
=C2=A0CFLAGS:append:libc-musl =3D &quot; -DLIBBSD_OVERLAY&quot;<br>
<br>
-# Force static linking of utilities so we can use from the sysroot/sstate =
for useradd<br>
-# without worrying about the dependency libraries being available<br>
-LDFLAGS:append:class-native =3D &quot; -no-pie&quot;<br>
-do_compile:prepend:class-native () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s#\(LIBS.*\)-lbsd#\1 ${STAGING_L=
IBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s#\(LIBBSD.*\)-lb=
sd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s#\(LIBATTR.*\)-l=
attr#\1 ${STAGING_LIBDIR}/libattr.a#g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/lib/Makefile $=
{B}/src/Makefile<br>
-}<br>
-<br>
=C2=A0NSCDOPT =3D &quot;&quot;<br>
=C2=A0NSCDOPT:class-native =3D &quot;--without-nscd&quot;<br>
=C2=A0NSCDOPT:class-nativesdk =3D &quot;--without-nscd&quot;<br>
@@ -161,6 +151,20 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${D}${sysconfdir}/subgid<br>
=C2=A0}<br>
<br>
+# Make executables look for dynamically linked libraries in a custom locat=
ion, and install<br>
+# the needed libraries there. That way we can use them from sstate<br>
+# in setscene tasks without worrying about the dependency libraries being =
available.<br>
+do_install:append:class-native() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 binaries=3D$(find ${D}${base_bindir}/ ${D}${ba=
se_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow=
-deps $binaries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-=
deps/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${STAGING_LIBDIR_NATIVE}/libattr.so.* =
${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${=
D}${STAGING_DIR_NATIVE}/lib-shadow-deps/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${D}${libdir}/*.so.* ${D}${STAGING_DIR=
_NATIVE}/lib-shadow-deps/<br>
+}<br>
+<br>
+SYSROOT_DIRS:append:class-native =3D &quot; ${STAGING_DIR_NATIVE}/lib-shad=
ow-deps/&quot;<br>
+INSANE_SKIP:${PN}:class-native =3D &quot;already-stripped&quot;<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-base&quot;<br>
=C2=A0FILES:${PN}-base =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${base_bindir}/login.shadow \<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194041): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194041" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194041</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103828721/361=
6781" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103828721/3616781</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vishal.bhoj@linaro.org" ta=
rget=3D"_blank">vishal.bhoj@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><p class=3D"MsoNormal" style=3D"color:rgb(34,34,34)"><span s=
tyle=3D"color:rgb(7,55,99)"><b>Vishal Bhoj</b></span></p><p class=3D"MsoNor=
mal" style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(7,55,99)">Tech =
Lead=C2=A0 - Microservices CI Team</span><u></u></p><p class=3D"MsoNormal" =
style=3D"color:rgb(34,34,34)"><span style=3D"color:rgb(7,55,99)">Mob: +91 9=
886656306</span><u></u><u></u></p><p class=3D"MsoNormal" style=3D"color:rgb=
(34,34,34)"><img border=3D"0" width=3D"96" height=3D"55" src=3D"https://ci3=
.googleusercontent.com/mail-sig/AIorK4zjoFHznbwbgTzFgZgjhFW2yFF2qPduhbrUv4W=
5g-_8YJN2N4hZnpKJptas_3ax0WKvQJyUwJU" style=3D"width: 1in; height: 0.5729in=
;"><br></p></div></div>

--00000000000086a9c0060f5b0f73--

