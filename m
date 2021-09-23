Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web08.6774.1632412892734388820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 09:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L+P3xAsH;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id u8so7084095vsp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVXzK5k+IYYcv0gvMt1uc+i+XR9KTR/GSAJiiaUd7G0=;
        b=L+P3xAsHmMaL5XQG8SiDbSFJ+WvL+TibmYRZBjETazpsKapwM45DQdMSfxLAwa6uBz
         xQnoyWXMsd1faPm4jpxH/Itw1VsLwRabPhQdXhHE7AUFnPvie3bB08YALijPbaqLoyrJ
         GqRaBw460qhK80WByLEhEYcEvIjZYJRQhHrb8x4xkoh7cyvEVrCXztLrE43xK5waW92C
         fCS78GRiiamEUI6mF1zEXdesv5w3MftK8Ki7ONSTv6NbHMvFD4asbT0LlmwQmKamriiF
         y5rttDNz+Oa2Jkg5f/xBr1X52qspJiITL8kF2swKT8y5dmeztxpa/xSRa7NkijF5tsh4
         cQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVXzK5k+IYYcv0gvMt1uc+i+XR9KTR/GSAJiiaUd7G0=;
        b=Tjfhh33QDhk06FNxWRJLNlonACe9zMutlW4TfiXAfxDe0Y+SPuFtvXWER3gGTi+S3B
         wajOPpy2GhI6e1pKnmqzhg1ny2tI6NM9gyjYiPgp1OdcqLrNrnKRCWyV6GdaszZRMSq4
         UX5iPXXUcQZc9L2cB7b55PRUuewZBBEugUIecuLnE+CQ/4UWbWPrrlMpSnu1fz6DwpUG
         WA3g49IFbes1KTvIakFK8mzMMnRu2ceLrV+98odYP/u6E+TV87HdE1PAZISJWPwRxQJq
         rg7kovHsWpXXWXC4dSWEOQTO93auavney3awMBxskud2Xu+YeGubHIxh1Ysml5ohK90g
         vRoQ==
X-Gm-Message-State: AOAM532677SLZCjj6/mH85BvRFy2fRX1rYNDLHH/l8KL9nbkyAuEQFTP
	dmSd2y3dY5iixfOWVTdLtpuD61/KoP08+Z9aXOc=
X-Google-Smtp-Source: ABdhPJz7GoKbRJpyRRr2XiZoRpGJstBfWXMOV/ORIblEsOnBLV3AsV/m0I5IDyAgLCJCqfLZQ4GLv/bwr8n+nNccNCk=
X-Received: by 2002:a05:6102:21b9:: with SMTP id i25mr4854747vsb.1.1632412891737;
 Thu, 23 Sep 2021 09:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
 <20210923151723.3435155-1-psaavedra@igalia.com>
In-Reply-To: <20210923151723.3435155-1-psaavedra@igalia.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 23 Sep 2021 18:01:20 +0200
Message-ID: <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH v2 ] mesa: Add patches for red label issues on video for VC4 and Freedreno
To: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089f1b505ccabbeed"

--00000000000089f1b505ccabbeed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would strongly suggest that you get everything merged upstream first
before adding the patches to oe-core.

Even then, this should go to master first, as we do not want the situation
when honister has these fixes, but master does not.

Backport must be capitalized.

Alex

On Thu, 23 Sept 2021 at 17:17, Pablo Saavedra Rodi?o <psaavedra@igalia.com>
wrote:

> freedreno,v3d: YUV formats are supported as external-only dmabuf
> modifiers.
>
> This patch fix red label issues on video for Raspberry 4-64 Mesa VC4
> driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver
>
> Issue was originally reported in meta-webkit [1] and later contributed
> in Mesa [2]  where it was already merged in master.
>
> * Commits for VC4 [3] had been nominated for stable 21.1 and already in
>   21.2 (available in honister).
> * Commit for Freedreno [4] also reported (not merged yet).
>
> [1] https://github.com/Igalia/meta-webkit/issues/185
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10534
> [4] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  ...rmats-are-supported-as-external-only.patch | 34 +++++++++++++++++
>  ...at-is_dmabuf_modifier_supported-are-.patch | 35 ++++++++++++++++++
>  ...at-query_dmabuf_modifiers-are-extern.patch | 34 +++++++++++++++++
>  ...OD_BROADCOM_SAND128-only-available-f.patch | 37 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  4 ++
>  5 files changed, 144 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-supported=
-as-external-only.patch
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifi=
er_supported-are-.patch
>  create mode 100644
> meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_mod=
ifiers-are-extern.patch
>  create mode 100644
> meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128=
-only-available-f.patch
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-support=
ed-as-external-only.patch
> b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-support=
ed-as-external-only.patch
> new file mode 100644
> index 0000000000..9688ac1619
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-support=
ed-as-external-only.patch
> @@ -0,0 +1,34 @@
> +From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00 2001
> +From: Pablo Saavedra <psaavedra@igalia.com>
> +Date: Thu, 23 Sep 2021 10:23:56 +0200
> +Subject: [PATCH] freedreno: YUV formats are supported as external-only
> dmabuf
> + modifiers
> +
> +Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> +
> +Co-authored-by: Alberto Garcia <berto@igalia.com>
> +Co-authored-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> +
> +Upstream-Status: Pending [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991]
> +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> +---
> + src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c
> b/src/gallium/drivers/freedreno/freedreno_screen.c
> +index a9cd0e2..dc2b79d 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> +@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pipe_screen
> *pscreen,
> +                       modifiers[num] =3D screen->supported_modifiers[i]=
;
> +
> +               if (external_only)
> +-                      external_only[num] =3D 0;
> ++                      external_only[num] =3D util_format_is_yuv(format)=
;
> +
> +               num++;
> +       }
> +--
> +2.30.2
> +
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modi=
fier_supported-are-.patch
> b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modi=
fier_supported-are-.patch
> new file mode 100644
> index 0000000000..9e90a07c8e
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modi=
fier_supported-are-.patch
> @@ -0,0 +1,35 @@
> +From 389bffa0981bba60f9d081063c150fb17e497c4a Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:15:27 +0200
> +Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported are
> + external_only
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on vid=
eo"
> +
> +Fixes: 6ee10ab3de86 "gallium: Add
> pipe_screen::is_dmabuf_modifier_supported"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4
> >
> +
> +Upstream-status: backport [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> b/src/gallium/drivers/v3d/v3d_screen.c
> +index 4f69c20..a5c94db 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct
> pipe_screen *pscreen,
> +         for (i =3D 0; i < ARRAY_SIZE(v3d_available_modifiers); i++) {
> +                 if (v3d_available_modifiers[i] =3D=3D modifier) {
> +                         if (external_only)
> +-                                *external_only =3D false;
> ++                                *external_only =3D
> util_format_is_yuv(format);
> +
> +                         return true;
> +                 }
> diff --git
> a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_m=
odifiers-are-extern.patch
> b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_m=
odifiers-are-extern.patch
> new file mode 100644
> index 0000000000..d1658f9a87
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_m=
odifiers-are-extern.patch
> @@ -0,0 +1,34 @@
> +From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:37:25 +0200
> +Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are
> external_only
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on vid=
eo"
> +
> +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 suppor=
t"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4
> >
> +
> +Upstream-status: backport [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> b/src/gallium/drivers/v3d/v3d_screen.c
> +index a5c94db..edde17d 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen
> *pscreen,
> +         for (i =3D 0; i < *count; i++) {
> +                 modifiers[i] =3D v3d_available_modifiers[i];
> +                 if (external_only)
> +-                        external_only[i] =3D false;
> ++                        external_only[i] =3D util_format_is_yuv(format)=
;
> +        }
> + }
> +
> diff --git
> a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND1=
28-only-available-f.patch
> b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND1=
28-only-available-f.patch
> new file mode 100644
> index 0000000000..17a612ea7e
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND1=
28-only-available-f.patch
> @@ -0,0 +1,37 @@
> +From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:47:53 +0200
> +Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only available for
> NV12
> + format.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We were exposing as available DRM_FORMAT_MOD_BROADCOM_SAND128 for
> +any format.
> +
> +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 suppor=
t"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4
> >
> +
> +Upstream-status: backport [
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> b/src/gallium/drivers/v3d/v3d_screen.c
> +index edde17d..684f912 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_scree=
n
> *pscreen,
> +         int i;
> +         int num_modifiers =3D ARRAY_SIZE(v3d_available_modifiers);
> +
> ++        /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 only for
> PIPE_FORMAT_NV12 */
> ++        if (format !=3D PIPE_FORMAT_NV12)
> ++                num_modifiers--;
> ++
> +         if (!modifiers) {
> +                 *count =3D num_modifiers;
> +                 return;
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index a85f94c75e..8d8871aa5d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,6 +19,10 @@ SRC_URI =3D "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h
> \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> +
>  file://0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch \
> +
>  file://0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch \
> +
>  file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch \
> +
>  file://0001-freedreno-YUV-formats-are-supported-as-external-only.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
> --
> 2.30.2
>
>
>=20
>
>

--00000000000089f1b505ccabbeed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I would strongly suggest that you get everything=
 merged upstream first before adding the patches to oe-core.<br></div><div>=
<br></div></div><div>Even then, this should go to master first, as we do no=
t want the situation when honister has these fixes, but master does not.</d=
iv><div></div><br><div>Backport must be capitalized.<br></div><div><br></di=
v><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, 23 Sept 2021 at 17:17, Pablo Saavedra Rodi?o &lt;<=
a href=3D"mailto:psaavedra@igalia.com">psaavedra@igalia.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">freedreno,v3d: Y=
UV formats are supported as external-only dmabuf<br>
modifiers.<br>
<br>
This patch fix red label issues on video for Raspberry 4-64 Mesa VC4<br>
driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver<br>
<br>
Issue was originally reported in meta-webkit [1] and later contributed<br>
in Mesa [2]=C2=A0 where it was already merged in master.<br>
<br>
* Commits for VC4 [3] had been nominated for stable 21.1 and already in<br>
=C2=A0 21.2 (available in honister).<br>
* Commit for Freedreno [4] also reported (not merged yet).<br>
<br>
[1] <a href=3D"https://github.com/Igalia/meta-webkit/issues/185" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/Igalia/meta-webkit/issues/185=
</a><br>
[2] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10=
524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/10524</a><br>
[3] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10=
534" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/10534</a><br>
[4] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12=
991" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/12991</a><br>
<br>
Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" t=
arget=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
---<br>
=C2=A0...rmats-are-supported-as-external-only.patch | 34 +++++++++++++++++<=
br>
=C2=A0...at-is_dmabuf_modifier_supported-are-.patch | 35 ++++++++++++++++++=
<br>
=C2=A0...at-query_dmabuf_modifiers-are-extern.patch | 34 +++++++++++++++++<=
br>
=C2=A0...OD_BROADCOM_SAND128-only-available-f.patch | 37 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 ++<br>
=C2=A05 files changed, 144 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-YU=
V-formats-are-supported-as-external-only.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-YUV-form=
ats-at-is_dmabuf_modifier_supported-are-.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-YUV-form=
ats-at-query_dmabuf_modifiers-are-extern.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORM=
AT_MOD_BROADCOM_SAND128-only-available-f.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-ar=
e-supported-as-external-only.patch b/meta/recipes-graphics/mesa/files/0001-=
freedreno-YUV-formats-are-supported-as-external-only.patch<br>
new file mode 100644<br>
index 0000000000..9688ac1619<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-suppo=
rted-as-external-only.patch<br>
@@ -0,0 +1,34 @@<br>
+From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00 2001<br>
+From: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" target=3D=
"_blank">psaavedra@igalia.com</a>&gt;<br>
+Date: Thu, 23 Sep 2021 10:23:56 +0200<br>
+Subject: [PATCH] freedreno: YUV formats are supported as external-only dma=
buf<br>
+ modifiers<br>
+<br>
+Based on <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/mesa/mesa/-/merge_requests/10524</a><br>
+<br>
+Co-authored-by: Alberto Garcia &lt;<a href=3D"mailto:berto@igalia.com" tar=
get=3D"_blank">berto@igalia.com</a>&gt;<br>
+Co-authored-by: Jose Maria Casanova Crespo &lt;<a href=3D"mailto:jmcasanov=
a@igalia.com" target=3D"_blank">jmcasanova@igalia.com</a>&gt;<br>
+Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
+<br>
+Upstream-Status: Pending [<a href=3D"https://gitlab.freedesktop.org/mesa/m=
esa/-/merge_requests/12991" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/mesa/mesa/-/merge_requests/12991</a>]<br>
+Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
+---<br>
+ src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/galliu=
m/drivers/freedreno/freedreno_screen.c<br>
+index a9cd0e2..dc2b79d 100644<br>
+--- a/src/gallium/drivers/freedreno/freedreno_screen.c<br>
++++ b/src/gallium/drivers/freedreno/freedreno_screen.c<br>
+@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pipe_screen *p=
screen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0modifiers[num] =3D screen-&gt;supported_modifiers[i];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (external_only)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 external_only[num] =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 external_only[num] =3D util_format_is_yuv(format);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dm=
abuf_modifier_supported-are-.patch b/meta/recipes-graphics/mesa/files/0001-=
v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch<br>
new file mode 100644<br>
index 0000000000..9e90a07c8e<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_mo=
difier_supported-are-.patch<br>
@@ -0,0 +1,35 @@<br>
+From 389bffa0981bba60f9d081063c150fb17e497c4a Mon Sep 17 00:00:00 2001<br>
+From: Jose Maria Casanova Crespo &lt;<a href=3D"mailto:jmcasanova@igalia.c=
om" target=3D"_blank">jmcasanova@igalia.com</a>&gt;<br>
+Date: Thu, 29 Apr 2021 18:15:27 +0200<br>
+Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported are<br>
+ external_only<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This fixes Issue <a href=3D"https://github.com/Igalia/meta-webkit/issues/1=
85" rel=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/meta-web=
kit/issues/185</a><br>
+&quot;Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on =
video&quot;<br>
+<br>
+Fixes: 6ee10ab3de86 &quot;gallium: Add pipe_screen::is_dmabuf_modifier_sup=
ported&quot;<br>
+Reviewed-by: Alejandro Pi=C3=B1eiro &lt;<a href=3D"mailto:apinheiro@igalia=
.com" target=3D"_blank">apinheiro@igalia.com</a>&gt;<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_r=
equests/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/10524</a>&gt;<br>
+<br>
+Upstream-status: backport [<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a>]<br>
+Signed-off-by: pablo saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
+---<br>
+ src/gallium/drivers/v3d/v3d_screen.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3=
d/v3d_screen.c<br>
+index 4f69c20..a5c94db 100644<br>
+--- a/src/gallium/drivers/v3d/v3d_screen.c<br>
++++ b/src/gallium/drivers/v3d/v3d_screen.c<br>
+@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct pipe_sc=
reen *pscreen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(v3d_avai=
lable_modifiers); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (v3d_avai=
lable_modifiers[i] =3D=3D modifier) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (external_only)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *external_only =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *external_only =3D util_format_is_yu=
v(format);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query=
_dmabuf_modifiers-are-extern.patch b/meta/recipes-graphics/mesa/files/0002-=
v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch<br>
new file mode 100644<br>
index 0000000000..d1658f9a87<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf=
_modifiers-are-extern.patch<br>
@@ -0,0 +1,34 @@<br>
+From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00 2001<br>
+From: Jose Maria Casanova Crespo &lt;<a href=3D"mailto:jmcasanova@igalia.c=
om" target=3D"_blank">jmcasanova@igalia.com</a>&gt;<br>
+Date: Thu, 29 Apr 2021 18:37:25 +0200<br>
+Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are external_o=
nly<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This fixes Issue <a href=3D"https://github.com/Igalia/meta-webkit/issues/1=
85" rel=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/meta-web=
kit/issues/185</a><br>
+&quot;Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on =
video&quot;<br>
+<br>
+Fixes: 95c4f0f91098 &quot;v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 sup=
port&quot;<br>
+Reviewed-by: Alejandro Pi=C3=B1eiro &lt;<a href=3D"mailto:apinheiro@igalia=
.com" target=3D"_blank">apinheiro@igalia.com</a>&gt;<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_r=
equests/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/10524</a>&gt;<br>
+<br>
+Upstream-status: backport [<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a>]<br>
+Signed-off-by: pablo saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
+---<br>
+ src/gallium/drivers/v3d/v3d_screen.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3=
d/v3d_screen.c<br>
+index a5c94db..edde17d 100644<br>
+--- a/src/gallium/drivers/v3d/v3d_screen.c<br>
++++ b/src/gallium/drivers/v3d/v3d_screen.c<br>
+@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen *=
pscreen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; *count; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modifiers[i]=
 =3D v3d_available_modifiers[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (external=
_only)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 external_only[i] =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 external_only[i] =3D util_format_is_yuv(format);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ }<br>
+ <br>
diff --git a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROAD=
COM_SAND128-only-available-f.patch b/meta/recipes-graphics/mesa/files/0003-=
v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch<br>
new file mode 100644<br>
index 0000000000..17a612ea7e<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAN=
D128-only-available-f.patch<br>
@@ -0,0 +1,37 @@<br>
+From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00 2001<br>
+From: Jose Maria Casanova Crespo &lt;<a href=3D"mailto:jmcasanova@igalia.c=
om" target=3D"_blank">jmcasanova@igalia.com</a>&gt;<br>
+Date: Thu, 29 Apr 2021 18:47:53 +0200<br>
+Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only available for N=
V12<br>
+ format.<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+We were exposing as available DRM_FORMAT_MOD_BROADCOM_SAND128 for<br>
+any format.<br>
+<br>
+Fixes: 95c4f0f91098 &quot;v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128 sup=
port&quot;<br>
+Reviewed-by: Alejandro Pi=C3=B1eiro &lt;<a href=3D"mailto:apinheiro@igalia=
.com" target=3D"_blank">apinheiro@igalia.com</a>&gt;<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_r=
equests/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/10524</a>&gt;<br>
+<br>
+Upstream-status: backport [<a href=3D"https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a>]<br>
+Signed-off-by: pablo saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>
+---<br>
+ src/gallium/drivers/v3d/v3d_screen.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3=
d/v3d_screen.c<br>
+index edde17d..684f912 100644<br>
+--- a/src/gallium/drivers/v3d/v3d_screen.c<br>
++++ b/src/gallium/drivers/v3d/v3d_screen.c<br>
+@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen =
*pscreen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int num_modifiers =3D ARRAY_SIZE(v3d_ava=
ilable_modifiers);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 onl=
y for PIPE_FORMAT_NV12 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (format !=3D PIPE_FORMAT_NV12)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_modifiers--;<=
br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!modifiers) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*count =3D n=
um_modifiers;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index a85f94c75e..8d8871aa5d 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -19,6 +19,10 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.or=
g/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-meson.build-make-TLS-=
ELF-optional.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-v3d-YUV-formats-at-is=
_dmabuf_modifier_supported-are-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-v3d-YUV-formats-at-qu=
ery_dmabuf_modifiers-are-extern.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-v3d-DRM_FORMAT_MOD_BR=
OADCOM_SAND128-only-available-f.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freedreno-YUV-formats=
-are-supported-as-external-only.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;565c6f4bd2d5747b919454fc1d439963024fc78c=
a56fd05158c3b2cde2f6912b&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000089f1b505ccabbeed--
