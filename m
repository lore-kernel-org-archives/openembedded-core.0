Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AB9C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:34:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.169477.1673883245160952692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/7csaqE;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so2777092wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6jaYBeQkaiO/aiWzhe5RflMNr9+E5JpV2FHycG14SOM=;
        b=B/7csaqEe7lr2Lc4RJkcH//SkT/CENHyEKyh+kX5rrnWuw1m7IRUVTdIQ8HGZKZSza
         dYpvMQ5OKEoe/Quaa6bl8nvKKF8kslIxjCe1hnjZYip41y0hMn8uEKAuG+IGrOyHK5ch
         SW0dcOY28IE9ff4WW2vrsdHawCQI3NJNd7SkpX0Q891v7DP924bkPnqRnm24JEY1diYu
         5e9Mc4utcM3ZPc+jUHVpRr/IhEQmddZIrAP6Uj/i8/lnSE4+KpkvV7NtCVM8ZYTA6a0t
         hlck39Xa1LT8jFTWwcJfDPwYEzodVIp745TDI3vbDDSEPm1VT09BXzfRPy3AVacQUIjU
         NdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jaYBeQkaiO/aiWzhe5RflMNr9+E5JpV2FHycG14SOM=;
        b=lJyiz7UeW7KxEhacfjMeGPL9maJ7o3/VU3+ewgUyKkhxXUC6F0JDQApzAEz+Hm5MjG
         rhMhOO5nhUezF3CLnSBzLG+qFSEXaL9Q71rhADvuhMmgYdIyhLKNvJgdjPZ5y6neG3GW
         PR2l9e/Ka/xDMEibCqrr+D+lF2XhaCwUdM/LFxIjWg/7F2t17JqS1hGf2sJySZP+/6qe
         7jCqP02Mlio7/+vH1ZfDCuuW8G0505uCqo+2R5hwiaTp+IJzuqw+86qjyACC+kHyTfUG
         VEtTTinISlf756R3mEuNbNKL7r1m3p9aDGkHdg7ffpA1LkOHxZdv+jRp8A4mymo+5f0J
         mfmg==
X-Gm-Message-State: AFqh2kqM+ZJmb5FXAs+nJsmO+pbpKSNpZgNsx+8bVlNZknFsJdeubzZO
	pGPTK4gTXCpJD8ae0Y35HbW8z4DREHndcnlbzaE=
X-Google-Smtp-Source: AMrXdXu/ssh43ljrBeu5TocWi3zA0pW18TmqRgykj42F5GCzcB+ex90IFmirMS5aZG4YwluWhl/dxjSPW0H3NPyaL8o=
X-Received: by 2002:a05:600c:4e51:b0:3cf:6b10:ca8d with SMTP id
 e17-20020a05600c4e5100b003cf6b10ca8dmr6681833wmq.44.1673883243582; Mon, 16
 Jan 2023 07:34:03 -0800 (PST)
MIME-Version: 1.0
References: <173AD3C1BA38F444.23170@lists.openembedded.org>
In-Reply-To: <173AD3C1BA38F444.23170@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jan 2023 16:33:51 +0100
Message-ID: <CA+chaQfkZ4XT5doXmjdASfeoVs6RNzUjCQxATKOdOkOgcgr06A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: update submitted patch with backported version
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, kai.kang@windriver.com
Content-Type: multipart/alternative; boundary="00000000000021190005f263506a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175999

--00000000000021190005f263506a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kai: can you please test it on ubuntu-18.04?

I've tested it with DEBUG_BUILD in native and target build on a host with
new toolchain (gentoo with gcc-12.2.1) and according to
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439 it works
with old toolchain as well.

