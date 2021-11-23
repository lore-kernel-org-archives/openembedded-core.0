Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2445C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 19:46:40 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web10.16395.1637696799448533079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 11:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZpPmUsPn;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id d130so83928vke.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 11:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sx0KJ763K0sp5raRxcoPHqVhF3St3MEBsJxLcMlNUNk=;
        b=ZpPmUsPnSqcp8zr9Gel/VqmmbyOjTXjWgNi9NpI1x8hPTy6MeKU9/jliLM6qlFkYNL
         xlcyGbMV6gPOduPks9Zl0vev+0CI+am/Qr3GYDCeWdf/0oA5bqPSgLfeJmWYj2Cqpbnx
         NkJzASp1Akde4cl+LwW3GCvCB8sNzRbOtjvagZ2NGvgwKGRe3UapLh0nqxMWj3lUNlLb
         +8ZRFDd3Lq+pZreDBqVLdmsVQ1B7l5qqECKLoqMiV61U9eh0bp5l5YmXncYXQbdNHcRS
         LkHe24H3vO0UPxFC4qSgVmSqlD+eFsZUI1wSgyfrf6kwrVKp0tGt/XGSWZ3ob+TL9sv2
         KCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sx0KJ763K0sp5raRxcoPHqVhF3St3MEBsJxLcMlNUNk=;
        b=C9XEeHf2R11fCUoMgz+LkVqutmYTOE2PKViHdPUZhx/Uc/xhK7XW0VE7EhRvJGd9fN
         L1/y/wsNzAHh7M9O6/1Kmi7FcRRx64+jVhTewDjL6rE/s8MIzcbiXtc4yOidyTYaDlLX
         gU0x8TlxN/daUTekZz1CHFCoWgW/JIGdRht2bBrANMS1j0JKXY9EbNyPx+t+UkQhieI5
         RtOiVAANYRESTK7hEkTd869L8o9MY7/SND+enzWMUP+/SI9ZpT7PZ+YWqaqPwCxeYDGd
         +uFgjPSInjzR1AWzwf3VcfrqYRJtjDRImzYNeoaU/l57KpiXvEhlpBAPQH6AdaFynK9h
         k7/g==
X-Gm-Message-State: AOAM5327ZegAhwGibop1gA5Pz/AuRP+nBzxB94m4EbYVTJ5yBnsXddiH
	7LKy9zOjVdF/mDgz+j1a2Pa6kUKbcafWP9EbJ/M=
X-Google-Smtp-Source: 
 ABdhPJySvN5c6NuZfrUOIOWBhOr78ZrPcsfgC8yHHZvHfKAag4U1aMSL+Ti8oCaQ6vTPMutIqwWuhPtCOg/8ZKf2DVY=
X-Received: by 2002:a05:6122:a03:: with SMTP id
 3mr14980253vkn.8.1637696798577;
 Tue, 23 Nov 2021 11:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20211123193859.2983287-1-ross.burton@arm.com>
In-Reply-To: <20211123193859.2983287-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Nov 2021 20:46:27 +0100
Message-ID: 
 <CANNYZj8B74QzRiTt+M=Qw72JdhZpFT1rg_g3m6g6+6cohJ45YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: drop redundant patch
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000edd72e05d179ff9b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 19:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158617

--000000000000edd72e05d179ff9b
Content-Type: text/plain; charset="UTF-8"

Sorry, I have to say no. The offending is_debianlike function is still in
place, and I would not want to battle cryptic errors again if it is taken
in use somewhere else. The correct fix is to drop the function itself.

Alex

On Tue, 23 Nov 2021 at 20:39, Ross Burton <ross@burtonini.com> wrote:

> This patch disables the debian-detection to use the correct $libdir by
> default on that platform.  However in cross builds this is always
> overridden to be $prefix/lib, and all recipes that inherit meson pass
> the correct libdir explicitly.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/meson/meson.inc         |  1 -
>  ...01-is_debianlike-always-return-False.patch | 26 -------------------
>  2 files changed, 27 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
>
> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> index f383ad9f74..757295a50a 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -13,7 +13,6 @@ SRC_URI = "
> https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
>             file://disable-rpath-handling.patch \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
> -           file://0001-is_debianlike-always-return-False.patch \
>             "
>  SRC_URI[sha256sum] =
> "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
>
> diff --git
> a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
> b/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
> deleted file mode 100644
> index 83c4782a61..0000000000
> ---
> a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 667b9ede638677fb37911306937ea62f05897581 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 18 Oct 2021 15:55:59 +0200
> -Subject: [PATCH] is_debianlike(): always return False
> -
> -Otherwise, host contamination happens.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - mesonbuild/mesonlib/universal.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/mesonbuild/mesonlib/universal.py
> b/mesonbuild/mesonlib/universal.py
> -index d670d04..47d1b52 100644
> ---- a/mesonbuild/mesonlib/universal.py
> -+++ b/mesonbuild/mesonlib/universal.py
> -@@ -651,7 +651,7 @@ def is_cygwin() -> bool:
> -
> -
> - def is_debianlike() -> bool:
> --    return os.path.isfile('/etc/debian_version')
> -+    return False
> -
> -
> - def is_dragonflybsd() -> bool:
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158616):
> https://lists.openembedded.org/g/openembedded-core/message/158616
> Mute This Topic: https://lists.openembedded.org/mt/87266402/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000edd72e05d179ff9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I have to say no. The offending is_debianlike =
function is still in place, and I would not want to battle cryptic errors a=
gain if it is taken in use somewhere else. The correct fix is to drop the f=
unction itself.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Nov 2021 =
at 20:39, Ross Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burton=
ini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">This patch disables the debian-detection to use the correct $libdir =
by<br>
default on that platform.=C2=A0 However in cross builds this is always<br>
overridden to be $prefix/lib, and all recipes that inherit meson pass<br>
the correct libdir explicitly.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A0...01-is_debianlike-always-return-False.patch | 26 ------------------=
-<br>
=C2=A02 files changed, 27 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianli=
ke-always-return-False.patch<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/=
meson/meson.inc<br>
index f383ad9f74..757295a50a 100644<br>
--- a/meta/recipes-devtools/meson/meson.inc<br>
+++ b/meta/recipes-devtools/meson/meson.inc<br>
@@ -13,7 +13,6 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/mesonbuil=
d/meson/releases/download/$%7BPV%7D/meson-$%7BP" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/mesonbuild/meson/releases/download/${PV}/mes=
on-${P</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-rpath-handling.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-CPU-family-warni=
ngs-fatal.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Support-building-alla=
rch-recipes-again.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-is_debianlike-always-=
return-False.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5add789c953d984b500858b2851ee3d7add0460c=
f1a6f852f0a721af17384e13&quot;<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-re=
turn-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike-alw=
ays-return-False.patch<br>
deleted file mode 100644<br>
index 83c4782a61..0000000000<br>
--- a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-Fa=
lse.patch<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-From 667b9ede638677fb37911306937ea62f05897581 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
-Date: Mon, 18 Oct 2021 15:55:59 +0200<br>
-Subject: [PATCH] is_debianlike(): always return False<br>
-<br>
-Otherwise, host contamination happens.<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- mesonbuild/mesonlib/universal.py | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/mesonbuild/mesonlib/universal.py b/mesonbuild/mesonlib/univer=
sal.py<br>
-index d670d04..47d1b52 100644<br>
---- a/mesonbuild/mesonlib/universal.py<br>
-+++ b/mesonbuild/mesonlib/universal.py<br>
-@@ -651,7 +651,7 @@ def is_cygwin() -&gt; bool:<br>
- <br>
- <br>
- def is_debianlike() -&gt; bool:<br>
--=C2=A0 =C2=A0 return os.path.isfile(&#39;/etc/debian_version&#39;)<br>
-+=C2=A0 =C2=A0 return False<br>
- <br>
- <br>
- def is_dragonflybsd() -&gt; bool:<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158616): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158616" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158616</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87266402/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87266402/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000edd72e05d179ff9b--

