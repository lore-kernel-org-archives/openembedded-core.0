Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.1340.1628028273441438404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 15:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbCkCZtO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id o5so787178ejy.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n+4dumGOQSL8ntgImQOQu1bAG4UePaq+QNDH27VWjK4=;
        b=sbCkCZtO/oD+GE99dqaXrIjayNAaid0gX5y6scL+5yBylUBd3B2JmKovZdOCzhyRdR
         1C8cazRRGEUNe4PjTTu56eF6c62CKcx2kVrEUSYXKeb5lYGvqCiFSyI79l+J5/5EcFrM
         jda8Nxc+ZgFa1qt4Ren0cnE9wUWcmkgwiiJsIPEPTYlC9bqaWWcgmOV2yhWCt1tDVpdy
         x+fEcIu6P9FFBlSoXQnqFo7ayBV+vQqz7G22jFXefwwdg5jhaTz7CusS6bCrrIzC8S1U
         EsNDxIm0a7HL+w/0fAjiMoelLTKFKBSEe8PqIXoaxlNbf2QPm+AimrqePCd5WYSlJNHp
         rQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n+4dumGOQSL8ntgImQOQu1bAG4UePaq+QNDH27VWjK4=;
        b=WVPSMT0wNqR1PxEMXE8eWSecm542XZRhFqXEQfRnC9wIAG7gj59zOVh7D8s8xC8p6S
         f0V6f0U9B1te9wBiFyjBbB/3XQB4nkDbmKx75RxB+/frgouJBlHA23TlqCZdZ3gvPDxY
         fiIPJ0GeN9vV5SuLkuTBRCG4xscRnNGyp+7SUZZN/VvOcM58+SPFC7FnzebDISPK8g/Z
         fp2cetnsP1NhXZh/afWczdmUH0frBQApnoD3mk6XFz5HxfE60YKrYRm03G12FG36G4up
         SMgFMKJuRDr7oKcOn/1VfBupEljXVFJ+0ws2KNspaWYabjDU58plkVXu2tnYj5R8DQgI
         8tHA==
X-Gm-Message-State: AOAM532kExPE2Ac3mw7qBECl+/DqmKQA7z+fgxCag9Dhs5e2/YbbU4pe
	ZXLY4IdCBg0FcZ12SCbIB4ziYpuCaNsRvfHRm6M=
X-Google-Smtp-Source: ABdhPJy4KfA8XK1kj5agIMYOgPV29fDzEgM5w9FvVsnaNHvDbXS+Ious8+I4zWHHCXNN/iiYFf+YtRzQ6cLp5uaP2mM=
X-Received: by 2002:a17:906:5e11:: with SMTP id n17mr22440820eju.470.1628028271801;
 Tue, 03 Aug 2021 15:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210730114507.732448-1-alex.kanavin@gmail.com> <20210730114507.732448-4-alex.kanavin@gmail.com>
In-Reply-To: <20210730114507.732448-4-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 00:04:20 +0200
Message-ID: <CA+chaQco2_MxRnF8r8+keOOV=ebAqwgj260z5Uw_kd8QfZ_X3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/9] iputils: update 20210202 -> 20210722
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d33eb105c8aedeec"

--000000000000d33eb105c8aedeec
Content-Type: text/plain; charset="UTF-8"

This upgrade causes iputils to fail building on hosts without ip:

../git/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or
not executable

It would need
https://github.com/iputils/iputils/commit/3163c49f9f4ad473a00d8a345ee334a028376011
and -DSKIP_TESTS=true

