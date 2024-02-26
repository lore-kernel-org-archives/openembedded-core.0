Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405D8C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:39:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.21765.1708958372028181645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hj2MqbHS;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d2533089f6so37278461fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958370; x=1709563170; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LFOndlu9A3xUKsgV73+az2uPIEsBxJrp5wTO3Mi9vTc=;
        b=hj2MqbHSrlq+9qa5GUyK60TsjzW5UscDsJT/+j6dZEr3mjp/RQW0ZVLPF8llXvZk3J
         UwKkuTxHxTPTVP4yMxnOSR6FzGsVynhCZj/214+Vdn7z41M4QeOLDdXcu2VWh1edhueJ
         s1/WsH06ZY2ZOZ5OtdLuTa6XldtCIfSrRMGeZeiLIcOY/tNUR+N0yFV2HPKSicla81EL
         rf6Xwq+jTmHEia1awCZz6MCMzYVa/Vg7j9DQwywnUEwTVRPEtr5/6IwRhGZ0yKXZK2cM
         z3lZgBUPc0JNoHXQbYQDUzVQjoDomKIjWG/vqEllbgjvLZDp4XwufOtWWM21LVd07MdA
         tOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958370; x=1709563170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFOndlu9A3xUKsgV73+az2uPIEsBxJrp5wTO3Mi9vTc=;
        b=lXA5/Ysrf3Oi9ouuBPFLjldqy2MZgsxMqYPy9Nn3C8S2K0r/AHTP0LDeEz0wCIvhTp
         l/cvzu0P53mzz4M/WRtsz6Pl1wjddJeO9rdVsogcNWfFwFdtYj48ZPm8Cw8qepQua5Ut
         vr1p9jCtnyVJcu/+WB2bBQFLEcD7H0R+qZeKIpoo05k18+Ca5NbZt9BHp8/T4WEOZx7y
         46+mQmJQBYvlFCDBC/GtLtW+E7SGpilb2ncQLBRGjmgFkTGB6vpYjLUiv7t2zcwzChfS
         omRJ2yyJqwIpT+vJkyATHTz9Kuwu4xRAnbFW4DghBFfC5nEMVq9fr8cEP35NFPRZpgYd
         teOA==
X-Gm-Message-State: AOJu0Yy46VpwqRxkmzGOvOoUyq4Lro8icvBlS2jPBg5dL660b/3BZ6Si
	+tTMYhQaHcPXZLtrW6+67l1SFt0+OtwvlkRsxG5IxRl8CHq/r/zo/cDpqzntD/BWkxu4s+RD88V
	aYYpkbV3g0QdT+k2AkjfyuErI5cQ=
X-Google-Smtp-Source: AGHT+IHgpYzfIdkOs9QrWi//UP3+FoG33I986fi9AygQA01+kMmBt0EfbT/Vv2g3vbIwGXnQCBGvUKH2nlKtEuPewaU=
X-Received: by 2002:a2e:97d3:0:b0:2d2:6788:3183 with SMTP id
 m19-20020a2e97d3000000b002d267883183mr4436264ljj.48.1708958369984; Mon, 26
 Feb 2024 06:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20240226142855.2687016-1-martin.jansa@gmail.com>
In-Reply-To: <20240226142855.2687016-1-martin.jansa@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Feb 2024 15:39:18 +0100
Message-ID: <CANNYZj9M9TGYGvEN0sZOpYYQ1-PVk3gnehR_zh_c9Ue4mEv8hQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] rpm: add PACKAGECONFIG for openmp and
 disable it by default for native builds
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000943428061249e0c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196206

--000000000000943428061249e0c4
Content-Type: text/plain; charset="UTF-8"

This needs to be handled with care. We rely heavily on openmp support in
rpm to speed up rpm operations; adding an option to turn it off is okay,
but actually turning it off is not.


Alex

On Mon 26. Feb 2024 at 15.29, Martin Jansa <martin.jansa@gmail.com> wrote:

> * and keep it enabled in target builds unless libc-musl where it was
>   disabled since upgrade to 4.15.1 in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=67257ca87c6fa8e6050a20ecea50daf834c7e869
>   and disable it for native builds to be able to reuse rpm-native
>   between hosts with libomp and without to avoid do_package failures like:
>   recipe-sysroot-native/usr/lib/rpm/rpmdeps: error while loading shared
> libraries: libgomp.so.1: cannot open shared object file: No such file or
> directory
>
> * and on hosts without libomp it fails in do_configure:
>   | CMake Error at
> /OE/build/tmp-glibc/work/x86_64-linux/rpm-native/4.19.1/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230
> (message):
>   |   Could NOT find OpenMP_C (missing: OpenMP_C_FLAGS OpenMP_C_LIB_NAMES)
>   |   (Required is at least version "4.5")
>
> * I've noticed this in new experimental gentoo profiles which don't
>   enable openmp by default for gcc-13 and newer, see:
>   https://bugs.gentoo.org/890999
>
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=8189b4b48c25dbd7b330b51b53f9023cdbbb29ec
>
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=94d882482714698d6d9b765920cd26bbe849336d
>
>   I'm not sure what other distributions plan with openmp support in future
>   (and this profile is just experimental and the decision not to enable
>   openmp by default might still change), but having the PACKAGECONFIG
>   at least gives easy way to explicitly enable/disable this in bbappend
>
>   openmp is also explicitly disabled in gettext since 2011:
>
> https://git.openembedded.org/openembedded-core/commit/?id=e897103a58ad672cc87d2bab3ec45501ef09f8f1
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.19.1.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> index 1f8611a29c..477e1c2d62 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> @@ -52,7 +52,7 @@ DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils
> python3 sqlite3 zstd"
>  DEPENDS:append:class-native = " file-replacement-native
> bzip2-replacement-native"
>
>  EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
> -EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"
> +EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF"
>
>  # --sysconfdir prevents rpm from attempting to access machine-specific
> configuration in sysroot/etc; we need to have it in rootfs
>  # --localstatedir prevents rpm from writing its database to native
> sysroot when building images
> @@ -64,10 +64,15 @@ OECMAKE_GENERATOR = "Unix Makefiles"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -PACKAGECONFIG ??= "internal-openpgp"
> +PACKAGECONFIG_OPENMP = "openmp"
> +PACKAGECONFIG_OPENMP:libc-musl = ""
> +PACKAGECONFIG_OPENMP:class-native = ""
> +
> +PACKAGECONFIG ??= "internal-openpgp ${PACKAGECONFIG_OPENMP}"
>
>  PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"
>  PACKAGECONFIG[testsuite] = "-DENABLE_TESTSUITE=ON,-DENABLE_TESTSUITE=OFF"
> +PACKAGECONFIG[openmp] = "-DENABLE_OPENMP=ON,-DENABLE_OPENMP=OFF"
>
>  # Deprecated! https://fedoraproject.org/wiki/Changes/RpmSequoia
>  PACKAGECONFIG[internal-openpgp] =
> "-DWITH_INTERNAL_OPENPGP=ON,-DWITH_INTERNAL_OPENPGP=OFF"
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196205):
> https://lists.openembedded.org/g/openembedded-core/message/196205
> Mute This Topic: https://lists.openembedded.org/mt/104582694/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000943428061249e0c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This needs to be handled with care. We rely heavily on op=
enmp support in rpm to speed up rpm operations; adding an option to turn it=
 off is okay, but actually turning it off is not.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 26. F=
