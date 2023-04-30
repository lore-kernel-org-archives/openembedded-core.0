Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE497C77B60
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 04:48:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.63029.1682830096794689332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 21:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EnKegKf7;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4efeea05936so1707874e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 21:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682830095; x=1685422095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cm+8RQY6eZUppj8Xh7UkrzXrGieszUpcy0ULD9RsX8Q=;
        b=EnKegKf7nyM9uk+JNOEg2bpLm9nDGJ5fxa7f0o4bi2fV9IaNwbfMB3Z6FJ4w4HsG4/
         wDpr9tKLvoQJREF9RZR0E7ordh50dFakosTo6leFSThseY4Ya+YUOI5I/D/uSSvRXTMB
         7NNSSSdKv2rmjY393qyQ1e9h2yaHI5/TOVhUIH2mAZGoH82j/zJ7AAzz1Au/wEKBqdWX
         oLxFKQB1368fg8BEpLHgR4VO7rLsPKN/3re/r+AuEHDhdj8yvfhHF2nXB9bwc0WppimS
         7IZ9zVdlC0ZHiEDZXwZoID1/Nyo0Z02JBim3xJvg6ciDmrU/L6Wa+kv6TISzN7hAJnxu
         rzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682830095; x=1685422095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cm+8RQY6eZUppj8Xh7UkrzXrGieszUpcy0ULD9RsX8Q=;
        b=C460MLK2DOtED/6gCLYTD3KEuszl9wZc8ba0bQ+Wke7sAtV6LCGv9Eu8EB1Etk147n
         HHxJpVDYzXjiv7GA/urpL4IPuX1Pd75Q/lm5nSvKzZNHtWT/SwT8y+hoUHrSwc7wF0I8
         5kJtbffqpf0D29bBg/5z1+iQQHWWhUK0KjTTVWG2y2vsVWivlsPt3roqx/8ihkeu062v
         0djNXQTsH0btzf1Z0J28kmH+6L27UYJbFeVQucSqIjyG9eS2ctMRZc5msi3RWYTCEevX
         2ELgsFQYinijtGdZ8/SwbPaieTDn4GvJa56435xj0xP7v94a5GneOXVYT6hJZP2BvGvn
         45Kw==
X-Gm-Message-State: AC+VfDzhpFLnp8wCcH7urXrI4Sed9y4MvXN35ElSR+TVt1nj+wkEvt+b
	GTlVpuFZwtUOjKcyHwtTTG/8lJ25aGzAB8bHt+k=
X-Google-Smtp-Source: ACHHUZ5/7nkuxk5Zw+1pqrH7k++I+NBxkXPM12npu2IDuNWVUPY62x10dvW/hvGk+IfHBRK7MvMXKeB9152YHHgeAes=
X-Received: by 2002:ac2:598f:0:b0:4ec:89d3:a8ac with SMTP id
 w15-20020ac2598f000000b004ec89d3a8acmr2758873lfn.30.1682830094359; Sat, 29
 Apr 2023 21:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230429223007.86655-1-changhyeok.bae@gmail.com> <20230429223007.86655-2-changhyeok.bae@gmail.com>
In-Reply-To: <20230429223007.86655-2-changhyeok.bae@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Apr 2023 06:48:03 +0200
Message-ID: <CANNYZj-jrY1dULQZpLe79967u5XhXDfcn2CjKLyu_CQamxUbng@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kea: upgrade 2.2.0 -> 2.3.7
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fde19905fa8669d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 04:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180562

--000000000000fde19905fa8669d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kea 2.3.x are development versions and do unsuitable. See
https://kb.isc.org/docs/aa-00896

You should use =E2=80=98devtool latest-version kea=E2=80=99 to check what t=
he latest
suitable version is.

Alex

On Sun 30. Apr 2023 at 0.30, Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Fix buildpaths issue.
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../recipes-connectivity/kea/{kea_2.2.0.bb =3D> kea_2.3.7.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-connectivity/kea/{kea_2.2.0.bb =3D> kea_2.3.7.bb} (9=
1%)
>
> diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb
> b/meta/recipes-connectivity/kea/kea_2.3.7.bb
> similarity index 91%
> rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
> rename to meta/recipes-connectivity/kea/kea_2.3.7.bb
> index 2c2e5a74dd..8335629474 100644
> --- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.3.7.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Kea is the next generation of DHCP softw=
are
> developed by ISC. It
>  HOMEPAGE =3D "http://kea.isc.org"
>  SECTION =3D "connectivity"
>  LICENSE =3D "MPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97ce14bdd2733f5b84ab5e29380d0=
57d"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea061fa0188838072c4248c1318ec=
131"
>
>  DEPENDS =3D "boost log4cplus openssl"
>
> @@ -18,7 +18,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.gz
> \
>             file://fix_pid_keactrl.patch \
>
> file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
> +SRC_URI[sha256sum] =3D
> "3aa58fd8042ce49a502ddaa5fa88f5700073ffe03ff967e9f9b7cc32f58cc65b"
>
>  inherit autotools systemd update-rc.d upstream-version-is-even
>
> @@ -46,7 +46,7 @@ do_configure:prepend() {
>      # replace abs_top_builddir to avoid introducing the build path
>      # don't expand the abs_top_builddir on the target as the
> abs_top_builddir is meanlingless on the target
>      find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir
> @:@abs_top_builddir_placeholder@:g"
> -    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g"
> ${S}/src/bin/admin/kea-admin.in
> +    sed -i "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
> ${S}/src/bin/admin/kea-admin.in
>  }
>
>  # patch out build host paths for reproducibility
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180561):
> https://lists.openembedded.org/g/openembedded-core/message/180561
> Mute This Topic: https://lists.openembedded.org/mt/98585530/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fde19905fa8669d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Kea 2.3.x are development versions and do unsuitable. See=
=C2=A0<div><a href=3D"https://kb.isc.org/docs/aa-00896">https://kb.isc.org/=
docs/aa-00896</a></div><div><br></div><div dir=3D"auto">You should use =E2=
=80=98devtool latest-version kea=E2=80=99 to check what the latest suitable=
 version is.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex=
