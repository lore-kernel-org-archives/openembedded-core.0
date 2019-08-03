Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5724F7F322
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 12:30:42 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id x22so3322681qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q2CClFrcjAURx18urpPZ20xSsj3RWCn+f3Jp8BVuZqk=;
	b=Ede0JVL00A0XPjShPfjdQXSpRU3+otOgZsZXleM8qF2PtBMFHJjRIWq2nusepRelLm
	ebj9PQn7dvkbC//fRARsAlx31nftfkVJG1DCCLrWkJKeb8xmfoEeGZkD8NBNs/23WPIC
	GXSi1nEG54TsKW5ZXZc+xOFAYrj7a1w8giAeTZrGoBha3BBNqkf3nkkl1SVAlz+Wyfai
	KpNSB7UzBPlUoKkmNGphG/eGIyyJVWzmj/VqvAxsn85mXaoPr1lUX1GQuqePfp/033yM
	dTseqAcmlT+pj6NjEu9G3sVeiRf9S6lKkdaIB1JNJ4PzEWQQMXSW/N0QiDrupYdsOm6d
	nv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q2CClFrcjAURx18urpPZ20xSsj3RWCn+f3Jp8BVuZqk=;
	b=EmgqyWw4WfWoyIC3CcNobTq9TmtD0xMa462eKO7ZY4acO+I4i4YgLpl5kmmj2fZb6V
	1WBoPWH6xjpIOFQ6hR/FeFjZDF7ePIPmZj2typO1pjVJcMyEhMgRo9J8+NI9U2jvSqOG
	XCdU8ARXcVvEww1IghOi5SDRTvdYsWju6yemkVHDgJU4xrL8jQOeMoNznNXCn9Nk/kU1
	AXqAC89PM7DwteM6KQoboPvRh+5TXEwy2Bflm3kc0FLuoqegZmqbMiC+0DkY9bfVzDJ1
	mYRwYhecrFzGxSX6iY5FfL/Z5aWISnq1FKmbm7VkCTJPS8vNP4iyajSlW59jzwFqwrxx
	InGw==
X-Gm-Message-State: APjAAAV34fOd3qPs9GHek7YV5sbycnQfr3dqlSBp13yn+jXu8aeKOmkN
	xDMO0qVlLjkVdCXnPX9jSwoyVoTU9iaNvZQ+3Vk=
X-Google-Smtp-Source: APXvYqxyKDtNGal2wAiPUrM7caKLuDDMOtl9OpM24x+K7UbDuD4kd69cmfxQxr6w96TRWgjsZmXVDuo3YuJgwa4G7L4=
X-Received: by 2002:aed:3644:: with SMTP id e62mr96632869qtb.80.1564835442781; 
	Sat, 03 Aug 2019 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-9-ross.burton@intel.com>
In-Reply-To: <20190802203719.20437-9-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 05:30:32 -0700
Message-ID: <CAMKF1soeb69h2dkmV_LdpugZrAEP8OFQiVxb7qxrBw-9G0VPDQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] libx11: update to 1.6.8
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
X-List-Received-Date: Sat, 03 Aug 2019 12:30:42 -0000
Content-Type: multipart/alternative; boundary="000000000000b2f536058f35a4c9"

--000000000000b2f536058f35a4c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2019 at 1:52 PM Ross Burton <ross.burton@intel.com> wrote:

> Fix the build when the host doesn't have libc.a installed by reverting an
> upstream commit, and cherry-pick a build fix from master.
>
> Drop a redundant sed, the expression it removes doesn't exist anymore.
>
> Move most patches to libx11.inc so that they're applied to both libx11 an=
d
> libx11-diet.
>

