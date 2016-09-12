Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id BE0AD6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 07:43:19 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id m11so295733134oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ff7o67SPX0wryOq7+pa6dheeAN0tPL1S2hM9jpIxlYY=;
	b=SyyZvXTTxL2m9MPMsSbAPjKuGbjFPzuNi1gvhamnqvGQLP9hwiHc9tV82M9TXMoep9
	xZqhmC8FQEIE0fEM6IIoxj9K6Xpd1/8c94oENWWUI3M1KWRR+Si0DGqNhfPQrWvpPTlB
	QAD41tUCWeC7THo8sFW/d2blsl+aOveq3SQjyMEzsCI/RROANeVuBuA7tHU7fsj9oijk
	hn0C7zNMlmDU2EymvO/BDrNJPPdbBvy0uqpoj7qzVWX+mAfHc+8OMP91RmTAEw1f4+qO
	0mhPz9qwDDRDZ4Y3kTT9iO6GOeQK/RPbRQGGrb4davZCe9kbfxHtk2W27l03II0uCahJ
	0/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ff7o67SPX0wryOq7+pa6dheeAN0tPL1S2hM9jpIxlYY=;
	b=OBPLkCfezHC87HIOg+gXyudLwBLU4RRKxK+rf6yNV9lvi8S5ekdGaP4u4ReMfZgt0p
	Z1kdtlY63wytDPyjrujrlfBnujmhHmOCoOBQA+gaOzk5knS6ZOkZN1RTg4ssQTbbWLzC
	7/0udI88+LCTTGwVSbzkQ+JgobX2xntPYN6VQDCc9hAyuuBdNzMPmd8o22/nz76n/gRf
	vyTQYAIq8jZpIu/ROzUo4VuMxyr8BJcIOUkng9dfAWg0dnZFzGsYzww8g7JMUyQn/rbQ
	6smXIAc5FiftETs8YPlK6yPTKZTi5cG+MMxF81CSYcbJS8oTxnOKpTfe9WHRJT+ep2BS
	8IEw==
X-Gm-Message-State: AE9vXwPZSX9NuxDpeOeS1BX8tCPGovGr11fYrnko3kk8lXxIPsz9Tbg63ad4o49dsGEriy+aQJ5H/l1ctOj6iW1h
X-Received: by 10.202.90.196 with SMTP id o187mr21805354oib.75.1473666199953; 
	Mon, 12 Sep 2016 00:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Mon, 12 Sep 2016 00:42:49 -0700 (PDT)
In-Reply-To: <1473437997-26515-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473437997-26515-1-git-send-email-schnitzeltony@googlemail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 12 Sep 2016 10:42:49 +0300
Message-ID: <CAHiDW_F8fGAf3pxYC0HnR=kGo-X=KN1DwcE5sZaOCa7pXncXkA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update to 12.0.2
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
X-List-Received-Date: Mon, 12 Sep 2016 07:43:20 -0000
Content-Type: multipart/alternative; boundary=001a113d47f25dbcaf053c4aa676

--001a113d47f25dbcaf053c4aa676
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 September 2016 at 19:19, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> * removed patch was applied mainline
> * tested on RaspberryPi2 weston / lxqt / kde
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../mesa/files/clang-compile-PR89599.patch         | 116
> ---------------------
>  .../mesa/{mesa-gl_12.0.1.bb =3D> mesa-gl_12.0.2.bb}  |   0
>  .../mesa/{mesa_12.0.1.bb =3D> mesa_12.0.2.bb}        |   5 +-
>

2.2 Milestone 3 is very close to release so this is unlikely to be accepted
before 2.2 release scheduled next month. If you have a specific bug fix you
need I suggest backporting.

  Jussi


 3 files changed, 2 insertions(+), 119 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/