On Fri, Jul 30, 2021 at 1:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Drop rdisc part from 0001-rarpd-rdisc-Drop-PrivateUsers.patch
> as it's been fixed upstream; rarpd still isn't.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 31 ++++---------------
>  ...putils_20210202.bb => iputils_20210722.bb} |  2 +-
>  2 files changed, 7 insertions(+), 26 deletions(-)
>  rename meta/recipes-extended/iputils/{iputils_20210202.bb =>
> iputils_20210722.bb} (98%)
>
> diff --git
> a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> index d7367caf78..c61e39dc80 100644
> ---
> a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> +++
> b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateUsers.patch
> @@ -1,20 +1,20 @@
> -From 6e51d529988cfc0bb357751fd767e9f1478e2b81 Mon Sep 17 00:00:00 2001
> +From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001
>  From: Alex Kiernan <alex.kiernan@gmail.com>
>  Date: Thu, 13 Feb 2020 06:08:45 +0000
> -Subject: [PATCH] rarpd: rdisc: Drop PrivateUsers
> +Subject: [PATCH] rarpd:Drop PrivateUsers
>
> -Neither rarpd nor rdisc can gain the necessary capabilities with
> +rarpd cannot gain the necessary capabilities with
>  PrivateUsers enabled.
>
>  Upstream-Status: Pending
>  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +
>  ---
>   systemd/rarpd.service.in | 1 -
> - systemd/rdisc.service.in | 3 ++-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> + 1 file changed, 1 deletion(-)
>
>  diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
> -index e600c10c93e6..f5d7621a7ce8 100644
> +index e600c10..f5d7621 100644
>  --- a/systemd/rarpd.service.in
>  +++ b/systemd/rarpd.service.in
>  @@ -12,7 +12,6 @@ AmbientCapabilities=CAP_NET_RAW
> @@ -25,22 +25,3 @@ index e600c10c93e6..f5d7621a7ce8 100644
>   ProtectSystem=strict
>   ProtectHome=yes
>   ProtectControlGroups=yes
> -diff --git a/systemd/rdisc.service.in b/systemd/rdisc.service.in
> -index 4e2a1ec9d0e5..a71b87d36b37 100644
> ---- a/systemd/rdisc.service.in
> -+++ b/systemd/rdisc.service.in
> -@@ -8,9 +8,10 @@ After=network.target
> - EnvironmentFile=-/etc/sysconfig/rdisc
> - ExecStart=@sbindir@/rdisc -f -t $OPTIONS $SEND_ADDRESS $RECEIVE_ADDRESS
> -
> -+CapabilityBoundingSet=CAP_NET_RAW
> - AmbientCapabilities=CAP_NET_RAW
> - PrivateTmp=yes
> --PrivateUsers=yes
> -+DynamicUser=yes
> - ProtectSystem=strict
> - ProtectHome=yes
> - ProtectControlGroups=yes
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-extended/iputils/iputils_20210202.bb
> b/meta/recipes-extended/iputils/iputils_20210722.bb
> similarity index 98%
> rename from meta/recipes-extended/iputils/iputils_20210202.bb
> rename to meta/recipes-extended/iputils/iputils_20210722.bb
> index 02a303782e..b5a774073e 100644
> --- a/meta/recipes-extended/iputils/iputils_20210202.bb
> +++ b/meta/recipes-extended/iputils/iputils_20210722.bb
> @@ -13,7 +13,7 @@ DEPENDS = "gnutls"
>  SRC_URI = "git://github.com/iputils/iputils \
>             file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
>             "
> -SRCREV = "cc16da6b574ce6637f3e6e9ab3c1a728663006ff"
> +SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.31.1
>
>
> 
>
>

--000000000000d33eb105c8aedeec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This upgrade causes iputils to fail building on hosts with=
out ip:<div><br></div><div>../git/ping/meson.build:38:0: ERROR: Program or =
command &#39;ip&#39; not found or not executable<br></div><div><br></div><d=
iv>It would need=C2=A0<a href=3D"https://github.com/iputils/iputils/commit/=
3163c49f9f4ad473a00d8a345ee334a028376011">https://github.com/iputils/iputil=
s/commit/3163c49f9f4ad473a00d8a345ee334a028376011</a> and=C2=A0-DSKIP_TESTS=
=
=3Dtrue</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 30, 2021 at 1:45 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Drop rdisc part=
 from 0001-rarpd-rdisc-Drop-PrivateUsers.patch<br>
