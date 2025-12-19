Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3913AD78763
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:17:59 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15580.1766146670034337744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NqNaGwbP;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-455749af2e1so1593371b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766146669; x=1766751469; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rEgXDRuZ+pzUd1B9Mxzb1dxRCHvhzZ9UtX7jZxn+MlI=;
        b=NqNaGwbPPRHaIJtIRt9wwtI+Zds1gbA4lcxGer2G1jvzFAYjS8WE/ImwCXfuwnxWU5
         pmGpTpJLkjLjEgU1ybxGIA47VcKC88sLQQ1YxCaexkLM7NbivQKCJKb01Z+F4SYBS+gP
         b6/+ziHFz9TziwKRnv4H6xz366yCbJQ0q0UsHC+v0mWgURgcuGqXiEgQxPrqG+Myeqf7
         hZgrTSGL56sn8f0oCxBlNbKsJ+XiXSIbgDGqXi2H21bLUi3J1XB5fvr06NfCHFrfzC0E
         Y3C/oleOjZXfZ07LB2BBIj/QHxPFGCmSyUPcsn5sDPVu/zaPziS1XNIK3RqBzkNqclhK
         mqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146669; x=1766751469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEgXDRuZ+pzUd1B9Mxzb1dxRCHvhzZ9UtX7jZxn+MlI=;
        b=Frq1jMLe+dSGHLvOSvde8/ndTUN6boQxkhyI0WNmAWvYvC9F1eQcQPBXKA9IxMuDZe
         1EUt+YUmswvjZcyH5xgbiof8pVlfEQWa/QJKn7G2JGbvDpTSy784SO/eld6hswi/boW+
         UBWasO3CsUug5t8dtWHuKdSNPaE8T/ivE7L67QLfd/X/7KZ9ecpnH39ik4KI1gbVXf5H
         azw3vVwpx+4MTTTpmW4uqDhHDyYJdbNdbzXhi+EYc6sw/tkkl9qwD7CQ7uNPlscNlg+/
         fVVjmRguNb27L773La8TPMx6VD0gsHgAqM+UxnlJHKpFLqz2o9f0iPFksjo0/vRF8xYd
         u7DQ==
X-Gm-Message-State: AOJu0YyDZU7V+wdvnUpv8i6Qge9M+wQl0ASVMi4rhwBEQ3/7uATxlRQg
	ULjjSNrvSVa7t0QgbK3+8K2qk0KvDoF7XI+Tq0CUULfOpZqrwOfofm1SalWSC/SgBUa0eOIFs4Q
	wYL8HCbrUKzD2fqG3gxhYZsPNzzFCy5k=
X-Gm-Gg: AY/fxX6zUU7lB3T7zN2egHlBqyqdGR1muHG3EUG4T7cyRZp3CmsnV93CIJNP8hpHPI0
	MgemqtxCbTUkUPT3MH+rVRH9NfOe0FqKgE9CgdxpE4IOCtNLbtaVua5sIS1GiNRhbAmOIkoxEUF
	tbBx2OiE+Sg2F9mBfjEZSXU/W5FbWXBRQfN4nUiEd20oIXsoKfOwaWs8zIveyfaCWafUaGNGP5o
	z0n7gq6ShL+FA6xmnT4F942spbemixRaz8af/1CGWZgwfZ/pGE1gJmyUtBxN7SpjhB6Px9csytE
	/fyzTz7VLSbLjEmPbOaQ79DelVGGUhn2nkr21Q/t
X-Google-Smtp-Source: AGHT+IHX+pwevfBeIlQXZQYoPAxdi4DsUzB/pEaxzTMtXNw1NC2Se78EbBsUBxO+Ja2ZEzo7pWsZf4h2lgUhRYlyfKM=
X-Received: by 2002:a05:6808:17aa:b0:450:cd83:80d6 with SMTP id
 5614622812f47-457b221dda4mr1398996b6e.16.1766146669088; Fri, 19 Dec 2025
 04:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20251219121313.23354-1-opensource@nabladev.com>
In-Reply-To: <20251219121313.23354-1-opensource@nabladev.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 19 Dec 2025 17:47:34 +0530
X-Gm-Features: AQt7F2oDfayV6e9S3iikQdjKrdHiCYHruBoTd8-3POzJoSLl5nrFQq0o366g9as
Message-ID: <CADySD0HVhC-MQrm_xv=AejtQatRPNxYJNCVTmOT37kWs6uqPpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: upgrade 0.3.6 -> 0.3.7
To: opensource@nabladev.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Stefano Babic <sbabic@nabladev.com>
Content-Type: multipart/alternative; boundary="000000000000d511bd06464d106f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228228