> files/clang-compile-PR89599.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_12.0.1.bb =3D> mesa-gl_12.0.2=
.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_12.0.1.bb =3D> mesa_12.0.2.bb}
> (77%)
>
> diff --git a/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
> b/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
> deleted file mode 100644
> index 48bd325..0000000
> --- a/meta/recipes-graphics/mesa/files/clang-compile-PR89599.patch
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -From 5ec140c17b54c25920091501b665b9aa809cc5e8 Mon Sep 17 00:00:00 2001
> -From: Matt Turner <mattst88@gmail.com>
> -Date: Mon, 11 Jul 2016 10:44:25 -0700
> -Subject: mapi: Massage code to allow clang to compile.
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -According to https://llvm.org/bugs/show_bug.cgi?id=3D19778#c3 this code
> -was violating the spec, resulting in it failing to compile.
> -
> -Cc: mesa-stable@lists.freedesktop.org
> -Co-authored-by: Tomasz Pawe=C5=82 Gajc <tpgxyz@gmail.com>
> -Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D89599
> -Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 3799d8d..1ca8359 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -226,6 +226,7 @@ AX_GCC_FUNC_ATTRIBUTE([packed])
> - AX_GCC_FUNC_ATTRIBUTE([pure])
> - AX_GCC_FUNC_ATTRIBUTE([returns_nonnull])
> - AX_GCC_FUNC_ATTRIBUTE([unused])
> -+AX_GCC_FUNC_ATTRIBUTE([visibility])
> - AX_GCC_FUNC_ATTRIBUTE([warn_unused_result])
> - AX_GCC_FUNC_ATTRIBUTE([weak])
> -
> -diff --git a/src/mapi/entry_x86-64_tls.h b/src/mapi/entry_x86-64_tls.h
> -index 38faccc..c5262a1 100644
> ---- a/src/mapi/entry_x86-64_tls.h
> -+++ b/src/mapi/entry_x86-64_tls.h
> -@@ -25,6 +25,11 @@
> -  *    Chia-I Wu <olv@lunarg.com>
> -  */
> -
> -+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
> -+#define HIDDEN __attribute__((visibility("hidden")))
> -+#else
> -+#define HIDDEN
> -+#endif
> -
> - __asm__(".text\n"
> -         ".balign 32\n"
> -@@ -54,8 +59,8 @@ entry_patch_public(void)
> - {
> - }
> -
> --static char
> --x86_64_entry_start[];
> -+extern char
> -+x86_64_entry_start[] HIDDEN;
> -
> - mapi_func
> - entry_get_public(int slot)
> -diff --git a/src/mapi/entry_x86_tls.h b/src/mapi/entry_x86_tls.h
> -index 46d2ece..231b409 100644
> ---- a/src/mapi/entry_x86_tls.h
> -+++ b/src/mapi/entry_x86_tls.h
> -@@ -27,6 +27,12 @@
> -
> - #include <string.h>
> -
> -+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
> -+#define HIDDEN __attribute__((visibility("hidden")))
> -+#else
> -+#define HIDDEN
> -+#endif
> -+
> - __asm__(".text");
> -
> - __asm__("x86_current_tls:\n\t"
> -@@ -71,8 +77,8 @@ __asm__(".text");
> - extern unsigned long
> - x86_current_tls();
> -
> --static char x86_entry_start[];
> --static char x86_entry_end[];
> -+extern char x86_entry_start[] HIDDEN;
> -+extern char x86_entry_end[] HIDDEN;
> -
> - void
> - entry_patch_public(void)
> -diff --git a/src/mapi/entry_x86_tsd.h b/src/mapi/entry_x86_tsd.h
> -index ea7bacb..03d9735 100644
> ---- a/src/mapi/entry_x86_tsd.h
> -+++ b/src/mapi/entry_x86_tsd.h
> -@@ -25,6 +25,11 @@
> -  *    Chia-I Wu <olv@lunarg.com>
> -  */
> -
> -+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY
> -+#define HIDDEN __attribute__((visibility("hidden")))
> -+#else
> -+#define HIDDEN
> -+#endif
> -
> - #define X86_ENTRY_SIZE 32
> -
> -@@ -58,8 +63,8 @@ __asm__(".balign 32\n"
> - #include <string.h>
> - #include "u_execmem.h"
> -
> --static const char x86_entry_start[];
> --static const char x86_entry_end[];
> -+extern const char x86_entry_start[] HIDDEN;
> -+extern const char x86_entry_end[] HIDDEN;
> -
> - void
> - entry_patch_public(void)
> ---
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
> b/meta/recipes-graphics/mesa/mesa-gl_12.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_12.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_12.0.2.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_12.0.1.bb
> b/meta/recipes-graphics/mesa/mesa_12.0.2.bb
> similarity index 77%
> rename from meta/recipes-graphics/mesa/mesa_12.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_12.0.2.bb
> index 80189e3..12a5495 100644
> --- a/meta/recipes-graphics/mesa/mesa_12.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa_12.0.2.bb
> @@ -2,12 +2,11 @@ require ${BPN}.inc
>
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz =
\
>             file://replace_glibc_check_with_linux.patch \
> -           file://clang-compile-PR89599.patch \
>             file://disable-asm-on-non-gcc.patch \
>  "
>
> -SRC_URI[md5sum] =3D "972fd5ad5a63aeabf173fb9adefc6522"
> -SRC_URI[sha256sum] =3D "bab24fb79f78c876073527f515ed87
> 1fc9c81d816f66c8a0b051d8d653896389"
> +SRC_URI[md5sum] =3D "f19032b5cb5e362745f0c2accc28a641"
> +SRC_URI[sha256sum] =3D "d957a5cc371dcd7ff2aa0d87492f26
> 3aece46f79352f4520039b58b1f32552cb"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113d47f25dbcaf053c4aa676
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 9=
 September 2016 at 19:19, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=
=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@go=
oglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* remo=
ved patch was applied mainline<br>
* tested on RaspberryPi2 weston / lxqt / kde<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0.../mesa/files/clang-compile-<wbr>PR89599.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 116 ---------------------<br>
=C2=A0.../mesa/{<a href=3D"http://mesa-gl_12.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mesa-gl_12.0.1.bb</a> =3D&gt; <a href=3D"http://mesa-gl_12.0=
.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_12.0.2.bb</a>}=C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_12.0.1.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_12.0.1.bb</a> =3D&gt; <a href=3D"http://mesa_12.0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_12.0.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +-<br></blockquote><div><br></div><div>2.2 Milestone=
 3 is very close to release so this is unlikely to be accepted before 2.2 r=
elease scheduled next month. If you have a specific bug fix you need I sugg=
est backporting.</div><div><br></div><div>=C2=A0 Jussi</div><div><br></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
=C2=A03 files changed, 2 insertions(+), 119 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/mesa/<wbr>files/clang-compil=
e-PR89599.<wbr>patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_12.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_12.0.1.bb</a> =3D&gt; =
<a href=3D"http://mesa-gl_12.0.2.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa-gl_12.0.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_12.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_12.0.1.bb</a> =3D&gt; <a hre=
f=3D"http://mesa_12.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_12.0.=
2.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>files/clang-compile-PR89599.<w=
br>patch b/meta/recipes-graphics/mesa/<wbr>files/clang-compile-PR89599.<wbr=
>patch<br>
deleted file mode 100644<br>
index 48bd325..0000000<br>
--- a/meta/recipes-graphics/mesa/<wbr>files/clang-compile-PR89599.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,116 +0,0 @@<br>
-From 5ec140c17b54c25920091501b665b9<wbr>aa809cc5e8 Mon Sep 17 00:00:00 200=
1<br>
-From: Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com">mattst88@gmail=
.com</a>&gt;<br>
-Date: Mon, 11 Jul 2016 10:44:25 -0700<br>
-Subject: mapi: Massage code to allow clang to compile.<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-According to <a href=3D"https://llvm.org/bugs/show_bug.cgi?id=3D19778#c3" =
rel=3D"noreferrer" target=3D"_blank">https://llvm.org/bugs/show_<wbr>bug.cg=
i?id=3D19778#c3</a> this code<br>
-was violating the spec, resulting in it failing to compile.<br>
-<br>
-Cc: <a href=3D"mailto:mesa-stable@lists.freedesktop.org">mesa-stable@lists=
.freedesktop.<wbr>org</a><br>
-Co-authored-by: Tomasz Pawe=C5=82 Gajc &lt;<a href=3D"mailto:tpgxyz@gmail.=
com">tpgxyz@gmail.com</a>&gt;<br>
-Bugzilla: <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89599"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.freedesktop.org/<wbr>sho=
w_bug.cgi?id=3D89599</a><br>
-Reviewed-by: Emil Velikov &lt;<a href=3D"mailto:emil.velikov@collabora.com=
">emil.velikov@collabora.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 3799d8d..1ca8359 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -226,6 +226,7 @@ AX_GCC_FUNC_ATTRIBUTE([packed]<wbr>)<br>
- AX_GCC_FUNC_ATTRIBUTE([pure])<br>
- AX_GCC_FUNC_ATTRIBUTE([<wbr>returns_nonnull])<br>
- AX_GCC_FUNC_ATTRIBUTE([unused]<wbr>)<br>
-+AX_GCC_FUNC_ATTRIBUTE([<wbr>visibility])<br>
- AX_GCC_FUNC_ATTRIBUTE([warn_<wbr>unused_result])<br>
- AX_GCC_FUNC_ATTRIBUTE([weak])<br>
-<br>
-diff --git a/src/mapi/entry_x86-64_tls.h b/src/mapi/entry_x86-64_tls.h<br>
-index 38faccc..c5262a1 100644<br>
---- a/src/mapi/entry_x86-64_tls.h<br>
-+++ b/src/mapi/entry_x86-64_tls.h<br>
-@@ -25,6 +25,11 @@<br>
-=C2=A0 *=C2=A0 =C2=A0 Chia-I Wu &lt;<a href=3D"mailto:olv@lunarg.com">olv@=
lunarg.com</a>&gt;<br>
-=C2=A0 */<br>
-<br>
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY<br>
-+#define HIDDEN __attribute__((visibility(&quot;<wbr>hidden&quot;)))<br>
-+#else<br>
-+#define HIDDEN<br>
-+#endif<br>
-<br>
- __asm__(&quot;.text\n&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;.balign 32\n&quot;<br>
-@@ -54,8 +59,8 @@ entry_patch_public(void)<br>
- {<br>
- }<br>
-<br>
--static char<br>
--x86_64_entry_start[];<br>
-+extern char<br>
-+x86_64_entry_start[] HIDDEN;<br>
-<br>
- mapi_func<br>
- entry_get_public(int slot)<br>
-diff --git a/src/mapi/entry_x86_tls.h b/src/mapi/entry_x86_tls.h<br>
-index 46d2ece..231b409 100644<br>
---- a/src/mapi/entry_x86_tls.h<br>
-+++ b/src/mapi/entry_x86_tls.h<br>
-@@ -27,6 +27,12 @@<br>
-<br>
- #include &lt;string.h&gt;<br>
-<br>
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY<br>
-+#define HIDDEN __attribute__((visibility(&quot;<wbr>hidden&quot;)))<br>
-+#else<br>
-+#define HIDDEN<br>
-+#endif<br>
-+<br>
- __asm__(&quot;.text&quot;);<br>
-<br>
- __asm__(&quot;x86_current_tls:\n\t&quot;<br>
-@@ -71,8 +77,8 @@ __asm__(&quot;.text&quot;);<br>
- extern unsigned long<br>
- x86_current_tls();<br>
-<br>
--static char x86_entry_start[];<br>
--static char x86_entry_end[];<br>
-+extern char x86_entry_start[] HIDDEN;<br>
-+extern char x86_entry_end[] HIDDEN;<br>
-<br>
- void<br>
- entry_patch_public(void)<br>
-diff --git a/src/mapi/entry_x86_tsd.h b/src/mapi/entry_x86_tsd.h<br>
-index ea7bacb..03d9735 100644<br>
---- a/src/mapi/entry_x86_tsd.h<br>
-+++ b/src/mapi/entry_x86_tsd.h<br>
-@@ -25,6 +25,11 @@<br>
-=C2=A0 *=C2=A0 =C2=A0 Chia-I Wu &lt;<a href=3D"mailto:olv@lunarg.com">olv@=
lunarg.com</a>&gt;<br>
-=C2=A0 */<br>
-<br>
-+#ifdef HAVE_FUNC_ATTRIBUTE_VISIBIITY<br>
-+#define HIDDEN __attribute__((visibility(&quot;<wbr>hidden&quot;)))<br>
-+#else<br>
-+#define HIDDEN<br>
-+#endif<br>
-<br>
- #define X86_ENTRY_SIZE 32<br>
-<br>
-@@ -58,8 +63,8 @@ __asm__(&quot;.balign 32\n&quot;<br>
- #include &lt;string.h&gt;<br>
- #include &quot;u_execmem.h&quot;<br>
-<br>
--static const char x86_entry_start[];<br>
--static const char x86_entry_end[];<br>
-+extern const char x86_entry_start[] HIDDEN;<br>
-+extern const char x86_entry_end[] HIDDEN;<br>
-<br>
- void<br>
- entry_patch_public(void)<br>
---<br>
-cgit v0.10.2<br>
-<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_12.0.1.bb</a> b/meta/re=
cipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">m<wbr>esa-gl_12.0.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_12.0.1.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_12.0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_12.0.2.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">m<wbr>esa_12.0.1.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_12.0.2.bb" rel=3D"noreferrer" target=
=3D"_blank">m<wbr>esa_12.0.2.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">mes<wbr>a_12.0.1.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a_12.0.2.bb</a><br>
index 80189e3..12a5495 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_12.0.1.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_12.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_12.0.2.bb</a><br>
@@ -2,12 +2,11 @@ require ${BPN}.inc<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/${PV}=
/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.freedesk=
top.org/<wbr>pub/mesa/${PV}/mesa-${PV}.tar.<wbr>xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://replace_glibc_check_<wbr>w=
ith_linux.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://clang-compile-PR89599.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-asm-on-non-gcc.<wb=
r>patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>972fd5ad5a63aeabf173fb9adefc65<wbr>22&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>bab24fb79f78c876073527f515ed87<wbr>1fc9c=
81d816f66c8a0b051d8d65389<wbr>6389&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>f19032b5cb5e362745f0c2accc28a6<wbr>41&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>d957a5cc371dcd7ff2aa0d87492f26<wbr>3aece=
46f79352f4520039b58b1f325<wbr>52cb&quot;<br>
<br>
=C2=A0#because we cannot rely on the fact that all apps will use pkgconfig,=
<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113d47f25dbcaf053c4aa676--
