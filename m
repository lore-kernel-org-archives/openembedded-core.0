Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.2155.1632389209256822383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 02:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LUE7FHUr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id i4so24047845lfv.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iFUXTTrwWyaVK1gz8ZsYKl+pnBgZDx3o77MZwTShJc0=;
        b=LUE7FHUro7MWMsEyCoEiOj+jmYRcnO5syYl2WbuGaRE7Do+Gvz7NdZCzUds1BTpdZX
         hNAAUd8Xbi8CbTRp/jifuWmbJ3XY8WiJwbnDpymQ3vxQyoW2z6UN0bz9DHhzh3lWoKG+
         HV3ABd/1df8kf9pH3wW02fCWcwyyTju4wOni8tLy2NJG0on9SMi3GnSbwY5FJrVhkRud
         orb9wx91/jbHXpIIsK8nJjcJIK0uiekTBVBLXmgSPTECEA7Oo+OXu+WUWgdoZ7CebScL
         J7gzSRCKDv+bP9DV4ztoqmt0l6xs6rv7qEUSzgpNgh7tbqnfXGCt99xUuh0kR+JteYVB
         cZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iFUXTTrwWyaVK1gz8ZsYKl+pnBgZDx3o77MZwTShJc0=;
        b=Lg3Ha3r2ze0G2xh6o/VJ0Gu7mEFYQNK3kTjp3pHIe3+EbBzNJHiCWvc5tzEXut4yRF
         d6Y6npswaooGnCjujcFqL7kRF2p6Ws3LV9/948Xxd7NLAECMx6hCOFsTq2/D3QRqMD5B
         AUkvEsYnJKmq+jFdb/TWsfFFJN77blkjqio4cubYjppLpOJAloqqXFYDCYX6vHYhMuQ7
         f6v3sfAlI/6acj3YZyE/a5g/KLhvBsm/loOpmZ3XXjTGRRiH3D5OX/DJwhn7hSwReCHw
         Q/tpXL+JcuWFoubHPnW1e+FIwiIZhqVyEvJiio0CnLkMPppCS4G1nS82mQ4o+TauAYBu
         YLAg==
X-Gm-Message-State: AOAM530okQJe8YV/GapSi9SK8MQIflD3BE3/pNE9eA6ApFTY91Wdaf9O
	/0uen6/vM5Cidh1hJdRZ4Vxcr28ELKZJ0eQn9Ck=
X-Google-Smtp-Source: ABdhPJxAb9s8GvKEfzDV7DoVTh3tvDBVKBm73AHF4iTNdEWHLqYVMecQSPO10jO7OHkabqLfWYdjWUDUvYu9R3sYnbo=
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr2730494ljj.369.1632389206828;
 Thu, 23 Sep 2021 02:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210923090547.3260456-1-psaavedra@igalia.com>
In-Reply-To: <20210923090547.3260456-1-psaavedra@igalia.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 23 Sep 2021 10:26:37 +0100
Message-ID: <CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] mesa: Add patches for red label issues on video for VC4 and Freedreno
To: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

All the patches misses the Upstream-Status:

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Packag=
e_Updating#Patch_Upstreaming