--000000000000d511bd06464d106f
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 19, 2025, 5:43 PM opensource via lists.openembedded.org
<opensource=nabladev.com@lists.openembedded.org> wrote:

> From: Stefano Babic <sbabic@nabladev.com>
>
> Signed-off-by: Stefano Babic <sbabic@nabladev.com>
> ---
>  ...Update-cmake_minimum_required-to-3.5.patch | 50 -------------------
>  ...ubootenv_0.3.6.bb => libubootenv_0.3.7.bb} |  3 +-
>  2 files changed, 1 insertion(+), 52 deletions(-)
>  delete mode 100644
> meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
>  rename meta/recipes-bsp/u-boot/{libubootenv_0.3.6.bb =>
> libubootenv_0.3.7.bb} (86%)
>
> diff --git
> a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
> b/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
> deleted file mode 100644
> index ee174ca59e..0000000000
> ---
> a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From cd12d9dd2bea8e4580f458df77229477fc55ba70 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Wed, 14 May 2025 14:17:40 -0600
> -Subject: [PATCH] Update cmake_minimum_required to 3.5
> -
> -This supports compilation with cmake-4.0.0.
> -
> -Fixes:
> -CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
> -  Compatibility with CMake < 3.5 has been removed from CMake.
> -
> -  Update the VERSION argument <min> value.  Or, use the <min>...<max>
> syntax
> -  to tell CMake that the project requires at least <min> but has been
> updated
> -  to work with policies introduced by <max> or earlier.
> -
> -  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> -Upstream-Status: Backport [cd12d9dd2bea8e4580f458df77229477fc55ba70]
> ----
> - CMakeLists.txt     | 2 +-
> - src/CMakeLists.txt | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 796d7bc..0a11730 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -2,7 +2,7 @@
> - #
> - # SPDX-License-Identifier:     LGPL-2.1-or-later
> -
> --cmake_minimum_required (VERSION 2.6)
> -+cmake_minimum_required (VERSION 3.5)
> - project (libubootenv C)
> -
> - # The version number.
> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index c56d0c7..3370232 100644
> ---- a/src/CMakeLists.txt
> -+++ b/src/CMakeLists.txt
> -@@ -1,7 +1,7 @@
> - # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <
> stefano.babic@swupdate.org>
> - #
> - # SPDX-License-Identifier:     LGPL-2.1-or-later
> --cmake_minimum_required (VERSION 2.6)
> -+cmake_minimum_required (VERSION 3.5)
> - # Sources and private headers
> - SET(libubootenv_SOURCES
> -   uboot_env.c
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
> similarity index 86%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
> index b63b8ff87d..e7c131e5cd 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
> @@ -11,9 +11,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
>  SECTION = "libs"
>
>  SRC_URI = "git://
> github.com/sbabic/libubootenv;protocol=https;branch=master \
>

Can please also add ";tag=v${PV}" to SRC_URI

-           file://0001-Update-cmake_minimum_required-to-3.5.patch \
>             "
> -SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
> +SRCREV = "1e3511ed77f794ee5decc0974d54c8e5af26f64c"
>
>  inherit cmake lib_package
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228226):
> https://lists.openembedded.org/g/openembedded-core/message/228226
> Mute This Topic: https://lists.openembedded.org/mt/116858096/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ankur.tyagi85@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d511bd06464d106f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 19, 2025, 5:43 PM op=
ensource via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;opensource=3D<a href=3D"mailto:nabladev.com@lists.openembedded.o=
rg">nabladev.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">From: Stefano Babic &lt;<a href=3D"mailto:sbabic@nablad=
ev.com" target=3D"_blank" rel=3D"noreferrer">sbabic@nabladev.com</a>&gt;<br=
>
<br>
Signed-off-by: Stefano Babic &lt;<a href=3D"mailto:sbabic@nabladev.com" tar=
get=3D"_blank" rel=3D"noreferrer">sbabic@nabladev.com</a>&gt;<br>
---<br>
=C2=A0...Update-cmake_minimum_required-to-3.5.patch | 50 ------------------=
-<br>
=C2=A0...<a href=3D"http://ubootenv_0.3.6.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">ubootenv_0.3.6.bb</a> =3D&gt; <a href=3D"http://libuboot=
env_0.3.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0=
.3.7.bb</a>} |=C2=A0 3 +-<br>
=C2=A02 files changed, 1 insertion(+), 52 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cm=
ake_minimum_required-to-3.5.patch<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://libubootenv_0.3.6.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.6.bb</a>=
 =3D&gt; <a href=3D"http://libubootenv_0.3.7.bb" rel=3D"noreferrer noreferr=
