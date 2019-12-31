Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2AD7F7AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 16:14:38 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id bx28so35539550edb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 08:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ERppapEgFpyD01/BD04mXzn99J4ct/YGcqogr9ouYQ=;
	b=TrNGtfB6SH/M7f0agHfr6UeEwTKpAANWmXL/T6kuUnMCP57Zm3A3+P7TKFOZ8j7J0P
	VWKHd/xblgXlTFQpbuZbVvAsInmiF2Pyq+J0PnkskFRBof4FMms+WsmuOXxv2Rj+29tj
	ABtOzh++7kkig/muEZww6MP4eL5oRMFLHcNaLBraRHiQn1+wOf+MMy9cLTLUmq2/JamF
	pJVhxPfTkxqyac8+jfSghufhtyGHWgOJzC2uclrgpoa0V6/duRJfDmIgf/IsyJymJpYU
	R5COna6c9oFwh0e5Vjo9xvO1HzT5MUU+DN+GnADMjdpmJDaKxIGyFywp/4yw+ERUcv3n
	8CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ERppapEgFpyD01/BD04mXzn99J4ct/YGcqogr9ouYQ=;
	b=TU38jv97dBVTr0+VqE733gIFiAPoNIZ0IlpxhVSOBFBpmBN1LnW5zvI32EZSgFSfPn
	dDz/QDAxg66xAGLftYvzgJnVHAaJ+v/SuhQ8sQavj5+UFmouj/yoi8oqNcSgyLbkjzsE
	wbyPlQF9B3H2E8VG7HL4GanXhX+dg8+TlUgfcsMINZjlTAwzkpAKwrI1hFNj+c7JFx2Q
	6PRIRmu+ekPw8lPJUGB7FFyG5+r78LMAAlOt/bEy44K0Kq5BJNoXJxlTwva5UUDP4Bfd
	Ret6AWZzmUfFNGhBqWhu20XWQP1r4fbcDK6MMOFKriilOalKi7dY3Jygf7+9wMygUcmd
	zstQ==
X-Gm-Message-State: APjAAAWlVp+nQmxPK6vyon81kx/mtkvgbMepEF34bcO/7G5uuvxzlIrs
	/gkNBIFu84WQOYO3Plx9PAtUIzMwCJ1DtUE0UC/NOSq+
X-Google-Smtp-Source: APXvYqwfkTLU+nu6kTjBOBTg8aZ6OTjFxGumbusreS3WDGZo3IRf2k8d1qMyMyUEPKJwPPR+K+tlfKTI2DBWr2qAwyM=
X-Received: by 2002:a17:906:5399:: with SMTP id
	g25mr78398635ejo.121.1577808879598; 
	Tue, 31 Dec 2019 08:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20191231155540.31434-1-alistair.francis@wdc.com>
In-Reply-To: <20191231155540.31434-1-alistair.francis@wdc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Dec 2019 16:14:45 +0100
Message-ID: <CA+chaQensC2wCxgWMSMWa9iUqkhwMDeS7VB0mz34v62W+6a6fw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: sateesh0457@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to v2020.01-rc5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Dec 2019 16:14:39 -0000
Content-Type: multipart/alternative; boundary="000000000000cac3ab059b02418c"

--000000000000cac3ab059b02418c
Content-Type: text/plain; charset="UTF-8"

Please use --no-signature when updating the .patch files with git
format-patch. It will make the diffs a bit smaller (next time).