Aren=E2=80=99t we deleting libx11-diet then we might not want to accommodat=
e for it

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...x11-diet_1.6.7.bb =3D> libx11-diet_1.6.8.bb} |  0
>  meta/recipes-graphics/xorg-lib/libx11.inc     |  8 +++-
>  .../xorg-lib/libx11/fix-libtool.patch         | 35 ++++++++++++++++
>  .../xorg-lib/libx11/no-host-x.patch           | 40 +++++++++++++++++++
>  .../recipes-graphics/xorg-lib/libx11_1.6.7.bb | 13 ------
>  .../recipes-graphics/xorg-lib/libx11_1.6.8.bb |  7 ++++
>  6 files changed, 88 insertions(+), 15 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.7.bb =3D>
> libx11-diet_1.6.8.bb} (100%)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-libtool.pat=
ch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
> b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
> similarity index 100%
> rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
> rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc
> b/meta/recipes-graphics/xorg-lib/libx11.inc
> index ea2ebfb8b95..994c33a8efc 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -10,8 +10,12 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/libx11:"
>
>  PE =3D "1"
>
> -SRC_URI[md5sum] =3D "034fdd6cc5393974d88aec6f5bc96162"
> -SRC_URI[sha256sum] =3D
> "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
> +SRC_URI +=3D "file://Fix-hanging-issue-in-_XReply.patch \
> +            file://fix-libtool.patch \
> +            file://no-host-x.patch"
> +
> +SRC_URI[md5sum] =3D "c5fa5a86a20e3591bed6c046498d4b8f"
> +SRC_URI[sha256sum] =3D
> "b289a845c189e251e0e884cc0f9269bbe97c238df3741e854ec4c17c21e473d5"
>
>  PROVIDES =3D "virtual/libx11"
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
> b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
> new file mode 100644
> index 00000000000..678b7aff445
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch
> @@ -0,0 +1,35 @@
> +Passing -all-static to libtool is done to avoid libtool wrappers on
> Windows, but
> +it means that the build host needs to have libc.a installed.  This isn't
> the
> +case for a lot of distributions out of the box, so revert this commit.
> +
> +Filed a bug upstream to get a proper fix:
> https://gitlab.freedesktop.org/xorg/lib/libx11/issues/100
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From b9f74dc5e714115057a5a1789b4de202d6f58547 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Fri, 2 Aug 2019 00:39:39 +0100
> +Subject: [PATCH 2/2] Revert "Avoid using libtool wrapper for makekeys"
> +
> +This reverts commit 4645e219133458781e3fb48eaea6a74cccb1b9aa.
> +---
> + src/util/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/Makefile.am b/src/util/Makefile.am
> +index 37314370..a051567a 100644
> +--- a/src/util/Makefile.am
> ++++ b/src/util/Makefile.am
> +@@ -10,7 +10,7 @@ AM_CPPFLAGS =3D \
> + CC =3D @CC_FOR_BUILD@
> + CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
> + CFLAGS =3D @CFLAGS_FOR_BUILD@
> +-LDFLAGS =3D @LDFLAGS_FOR_BUILD@ -all-static
> ++LDFLAGS =3D @LDFLAGS_FOR_BUILD@
> + LIBS =3D
> + EXEEXT =3D @EXEEXT_FOR_BUILD@
> +
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
> b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
> new file mode 100644
> index 00000000000..803f8b408cb
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch
> @@ -0,0 +1,40 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From cf2ef27831173c5ed6f98be3c39caff18fd4e7f1 Mon Sep 17 00:00:00 2001
> +From: Adam Jackson <ajax@redhat.com>
> +Date: Mon, 17 Jun 2019 13:36:08 -0400
> +Subject: [PATCH 1/2] makekeys: Detach ourselves from X headers entirely
> +
> +Subsequent to a121b7b0c210efe10bf93453b29050282324c906 we are no longer
> +building makekeys with enough -I/foo/bar to find the X11 headers, so if
> +they're not in a system include path, things fail. Since this utility is
> +only needed at build time, there's no real reason to demand the X
> +headers be installed for both the build and target machines if cross-
> +compiling, we can just assume a vaguely ANSI environment instead.
> +
> +Tested-by: Niclas Zeising <zeising@daemonic.se>
> +Reviewed-by: Keith Packard <keithp@keithp.com>
> +Reviewed-by: Matt Turner <mattst88@gmail.com>
> +---
> + src/util/makekeys.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/util/makekeys.c b/src/util/makekeys.c
> +index bcb5b7d5..07563315 100644
> +--- a/src/util/makekeys.c
> ++++ b/src/util/makekeys.c
> +@@ -35,8 +35,10 @@ from The Open Group.
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> ++#include <stdint.h>
> ++#include <inttypes.h>
> +
> +-#include "../Xresinternal.h"
> ++typedef uint32_t Signature;
> +
> + #define KTNUM 4000
> +
> +--
> +2.20.1
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
> b/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
> deleted file mode 100644
> index 6141f571c5a..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require libx11.inc
> -
> -SRC_URI +=3D "file://disable_tests.patch \
> -            file://Fix-hanging-issue-in-_XReply.patch \
> -           "
> -
> -inherit gettext
> -
> -do_configure_append () {
> -    sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
> b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
> new file mode 100644
> index 00000000000..0d27bc2bce9
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.8.bb
> @@ -0,0 +1,7 @@
> +require libx11.inc
> +
> +SRC_URI +=3D "file://disable_tests.patch"
> +
> +inherit gettext
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b2f536058f35a4c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 2, 2019 at 1:52 PM Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Fix the build when the host doesn&#39;t have=
 libc.a installed by reverting an<br>
upstream commit, and cherry-pick a build fix from master.<br>
<br>
Drop a redundant sed, the expression it removes doesn&#39;t exist anymore.<=
br>
<br>
Move most patches to libx11.inc so that they&#39;re applied to both libx11 =
and libx11-diet.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Aren=E2=80=99t w=
e deleting libx11-diet then we might not want to accommodate for it=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://x11-diet_1.6.7.bb" rel=3D"noreferrer" target=3D"=
_blank">x11-diet_1.6.7.bb</a> =3D&gt; <a href=3D"http://libx11-diet_1.6.8.b=
b" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.8.bb</a>} |=C2=A0 0=
<br>
=C2=A0meta/recipes-graphics/xorg-lib/libx11.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
8 +++-<br>
=C2=A0.../xorg-lib/libx11/fix-libtool.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 35 ++++++++++++++++<br>
=C2=A0.../xorg-lib/libx11/no-host-x.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 40 +++++++++++++++++++<br>
=C2=A0.../recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.6.7.bb</a> | 13 ------<br>
=C2=A0.../recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.6.8.bb</a> |=C2=A0 7 ++++<br>
=C2=A06 files changed, 88 insertions(+), 15 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/xorg-lib/{<a href=3D"http://libx11-diet_=
1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.7.bb</a> =3D=
&gt; <a href=3D"http://libx11-diet_1.6.8.bb" rel=3D"noreferrer" target=3D"_=
blank">libx11-diet_1.6.8.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-libtool.=
patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/libx11/no-host-x.pa=
tch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-lib/<a href=3D"http://l=
ibx11_1.6.7.bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.7.bb</a><br=
>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/<a href=3D"http://l=
ibx11_1.6.8.bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.8.bb</a><br=
>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-diet_1=
.6.7.bb" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.7.bb</a> b/me=
ta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-diet_1.6.8.bb" rel=3D=
"noreferrer" target=3D"_blank">libx11-diet_1.6.8.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-diet_1.=
6.7.bb" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.7.bb</a><br>
rename to meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-diet_1.6.=
8.bb" rel=3D"noreferrer" target=3D"_blank">libx11-diet_1.6.8.bb</a><br>
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graph=
ics/xorg-lib/libx11.inc<br>
index ea2ebfb8b95..994c33a8efc 100644<br>
--- a/meta/recipes-graphics/xorg-lib/libx11.inc<br>
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc<br>
@@ -10,8 +10,12 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/libx11:&quot;=
<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;034fdd6cc5393974d88aec6f5bc96162&quot;<br>
-SRC_URI[sha256sum] =3D &quot;910e9e30efba4ad3672ca277741c2728aebffa7bc526f=
04dcfa74df2e52a1348&quot;<br>
+SRC_URI +=3D &quot;file://Fix-hanging-issue-in-_XReply.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-libtool.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-host-x.patch&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;c5fa5a86a20e3591bed6c046498d4b8f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b289a845c189e251e0e884cc0f9269bbe97c238df3741=
e854ec4c17c21e473d5&quot;<br>
<br>
=C2=A0PROVIDES =3D &quot;virtual/libx11&quot;<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch b/meta=
/recipes-graphics/xorg-lib/libx11/fix-libtool.patch<br>
new file mode 100644<br>
index 00000000000..678b7aff445<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-libtool.patch<br>
@@ -0,0 +1,35 @@<br>
+Passing -all-static to libtool is done to avoid libtool wrappers on Window=
s, but<br>
+it means that the build host needs to have libc.a installed.=C2=A0 This is=
n&#39;t the<br>
+case for a lot of distributions out of the box, so revert this commit.<br>
+<br>
+Filed a bug upstream to get a proper fix: <a href=3D"https://gitlab.freede=
sktop.org/xorg/lib/libx11/issues/100" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/xorg/lib/libx11/issues/100</a><br>
+<br>
+Upstream-Status: Inappropriate<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
+<br>
+From b9f74dc5e714115057a5a1789b4de202d6f58547 Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;<br>
+Date: Fri, 2 Aug 2019 00:39:39 +0100<br>
+Subject: [PATCH 2/2] Revert &quot;Avoid using libtool wrapper for makekeys=
&quot;<br>
+<br>
+This reverts commit 4645e219133458781e3fb48eaea6a74cccb1b9aa.<br>
+---<br>
+ src/util/Makefile.am | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am<br>
+index 37314370..a051567a 100644<br>
+--- a/src/util/Makefile.am<br>
++++ b/src/util/Makefile.am<br>
+@@ -10,7 +10,7 @@ AM_CPPFLAGS =3D \<br>
+ CC =3D @CC_FOR_BUILD@<br>
+ CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@<br>
+ CFLAGS =3D @CFLAGS_FOR_BUILD@<br>
+-LDFLAGS =3D @LDFLAGS_FOR_BUILD@ -all-static<br>
++LDFLAGS =3D @LDFLAGS_FOR_BUILD@<br>
+ LIBS =3D<br>
+ EXEEXT =3D @EXEEXT_FOR_BUILD@<br>
+ <br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch b/meta/r=
ecipes-graphics/xorg-lib/libx11/no-host-x.patch<br>
new file mode 100644<br>
index 00000000000..803f8b408cb<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-lib/libx11/no-host-x.patch<br>
@@ -0,0 +1,40 @@<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
+<br>
+From cf2ef27831173c5ed6f98be3c39caff18fd4e7f1 Mon Sep 17 00:00:00 2001<br>
+From: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" target=3D"_blank=
">ajax@redhat.com</a>&gt;<br>
+Date: Mon, 17 Jun 2019 13:36:08 -0400<br>
+Subject: [PATCH 1/2] makekeys: Detach ourselves from X headers entirely<br=
>
+<br>
+Subsequent to a121b7b0c210efe10bf93453b29050282324c906 we are no longer<br=
>
+building makekeys with enough -I/foo/bar to find the X11 headers, so if<br=
>
+they&#39;re not in a system include path, things fail. Since this utility =
is<br>
+only needed at build time, there&#39;s no real reason to demand the X<br>
+headers be installed for both the build and target machines if cross-<br>
+compiling, we can just assume a vaguely ANSI environment instead.<br>
+<br>
+Tested-by: Niclas Zeising &lt;<a href=3D"mailto:zeising@daemonic.se" targe=
t=3D"_blank">zeising@daemonic.se</a>&gt;<br>
+Reviewed-by: Keith Packard &lt;<a href=3D"mailto:keithp@keithp.com" target=
=3D"_blank">keithp@keithp.com</a>&gt;<br>
+Reviewed-by: Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com" target=
=3D"_blank">mattst88@gmail.com</a>&gt;<br>
+---<br>
+ src/util/makekeys.c | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/util/makekeys.c b/src/util/makekeys.c<br>
+index bcb5b7d5..07563315 100644<br>
+--- a/src/util/makekeys.c<br>
++++ b/src/util/makekeys.c<br>
+@@ -35,8 +35,10 @@ from The Open Group.<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+ #include &lt;string.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
++#include &lt;inttypes.h&gt;<br>
+ <br>
+-#include &quot;../Xresinternal.h&quot;<br>
++typedef uint32_t Signature;<br>
+ <br>
+ #define KTNUM 4000<br>
+ <br>
+-- <br>
+2.20.1<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.7.=
bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.7.bb</a> b/meta/recipes=
-graphics/xorg-lib/<a href=3D"http://libx11_1.6.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libx11_1.6.7.bb</a><br>
deleted file mode 100644<br>
index 6141f571c5a..00000000000<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.7.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.6.7.bb</a><br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-require libx11.inc<br>
-<br>
-SRC_URI +=3D &quot;file://disable_tests.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-hanging-issue-in-_XRe=
ply.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-inherit gettext<br>
-<br>
-do_configure_append () {<br>
-=C2=A0 =C2=A0 sed -i -e &quot;/X11_CFLAGS/d&quot; ${B}/src/util/Makefile<b=
r>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.8.=
bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.8.bb</a> b/meta/recipes=
-graphics/xorg-lib/<a href=3D"http://libx11_1.6.8.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libx11_1.6.8.bb</a><br>
new file mode 100644<br>
index 00000000000..0d27bc2bce9<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.6.8.bb</a><br>
@@ -0,0 +1,7 @@<br>
+require libx11.inc<br>
+<br>
+SRC_URI +=3D &quot;file://disable_tests.patch&quot;<br>
+<br>
+inherit gettext<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000b2f536058f35a4c9--
