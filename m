Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0094360BA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:09:04 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id t12so3001768vso.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sP3JMN01QW/2ocbtaFTKX0L3M5cnk2Q7+/dtXCqWZSk=;
	b=iKZ4/b01I1/ibNIIE54g5oc5JghoCOhco5JJBzDupLKoV1RrYzPuKVICeC0eumH81h
	MVxYFwJ1S90b/qWC7FQ9FHqasgV6ncXc651mbSGlfRWoN/ahKkhI/ceHTkOWhW3/ZxYw
	fAeBruIImS+SwaXL2UeoCVnw5vZyXmeFIO8pBQFBZj/2l2iiVgn5VNVvphVc65ORfS6E
	AOxjQ8zIbD8Niw5mrfGAvAo2Kupmk8OdMd14wz56uq2j0dG1HtNiSAezViuGh7YnwSp+
	uzJ6NT75Lmh8rhz2+esk+7SaQxUDRkkPEeW6F4D6NZQSpC0fI9HP9IfQtVNoXpeRG/DF
	RV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sP3JMN01QW/2ocbtaFTKX0L3M5cnk2Q7+/dtXCqWZSk=;
	b=OjexY4uiPP41KWGGTozejoWnJh89C95GvfIqdBPlVAzb0wOfZw+ruWfkJJVfVtI/ra
	6AU0PU7Uggx+r+dsaWRh9MI98G9W3uWN0CrV0FS/vSqVH1nV3BMdd2X/xgdrHuc7Qj5r
	M5n5RUxr7Did5O7mQaWM+P0LEYs43Q1kSNoRINJCLyyu12bjnG/4EcS/l2Imrh6zUSA1
	QFFTXLdNtJLygJ6+NGAvSMp0MKxVs+rCVj6xxlVbPY5wggYANmvvutcD/ch50LRTbLjm
	1rMGIlsfkyPXjsFz6Kg0haPQPREu9cJlKSXFwf2sO/LJXeYtUS2g1G70gIp5JdK/L5MQ
	iO5Q==
X-Gm-Message-State: APjAAAVzJHzLTk51zdY1VqZcFHcUhrNkUJNUL+TpsSrw+rEdSnPVuMAd
	KBLBnlvRN3NN/xP4kL6PDRLDyOJ3X6IgLXwZFec=
X-Google-Smtp-Source: APXvYqwFG+Re8nQPQqXCSt+DdtJOy8S7PNabeqH8xbyNMbl1xoT9uWZsF4mxux2HJCbu38IwIUAtMp3cXnnOjj0tfAI=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr14285976vsq.94.1581581345575; 
	Thu, 13 Feb 2020 00:09:05 -0800 (PST)
MIME-Version: 1.0
References: <1581575024-31531-1-git-send-email-denis@denix.org>
In-Reply-To: <1581575024-31531-1-git-send-email-denis@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 09:08:54 +0100
Message-ID: <CANNYZj-=MfTekSQ_pObBWFyOs0=7hA8bX9AB36Dpfz7M3BuZgA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] wayland: upgrade 1.17.0 -> 1.18.0
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
X-List-Received-Date: Thu, 13 Feb 2020 08:09:05 -0000
Content-Type: multipart/alternative; boundary="0000000000004959c1059e709a9e"

--0000000000004959c1059e709a9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you prepare the meson conversion as a separate patch please?

Alex

