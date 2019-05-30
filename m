Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id D0DC57E3FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 17:49:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k24so1343829otn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i3bEX2dHaEExJ3a0NhjL5kDQXqfPl3SuAlLDzC+PeDQ=;
	b=jcTcd+gIG53eyUaati3XzPWsYCSAA1yVMplxHMG8JLe+ROK+mF4WBQFI8+P8A5o7eF
	gU8ZYi7tlgqxVHvz8mlXBGiaNJ696ZMD20+Nw2SVRRkh4Bfm0wI0m8HO4f07Vde8hR71
	VuqcVrTfTzXn/Un8hS6RjCnT9cXIUY0pSy0qMDDltwNvm5hfkF0wN+q8S500bda6sld2
	sk+rk7Q8YtuohswjePxaZVTzYdIpZOcPZW3LhPCdRQqD6fPeCoymVnby9dI4A+7P0H8C
	cC1COkXwMW8Xso764tIEdbKTCb6qTjQ2JzpIQuoCCQuKyuPqfc2VKVcPh8y82Hq/e5+b
	O1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i3bEX2dHaEExJ3a0NhjL5kDQXqfPl3SuAlLDzC+PeDQ=;
	b=thpFiyn0CzYl5ir56TmUljZ4DlO0RLc9HwLECUWZyo6spOQstbfIbccCQy49nAHlzX
	KBu/bwC2vF3PD9LpC9YvxG2V7CIfDT6aF+5VZ7N+QvMfzQVHNkGs6hCM4HF3HtET5RfW
	v3dfdYvndDfWqu3hK1vLbYeu+cgdgYCV9jbySByuit/BYgeJZHnLNJgttuNuWvHqiGfL
	jg9F4oNC8pRcutA8n9uUcs+Wy+9qCzvfYgzrs/M9bDt7YOik4rABT/iDb7gBJrb75VdF
	f3zUNltywMatUSKV5qKjm0gzA5ATSxH7aXeI8em4u1AXEQBkzOoAO1/IHZrg9746Ca6b
	m9nA==
X-Gm-Message-State: APjAAAVWNkT6zjtrh/8cd+njVRiYF0s4MRbC1RGNzHG2n3Bi6aKvLD8r
	f56gfRe/N2T+5Nv2CDuDT+metEQj1tETxLU4DgY=
X-Google-Smtp-Source: APXvYqyGaws+Qk5DR26kkU466tVCs84SsBSpiwkUV9gHigFSJ4ZJE9OLUSe8YriQOaYbA5ybXbzpfOhngwsJmpvMMHA=
X-Received: by 2002:a05:6830:1541:: with SMTP id
	l1mr3610238otp.350.1559238596781; 
	Thu, 30 May 2019 10:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190530164150.27038-1-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 May 2019 19:49:45 +0200
Message-ID: <CANNYZj9AhnXUakzrshobj4+pnxae3==OEu0LW=FYPJtmO5DynA@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 01/11] gstreamer1.0: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 17:49:56 -0000
Content-Type: multipart/alternative; boundary="000000000000ae6e29058a1e86d3"

--000000000000ae6e29058a1e86d3
Content-Type: text/plain; charset="UTF-8"

This has already merged to master, so you need to rebase, and resend what's
left.

Alex

