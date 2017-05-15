Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A607271C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 10:49:58 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id j17so26461291ybj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wXHgGxihl9dBgeSnFCZim0uDAKF7dp0ugd1nl61SvXA=;
	b=Le6g9cmxfowMMdTuBqoVvXduq2uD1a5pPmF3TW89pNb/tKuYcWIaiXiUKW+rvpiV7W
	gzHq15QYL2pfgojJU9EH1P3xsnWLZS7PfQoieacNrkHZm2qdJkHIns6A3qhVjc74VenR
	Roz2E3w3aUe/i8KHPhsSD4VbDuU1S0vt9Rc1xA1BUvzmI9YwmWm3NN9fyjTsy/bhSUcH
	CVrJzBQiFkBC52GYxiR/eSB6JjUl4DfjMbPcChxDwePUpwHh9ABw/BsYcb9It9wUjuGh
	Ze1I4Rekjib7mnZZvu9FpKwGhw1ThsdtMniVnjk0y65LQk5zsABeFOUGp93yLgS/O2dG
	fjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wXHgGxihl9dBgeSnFCZim0uDAKF7dp0ugd1nl61SvXA=;
	b=JGjvtGKZMqml3WN9jEgkSjGA3Bxw/QwA6MF+4C8EtUeKavq6hP5NLoABpva+s/m3c1
	bkmC9kKyo1IF+6vPEwsjwYEIL/WSJa5QJUDL8SAeBISeGoKnaebI7E4eeZO+0clOzpSU
	M2NePcTIhsFGDDLgl58cgX3WTI8vW264yHDhkEhvv1RBopU58LFt0VIFrimgnR+6zJ2u
	b8E5bMFC9hYBfv/AlMD1RyYcP08FfexyMSM5m9EBrh3PCpFBZAkZ0eGa7Ndt2QHnnAMu
	sd/H+Q37PTcS69i7gzRt7gbYYEDKCT44YgM40iuFlH0+Pw3deaVP+TgONz3WSadP2Xs4
	Jdfg==
X-Gm-Message-State: AODbwcCotNHW495Xl3LPP0Sq4LQ2Ke8RB+lq585jTG0diHtc6LcbWn4S
	uXacTxFQt/386hAxa8VXI9GRqADLTg1X
X-Received: by 10.37.170.66 with SMTP id s60mr4024104ybi.150.1494845399396;
	Mon, 15 May 2017 03:49:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.194.134 with HTTP; Mon, 15 May 2017 03:49:28 -0700 (PDT)
In-Reply-To: <1494839116-32279-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1494839116-32279-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 15 May 2017 13:49:28 +0300
Message-ID: <CAHiDW_FuoagmNjK=XV3OeaYSq+AAR6NvcZ9RnKFabN0=DUFHGQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Mon, 15 May 2017 10:49:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c19e700068669054f8dd1aa"

--94eb2c19e700068669054f8dd1aa
Content-Type: text/plain; charset="UTF-8"