Pablo Saavedra Rodi?o <psaavedra@igalia.com> escreveu no dia quinta,
23/09/2021 =C3=A0(s) 10:06:
>
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
>  ...rmats-are-supported-as-external-only.patch | 31 +++++++++++++++++
>  ...at-is_dmabuf_modifier_supported-are-.patch | 32 +++++++++++++++++
>  ...at-query_dmabuf_modifiers-are-extern.patch | 31 +++++++++++++++++
>  ...OD_BROADCOM_SAND128-only-available-f.patch | 34 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +++
>  5 files changed, 132 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-YUV-f=
ormats-are-supported-as-external-only.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats=
-at-is_dmabuf_modifier_supported-are-.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats=
-at-query_dmabuf_modifiers-are-extern.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_=
MOD_BROADCOM_SAND128-only-available-f.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-=
are-supported-as-external-only.patch b/meta/recipes-graphics/mesa/files/000=
1-freedreno-YUV-formats-are-supported-as-external-only.patch
> new file mode 100644
> index 0000000000..92f4b40997
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-sup=
ported-as-external-only.patch
> @@ -0,0 +1,31 @@
> +From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00 2001
> +From: Pablo Saavedra <psaavedra@igalia.com>
> +Date: Thu, 23 Sep 2021 10:23:56 +0200
> +Subject: [PATCH] freedreno: YUV formats are supported as external-only d=
mabuf
> + modifiers
> +
> +Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> +
> +Co-authored-by: Alberto Garcia <berto@igalia.com>
> +Co-authored-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> +---
> + src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gall=
ium/drivers/freedreno/freedreno_screen.c
> +index a9cd0e2..dc2b79d 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> +@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pipe_screen =
*pscreen,
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
> diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_=
dmabuf_modifier_supported-are-.patch b/meta/recipes-graphics/mesa/files/000=
1-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch
> new file mode 100644
> index 0000000000..c2e5462dd1
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_=
modifier_supported-are-.patch
> @@ -0,0 +1,32 @@
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
> +Fixes: 6ee10ab3de86 "gallium: Add pipe_screen::is_dmabuf_modifier_suppor=
ted"
> +Reviewed-by: Alejandro Pi=C3=B1eiro <apinheiro@igalia.com>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1052=
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index 4f69c20..a5c94db 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct pipe_=
screen *pscreen,
> +         for (i =3D 0; i < ARRAY_SIZE(v3d_available_modifiers); i++) {
> +                 if (v3d_available_modifiers[i] =3D=3D modifier) {
> +                         if (external_only)
> +-                                *external_only =3D false;
> ++                                *external_only =3D util_format_is_yuv(f=
ormat);
> +
> +                         return true;
> +                 }
> diff --git a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-que=
ry_dmabuf_modifiers-are-extern.patch b/meta/recipes-graphics/mesa/files/000=
2-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.patch
> new file mode 100644
> index 0000000000..dfbe994048
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmab=
uf_modifiers-are-extern.patch
> @@ -0,0 +1,31 @@
> +From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:37:25 +0200
> +Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are external=
_only
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
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index a5c94db..edde17d 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_screen=
 *pscreen,
> +         for (i =3D 0; i < *count; i++) {
> +                 modifiers[i] =3D v3d_available_modifiers[i];
> +                 if (external_only)
> +-                        external_only[i] =3D false;
> ++                        external_only[i] =3D util_format_is_yuv(format)=
;
> +        }
> + }
> +
> diff --git a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BRO=
ADCOM_SAND128-only-available-f.patch b/meta/recipes-graphics/mesa/files/000=
3-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> new file mode 100644
> index 0000000000..7d60a31f53
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_S=
AND128-only-available-f.patch
> @@ -0,0 +1,34 @@
> +From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00 2001
> +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> +Date: Thu, 29 Apr 2021 18:47:53 +0200
> +Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only available for=
 NV12
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
4>
> +---
> + src/gallium/drivers/v3d/v3d_screen.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/=
v3d/v3d_screen.c
> +index edde17d..684f912 100644
> +--- a/src/gallium/drivers/v3d/v3d_screen.c
> ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> +@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_scree=
n *pscreen,
> +         int i;
> +         int num_modifiers =3D ARRAY_SIZE(v3d_available_modifiers);
> +
> ++        /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 only for PIPE_FORMAT_=
NV12 */
> ++        if (format !=3D PIPE_FORMAT_NV12)
> ++                num_modifiers--;
> ++
> +         if (!modifiers) {
> +                 *count =3D num_modifiers;
> +                 return;
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index a85f94c75e..8d8871aa5d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,6 +19,10 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
>             file://0002-meson.build-make-TLS-ELF-optional.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
> +           file://0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-a=
re-.patch \
> +           file://0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-ext=
ern.patch \
> +           file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-availabl=
e-f.patch \
> +           file://0001-freedreno-YUV-formats-are-supported-as-external-o=
nly.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd051=
58c3b2cde2f6912b"
> --
> 2.30.2
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