On Thu, 30 May 2019 at 18:42, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> From: Philippe Normand <philn@igalia.com>
>
> * 0002-gstconfig.h.in-initial-RISC-V-support.patch
>   Removed since this is included in 1.16.0
>
> Signed-off-by: Philippe Normand <philn@igalia.com>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  ...stconfig.h.in-initial-RISC-V-support.patch | 30 -------------------
>  ...er1.0_1.14.4.bb => gstreamer1.0_1.16.0.bb} |  6 ++--
>  2 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.4.bb =>
> gstreamer1.0_1.16.0.bb} (94%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
> b/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
> deleted file mode 100644
> index db742dea23..0000000000
> ---
> a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-RISC-V-support.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001
> -From: Aurelien Jarno <aurelien@aurel32.net>
> -Date: Sun, 15 Apr 2018 00:49:55 +0200
> -Subject: [PATCH] gstconfig.h.in: initial RISC-V support
> -
> -RISC-V supports unaligned accesses, but these might run extremely slowly
> -depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
> -to 0 on this architecture.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=795271
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -Upstream-Status: Accepted [1.15.1 -
> https://bugzilla.gnome.org/show_bug.cgi?id=795271]
> ----
> - gst/gstconfig.h.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
> -index 6351c04da..33dfed1f6 100644
> ---- a/gst/gstconfig.h.in
> -+++ b/gst/gstconfig.h.in
> -@@ -104,7 +104,7 @@
> -  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
> -  * https://software.intel.com/en-us/node/583402
> -  */
> --#if defined(__alpha__) || defined(__arc__) || defined(__arm__) ||
> defined(__aarch64__) || defined(__bfin) || defined(__hppa__) ||
> defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) ||
> defined(__or1k__) || defined(__sh__) || defined(__SH4__) ||
> defined(__sparc__) || defined(__sparc) || defined(__ia64__) ||
> defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) ||
> defined(__xtensa__) || defined(__e2k__)
> -+#if defined(__alpha__) || defined(__arc__) || defined(__arm__) ||
> defined(__aarch64__) || defined(__bfin) || defined(__hppa__) ||
> defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) ||
> defined(__or1k__) || defined(__sh__) || defined(__SH4__) ||
> defined(__sparc__) || defined(__sparc) || defined(__ia64__) ||
> defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) ||
> defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
> - #  define GST_HAVE_UNALIGNED_ACCESS 0
> - #elif defined(__i386__) || defined(__i386) || defined(__amd64__) ||
> defined(__amd64) || defined(__x86_64__) || defined(__ppc__) ||
> defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) ||
> defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) ||
> defined(_M_X64) || defined(__s390__) || defined(__s390x__) ||
> defined(__zarch__)
> - #  define GST_HAVE_UNALIGNED_ACCESS 1
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
> similarity index 94%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
> index 98c9a28e39..da2d14cd99 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
> @@ -25,11 +25,10 @@ SRC_URI = " \
>      file://gtk-doc-tweaks.patch \
>
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>      file://add-a-target-to-compile-tests.patch \
> -    file://0002-gstconfig.h.in-initial-RISC-V-support.patch \
>      file://run-ptest \
>  "
> -SRC_URI[md5sum] = "f67fbbc42bd85a0701df119f52fb52bd"
> -SRC_URI[sha256sum] =
> "f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e7920afa985ffc7"
> +SRC_URI[md5sum] = "862b7e4263d946bc2ef31b3c582e5587"
> +SRC_URI[sha256sum] =
> "0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     "
> @@ -55,6 +54,7 @@ PACKAGES += "${PN}-bash-completion"
>  FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
>  FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la
> ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
>  FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/
> ${datadir}/bash-completion/helpers/gst*"
> +FILES_${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
>
>  RDEPENDS_${PN}-ptest += "make"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ae6e29058a1e86d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This has already merged to master, so you need to rebase, =
and resend what&#39;s left.<div><br></div><div>Alex</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 May 201=
9 at 18:42, Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org">=
crg7475@mailbox.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From: Philippe=
 Normand &lt;<a href=3D"mailto:philn@igalia.com" target=3D"_blank">philn@ig=
alia.com</a>&gt;<br>
<br>
* 0002-gstconfig.h.in-initial-RISC-V-support.patch<br>
=C2=A0 Removed since this is included in 1.16.0<br>
<br>
Signed-off-by: Philippe Normand &lt;<a href=3D"mailto:philn@igalia.com" tar=
get=3D"_blank">philn@igalia.com</a>&gt;<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.or=
g" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
---<br>
=C2=A0...stconfig.h.in-initial-RISC-V-support.patch | 30 ------------------=
-<br>
=C2=A0...<a href=3D"http://er1.0_1.14.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">er1.0_1.14.4.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.16.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.0.bb</a>} |=C2=A0 6=
 ++--<br>