On Tue, Dec 31, 2019 at 5:09 PM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...nclude-env.h-Ensure-ulong-is-defined.patch |  6 +-
>  ...fix-ulong-definition-on-musl-targets.patch | 83 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
>  .../u-boot/u-boot-fw-utils_2020.01.bb         |  4 +-
>  4 files changed, 91 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
>
> diff --git
> a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
> b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
> index b9118164df..4d623c1f34 100644
> ---
> a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
> +++
> b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
> @@ -1,4 +1,4 @@
> -From 0565a080d153d5baaaacfeb5045a832e126f4f9e Mon Sep 17 00:00:00 2001
> +From 718170ff3a5e677db7212a86b129dacb28b1cac2 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@wdc.com>
>  Date: Mon, 14 Oct 2019 17:37:30 -0700
>  Subject: [PATCH] include/env.h: Ensure ulong is defined
> @@ -14,7 +14,7 @@ Signed-off-by: Alistair Francis <
> alistair.francis@wdc.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/include/env.h b/include/env.h
> -index b72239f6a5..5ca49a3456 100644
> +index d6c2d751d6..6cf5053431 100644
>  --- a/include/env.h
>  +++ b/include/env.h
>  @@ -13,6 +13,8 @@
> @@ -27,5 +27,5 @@ index b72239f6a5..5ca49a3456 100644
>
>   /* Value for environment validity */
>  --
> -2.23.0
> +2.24.1
>
> diff --git
> a/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
> b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
> new file mode 100644
> index 0000000000..0d965813b0
> --- /dev/null
> +++
> b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
> @@ -0,0 +1,83 @@
> +From dccfea2e95cd3f26d1295e02d41012d014827dd9 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyfox@gentoo.org>
> +Date: Mon, 16 Dec 2019 23:36:40 +0000
> +Subject: [PATCH 2/2] include: fix 'ulong' definition on musl targets
> +
> +The build failure was originally reported on arm64-musl
> +target at https://bugs.gentoo.org/703132. Here is the amd64-musl
> +variant:
> +
> +```
> +$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl-
> tools-only_defconfig -j$(nproc)
> +$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl- tools-all
>   -j$(nproc)
> +...
> +In file included from tools/env/../../env/flags.c:7,
> +                 from tools/env/env_flags.c:1:
> +include/env.h:159:1: error: unknown type name 'ulong'; did you mean
> 'long'?
> +  159 | ulong env_get_ulong(const char *name, int base, ulong
> default_val);
> +      | ^~~~~
> +      | long
> +```
> +
> +Note: 'ulong' is not defined there.
> +
> +On glibc 'ulong' comes from <sys/types.h>:
> +
> +```c
> +/* Old compatibility names for C types.  */
> +typedef unsigned long int ulong;
> +```
> +
> +On musl it comes from <sys/types.h> as well but from under different
> guards:
> +
> +```c
> +typedef unsigned long u_long, ulong;
> +```
> +
> +The change inlines 'ulong' define similar to 'uint' define.
> +
> +Upstream-Status: Pending
> +Bug: https://bugs.gentoo.org/703132
> +Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> +Message-Id: <20191216233640.518168-1-slyfox@gentoo.org>
> +---
> + include/compiler.h   | 2 +-
> + include/u-boot/crc.h | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/compiler.h b/include/compiler.h
> +index 29507f9840..90372f239c 100644
> +--- a/include/compiler.h
> ++++ b/include/compiler.h
> +@@ -46,7 +46,6 @@
> + # include <byteswap.h>
> + #elif defined(__MACH__) || defined(__FreeBSD__)
> + # include <machine/endian.h>
> +-typedef unsigned long ulong;
> + #endif
> + #ifdef __FreeBSD__
> + # include <sys/endian.h> /* htole32 and friends */
> +@@ -66,6 +65,7 @@ typedef uint8_t __u8;
> + typedef uint16_t __u16;
> + typedef uint32_t __u32;
> + typedef unsigned int uint;
> ++typedef unsigned long ulong;
> +
> + #define uswap_16(x) \
> +       ((((x) & 0xff00) >> 8) | \
> +diff --git a/include/u-boot/crc.h b/include/u-boot/crc.h
> +index 1086d2168c..b96b50d98b 100644
> +--- a/include/u-boot/crc.h
> ++++ b/include/u-boot/crc.h
> +@@ -8,6 +8,8 @@
> + #ifndef _UBOOT_CRC_H
> + #define _UBOOT_CRC_H
> +
> ++#include <compiler.h> /* unit definition */
> ++
> + /**
> +  * crc8() - Calculate and return CRC-8 of the data
> +  *
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index a0f9c41469..4799948bb1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  PE = "1"
>
>  # Drop this line when updating to 2020.01 final
> -PV = "2020.01~rc3"
> +PV = "2020.01~rc5"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> +SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
>
>  SRC_URI = "git://git.denx.de/u-boot.git \
>            "
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
> index 7de91ffbd7..5d9b300ae2 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2020.01.bb
> @@ -3,7 +3,9 @@ require u-boot-common.inc
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
>  DEPENDS += "mtd-utils"
>
> -SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch"
> +SRC_URI += "file://0001-include-env.h-Ensure-ulong-is-defined.patch \
> +
> file://0002-include-fix-ulong-definition-on-musl-targets.patch \
> +           "
>
>  INSANE_SKIP_${PN} = "already-stripped"
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> V=1'
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cac3ab059b02418c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please use --no-signature when updating the .patch files w=
ith git format-patch. It will make the diffs a bit smaller (next time).</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Dec 31, 2019 at 5:09 PM Alistair Francis &lt;<a href=3D"mailto:alistair=
.francis@wdc.com">alistair.francis@wdc.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Alistair Francis &=
lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair.f=
rancis@wdc.com</a>&gt;<br>
---<br>
=C2=A0...nclude-env.h-Ensure-ulong-is-defined.patch |=C2=A0 6 +-<br>
=C2=A0...fix-ulong-definition-on-musl-targets.patch | 83 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot-common.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 +-<br>
=C2=A0.../u-boot/<a href=3D"http://u-boot-fw-utils_2020.01.bb" rel=3D"noref=
errer" target=3D"_blank">u-boot-fw-utils_2020.01.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A04 files changed, 91 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-bsp/u-boot/files/0002-include-fix-ulo=
ng-definition-on-musl-targets.patch<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-=
is-defined.patch b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-=
ulong-is-defined.patch<br>
index b9118164df..4d623c1f34 100644<br>
--- a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defi=
ned.patch<br>
+++ b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defi=
ned.patch<br>
@@ -1,4 +1,4 @@<br>
-From 0565a080d153d5baaaacfeb5045a832e126f4f9e Mon Sep 17 00:00:00 2001<br>
+From 718170ff3a5e677db7212a86b129dacb28b1cac2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com=
" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
=C2=A0Date: Mon, 14 Oct 2019 17:37:30 -0700<br>
=C2=A0Subject: [PATCH] include/env.h: Ensure ulong is defined<br>
@@ -14,7 +14,7 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:ali=
stair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<b=
r>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/include/env.h b/include/env.h<br>
-index b72239f6a5..5ca49a3456 100644<br>
+index d6c2d751d6..6cf5053431 100644<br>
=C2=A0--- a/include/env.h<br>
=C2=A0+++ b/include/env.h<br>
=C2=A0@@ -13,6 +13,8 @@<br>
@@ -27,5 +27,5 @@ index b72239f6a5..5ca49a3456 100644<br>
<br>
=C2=A0 /* Value for environment validity */<br>
=C2=A0-- <br>
-2.23.0<br>
+2.24.1<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definitio=
n-on-musl-targets.patch b/meta/recipes-bsp/u-boot/files/0002-include-fix-ul=
ong-definition-on-musl-targets.patch<br>
new file mode 100644<br>
index 0000000000..0d965813b0<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-mu=
sl-targets.patch<br>
@@ -0,0 +1,83 @@<br>
+From dccfea2e95cd3f26d1295e02d41012d014827dd9 Mon Sep 17 00:00:00 2001<br>
+From: Sergei Trofimovich &lt;<a href=3D"mailto:slyfox@gentoo.org" target=
=3D"_blank">slyfox@gentoo.org</a>&gt;<br>
+Date: Mon, 16 Dec 2019 23:36:40 +0000<br>
+Subject: [PATCH 2/2] include: fix &#39;ulong&#39; definition on musl targe=
ts<br>
+<br>
+The build failure was originally reported on arm64-musl<br>
+target at <a href=3D"https://bugs.gentoo.org/703132" rel=3D"noreferrer" ta=
rget=3D"_blank">https://bugs.gentoo.org/703132</a>. Here is the amd64-musl<=
br>
+variant:<br>
+<br>
+```<br>
+$ LANG=3DC make CROSS_COMPILE=3Dx86_64-gentoo-linux-musl- tools-only_defco=
nfig -j$(nproc)<br>
+$ LANG=3DC make CROSS_COMPILE=3Dx86_64-gentoo-linux-musl- tools-all=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -j$(nproc)<br>
+...<br>
+In file included from tools/env/../../env/flags.c:7,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from tools/e=
nv/env_flags.c:1:<br>
+include/env.h:159:1: error: unknown type name &#39;ulong&#39;; did you mea=
n &#39;long&#39;?<br>
+=C2=A0 159 | ulong env_get_ulong(const char *name, int base, ulong default=
_val);<br>
+=C2=A0 =C2=A0 =C2=A0 | ^~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 | long<br>
+```<br>
+<br>
+Note: &#39;ulong&#39; is not defined there.<br>
+<br>
+On glibc &#39;ulong&#39; comes from &lt;sys/types.h&gt;:<br>
+<br>
+```c<br>
+/* Old compatibility names for C types.=C2=A0 */<br>
+typedef unsigned long int ulong;<br>
+```<br>
+<br>
+On musl it comes from &lt;sys/types.h&gt; as well but from under different=
 guards:<br>
+<br>
+```c<br>
+typedef unsigned long u_long, ulong;<br>
+```<br>
+<br>
+The change inlines &#39;ulong&#39; define similar to &#39;uint&#39; define=
.<br>
+<br>
+Upstream-Status: Pending<br>
+Bug: <a href=3D"https://bugs.gentoo.org/703132" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.gentoo.org/703132</a><br>
+Signed-off-by: Sergei Trofimovich &lt;<a href=3D"mailto:slyfox@gentoo.org"=
 target=3D"_blank">slyfox@gentoo.org</a>&gt;<br>
+Message-Id: &lt;<a href=3D"mailto:20191216233640.518168-1-slyfox@gentoo.or=
g" target=3D"_blank">20191216233640.518168-1-slyfox@gentoo.org</a>&gt;<br>
+---<br>
+ include/compiler.h=C2=A0 =C2=A0| 2 +-<br>
+ include/u-boot/crc.h | 2 ++<br>
+ 2 files changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/include/compiler.h b/include/compiler.h<br>
+index 29507f9840..90372f239c 100644<br>
+--- a/include/compiler.h<br>
++++ b/include/compiler.h<br>
+@@ -46,7 +46,6 @@<br>
+ # include &lt;byteswap.h&gt;<br>
+ #elif defined(__MACH__) || defined(__FreeBSD__)<br>
+ # include &lt;machine/endian.h&gt;<br>
+-typedef unsigned long ulong;<br>
+ #endif<br>
+ #ifdef __FreeBSD__<br>
+ # include &lt;sys/endian.h&gt; /* htole32 and friends */<br>
+@@ -66,6 +65,7 @@ typedef uint8_t __u8;<br>
+ typedef uint16_t __u16;<br>
+ typedef uint32_t __u32;<br>
+ typedef unsigned int uint;<br>
++typedef unsigned long ulong;<br>
+ <br>
+ #define uswap_16(x) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0((((x) &amp; 0xff00) &gt;&gt; 8) | \<br>
+diff --git a/include/u-boot/crc.h b/include/u-boot/crc.h<br>
+index 1086d2168c..b96b50d98b 100644<br>
+--- a/include/u-boot/crc.h<br>
++++ b/include/u-boot/crc.h<br>
+@@ -8,6 +8,8 @@<br>
+ #ifndef _UBOOT_CRC_H<br>
+ #define _UBOOT_CRC_H<br>
+ <br>
++#include &lt;compiler.h&gt; /* unit definition */<br>
++<br>
+ /**<br>
+=C2=A0 * crc8() - Calculate and return CRC-8 of the data<br>
+=C2=A0 *<br>
+-- <br>
+2.24.1<br>
+<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc<br>
index a0f9c41469..4799948bb1 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc<br>
@@ -11,11 +11,11 @@ LIC_FILES_CHKSUM =3D &quot;file://Licenses/README;md5=
=3D30503fd321432fc713238f582193b78e&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
=C2=A0# Drop this line when updating to 2020.01 final<br>
-PV =3D &quot;2020.01~rc3&quot;<br>
+PV =3D &quot;2020.01~rc5&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;d4a31e8ee5592072d8d5208b3e950cba2d89b6bd&quot;<br>
+SRCREV =3D &quot;ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=
=3D"noreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2020=
.01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2020.01.bb</a>=
 b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2020.01.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2020.01.bb</a><br>
index 7de91ffbd7..5d9b300ae2 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2020.01.bb"=
 rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2020.01.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2020.01.bb"=
 rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_2020.01.bb</a><br>
@@ -3,7 +3,9 @@ require u-boot-common.inc<br>
=C2=A0SUMMARY =3D &quot;U-Boot bootloader fw_printenv/setenv utilities&quot=
;<br>
=C2=A0DEPENDS +=3D &quot;mtd-utils&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-include-env.h-Ensure-ulong-is-defined.patch=
&quot;<br>
+SRC_URI +=3D &quot;file://0001-include-env.h-Ensure-ulong-is-defined.patch=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-include-fix-ulong-de=
finition-on-musl-targets.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
=C2=A0EXTRA_OEMAKE_class-target =3D &#39;CROSS_COMPILE=3D${TARGET_PREFIX} C=
C=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUI=
LD_CFLAGS} ${BUILD_LDFLAGS}&quot; V=3D1&#39;<br>
-- <br>
2.24.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000cac3ab059b02418c--