On Thu 13. Feb 2020 at 7.29, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> This is the official release for Wayland 1.18. The main new features in
> this release are:
>
> - Add support for the Meson build system (autotools is still supported
>   but will be removed in a future release)
> - Add API to tag proxy objects to allow applications and toolkits to
>   share the same Wayland connection
> - Track wayland-server timers in user-space to prevent creating too
>   many FDs
> - Add wl_global_remove, a new function to mitigate race conditions with
>   globals
>
> https://lists.freedesktop.org/archives/wayland-devel/2020-February/041207=
.html
>
> 2 upstreamed patches are dropped.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...1-scanner-Add-configure-check-for-strndup.patch |  50 -------
>  ...l_priv_signal-to-wayland-server-private.h.patch | 166
> ---------------------
>  .../{wayland_1.17.0.bb =3D> wayland_1.18.0.bb}       |   8 +-
>  3 files changed, 3 insertions(+), 221 deletions(-)
>  delete mode 100644
> meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-fo=
r-strndup.patch
>  delete mode 100644
> meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland=
-server-private.h.patch
>  rename meta/recipes-graphics/wayland/{wayland_1.17.0.bb =3D>
> wayland_1.18.0.bb} (84%)
>
> diff --git
> a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-=
for-strndup.patch
> b/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-=
for-strndup.patch
> deleted file mode 100644
> index c443587..0000000
> ---
> a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-=
for-strndup.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 3c8b4467a1ca229e72fb5223787ed400a19c65c0 Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> -Date: Fri, 25 Oct 2019 21:03:23 -0500
> -Subject: [PATCH] scanner: Add configure check for strndup
> -
> -Some platforms may not have strndup() (e.g. MinGW), so provide a
> -equivalent implementation if it's not found.
> -
> -Upstream-Status: Accepted [4a1f348c20157db7bd7c759fdeb23fbe8729c571]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - configure.ac  |  2 +-
> - src/scanner.c | 11 +++++++++++
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 8d56f2b..1c99e21 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -63,7 +63,7 @@ fi
> - AC_SUBST(GCC_CFLAGS)
> -
> - AC_CHECK_HEADERS([sys/prctl.h])
> --AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl])
> -+AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl strndup])
> -
> - AC_ARG_ENABLE([libraries],
> -             [AC_HELP_STRING([--disable-libraries],
> -diff --git a/src/scanner.c b/src/scanner.c
> -index a94be5d..27004bc 100644
> ---- a/src/scanner.c
> -+++ b/src/scanner.c
> -@@ -916,6 +916,17 @@ verify_arguments(struct parse_context *ctx,
> -
> - }
> -
> -+#ifndef HAVE_STRNDUP
> -+char *
> -+strndup(const char *s, size_t size)
> -+{
> -+      char *r =3D malloc(size + 1);
> -+      strncpy(r, s, size);
> -+      r[size] =3D '\0';
> -+      return r;
> -+}
> -+#endif
> -+
> - static void
> - end_element(void *data, const XML_Char *name)
> - {
> diff --git
> a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayla=
nd-server-private.h.patch
> b/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayla=
nd-server-private.h.patch
> deleted file mode 100644
> index b05b875..0000000
> ---
> a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayla=
nd-server-private.h.patch
> +++ /dev/null
> @@ -1,166 +0,0 @@
> -From e746f3bf7c8bb2f5dcf9e93edffc23b56eff12d0 Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> -Date: Tue, 5 Nov 2019 09:09:50 -0600
> -Subject: [PATCH] Move wl_priv_signal to wayland-server-private.h
> -
> -Including wayland-server-core.h in wayland-private.h is problematic
> -because wayland-private.h is included by wayland-scanner which should be
> -able to build against non-POSIX platforms (e.g. MinGW). The only reason
> -that wayland-server-core.h was included in wayland-private.h was for the
> -wl_private_signal definitions, so move those to a
> -wayland-server-private.h file that can be included by both
> -wayland-server.c and the tests.
> -
> -Upstream-Status: Accepted [e7d88f35eb89cf0cc77cbddd834cacc63683a9cc]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - Makefile.am                  |  3 +-
> - src/wayland-private.h        | 22 +--------------
> - src/wayland-server-private.h | 53 ++++++++++++++++++++++++++++++++++++
> - src/wayland-server.c         |  1 +
> - tests/newsignal-test.c       |  2 +-
> - 5 files changed, 58 insertions(+), 23 deletions(-)
> - create mode 100644 src/wayland-server-private.h
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index f47d055..026d981 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -56,7 +56,8 @@ libwayland_private_la_SOURCES =3D                     =
 \
> -       src/connection.c                        \
> -       src/wayland-os.c                        \
> -       src/wayland-os.h                        \
> --      src/wayland-private.h
> -+      src/wayland-private.h                   \
> -+      src/wayland-server-private.h
> -
> - include_HEADERS =3D                             \
> -       src/wayland-util.h                      \
> -diff --git a/src/wayland-private.h b/src/wayland-private.h
> -index 29516ec..dc7d12f 100644
> ---- a/src/wayland-private.h
> -+++ b/src/wayland-private.h
> -@@ -31,11 +31,11 @@
> - #include <stdarg.h>
> - #include <stdlib.h>
> - #include <stdint.h>
> -+#include <stdbool.h>
> -
> - #define WL_HIDE_DEPRECATED 1
> -
> - #include "wayland-util.h"
> --#include "wayland-server-core.h"
> -
> - /* Invalid memory address */
> - #define WL_ARRAY_POISON_PTR (void *) 4
> -@@ -236,26 +236,6 @@ zalloc(size_t s)
> -       return calloc(1, s);
> - }
> -
> --struct wl_priv_signal {
> --      struct wl_list listener_list;
> --      struct wl_list emit_list;
> --};
> --
> --void
> --wl_priv_signal_init(struct wl_priv_signal *signal);
> --
> --void
> --wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener
> *listener);
> --
> --struct wl_listener *
> --wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t
> notify);
> --
> --void
> --wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
> --
> --void
> --wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
> --
> - void
> - wl_connection_close_fds_in(struct wl_connection *connection, int max);
> -
> -diff --git a/src/wayland-server-private.h b/src/wayland-server-private.h
> -new file mode 100644
> -index 0000000..23fa458
> ---- /dev/null
> -+++ b/src/wayland-server-private.h
> -@@ -0,0 +1,53 @@
> -+/*
> -+ * Copyright =C2=A9 2008-2011 Kristian H=C3=B8gsberg
> -+ * Copyright =C2=A9 2011 Intel Corporation
> -+ * Copyright =C2=A9 2013 Jason Ekstrand
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sublicense, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial
> -+ * portions of the Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> -+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> -+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> -+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> -+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> -+ * SOFTWARE.
> -+ */
> -+
> -+#ifndef WAYLAND_SERVER_PRIVATE_H
> -+#define WAYLAND_SERVER_PRIVATE_H
> -+
> -+#include "wayland-server-core.h"
> -+
> -+struct wl_priv_signal {
> -+      struct wl_list listener_list;
> -+      struct wl_list emit_list;
> -+};
> -+
> -+void
> -+wl_priv_signal_init(struct wl_priv_signal *signal);
> -+
> -+void
> -+wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener
> *listener);
> -+
> -+struct wl_listener *
> -+wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t
> notify);
> -+
> -+void
> -+wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
> -+
> -+void
> -+wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
> -+
> -+#endif
> -diff --git a/src/wayland-server.c b/src/wayland-server.c
> -index 19f6a76..d6f0206 100644
> ---- a/src/wayland-server.c
> -+++ b/src/wayland-server.c
> -@@ -45,6 +45,7 @@
> -
> - #include "wayland-util.h"
> - #include "wayland-private.h"
> -+#include "wayland-server-private.h"
> - #include "wayland-server.h"
> - #include "wayland-os.h"
> -
> -diff --git a/tests/newsignal-test.c b/tests/newsignal-test.c
> -index 47c429b..f3a7bd9 100644
> ---- a/tests/newsignal-test.c
> -+++ b/tests/newsignal-test.c
> -@@ -26,7 +26,7 @@
> - #include <assert.h>
> -
> - #include "test-runner.h"
> --#include "wayland-private.h"
> -+#include "wayland-server-private.h"
> -
> - static void
> - signal_notify(struct wl_listener *listener, void *data)
> diff --git a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/wayland/wayland_1.17.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.18.0.bb
> index 12916a0..7a3f075 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> @@ -13,12 +13,10 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db31d8f53b6aaf2b4985d7dd7810a70d1 \
>  DEPENDS =3D "expat libffi wayland-native"
>
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
> -          file://fixpathinpcfiles.patch \
> -           file://0001-scanner-Add-configure-check-for-strndup.patch \
> -
>  file://0002-Move-wl_priv_signal-to-wayland-server-private.h.patch \
> +           file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] =3D "d91f970aea11fd549eae023d06f91af3"
> -SRC_URI[sha256sum] =3D
> "72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4"
> +SRC_URI[md5sum] =3D "23317697b6e3ff2e1ac8c5ba3ed57b65"
> +SRC_URI[sha256sum] =3D
> "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
>
>  UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004959c1059e709a9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Can you prepare the meson conversion as a separate p=
atch please?</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu 13. Feb 2020 at 7.29, Denys Dmytriyenko &lt;<a href=3D"mailto:de=
nis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" targ=
et=3D"_blank">denys@ti.com</a>&gt;<br>
<br>
This is the official release for Wayland 1.18. The main new features in<br>
this release are:<br>
<br>
- Add support for the Meson build system (autotools is still supported<br>
=C2=A0 but will be removed in a future release)<br>
- Add API to tag proxy objects to allow applications and toolkits to<br>
=C2=A0 share the same Wayland connection<br>
- Track wayland-server timers in user-space to prevent creating too<br>
=C2=A0 many FDs<br>
- Add wl_global_remove, a new function to mitigate race conditions with<br>
=C2=A0 globals<br>
<a href=3D"https://lists.freedesktop.org/archives/wayland-devel/2020-Februa=
ry/041207.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/wayland-devel/2020-February/041207.html</a><br>
<br>
2 upstreamed patches are dropped.<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0...1-scanner-Add-configure-check-for-strndup.patch |=C2=A0 50 -------=
<br>
=C2=A0...l_priv_signal-to-wayland-server-private.h.patch | 166 ------------=
---------<br>
=C2=A0.../{<a href=3D"http://wayland_1.17.0.bb" rel=3D"noreferrer" target=
=3D"_blank">wayland_1.17.0.bb</a> =3D&gt; <a href=3D"http://wayland_1.18.0.=
bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A03 files changed, 3 insertions(+), 221 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner=
-Add-configure-check-for-strndup.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Move-wl=
_priv_signal-to-wayland-server-private.h.patch<br>
=C2=A0rename meta/recipes-graphics/wayland/{<a href=3D"http://wayland_1.17.=
0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.17.0.bb</a> =3D&gt; <a=
 href=3D"http://wayland_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">way=
land_1.18.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configu=
re-check-for-strndup.patch b/meta/recipes-graphics/wayland/wayland/0001-sca=
nner-Add-configure-check-for-strndup.patch<br>
deleted file mode 100644<br>
index c443587..0000000<br>
--- a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-chec=
k-for-strndup.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From 3c8b4467a1ca229e72fb5223787ed400a19c65c0 Mon Sep 17 00:00:00 2001<br>
-From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_b=
lank">JPEWhacker@gmail.com</a>&gt;<br>
-Date: Fri, 25 Oct 2019 21:03:23 -0500<br>
-Subject: [PATCH] scanner: Add configure check for strndup<br>
-<br>
-Some platforms may not have strndup() (e.g. MinGW), so provide a<br>
-equivalent implementation if it&#39;s not found.<br>
-<br>
-Upstream-Status: Accepted [4a1f348c20157db7bd7c759fdeb23fbe8729c571]<br>
-Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" tar=
get=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 |=C2=A0 2 +-<br>
- src/scanner.c | 11 +++++++++++<br>
- 2 files changed, 12 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 8d56f2b..1c99e21 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -63,7 +63,7 @@ fi<br>
- AC_SUBST(GCC_CFLAGS)<br>
- <br>
- AC_CHECK_HEADERS([sys/prctl.h])<br>
--AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl])<br>
-+AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl strndup])<br>
- <br>
- AC_ARG_ENABLE([libraries],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_HELP_STRING([--disable=
-libraries],<br>
-diff --git a/src/scanner.c b/src/scanner.c<br>
-index a94be5d..27004bc 100644<br>
---- a/src/scanner.c<br>
-+++ b/src/scanner.c<br>
-@@ -916,6 +916,17 @@ verify_arguments(struct parse_context *ctx,<br>
- <br>
- }<br>
- <br>
-+#ifndef HAVE_STRNDUP<br>
-+char *<br>
-+strndup(const char *s, size_t size)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 char *r =3D malloc(size + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(r, s, size);<br>
-+=C2=A0 =C2=A0 =C2=A0 r[size] =3D &#39;\0&#39;;<br>
-+=C2=A0 =C2=A0 =C2=A0 return r;<br>
-+}<br>
-+#endif<br>
-+<br>
- static void<br>
- end_element(void *data, const XML_Char *name)<br>
- {<br>
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal=
-to-wayland-server-private.h.patch b/meta/recipes-graphics/wayland/wayland/=
0002-Move-wl_priv_signal-to-wayland-server-private.h.patch<br>
deleted file mode 100644<br>
index b05b875..0000000<br>
--- a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-way=
land-server-private.h.patch<br>
+++ /dev/null<br>
@@ -1,166 +0,0 @@<br>
-From e746f3bf7c8bb2f5dcf9e93edffc23b56eff12d0 Mon Sep 17 00:00:00 2001<br>
-From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_b=
lank">JPEWhacker@gmail.com</a>&gt;<br>
-Date: Tue, 5 Nov 2019 09:09:50 -0600<br>
-Subject: [PATCH] Move wl_priv_signal to wayland-server-private.h<br>
-<br>
-Including wayland-server-core.h in wayland-private.h is problematic<br>
-because wayland-private.h is included by wayland-scanner which should be<b=
r>
-able to build against non-POSIX platforms (e.g. MinGW). The only reason<br=
>
-that wayland-server-core.h was included in wayland-private.h was for the<b=
r>
-wl_private_signal definitions, so move those to a<br>
-wayland-server-private.h file that can be included by both<br>
-wayland-server.c and the tests.<br>
-<br>
-Upstream-Status: Accepted [e7d88f35eb89cf0cc77cbddd834cacc63683a9cc]<br>
-Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" tar=
get=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
----<br>
- Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 3 +-<br>
- src/wayland-private.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +--------------<br>
- src/wayland-server-private.h | 53 ++++++++++++++++++++++++++++++++++++<br=
>
- src/wayland-server.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
- tests/newsignal-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
- 5 files changed, 58 insertions(+), 23 deletions(-)<br>
- create mode 100644 src/wayland-server-private.h<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index f47d055..026d981 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -56,7 +56,8 @@ libwayland_private_la_SOURCES =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/connection.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/wayland-os.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/wayland-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 src/wayland-private.h<br>
-+=C2=A0 =C2=A0 =C2=A0 src/wayland-private.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 =C2=A0 src/wayland-server-private.h<br>
- <br>
- include_HEADERS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/wayland-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-diff --git a/src/wayland-private.h b/src/wayland-private.h<br>
-index 29516ec..dc7d12f 100644<br>
---- a/src/wayland-private.h<br>
-+++ b/src/wayland-private.h<br>
-@@ -31,11 +31,11 @@<br>
- #include &lt;stdarg.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;stdint.h&gt;<br>
-+#include &lt;stdbool.h&gt;<br>
- <br>
- #define WL_HIDE_DEPRECATED 1<br>
- <br>
- #include &quot;wayland-util.h&quot;<br>
--#include &quot;wayland-server-core.h&quot;<br>
- <br>
- /* Invalid memory address */<br>
- #define WL_ARRAY_POISON_PTR (void *) 4<br>
-@@ -236,26 +236,6 @@ zalloc(size_t s)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return calloc(1, s);<br>
- }<br>
- <br>
--struct wl_priv_signal {<br>
--=C2=A0 =C2=A0 =C2=A0 struct wl_list listener_list;<br>
--=C2=A0 =C2=A0 =C2=A0 struct wl_list emit_list;<br>
--};<br>
--<br>
--void<br>
--wl_priv_signal_init(struct wl_priv_signal *signal);<br>
--<br>
--void<br>
--wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *lis=
tener);<br>
--<br>
--struct wl_listener *<br>
--wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify=
);<br>
--<br>
--void<br>
--wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);<br>
--<br>
--void<br>
--wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);<br>
--<br>
- void<br>
- wl_connection_close_fds_in(struct wl_connection *connection, int max);<br=
>
- <br>
-diff --git a/src/wayland-server-private.h b/src/wayland-server-private.h<b=
r>
-new file mode 100644<br>
-index 0000000..23fa458<br>
---- /dev/null<br>
-+++ b/src/wayland-server-private.h<br>
-@@ -0,0 +1,53 @@<br>
-+/*<br>
-+ * Copyright =C2=A9 2008-2011 Kristian H=C3=B8gsberg<br>
-+ * Copyright =C2=A9 2011 Intel Corporation<br>
-+ * Copyright =C2=A9 2013 Jason Ekstrand<br>
-+ *<br>
-+ * Permission is hereby granted, free of charge, to any person obtaining<=
br>
-+ * a copy of this software and associated documentation files (the<br>
-+ * &quot;Software&quot;), to deal in the Software without restriction, in=
cluding<br>
-+ * without limitation the rights to use, copy, modify, merge, publish,<br=
>
-+ * distribute, sublicense, and/or sell copies of the Software, and to<br>
-+ * permit persons to whom the Software is furnished to do so, subject to<=
br>
-+ * the following conditions:<br>
-+ *<br>
-+ * The above copyright notice and this permission notice (including the<b=
r>
-+ * next paragraph) shall be included in all copies or substantial<br>
-+ * portions of the Software.<br>
-+ *<br>
-+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KI=
ND,<br>
-+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
-+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
-+ * NONINFRINGEMENT.=C2=A0 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLD=
ERS<br>
-+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN<br>
-+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN<br>
-+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE<br>
-+ * SOFTWARE.<br>
-+ */<br>
-+<br>
-+#ifndef WAYLAND_SERVER_PRIVATE_H<br>
-+#define WAYLAND_SERVER_PRIVATE_H<br>
-+<br>
-+#include &quot;wayland-server-core.h&quot;<br>
-+<br>
-+struct wl_priv_signal {<br>
-+=C2=A0 =C2=A0 =C2=A0 struct wl_list listener_list;<br>
-+=C2=A0 =C2=A0 =C2=A0 struct wl_list emit_list;<br>
-+};<br>
-+<br>
-+void<br>
-+wl_priv_signal_init(struct wl_priv_signal *signal);<br>
-+<br>
-+void<br>
-+wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *lis=
tener);<br>
-+<br>
-+struct wl_listener *<br>
-+wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify=
);<br>
-+<br>
-+void<br>
-+wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);<br>
-+<br>
-+void<br>
-+wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);<br>
-+<br>
-+#endif<br>
-diff --git a/src/wayland-server.c b/src/wayland-server.c<br>
-index 19f6a76..d6f0206 100644<br>
---- a/src/wayland-server.c<br>
-+++ b/src/wayland-server.c<br>
-@@ -45,6 +45,7 @@<br>
- <br>
- #include &quot;wayland-util.h&quot;<br>
- #include &quot;wayland-private.h&quot;<br>
-+#include &quot;wayland-server-private.h&quot;<br>
- #include &quot;wayland-server.h&quot;<br>
- #include &quot;wayland-os.h&quot;<br>
- <br>
-diff --git a/tests/newsignal-test.c b/tests/newsignal-test.c<br>
-index 47c429b..f3a7bd9 100644<br>
---- a/tests/newsignal-test.c<br>
-+++ b/tests/newsignal-test.c<br>
-@@ -26,7 +26,7 @@<br>
- #include &lt;assert.h&gt;<br>
- <br>
- #include &quot;test-runner.h&quot;<br>
--#include &quot;wayland-private.h&quot;<br>
-+#include &quot;wayland-server-private.h&quot;<br>
- <br>
- static void<br>
- signal_notify(struct wl_listener *listener, void *data)<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.17.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.17.0.bb</a> b/meta/reci=
pes-graphics/wayland/<a href=3D"http://wayland_1.18.0.bb" rel=3D"noreferrer=
" target=3D"_blank">wayland_1.18.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.17.0.=
bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.17.0.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.bb=
" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
index 12916a0..7a3f075 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.17.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.17.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.bb" re=
l=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
@@ -13,12 +13,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db31d8f5=
3b6aaf2b4985d7dd7810a70d1 \<br>
=C2=A0DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/releases=
/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://=
wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fixpathinpcfiles.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-scanner-Add-configure=
-check-for-strndup.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Move-wl_priv_signal-t=
o-wayland-server-private.h.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fixpathinpcfiles.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;d91f970aea11fd549eae023d06f91af3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94=
ee676c6b276f95f91a4&quot;<br>
+SRC_URI[md5sum] =3D &quot;23317697b6e3ff2e1ac8c5ba3ed57b65&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4675a79f091020817a98fd0484e7208c8762242266967=
f55a67776936c2e294d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesktop.o=
rg/releases.html" rel=3D"noreferrer" target=3D"_blank">https://wayland.free=
desktop.org/releases.html</a>&quot;<br>
<br>
-- <br>
2.7.4<br>
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

--0000000000004959c1059e709a9e--