as it&#39;s been fixed upstream; rarpd still isn&#39;t.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-rarpd-rdisc-Drop-PrivateUsers.patch=C2=A0 | 31 ++++--------=
-------<br>
=C2=A0...<a href=3D"http://putils_20210202.bb" rel=3D"noreferrer" target=
=3D"_blank">putils_20210202.bb</a> =3D&gt; <a href=3D"http://iputils_20210=
722.bb" rel=3D"noreferrer" target=3D"_blank">iputils_20210722.bb</a>} |=C2=
=A0 2 +-<br>
=C2=A02 files changed, 7 insertions(+), 26 deletions(-)<br>
=C2=A0rename meta/recipes-extended/iputils/{<a href=3D"http://iputils_2021=
0202.bb" rel=3D"noreferrer" target=3D"_blank">iputils_20210202.bb</a> =3D&g=
t; <a href=3D"http://iputils_20210722.bb" rel=3D"noreferrer" target=3D"_bla=
nk">iputils_20210722.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-P=
rivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-=
Drop-PrivateUsers.patch<br>
index d7367caf78..c61e39dc80 100644<br>
--- a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateU=
sers.patch<br>
+++ b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-PrivateU=
sers.patch<br>
@@ -1,20 +1,20 @@<br>
-From 6e51d529988cfc0bb357751fd767e9f1478e2b81 Mon Sep 17 00:00:00 2001<br=
>
+From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" tar=
get=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 13 Feb 2020 06:08:45 +0000<br>
-Subject: [PATCH] rarpd: rdisc: Drop PrivateUsers<br>
+Subject: [PATCH] rarpd:Drop PrivateUsers<br>
<br>
-Neither rarpd nor rdisc can gain the necessary capabilities with<br>
+rarpd cannot gain the necessary capabilities with<br>
=C2=A0PrivateUsers enabled.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail=
.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 systemd/<a href=3D"http://rarpd.service.in" rel=3D"noreferrer" targ=
et=3D"_blank">rarpd.service.in</a> | 1 -<br>
- systemd/<a href=3D"http://rdisc.service.in" rel=3D"noreferrer" target=3D=
"_blank">rdisc.service.in</a> | 3 ++-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+ 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/systemd/<a href=3D"http://rarpd.service.in" rel=3D"nore=
ferrer" target=3D"_blank">rarpd.service.in</a> b/systemd/<a href=3D"http://=
rarpd.service.in" rel=3D"noreferrer" target=3D"_blank">rarpd.service.in</a>=
<br>
-index e600c10c93e6..f5d7621a7ce8 100644<br>
+index e600c10..f5d7621 100644<br>
=C2=A0--- a/systemd/<a href=3D"http://rarpd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">rarpd.service.in</a><br>
=C2=A0+++ b/systemd/<a href=3D"http://rarpd.service.in" rel=3D"noreferrer"=
 target=3D"_blank">rarpd.service.in</a><br>
=C2=A0@@ -12,7 +12,6 @@ AmbientCapabilities=3DCAP_NET_RAW<br>
@@ -25,22 +25,3 @@ index e600c10c93e6..f5d7621a7ce8 100644<br>
=C2=A0 ProtectSystem=3Dstrict<br>
=C2=A0 ProtectHome=3Dyes<br>
=C2=A0 ProtectControlGroups=3Dyes<br>
-diff --git a/systemd/<a href=3D"http://rdisc.service.in" rel=3D"noreferre=
r" target=3D"_blank">rdisc.service.in</a> b/systemd/<a href=3D"http://rdisc=
.service.in" rel=3D"noreferrer" target=3D"_blank">rdisc.service.in</a><br>
-index 4e2a1ec9d0e5..a71b87d36b37 100644<br>
---- a/systemd/<a href=3D"http://rdisc.service.in" rel=3D"noreferrer" targ=
et=3D"_blank">rdisc.service.in</a><br>
-+++ b/systemd/<a href=3D"http://rdisc.service.in" rel=3D"noreferrer" targ=
et=3D"_blank">rdisc.service.in</a><br>
-@@ -8,9 +8,10 @@ After=3Dnetwork.target<br>
- EnvironmentFile=3D-/etc/sysconfig/rdisc<br>
- ExecStart=3D@sbindir@/rdisc -f -t $OPTIONS $SEND_ADDRESS $RECEIVE_ADDRES=
S<br>
- <br>
-+CapabilityBoundingSet=3DCAP_NET_RAW<br>
- AmbientCapabilities=3DCAP_NET_RAW<br>
- PrivateTmp=3Dyes<br>
--PrivateUsers=3Dyes<br>
-+DynamicUser=3Dyes<br>
- ProtectSystem=3Dstrict<br>
- ProtectHome=3Dyes<br>
- ProtectControlGroups=3Dyes<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210=
202.bb" rel=3D"noreferrer" target=3D"_blank">iputils_20210202.bb</a> b/meta=
/recipes-extended/iputils/<a href=3D"http://iputils_20210722.bb" rel=3D"nor=
eferrer" target=3D"_blank">iputils_20210722.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-extended/iputils/<a href=3D"http://iputils_202102=
02.bb" rel=3D"noreferrer" target=3D"_blank">iputils_20210202.bb</a><br>
rename to meta/recipes-extended/iputils/<a href=3D"http://iputils_20210722=
.bb" rel=3D"noreferrer" target=3D"_blank">iputils_20210722.bb</a><br>
index 02a303782e..b5a774073e 100644<br>
--- a/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210202.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_20210202.bb</a><br>
+++ b/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210722.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_20210722.bb</a><br>
@@ -13,7 +13,7 @@ DEPENDS =3D &quot;gnutls&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils=
" rel=3D"noreferrer" target=3D"_blank">github.com/iputils/iputils</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rarpd-rdisc-Drop-Pri=
vateUsers.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;cc16da6b574ce6637f3e6e9ab3c1a728663006ff&quot;<br>
+SRCREV =3D &quot;71bb2a6c72e9f658e90ac618c73d873a76bbaa81&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000d33eb105c8aedeec--
