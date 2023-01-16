Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713E2C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:31:28 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.169595.1673883086809457236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oG28f4Xv;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12c8312131fso29180128fac.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HH4IHqe9P2NiyrBfHj6pffyEu66/62p6DSbILO4E3cg=;
        b=oG28f4XvZ08wyNuhREmjssfGiCFXNYnHRNwolAp8TcJ0MQnTf3MhgWrGigHEAWPzGv
         jARaEHEoXihhc0ijFy2p5iKr4SHZ1bMv76D8mxuhphfhDyK4VzjPszpy2uYXzPqAGXe7
         rTT1ZKSOJqDV3l98l6nqY4VYi0EU0Z3kmtsbYXDiSaMFY3uGwqLrxRwMBIL6GgTd5wA5
         LyVEuUr5PP0SmPq+U6sB2ToYKD4pVvMi+qwoBan9Gzcexp+lI0YS7h//fn36IRaCQLb7
         2T6ZdBWFV8j1/TTyVbcMS79ZlEGqwWuDZ1BbJdWOUlARFSkwmbD6GDZZbpWPp3oVhcyU
         3onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH4IHqe9P2NiyrBfHj6pffyEu66/62p6DSbILO4E3cg=;
        b=VpmPSHi3lT/OEZS64KGN8JGeIWDzUjzgELK9Qjol9dNoeZY1X7xWMCevUVtMyNvoCp
         qzhFMv522lxxGFRe3Oa7N5BwIIBNk9//IV/jlMaucWbV7ntlsUKq2ChkILEkR1+ANnFV
         O/smiT9KGY+I1tf8yMFvNRdfxyw/dc4Rbt8BRAOjFkOLF6Exj79P1lu+Qw0ayPMInZYi
         VNK9zdLiPhf1yoXRcjcK5l+ZH++PGKW36TJf4HAYNBM5uLInY9DyuSr4ZhHEHey7TNt2
         rJ3C99+yUYF9SrvKnaKjabA5RkWgH1jh9Vob/EPCAqI6YcUWy1oTNgARAYCKD4XcTPOt
         26mg==
X-Gm-Message-State: AFqh2koN9FyCqvtPjouKWE0XKh38t5+4eaOelaQ18ZYTf57I5B/IcfdV
	rXS89AlEub4xcf+Xk+jB5CDxYMpVy35yfAPaWIS9WNXi9t0=
X-Google-Smtp-Source: AMrXdXufSdcJQPRNM6XXg+PckdWvFJW6KES6Q0IX6HIjgYDeg+YAUVOSQfmv+OHJ0qJ3A7JR+4psYAL9SSAcz6ABTI0=
X-Received: by 2002:a05:6870:514a:b0:15e:d5b1:33df with SMTP id
 z10-20020a056870514a00b0015ed5b133dfmr8770oak.55.1673883085934; Mon, 16 Jan
 2023 07:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20230116065843.19446-1-pavel@zhukoff.net>
In-Reply-To: <20230116065843.19446-1-pavel@zhukoff.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jan 2023 07:31:15 -0800
Message-ID: <CAMKF1sr6zMSx1JDt7Pmcw+BJbDeg-VUGvRGpCCoRwYmwN9nNmA@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] gcc: Fix build with musl and usrmerge on arm
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="000000000000bb968005f2634689"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175997

--000000000000bb968005f2634689
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 15, 2023 at 10:59 PM Pavel Zhukov <pavel@zhukoff.net> wrote:

> Backport fix from master to allow gcc to use proper linker path for
> musl [Yocto #14977]


Lgtm

>
>
> Fixes:
> | qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or
> directory
>
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/recipes-devtools/gcc/gcc-11.3.inc         |  1 +
>  .../gcc/0031-fix-musl-arm-with-usrmerge.patch  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc
> b/meta/recipes-devtools/gcc/gcc-11.3.inc
> index 27074a06ae..2adb21ed84 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
> @@ -60,6 +60,7 @@ SRC_URI = "\
>
> file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
>             file://0029-Fix-install-path-of-linux64.h.patch \
>             file://0030-rust-recursion-limit.patch \
> +           file://0031-fix-musl-arm-with-usrmerge.patch \
>             file://0001-CVE-2021-42574.patch \
>             file://0002-CVE-2021-42574.patch \
>             file://0003-CVE-2021-42574.patch \
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
> b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
> new file mode 100644
> index 0000000000..1408b65c64
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Inappropriate [bugfix]
> +
> +The fix has been picked from OE-core ustream:
> + 0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +
> +Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
> ++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +@@ -89,7 +89,7 @@
> + #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
> + #endif
> + #define MUSL_DYNAMIC_LINKER \
> +-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
> ++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
> +
> + /* For armv4 we pass --fix-v4bx to linker to support EABI */
> + #undef TARGET_FIX_V4BX_SPEC
> --
> 2.39.0
>
>

--000000000000bb968005f2634689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jan 15, 2023 at 10:59 PM Pavel Zhukov &lt;<a href=
=3D"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Backport fix from master to allow gcc to use pr=
oper linker path for<br>
musl [Yocto #14977]</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Lgtm=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Fixes:<br>
| qemu-arm: Could not open &#39;/lib/ld-musl-armhf.so.1&#39;: No such file =
or directory<br>
<br>
Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=
=3D"_blank">pavel@zhukoff.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-11.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0.../gcc/0031-fix-musl-arm-with-usrmerge.patch=C2=A0 | 18 ++++++++++++=
++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-wi=
th-usrmerge.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools=
/gcc/gcc-11.3.inc<br>
index 27074a06ae..2adb21ed84 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc<br>
@@ -60,6 +60,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0028-debug-101473-apply-de=
bug-prefix-maps-before-checksum.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0029-Fix-install-path-of-l=
inux64.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0030-rust-recursion-limit.=
patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-fix-musl-arm-with-usr=
merge.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-CVE-2021-42574.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-CVE-2021-42574.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-CVE-2021-42574.patch =
\<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.=
patch b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch=
<br>
new file mode 100644<br>
index 0000000000..1408b65c64<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/0031-fix-musl-arm-with-usrmerge.patch<b=
r>
@@ -0,0 +1,18 @@<br>
+Upstream-Status: Inappropriate [bugfix]<br>
+<br>
+The fix has been picked from OE-core ustream:<br>
+ 0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
+<br>
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h<br>
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
+@@ -89,7 +89,7 @@<br>
+ #define MUSL_DYNAMIC_LINKER_E &quot;%{mbig-endian:eb}&quot;<br>
+ #endif<br>
+ #define MUSL_DYNAMIC_LINKER \<br>
+-=C2=A0 &quot;/lib/ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E &quot;%{mfloat-=
abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E &quot=
;%{mfloat-abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
+<br>
+ /* For armv4 we pass --fix-v4bx to linker to support EABI */<br>
+ #undef TARGET_FIX_V4BX_SPEC<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--000000000000bb968005f2634689--