eb 2024 at 15.29, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com=
">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">* and kee=
p it enabled in target builds unless libc-musl where it was<br>
=C2=A0 disabled since upgrade to 4.15.1 in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D67257ca87c6fa8e6050a20ecea50daf834c7e869" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D67257ca8=
7c6fa8e6050a20ecea50daf834c7e869</a><br>
=C2=A0 and disable it for native builds to be able to reuse rpm-native<br>
=C2=A0 between hosts with libomp and without to avoid do_package failures l=
ike:<br>
=C2=A0 recipe-sysroot-native/usr/lib/rpm/rpmdeps: error while loading share=
d libraries: libgomp.so.1: cannot open shared object file: No such file or =
directory<br>
<br>
* and on hosts without libomp it fails in do_configure:<br>
=C2=A0 | CMake Error at /OE/build/tmp-glibc/work/x86_64-linux/rpm-native/4.=
19.1/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleSt=
andardArgs.cmake:230 (message):<br>
=C2=A0 |=C2=A0 =C2=A0Could NOT find OpenMP_C (missing: OpenMP_C_FLAGS OpenM=
P_C_LIB_NAMES)<br>
=C2=A0 |=C2=A0 =C2=A0(Required is at least version &quot;4.5&quot;)<br>
<br>
* I&#39;ve noticed this in new experimental gentoo profiles which don&#39;t=
<br>
=C2=A0 enable openmp by default for gcc-13 and newer, see:<br>
=C2=A0 <a href=3D"https://bugs.gentoo.org/890999" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.gentoo.org/890999</a><br>
=C2=A0 <a href=3D"https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D81=
89b4b48c25dbd7b330b51b53f9023cdbbb29ec" rel=3D"noreferrer" target=3D"_blank=
">https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D8189b4b48c25dbd7b3=
30b51b53f9023cdbbb29ec</a><br>
=C2=A0 <a href=3D"https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D94=
d882482714698d6d9b765920cd26bbe849336d" rel=3D"noreferrer" target=3D"_blank=
">https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D94d882482714698d6d=
9b765920cd26bbe849336d</a><br>
<br>
=C2=A0 I&#39;m not sure what other distributions plan with openmp support i=
n future<br>
=C2=A0 (and this profile is just experimental and the decision not to enabl=
e<br>
=C2=A0 openmp by default might still change), but having the PACKAGECONFIG<=
br>
=C2=A0 at least gives easy way to explicitly enable/disable this in bbappen=
d<br>
<br>
=C2=A0 openmp is also explicitly disabled in gettext since 2011:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3De897103a58ad672cc87d2bab3ec45501ef09f8f1" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3De897103a=
58ad672cc87d2bab3ec45501ef09f8f1</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.19.1.bb</a> | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.19.1.bb</a> b/meta/recipes-devtools=
/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=3D"noreferrer" target=3D"_blank">=
rpm_4.19.1.bb</a><br>
index 1f8611a29c..477e1c2d62 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.19.1.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.19.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_4.19.1.bb</a><br>
@@ -52,7 +52,7 @@ DEPENDS =3D &quot;lua libgcrypt file popt xz bzip2 elfuti=
ls python3 sqlite3 zstd&quot;<br>
=C2=A0DEPENDS:append:class-native =3D &quot; file-replacement-native bzip2-=
replacement-native&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE:append =3D &quot; -D__CURL:FILEPATH=3Dcurl&quot;<br>
-EXTRA_OECMAKE:append:libc-musl =3D &quot; -DENABLE_NLS=3DOFF -DENABLE_OPEN=
MP=3DOFF&quot;<br>
+EXTRA_OECMAKE:append:libc-musl =3D &quot; -DENABLE_NLS=3DOFF&quot;<br>
<br>
=C2=A0# --sysconfdir prevents rpm from attempting to access machine-specifi=
c configuration in sysroot/etc; we need to have it in rootfs<br>
=C2=A0# --localstatedir prevents rpm from writing its database to native sy=
sroot when building images<br>
@@ -64,10 +64,15 @@ OECMAKE_GENERATOR =3D &quot;Unix Makefiles&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;internal-openpgp&quot;<br>
+PACKAGECONFIG_OPENMP =3D &quot;openmp&quot;<br>
+PACKAGECONFIG_OPENMP:libc-musl =3D &quot;&quot;<br>
+PACKAGECONFIG_OPENMP:class-native =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;internal-openpgp ${PACKAGECONFIG_OPENMP}&quot;<b=
r>
<br>
=C2=A0PACKAGECONFIG[plugins] =3D &quot;-DENABLE_PLUGINS=3DON,-DENABLE_PLUGI=
NS=3DOFF&quot;<br>
=C2=A0PACKAGECONFIG[testsuite] =3D &quot;-DENABLE_TESTSUITE=3DON,-DENABLE_T=
ESTSUITE=3DOFF&quot;<br>
+PACKAGECONFIG[openmp] =3D &quot;-DENABLE_OPENMP=3DON,-DENABLE_OPENMP=3DOFF=
&quot;<br>
<br>
=C2=A0# Deprecated! <a href=3D"https://fedoraproject.org/wiki/Changes/RpmSe=
quoia" rel=3D"noreferrer" target=3D"_blank">https://fedoraproject.org/wiki/=
Changes/RpmSequoia</a><br>
=C2=A0PACKAGECONFIG[internal-openpgp] =3D &quot;-DWITH_INTERNAL_OPENPGP=3DO=
N,-DWITH_INTERNAL_OPENPGP=3DOFF&quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196205): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196205" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196205</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104582694/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104582694/1686489</a><br>
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

--000000000000943428061249e0c4--