=C2=A02 files changed, 3 insertions(+), 33 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/files/0002-gstco=
nfig.h.in-initial-RISC-V-support.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.14.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.4.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.16.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.16.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-in=
itial-RISC-V-support.patch b/meta/recipes-multimedia/gstreamer/files/0002-g=
stconfig.h.in-initial-RISC-V-support.patch<br>
deleted file mode 100644<br>
index db742dea23..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-R=
ISC-V-support.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001<br>
-From: Aurelien Jarno &lt;<a href=3D"mailto:aurelien@aurel32.net" target=3D=
"_blank">aurelien@aurel32.net</a>&gt;<br>
-Date: Sun, 15 Apr 2018 00:49:55 +0200<br>
-Subject: [PATCH] <a href=3D"http://gstconfig.h.in" rel=3D"noreferrer" targ=
et=3D"_blank">gstconfig.h.in</a>: initial RISC-V support<br>
-<br>
-RISC-V supports unaligned accesses, but these might run extremely slowly<b=
r>
-depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS<b=
r>
-to 0 on this architecture.<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D795271" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D795=
271</a><br>
-<br>
-Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
-Upstream-Status: Accepted [1.15.1 - <a href=3D"https://bugzilla.gnome.org/=
show_bug.cgi?id=3D795271" rel=3D"noreferrer" target=3D"_blank">https://bugz=
illa.gnome.org/show_bug.cgi?id=3D795271</a>]<br>
----<br>
- gst/<a href=3D"http://gstconfig.h.in" rel=3D"noreferrer" target=3D"_blank=
">gstconfig.h.in</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/gst/<a href=3D"http://gstconfig.h.in" rel=3D"noreferrer" targ=
et=3D"_blank">gstconfig.h.in</a> b/gst/<a href=3D"http://gstconfig.h.in" re=
l=3D"noreferrer" target=3D"_blank">gstconfig.h.in</a><br>
-index 6351c04da..33dfed1f6 100644<br>
---- a/gst/<a href=3D"http://gstconfig.h.in" rel=3D"noreferrer" target=3D"_=
blank">gstconfig.h.in</a><br>
-+++ b/gst/<a href=3D"http://gstconfig.h.in" rel=3D"noreferrer" target=3D"_=
blank">gstconfig.h.in</a><br>
-@@ -104,7 +104,7 @@<br>
-=C2=A0 * <a href=3D"http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.h=
tml#Vers6" rel=3D"noreferrer" target=3D"_blank">http://docs.oracle.com/cd/E=
19205-01/820-4155/c++_faq.html#Vers6</a><br>
-=C2=A0 * <a href=3D"https://software.intel.com/en-us/node/583402" rel=3D"n=
oreferrer" target=3D"_blank">https://software.intel.com/en-us/node/583402</=
a><br>
-=C2=A0 */<br>
--#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__)<br>
-+#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)<br>
- #=C2=A0 define GST_HAVE_UNALIGNED_ACCESS 0<br>
- #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defin=
ed(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__=
) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) ||=
 defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390=
__) || defined(__s390x__) || defined(__zarch__)<br>
- #=C2=A0 define GST_HAVE_UNALIGNED_ACCESS 1<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.14.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.4.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.16.=
0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0_1.14.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.4.bb</a=
><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.0.bb</a><=
br>
index 98c9a28e39..da2d14cd99 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.14=
.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.4.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.0.bb</a><br>
@@ -25,11 +25,10 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://gtk-doc-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloader.c-when-env-var-is-set-d=
o-not-fal.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://add-a-target-to-compile-tests.patch \<br>
-=C2=A0 =C2=A0 file://0002-gstconfig.h.in-initial-RISC-V-support.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;f67fbbc42bd85a0701df119f52fb52bd&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0ef=
a497e7920afa985ffc7&quot;<br>
+SRC_URI[md5sum] =3D &quot;862b7e4263d946bc2ef31b3c582e5587&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0e8e2f7118be437cba879353970cf83c2acced825ecb9=
275ba05d9186ef07c00&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
@@ -55,6 +54,7 @@ PACKAGES +=3D &quot;${PN}-bash-completion&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/gstreamer-1.0/*.so&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/gstreamer-1.0/*.la ${libdir}/gst=
reamer-1.0/*.a ${libdir}/gstreamer-1.0/include&quot;<br>
=C2=A0FILES_${PN}-bash-completion +=3D &quot;${datadir}/bash-completion/com=
pletions/ ${datadir}/bash-completion/helpers/gst*&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${datadir}/gdb ${datadir}/gstreamer-1.0/gdb&quo=
t;<br>
<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
<br>
-- <br>
2.17.1<br>
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

--000000000000ae6e29058a1e86d3--