On 15 May 2017 at 12:05, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade libnl from 3.2.29 to 3.3.0.
> 2) Delete patch "fix-pktloc_syntax_h-race.patch", since it is  integrated
> upstream.
> 3) Add patch "musl-header-conflict.patch" to fix musl compile error.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 36 -------------
>  .../libnl/libnl/musl-header-conflict.patch         | 59
> ++++++++++++++++++++++
>  .../libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb}      |  7 +--
>  3 files changed, 63 insertions(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-
> race.patch
>  create mode 100644 meta/recipes-support/libnl/libnl/musl-header-conflict.
> patch
>  rename meta/recipes-support/libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb}
> (88%)
>
> diff --git a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> deleted file mode 100644
> index 79aa0bd..0000000
> --- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -libnl has progressed to 0.3.2 and there does not appear to be any
> -"make -j" issues with this build after my limited testing on that
> -newer version so we can assume this issue is fixed upstream
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> -
> -Index: libnl-3.2.25/lib/Makefile.am
> -===================================================================
> ---- libnl-3.2.25.orig/lib/Makefile.am
> -+++ libnl-3.2.25/lib/Makefile.am
> -@@ -46,9 +46,12 @@ CLEANFILES = \
> -
> - # Hack to avoid using ylwrap. It does not function correctly in
> combination
> - # with --header-file=
> -+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
> -+route/pktloc_grammar.h: route/pktloc_grammar.c
> - route/pktloc_grammar.c: route/pktloc_grammar.l
> -       $(AM_V_GEN) $(MKDIR_P) route; $(FLEX) --header-file=route/pktloc_grammar.h
> $(LFLAGS) -o $@ $^
> -
> -+route/pktloc_syntax.h: route/pktloc_syntax.c
> - route/pktloc_syntax.c: route/pktloc_syntax.y
> -       $(AM_V_GEN) $(MKDIR_P) route; $(YACC) -d $(YFLAGS) -o $@ $^
> -
> -@@ -102,7 +105,9 @@ BUILT_SOURCES = \
> -       route/cls/ematch_grammar.c \
> -       route/cls/ematch_syntax.c \
> -       route/pktloc_grammar.c \
> --      route/pktloc_syntax.c
> -+   route/pktloc_syntax.c \
> -+   route/pktloc_syntax.h \
> -+   route/pktloc_grammar.h
> -
> - EXTRA_DIST = \
> -       route/pktloc_grammar.l \
> diff --git a/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
> b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
> new file mode 100644
> index 0000000..5363685
> --- /dev/null
> +++ b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
> @@ -0,0 +1,59 @@
> +From fa1ecb21bd612c0f7c0bd380c15d058227451e4e Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Tue, 16 May 2017 02:30:21 +0900
> +Subject: [PATCH] Fix musl compile error like:
> +
> +In file included from ../libnl-3.3.0/include/linux-
> private/linux/ipv6.h:5:0,
> +                 from ../libnl-3.3.0/include/
> netlink-private/netlink.h:54,
> +                 from ../libnl-3.3.0/lib/nl.c:28:
> +../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error:
> +redefinition of 'struct in6_addr'
> + struct in6_addr {
> +        ^~~~~~~~
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + include/linux-private/linux/if_bridge.h | 1 -
> + include/linux-private/linux/ipv6.h      | 1 -
> + include/netlink-private/netlink.h       | 1 -
> + 3 files changed, 3 deletions(-)
> +
> +diff --git a/include/linux-private/linux/if_bridge.h
> b/include/linux-private/linux/if_bridge.h
> +index f24050b..8f7490c 100644
> +--- a/include/linux-private/linux/if_bridge.h
> ++++ b/include/linux-private/linux/if_bridge.h
> +@@ -15,7 +15,6 @@
> +
> + #include <linux/types.h>
> + #include <linux/if_ether.h>
> +-#include <linux/in6.h>
> +
> + #define SYSFS_BRIDGE_ATTR     "bridge"
> + #define SYSFS_BRIDGE_FDB      "brforward"
> +diff --git a/include/linux-private/linux/ipv6.h
> b/include/linux-private/linux/ipv6.h
> +index e05e684..f16349d 100644
> +--- a/include/linux-private/linux/ipv6.h
> ++++ b/include/linux-private/linux/ipv6.h
> +@@ -2,7 +2,6 @@
> + #define _IPV6_H
> +
> + #include <asm/byteorder.h>
> +-#include <linux/in6.h>
> +
> + /* The latest drafts declared increase in minimal mtu up to 1280. */
> +
> +diff --git a/include/netlink-private/netlink.h b/include/netlink-private/
> netlink.h
> +index dd07c10..25ee07f 100644
> +--- a/include/netlink-private/netlink.h
> ++++ b/include/netlink-private/netlink.h
> +@@ -30,7 +30,6 @@
> + #include <limits.h>
> + #include <search.h>
> +
> +-#include <arpa/inet.h>
> + #include <netdb.h>
> +
> + #include <defs.h>
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb
> b/meta/recipes-support/libnl/libnl_3.3.0.bb
> similarity index 88%
> rename from meta/recipes-support/libnl/libnl_3.2.29.bb
> rename to meta/recipes-support/libnl/libnl_3.3.0.bb
> index 7d4839b..9138aa8 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
> +++ b/meta/recipes-support/libnl/libnl_3.3.0.bb
> @@ -10,13 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 4fbd65380cdd255951079008b364516c"
>  DEPENDS = "flex-native bison-native"
>
>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}$
> {@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
> -           file://fix-pktloc_syntax_h-race.patch \
>             file://fix-pc-file.patch \
>  "
>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>
> -SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
> -SRC_URI[sha256sum] = "0beb593dc6abfffa18a5c787b27884
> 979c1b7e7f1fd468c801e3cc938a685922"
> +SRC_URI_append_libc-musl = "file://musl-header-conflict.patch"
>

Does the patched version not build with glibc or why is this only patched
for musl?

Also patch seems to be missing Upstream-Status.

Jussi

--94eb2c19e700068669054f8dd1aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 15 May 2017 at 12:05, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
HOEnZb"><div class=3D"h5">1) Upgrade libnl from 3.2.29 to 3.3.0.<br>
2) Delete patch &quot;fix-pktloc_syntax_h-race.<wbr>patch&quot;, since it i=
s=C2=A0 integrated upstream.<br>
3) Add patch &quot;musl-header-conflict.patch&quot; to fix musl compile err=
or.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../libnl/libnl/fix-pktloc_<wbr>syntax_h-race.patch=C2=A0 =C2=A0 =C2=
=A0| 36 -------------<br>
=C2=A0.../libnl/libnl/musl-header-<wbr>conflict.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 59 ++++++++++++++++++++++<br>
=C2=A0.../libnl/{<a href=3D"http://libnl_3.2.29.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libnl_3.2.29.bb</a> =3D&gt; <a href=3D"http://libnl_3.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libnl_3.3.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 +--<br>
=C2=A03 files changed, 63 insertions(+), 39 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/libnl/<wbr>libnl/fix-pktloc_s=
yntax_h-<wbr>race.patch<br>
=C2=A0create mode 100644 meta/recipes-support/libnl/<wbr>libnl/musl-header-=
conflict.<wbr>patch<br>
=C2=A0rename meta/recipes-support/libnl/{<a href=3D"http://libnl_3.2.29.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>bnl_3.2.29.bb</a> =3D&gt; <a h=
ref=3D"http://libnl_3.3.0.bb" rel=3D"noreferrer" target=3D"_blank">libnl_3.=
3.0.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-support/libnl/<wbr>libnl/fix-pktloc_syntax_h-<wbr=
>race.patch b/meta/recipes-support/libnl/<wbr>libnl/fix-pktloc_syntax_h-<wb=
r>race.patch<br>
deleted file mode 100644<br>
index 79aa0bd..0000000<br>
--- a/meta/recipes-support/libnl/<wbr>libnl/fix-pktloc_syntax_h-<wbr>race.p=
atch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-libnl has progressed to 0.3.2 and there does not appear to be any<br>
-&quot;make -j&quot; issues with this build after my limited testing on tha=
t<br>
-newer version so we can assume this issue is fixed upstream<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">=
martin.jansa@gmail.com</a>&gt;<br>
-<br>
-Index: libnl-3.2.25/lib/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libnl-3.2.25.orig/lib/<wbr>Makefile.am<br>
-+++ libnl-3.2.25/lib/Makefile.am<br>
-@@ -46,9 +46,12 @@ CLEANFILES =3D \<br>
-<br>
- # Hack to avoid using ylwrap. It does not function correctly in combinati=
on<br>
- # with --header-file=3D<br>
-+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h<br>
-+route/pktloc_grammar.h: route/pktloc_grammar.c<br>
- route/pktloc_grammar.c: route/pktloc_grammar.l<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) $(MKDIR_P) route; $(FLEX) --header-=
file=3Droute/pktloc_<wbr>grammar.h $(LFLAGS) -o $@ $^<br>
-<br>
-+route/pktloc_syntax.h: route/pktloc_syntax.c<br>
- route/pktloc_syntax.c: route/pktloc_syntax.y<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) $(MKDIR_P) route; $(YACC) -d $(YFLA=
GS) -o $@ $^<br>
-<br>
-@@ -102,7 +105,9 @@ BUILT_SOURCES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0route/cls/ematch_grammar.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0route/cls/ematch_syntax.c \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0route/pktloc_grammar.c \<br>
--=C2=A0 =C2=A0 =C2=A0 route/pktloc_syntax.c<br>
-+=C2=A0 =C2=A0route/pktloc_syntax.c \<br>
-+=C2=A0 =C2=A0route/pktloc_syntax.h \<br>
-+=C2=A0 =C2=A0route/pktloc_grammar.h<br>
-<br>
- EXTRA_DIST =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0route/pktloc_grammar.l \<br>
diff --git a/meta/recipes-support/libnl/<wbr>libnl/musl-header-conflict.<wb=
r>patch b/meta/recipes-support/libnl/<wbr>libnl/musl-header-conflict.<wbr>p=
atch<br>
new file mode 100644<br>
</div></div>index 0000000..5363685<br>
<span class=3D"">--- /dev/null<br>
+++ b/meta/recipes-support/libnl/<wbr>libnl/musl-header-conflict.<wbr>patch=
<br>
@@ -0,0 +1,59 @@<br>
</span>+From fa1ecb21bd612c0f7c0bd380c15d05<wbr>8227451e4e Mon Sep 17 00:00=
:00 2001<br>
+From: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhen=
grq.fnst@cn.fujitsu.com</a>&gt;<br>
+Date: Tue, 16 May 2017 02:30:21 +0900<br>
<div><div class=3D"h5">+Subject: [PATCH] Fix musl compile error like:<br>
+<br>
+In file included from ../libnl-3.3.0/include/linux-<wbr>private/linux/ipv6=
.h:5:0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libn=
l-3.3.0/include/<wbr>netlink-private/netlink.h:54,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../libn=
l-3.3.0/lib/nl.c:28:<br>
+../libnl-3.3.0/include/linux-<wbr>private/linux/in6.h:32:8: error:<br>
+redefinition of &#39;struct in6_addr&#39;<br>
+ struct in6_addr {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
+<br>
+Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.=
com">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ include/linux-private/linux/<wbr>if_bridge.h | 1 -<br>
+ include/linux-private/linux/<wbr>ipv6.h=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
+ include/netlink-private/<wbr>netlink.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br=
>
+ 3 files changed, 3 deletions(-)<br>
+<br>
+diff --git a/include/linux-private/linux/<wbr>if_bridge.h b/include/linux-=
private/linux/<wbr>if_bridge.h<br>
+index f24050b..8f7490c 100644<br>
+--- a/include/linux-private/linux/<wbr>if_bridge.h<br>
++++ b/include/linux-private/linux/<wbr>if_bridge.h<br>
+@@ -15,7 +15,6 @@<br>
+<br>
+ #include &lt;linux/types.h&gt;<br>
+ #include &lt;linux/if_ether.h&gt;<br>
+-#include &lt;linux/in6.h&gt;<br>
+<br>
+ #define SYSFS_BRIDGE_ATTR=C2=A0 =C2=A0 =C2=A0&quot;bridge&quot;<br>
+ #define SYSFS_BRIDGE_FDB=C2=A0 =C2=A0 =C2=A0 &quot;brforward&quot;<br>
+diff --git a/include/linux-private/linux/<wbr>ipv6.h b/include/linux-priva=
te/linux/<wbr>ipv6.h<br>
+index e05e684..f16349d 100644<br>
+--- a/include/linux-private/linux/<wbr>ipv6.h<br>
++++ b/include/linux-private/linux/<wbr>ipv6.h<br>
+@@ -2,7 +2,6 @@<br>
+ #define _IPV6_H<br>
+<br>
+ #include &lt;asm/byteorder.h&gt;<br>
+-#include &lt;linux/in6.h&gt;<br>
+<br>
+ /* The latest drafts declared increase in minimal mtu up to 1280. */<br>
+<br>
+diff --git a/include/netlink-private/<wbr>netlink.h b/include/netlink-priv=
ate/<wbr>netlink.h<br>
</div></div>+index dd07c10..25ee07f 100644<br>
+--- a/include/netlink-private/<wbr>netlink.h<br>
++++ b/include/netlink-private/<wbr>netlink.h<br>
+@@ -30,7 +30,6 @@<br>
<span class=3D"">+ #include &lt;limits.h&gt;<br>
+ #include &lt;search.h&gt;<br>
+<br>
+-#include &lt;arpa/inet.h&gt;<br>
+ #include &lt;netdb.h&gt;<br>
+<br>
+ #include &lt;defs.h&gt;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-support/libnl/<a href=3D"http://libnl_3.2.29.bb" =
rel=3D"noreferrer" target=3D"_blank">l<wbr>ibnl_3.2.29.bb</a> b/meta/recipe=
s-support/libnl/<a href=3D"http://libnl_3.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">l<wbr>ibnl_3.3.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-support/libnl/<a href=3D"http://libnl_3.2.29.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>nl_3.2.29.bb</a><br>
rename to meta/recipes-support/libnl/<a href=3D"http://libnl_3.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">lib<wbr>nl_3.3.0.bb</a><br>
</span>index 7d4839b..9138aa8 100644<br>
<div class=3D"HOEnZb"><div class=3D"h5">--- a/meta/recipes-support/libnl/<a=
 href=3D"http://libnl_3.2.29.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr=
>ibnl_3.2.29.bb</a><br>
+++ b/meta/recipes-support/libnl/<a href=3D"http://libnl_3.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">l<wbr>ibnl_3.3.0.bb</a><br>
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4f=
bd65380cdd255951079008b36451<wbr>6c&quot;<br>
=C2=A0DEPENDS =3D &quot;flex-native bison-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/thom311/${BPN}/releas=
es/download/${BPN}${@d.getVar(&#39;PV&#39;).replace(&#39;." rel=3D"noreferr=
er" target=3D"_blank">https://github.com/thom311/${<wbr>BPN}/releases/downl=
oad/${BPN}$<wbr>{@d.getVar(&#39;PV&#39;).replace(&#39;.</a>&#39;,&#39;<wbr>=
_&#39;)}/${BP}.tar.gz \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-pktloc_syntax_h-<wbr>r=
ace.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-pc-file.patch \<br>
=C2=A0&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/thom311/${=
BPN}/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/thom=
311/${<wbr>BPN}/releases</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>a8ba62a5c4f883f4e493a46d1f3733<wbr>fe&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>0beb593dc6abfffa18a5c787b27884<wbr>979c1=
b7e7f1fd468c801e3cc938a68<wbr>5922&quot;<br>
+SRC_URI_append_libc-musl =3D &quot;file://musl-header-conflict.<wbr>patch&=
quot;<br></div></div></blockquote><div><br></div><div>Does the patched vers=
ion not build with glibc or why is this only patched for musl?</div><div><b=
r></div><div>Also patch seems to be missing Upstream-Status.</div><div><br>=
</div><div>Jussi</div><div><br></div></div></div></div>

--94eb2c19e700068669054f8dd1aa--