=C2=A0</div><div dir=3D"auto"><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun 30. Apr 2023 at 0.30, Changhyeok Bae &lt;<a =
href=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">Fix buildpaths issue.<br>
<br>
Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.co=
m" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/kea/{<a href=3D"http://kea_2.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">kea_2.2.0.bb</a> =3D&gt; <a href=3D"http://ke=
a_2.3.7.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.3.7.bb</a>} | 6 +++-=
--<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/kea/{<a href=3D"http://kea_2.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">kea_2.2.0.bb</a> =3D&gt; <a href=3D"h=
ttp://kea_2.3.7.bb" rel=3D"noreferrer" target=3D"_blank">kea_2.3.7.bb</a>} =
(91%)<br>
<br>
diff --git a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">kea_2.2.0.bb</a> b/meta/recipes-connec=
tivity/kea/<a href=3D"http://kea_2.3.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">kea_2.3.7.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-connectivity/kea/<a href=3D"http://kea_2.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">kea_2.2.0.bb</a><br>
rename to meta/recipes-connectivity/kea/<a href=3D"http://kea_2.3.7.bb" rel=
=3D"noreferrer" target=3D"_blank">kea_2.3.7.bb</a><br>
index 2c2e5a74dd..8335629474 100644<br>
--- a/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">kea_2.2.0.bb</a><br>
+++ b/meta/recipes-connectivity/kea/<a href=3D"http://kea_2.3.7.bb" rel=3D"=
noreferrer" target=3D"_blank">kea_2.3.7.bb</a><br>
@@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Kea is the next generation of DHCP so=
ftware developed by ISC. It<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://kea.isc.org" rel=3D"noreferrer" =
target=3D"_blank">http://kea.isc.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;connectivity&quot;<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D97ce14bdd2733f5b84ab5e2938=
0d057d&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea061fa0188838072c4248c131=
8ec131&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;boost log4cplus openssl&quot;<br>
<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.org/isc/kea/$=
%7BPV%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.=
isc.org/isc/kea/${PV}/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_pid_keactrl.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-lib-log-logger_un=
ittest_support.cc-do-not-write-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;da7d90ca62a772602dac6e77e507319038422895ad68e=
eb142f1487d67d531d2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3aa58fd8042ce49a502ddaa5fa88f5700073ffe03ff96=
7e9f9b7cc32f58cc65b&quot;<br>
<br>
=C2=A0inherit autotools systemd update-rc.d upstream-version-is-even<br>
<br>
@@ -46,7 +46,7 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# replace abs_top_builddir to avoid introducing the bui=
ld path<br>
=C2=A0 =C2=A0 =C2=A0# don&#39;t expand the abs_top_builddir on the target a=
s the abs_top_builddir is meanlingless on the target<br>
=C2=A0 =C2=A0 =C2=A0find ${S} -type f -name *.<a href=3D"http://sh.in" rel=
=3D"noreferrer" target=3D"_blank">sh.in</a> | xargs sed -i=C2=A0 &quot;s:@a=
bs_top_builddir@:@abs_top_builddir_placeholder@:g&quot;<br>
-=C2=A0 =C2=A0 sed -i &quot;s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@=
:g&quot; ${S}/src/bin/admin/<a href=3D"http://kea-admin.in" rel=3D"noreferr=
er" target=3D"_blank">kea-admin.in</a><br>
+=C2=A0 =C2=A0 sed -i &quot;s:@abs_top_builddir@:@abs_top_builddir_placehol=
der@:g&quot; ${S}/src/bin/admin/<a href=3D"http://kea-admin.in" rel=3D"nore=
ferrer" target=3D"_blank">kea-admin.in</a><br>
=C2=A0}<br>
<br>
=C2=A0# patch out build host paths for reproducibility<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180561): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180561" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180561</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98585530/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98585530/1686489</a><br>
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

--000000000000fde19905fa8669d6--