On Mon, Jan 16, 2023 at 4:30 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * this version was merged to main in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa6=
6f1665aa152b4e911
>   and cherry-picked to staging/23.0 as well in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46=
d87455a9a414d7c65
>
>   and as a bonus it doesn't break the build with DEBUG_BUILD
>   for newer toolchain, so we can apply it for target build as well, see:
>   https://lists.openembedded.org/g/openembedded-core/message/169002
>   https://lists.openembedded.org/g/openembedded-core/message/170930
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...ove-fix-ALWAYS_INLINE-compiler-error.patch | 81 ++++++-------------
>  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
>  2 files changed, 26 insertions(+), 60 deletions(-)
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
> b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
> index 7989843eb4..1cf23492fe 100644
> ---
> a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
> +++
> b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
> @@ -1,67 +1,36 @@
> -From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17 00:00:00 2001
> -From: t bettler <thomas.bettler@gmail.com>
> -Date: Sat, 9 Jul 2022 09:28:51 +0000
> +From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17 00:00:00 2001
> +From: t0b3 <thomas.bettler@gmail.com>
> +Date: Sat, 10 Dec 2022 14:32:53 +0100
>  Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
>
> -Backport merge request to fix mesa compile error when debug build
> -enabled.
> -
> -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=80=99
> -
> -Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
> -Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 ("nir/nir_opt_move:
> handle non-SSA defs ")
> +Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +Closes: #6825
> +Fixes: f1d20ec6 ("nir/nir_opt_move: handle non-SSA defs ")
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1743=
9
> >
>
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa6=
6f1665aa152b4e911
> ]
>  ---
> - src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
> - src/compiler/nir/nir_opt_move.c       |  2 +-
> - 2 files changed, 9 insertions(+), 3 deletions(-)
> + src/compiler/nir/nir_opt_move.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/src/compiler/nir/nir_inline_helpers.h
> b/src/compiler/nir/nir_inline_helpers.h
> -index 125dd8a..ec33f05 100644
> ---- a/src/compiler/nir/nir_inline_helpers.h
> -+++ b/src/compiler/nir/nir_inline_helpers.h
> -@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_cb
> cb, void *state)
> -    return _nir_foreach_dest(instr, cb, state);
> - }
> -
> --static inline bool
> --nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
> -+static ALWAYS_INLINE bool
> -+_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
> - {
> -    switch (instr->type) {
> -    case nir_instr_type_alu: {
> -@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr, nir_foreach_src_cb
> cb, void *state)
> -    dest_state.cb =3D cb;
> -    return _nir_foreach_dest(instr, _nir_visit_dest_indirect,
> &dest_state);
> - }
> -+
> -+static inline bool
> -+nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
> -+{
> -+   return _nir_foreach_src(instr, cb, state);
> -+}
>  diff --git a/src/compiler/nir/nir_opt_move.c
> b/src/compiler/nir/nir_opt_move.c
> -index 81bcde5..051c3cc 100644
> +index 81bcde5c436..9aeb9f4cf86 100644
>  --- a/src/compiler/nir/nir_opt_move.c
>  +++ b/src/compiler/nir/nir_opt_move.c
> -@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
> - static ALWAYS_INLINE bool
> - instr_reads_register(nir_instr *instr)
> +@@ -51,13 +51,13 @@
> +  * lower register pressure.
> +  */
> +
> +-static ALWAYS_INLINE bool
> ++static inline bool
> + src_is_ssa(nir_src *src, void *state)
>   {
> --   return !nir_foreach_src(instr, src_is_ssa, NULL);
> -+   return !_nir_foreach_src(instr, src_is_ssa, NULL);
> +    return src->is_ssa;
>   }
>
> - static bool
> +-static ALWAYS_INLINE bool
> ++static inline bool
> + instr_reads_register(nir_instr *instr)
> + {
> +    return !nir_foreach_src(instr, src_is_ssa, NULL);
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 5fdb67ca2a..866b7fc462 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,11 +18,8 @@ SRC_URI =3D "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h
> \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
> -           ${NATIVE_PATCHES} \
> +
>  file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>             "
> -NATIVE_PATCHES ?=3D ""
> -# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD
> enabled
> -NATIVE_PATCHES:class-native =3D
> "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>
>  SRC_URI[sha256sum] =3D
> "bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b17812922"
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175996):
> https://lists.openembedded.org/g/openembedded-core/message/175996
> Mute This Topic: https://lists.openembedded.org/mt/96308437/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000021190005f263506a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kai: can you please test it on ubuntu-18.04?<div><br></div=
><div>I&#39;ve tested it with DEBUG_BUILD in native and target build on a h=
ost with new toolchain (gentoo with gcc-12.2.1) and according to=C2=A0<a hr=
ef=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439">http=
s://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439</a> it works wi=
th old toolchain as well.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jan 16, 2023 at 4:30 PM Martin Jansa=
 via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* this versi=
on was merged to main in:<br>
=C2=A0 <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f=
4d571ee606141aa66f1665aa152b4e911" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f166=
5aa152b4e911</a><br>
=C2=A0 and cherry-picked to staging/23.0 as well in:<br>
=C2=A0 <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb55=
2abc50e8167cdc46d87455a9a414d7c65" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46d8745=
5a9a414d7c65</a><br>
<br>
=C2=A0 and as a bonus it doesn&#39;t break the build with DEBUG_BUILD<br>
=C2=A0 for newer toolchain, so we can apply it for target build as well, se=
e:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/169002" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/169002</a><br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/170930" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/170930</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ove-fix-ALWAYS_INLINE-compiler-error.patch | 81 ++++++------------=
-<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 5 +-<br>
=C2=A02 files changed, 26 insertions(+), 60 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch b/meta/recipes-graphics/mesa/files/0001-nir=
-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch<br>
index 7989843eb4..1cf23492fe 100644<br>
--- a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INL=
INE-compiler-error.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INL=
INE-compiler-error.patch<br>
@@ -1,67 +1,36 @@<br>
-From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17 00:00:00 2001<br>
-From: t bettler &lt;<a href=3D"mailto:thomas.bettler@gmail.com" target=3D"=
_blank">thomas.bettler@gmail.com</a>&gt;<br>
-Date: Sat, 9 Jul 2022 09:28:51 +0000<br>
+From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17 00:00:00 2001<br>
+From: t0b3 &lt;<a href=3D"mailto:thomas.bettler@gmail.com" target=3D"_blan=
k">thomas.bettler@gmail.com</a>&gt;<br>
+Date: Sat, 10 Dec 2022 14:32:53 +0100<br>
=C2=A0Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error<b=
r>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
<br>
-Backport merge request to fix mesa compile error when debug build<br>
-enabled.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/mesa=
/mesa/-/merge_requests/17439" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439</a>]<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
-<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=80=99<b=
r>
-<br>
-Closes: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/m=
esa/-/issues/6825</a><br>
-Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 (&quot;nir/nir_opt_move: h=
andle non-SSA defs &quot;)<br>
+Reviewed-by: Iago Toral Quiroga &lt;<a href=3D"mailto:itoral@igalia.com" t=
arget=3D"_blank">itoral@igalia.com</a>&gt;<br>
+Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.com" target=3D=
"_blank">ajax@redhat.com</a>&gt;<br>
+Closes: #6825<br>
+Fixes: f1d20ec6 (&quot;nir/nir_opt_move: handle non-SSA defs &quot;)<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_r=
equests/17439" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/17439</a>&gt;<br>
<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f=
4d571ee606141aa66f1665aa152b4e911</a>]<br>
=C2=A0---<br>
- src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--<br>
- src/compiler/nir/nir_opt_move.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br=
>
- 2 files changed, 9 insertions(+), 3 deletions(-)<br>
+ src/compiler/nir/nir_opt_move.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
-diff --git a/src/compiler/nir/nir_inline_helpers.h b/src/compiler/nir/nir_=
inline_helpers.h<br>
-index 125dd8a..ec33f05 100644<br>
---- a/src/compiler/nir/nir_inline_helpers.h<br>
-+++ b/src/compiler/nir/nir_inline_helpers.h<br>
-@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_cb c=
b, void *state)<br>
-=C2=A0 =C2=A0 return _nir_foreach_dest(instr, cb, state);<br>
- }<br>
- <br>
--static inline bool<br>
--nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)<br>
-+static ALWAYS_INLINE bool<br>
-+_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)<br=
>
- {<br>
-=C2=A0 =C2=A0 switch (instr-&gt;type) {<br>
-=C2=A0 =C2=A0 case nir_instr_type_alu: {<br>
-@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr, nir_foreach_src_cb c=
b, void *state)<br>
-=C2=A0 =C2=A0 dest_state.cb =3D cb;<br>
-=C2=A0 =C2=A0 return _nir_foreach_dest(instr, _nir_visit_dest_indirect, &a=
mp;dest_state);<br>
- }<br>
-+<br>
-+static inline bool<br>
-+nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)<br>
-+{<br>
-+=C2=A0 =C2=A0return _nir_foreach_src(instr, cb, state);<br>
-+}<br>
=C2=A0diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_o=
pt_move.c<br>
-index 81bcde5..051c3cc 100644<br>
+index 81bcde5c436..9aeb9f4cf86 100644<br>
=C2=A0--- a/src/compiler/nir/nir_opt_move.c<br>
=C2=A0+++ b/src/compiler/nir/nir_opt_move.c<br>
-@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)<br>
- static ALWAYS_INLINE bool<br>
- instr_reads_register(nir_instr *instr)<br>
+@@ -51,13 +51,13 @@<br>
+=C2=A0 * lower register pressure.<br>
+=C2=A0 */<br>
+ <br>
+-static ALWAYS_INLINE bool<br>
++static inline bool<br>
+ src_is_ssa(nir_src *src, void *state)<br>
=C2=A0 {<br>
--=C2=A0 =C2=A0return !nir_foreach_src(instr, src_is_ssa, NULL);<br>
-+=C2=A0 =C2=A0return !_nir_foreach_src(instr, src_is_ssa, NULL);<br>
+=C2=A0 =C2=A0 return src-&gt;is_ssa;<br>
=C2=A0 }<br>
<br>
- static bool<br>
+-static ALWAYS_INLINE bool<br>
++static inline bool<br>
+ instr_reads_register(nir_instr *instr)<br>
+ {<br>
+=C2=A0 =C2=A0 return !nir_foreach_src(instr, src_is_ssa, NULL);<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 5fdb67ca2a..866b7fc462 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -18,11 +18,8 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.or=
g/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson.build-check-for=
-all-linux-host_os-combinations.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-format-Check-for=
-NEON-before-using-it.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NATIVE_PATCHES} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-nir-nir_opt_move-fix-=
ALWAYS_INLINE-compiler-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-NATIVE_PATCHES ?=3D &quot;&quot;<br>
-# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD en=
abled<br>
-NATIVE_PATCHES:class-native =3D &quot;file://0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;bed799788bf2bd9ef079d97cd8e09348bf53cb08=
6818578e40773b2b17812922&quot;<br>
<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175996): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175996" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175996</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96308437/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96308437/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000021190005f263506a--

