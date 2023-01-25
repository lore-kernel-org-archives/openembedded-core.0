Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6F5C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:24:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.46129.1674656682358681043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qgj+fidr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so1342134wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gh0kLcgh/PqB5HF6pShYtOzTHY6bniPHcwMG0WaVZ8Y=;
        b=Qgj+fidrCBpgtrUpxKSwWfuWDg/caBUn0I5Th0zI2FGQ40+nUU6OQQlj3LaNb79rCd
         woPlQoxCU7ercZzBD1+yVAsNlbBaXOvKFXu5/Hl9k+tzabyyTgYKvJRUv3i53qWoy67a
         nvqOdHyYjqpLQaNlxMdEsIBbcE2ISTdYKJkxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gh0kLcgh/PqB5HF6pShYtOzTHY6bniPHcwMG0WaVZ8Y=;
        b=JBncez7JPLcPBlqw6Fs/tljStkm3PxJfa36m6hzrfPLKHI8DCmpSE6N76b7oYlcZJO
         SLfcX87718faBTU7+YsmnBFh56MPVgwkV8EVaChybliEwXo7OAiv/WuJ3xaum9kV2Nea
         /qv/EKJHUZUQyTdMmW9I24ILKhXKGQnysb+DOoysMfCQ4exipUz/6f/u9V+nt0pQxYCS
         LiXicjLtW9+AWJ4sTsFyJazyg30C+DMlcMWgnSr6VucZ6fkoKjASpo6o5lWRWKm+G/kv
         zvcPdAdxAG312O5S92YAtg5NXBzpx7OZhvNt86kZkz/pT/YnMSR332EDas+DeVKrU/xv
         IEEA==
X-Gm-Message-State: AFqh2koEv7Rznf5dFVI0K5BnjA7qGMWMAGcr61R4SsZTFY6WXDjJDFQk
	i0oeMXYA6TeebhBICBs8Haurxg==
X-Google-Smtp-Source: AMrXdXv1nODZ/JduhPLsKNKffLgumqnk+KQ/9QudtDDrN7Ng+OXA9k/E3hL05MW98nDFS3atTHdvgA==
X-Received: by 2002:a05:600c:2052:b0:3da:f9e8:9809 with SMTP id p18-20020a05600c205200b003daf9e89809mr31760050wmg.35.1674656680786;
        Wed, 25 Jan 2023 06:24:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a? ([2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a])
        by smtp.gmail.com with ESMTPSA id u36-20020a05600c4d2400b003daf681d05dsm1996191wmp.26.2023.01.25.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:24:40 -0800 (PST)
Message-ID: <9ab1d0034d3d20fcc42a544f5899f7072cac7c71.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] gtk4: add PACKAGECONFIG for cloudproviders
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2023 14:24:39 +0000
In-Reply-To: <20230122070632.756193-1-f_l_k@t-online.de>
References: <20230122070632.756193-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176350

On Sun, 2023-01-22 at 08:06 +0100, Markus Volk wrote:
> - Add missing cups runtime dependency
> - Create packages for the printbackends only for target
>   This fixes:
>=20
>   NOTE: Multiple providers are available for runtime gtk4-printbackend-cu=
ps (gtk4, gtk4-native)
>   Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbacken=
d-cups
>   NOTE: Multiple providers are available for runtime gtk4-printbackend-fi=
le (gtk4, gtk4-native)
>   Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbacken=
d-file
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/gtk4_4.8.3.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.8.3.bb
> index 6101905128..5112d3b38b 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> @@ -65,7 +65,8 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('=
DISTRO_FEATURES', 'x11', d)
> =20
>  PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libx=
render libxcomposite libxfixes xinerama"
>  PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=
=3Dfalse,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-nat=
ive"
> -PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups"
> +PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudpro=
viders=3Ddisabled,libcloudproviders"
> +PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups"
>  PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
>  PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
>  PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"

This bit is fine.

> @@ -114,7 +115,7 @@ RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
>  RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
>  RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
> =20
> -PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
> +PACKAGES_DYNAMIC:class-target +=3D "^gtk4-printbackend-.*"
>  python populate_packages:prepend () {
>      import os.path
>=20

This bit is really a bug in the native.bbclass class extension code and
I'd really prefer to fix that rather than needing every recipe with a
BBCLASSEXTEND native to handle PACKAGES_DYNAMIC specially.

You'll see that nativesdk.bbclass does:

    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")

but native.bbclass doesn't do anything with PACKAGES_DYANAMIC which is
the issue. Could you see if the patch below helps please?

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nativ=
e.bbclass
index 1e94585f3e3..cfd299d0c8c 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -139,7 +139,7 @@ python native_virtclass_handler () {
     if "native" not in classextend:
         return
=20
-    def map_dependencies(varname, d, suffix =3D "", selfref=3DTrue):
+    def map_dependencies(varname, d, suffix =3D "", selfref=3DTrue, regex=
=3DFalse):
         if suffix:
             varname =3D varname + ":" + suffix
         deps =3D d.getVar(varname)
@@ -148,7 +148,9 @@ python native_virtclass_handler () {
         deps =3D bb.utils.explode_deps(deps)
         newdeps =3D []
         for dep in deps:
-            if dep =3D=3D pn:
+            if regex and dep.startswith("^") and dep.endswith("$"):
+                newdeps.append(dep[:-1].replace(pn, bpn) + "-native$")
+            elif dep =3D=3D pn:
                 if not selfref:
                     continue
                 newdeps.append(dep)
@@ -171,6 +173,7 @@ python native_virtclass_handler () {
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
     map_dependencies("PACKAGES", e.data)
+    map_dependencies("PACKAGES_DYNAMIC", e.data, regex=3DTrue)
=20
     provides =3D e.data.getVar("PROVIDES")
     nprovides =3D []


Cheers,

Richard