er" target=3D"_blank">libubootenv_0.3.7.bb</a>} (86%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_=
required-to-3.5.patch b/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cma=
ke_minimum_required-to-3.5.patch<br>
deleted file mode 100644<br>
index ee174ca59e..0000000000<br>
--- a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_require=
d-to-3.5.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From cd12d9dd2bea8e4580f458df77229477fc55ba70 Mon Sep 17 00:00:00 2001<br>
-From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;<br>
-Date: Wed, 14 May 2025 14:17:40 -0600<br>
-Subject: [PATCH] Update cmake_minimum_required to 3.5<br>
-<br>
-This supports compilation with cmake-4.0.0.<br>
-<br>
-Fixes:<br>
-CMake Error at CMakeLists.txt:5 (cmake_minimum_required):<br>
-=C2=A0 Compatibility with CMake &lt; 3.5 has been removed from CMake.<br>
-<br>
-=C2=A0 Update the VERSION argument &lt;min&gt; value.=C2=A0 Or, use the &l=
t;min&gt;...&lt;max&gt; syntax<br>
-=C2=A0 to tell CMake that the project requires at least &lt;min&gt; but ha=
s been updated<br>
-=C2=A0 to work with policies introduced by &lt;max&gt; or earlier.<br>
-<br>
-=C2=A0 Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring any=
way.<br>
-<br>
-Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;=
<br>
-Upstream-Status: Backport [cd12d9dd2bea8e4580f458df77229477fc55ba70]<br>
----<br>
- CMakeLists.txt=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- src/CMakeLists.txt | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 796d7bc..0a11730 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -2,7 +2,7 @@<br>
- #<br>
- # SPDX-License-Identifier:=C2=A0 =C2=A0 =C2=A0LGPL-2.1-or-later<br>
-<br>
--cmake_minimum_required (VERSION 2.6)<br>
-+cmake_minimum_required (VERSION 3.5)<br>
- project (libubootenv C)<br>
-<br>
- # The version number.<br>
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt<br>
-index c56d0c7..3370232 100644<br>
---- a/src/CMakeLists.txt<br>
-+++ b/src/CMakeLists.txt<br>
-@@ -1,7 +1,7 @@<br>
- # SPDX-FileCopyrightText: 2019-2021 Stefano Babic &lt;<a href=3D"mailto:s=
tefano.babic@swupdate.org" target=3D"_blank" rel=3D"noreferrer">stefano.bab=
ic@swupdate.org</a>&gt;<br>
- #<br>
- # SPDX-License-Identifier:=C2=A0 =C2=A0 =C2=A0LGPL-2.1-or-later<br>
--cmake_minimum_required (VERSION 2.6)<br>
-+cmake_minimum_required (VERSION 3.5)<br>
- # Sources and private headers<br>
- SET(libubootenv_SOURCES<br>
-=C2=A0 =C2=A0uboot_env.c<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.6.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.6.bb</a> =
b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.7.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">libubootenv_0.3.7.bb</a><br>
similarity index 86%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.6.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.6.bb</a><b=
r>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.7.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.7.bb</a><br>
index b63b8ff87d..e7c131e5cd 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.6.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.3.7.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libubootenv_0.3.7.bb</a><br>
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES/LGPL-2.1-or-la=
ter.txt;md5=3D4fbd65380cdd255951<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/libuboote=
nv;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/sbabic/libubootenv;protocol=3Dhttps;branch=3Dmaster<=
/a> \<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Can please also add &quot;;tag=3Dv${PV}&quot; to SRC_URI</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote=
_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Update-cmake_minimum_=
required-to-3.5.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;5507339628b5caf244e1ff9d58cb3fa534b16beb&quot;<br>
+SRCREV =3D &quot;1e3511ed77f794ee5decc0974d54c8e5af26f64c&quot;<br>
<br>
=C2=A0inherit cmake lib_package<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228226): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228226" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/228226</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116858096/361=
9737" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/116858096/3619737</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ankur.tyagi85@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000d511bd06464d106f--

