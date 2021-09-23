Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web10.189.1632422675956739286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 11:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=A8ND+k2i;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
	h=MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=gTSRxccXgWjbQLj74XwY8JaGi0tX2JkmqKQ7PdEsIGE=;
	b=A8ND+k2isnw/APj5pOZz7GnwIoBCHktW+qmZvO7ZXZTfGqoBcIpxCtPNhmr09JVcC++FQce++USkrWEQkiPwDjup9CpfCs+e0mpYerfA42ibT7YQdJP4sYEZz72N/BpSqwjtA2KtQBgDfUHkQIx+9LkIYdbuC7+sWwPcseCrFqZrp8q/qlph/PO+Ef7Gun1PunZno3PhHvTC7CGmgr1BX2IBqb1EktrvPLAV6WAoILJ0Z4Q0r1DVhyc7xE7cByb2Q3i5vQ90w5DtpM9jttxIy3DX4PduN5k6FgFJmwiCKuJjHrC1WGyaIicnVR3c1JnXOR7f2aizKZ1599nytko2tw==;
Received: from 164.25.165.83.dynamic.reverse-mundo-r.com ([83.165.25.164] helo=[192.168.1.245])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1mTThx-0001cj-1D; Thu, 23 Sep 2021 20:44:33 +0200
Message-ID: <eecd36d1edb8fb6a25bba430505f223c021b8302.camel@igalia.com>
Subject: Re: [OE-core] [hardknott][PATCH v2 ] mesa: Add patches for red label issues on video for VC4 and Freedreno
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Sep 2021 20:44:23 +0200
In-Reply-To: <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
References: 
	<CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
	 <20210923151723.3435155-1-psaavedra@igalia.com>
	 <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LI0kA4Dlcbt98Z+93Exo"

--=-LI0kA4Dlcbt98Z+93Exo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-09-23 at 18:01 +0200, Alexander Kanavin wrote:
> I would strongly suggest that you get everything merged upstream
> first before adding the patches to oe-core.
> 

I kindly accept your recommendation but could I make also a question?:
Couldn't it be enough just setting the 0001-freedreno-YUV-formats-are-
supported-as-external-only.patch with "Upstream-status: Submitted" [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991

> Even then, this should go to master first, as we do not want the
> situation when honister has these fixes, but master does not.
> 

I assume this point affects only to the 0001-freedreno-YUV-formats-are-
supported-as-external-only.patch patch since the other commits are
already in Mesa 20.2 (version available in Honister) and they are not
required for Honister and next Am I right?

> 
> Backport must be capitalized.
> 
> Alex
> 
> On Thu, 23 Sept 2021 at 17:17, Pablo Saavedra Rodi?o
> <psaavedra@igalia.com> wrote:
> > freedreno,v3d: YUV formats are supported as external-only dmabuf
> > modifiers.
> > 
> > This patch fix red label issues on video for Raspberry 4-64 Mesa
> > VC4
> > driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno
> > driver
> > 
> > Issue was originally reported in meta-webkit [1] and later
> > contributed
> > in Mesa [2]  where it was already merged in master.
> > 
> > * Commits for VC4 [3] had been nominated for stable 21.1 and
> > already in
> >   21.2 (available in honister).
> > * Commit for Freedreno [4] also reported (not merged yet).
> > 
> > [1] https://github.com/Igalia/meta-webkit/issues/185
> > [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> > [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10534
> > [4] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
> > 
> > Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > ---
> >  ...rmats-are-supported-as-external-only.patch | 34
> > +++++++++++++++++
> >  ...at-is_dmabuf_modifier_supported-are-.patch | 35
> > ++++++++++++++++++
> >  ...at-query_dmabuf_modifiers-are-extern.patch | 34
> > +++++++++++++++++
> >  ...OD_BROADCOM_SAND128-only-available-f.patch | 37
> > +++++++++++++++++++
> >  meta/recipes-graphics/mesa/mesa.inc           |  4 ++
> >  5 files changed, 144 insertions(+)
> >  create mode 100644 meta/recipes-graphics/mesa/files/0001-
> > freedreno-YUV-formats-are-supported-as-external-only.patch
> >  create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-YUV-
> > formats-at-is_dmabuf_modifier_supported-are-.patch
> >  create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-YUV-
> > formats-at-query_dmabuf_modifiers-are-extern.patch
> >  create mode 100644 meta/recipes-graphics/mesa/files/0003-v3d-
> > DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> > 
> > diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-
> > formats-are-supported-as-external-only.patch b/meta/recipes-
> > graphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-
> > external-only.patch
> > new file mode 100644
> > index 0000000000..9688ac1619
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-
> > are-supported-as-external-only.patch
> > @@ -0,0 +1,34 @@
> > +From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00
> > 2001
> > +From: Pablo Saavedra <psaavedra@igalia.com>
> > +Date: Thu, 23 Sep 2021 10:23:56 +0200
> > +Subject: [PATCH] freedreno: YUV formats are supported as external-
> > only dmabuf
> > + modifiers
> > +
> > +Based on
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524
> > +
> > +Co-authored-by: Alberto Garcia <berto@igalia.com>
> > +Co-authored-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> > +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > +
> > +Upstream-Status: Pending
> > [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991]
> > +Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > +---
> > + src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c
> > b/src/gallium/drivers/freedreno/freedreno_screen.c
> > +index a9cd0e2..dc2b79d 100644
> > +--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> > ++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> > +@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct
> > pipe_screen *pscreen,
> > +                       modifiers[num] = screen-
> > >supported_modifiers[i];
> > + 
> > +               if (external_only)
> > +-                      external_only[num] = 0;
> > ++                      external_only[num] =
> > util_format_is_yuv(format);
> > + 
> > +               num++;
> > +       }
> > +-- 
> > +2.30.2
> > +
> > diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-
> > at-is_dmabuf_modifier_supported-are-.patch b/meta/recipes-
> > graphics/mesa/files/0001-v3d-YUV-formats-at-
> > is_dmabuf_modifier_supported-are-.patch
> > new file mode 100644
> > index 0000000000..9e90a07c8e
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-
> > is_dmabuf_modifier_supported-are-.patch
> > @@ -0,0 +1,35 @@
> > +From 389bffa0981bba60f9d081063c150fb17e497c4a Mon Sep 17 00:00:00
> > 2001
> > +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> > +Date: Thu, 29 Apr 2021 18:15:27 +0200
> > +Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported
> > are
> > + external_only
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> > +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer = red Label on
> > video"
> > +
> > +Fixes: 6ee10ab3de86 "gallium: Add
> > pipe_screen::is_dmabuf_modifier_supported"
> > +Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
> > +Part-of:
> > <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
> > +
> > +Upstream-status: backport
> > [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> > +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> > +---
> > + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> > b/src/gallium/drivers/v3d/v3d_screen.c
> > +index 4f69c20..a5c94db 100644
> > +--- a/src/gallium/drivers/v3d/v3d_screen.c
> > ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> > +@@ -670,7 +670,7 @@ v3d_screen_is_dmabuf_modifier_supported(struct
> > pipe_screen *pscreen,
> > +         for (i = 0; i < ARRAY_SIZE(v3d_available_modifiers); i++)
> > {
> > +                 if (v3d_available_modifiers[i] == modifier) {
> > +                         if (external_only)
> > +-                                *external_only = false;
> > ++                                *external_only =
> > util_format_is_yuv(format);
> > + 
> > +                         return true;
> > +                 }
> > diff --git a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-
> > at-query_dmabuf_modifiers-are-extern.patch b/meta/recipes-
> > graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-
> > are-extern.patch
> > new file mode 100644
> > index 0000000000..d1658f9a87
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-
> > query_dmabuf_modifiers-are-extern.patch
> > @@ -0,0 +1,34 @@
> > +From a5f74e140cce671dd9a04d3b3541cd3faf91916b Mon Sep 17 00:00:00
> > 2001
> > +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> > +Date: Thu, 29 Apr 2021 18:37:25 +0200
> > +Subject: [PATCH] v3d: YUV formats at query_dmabuf_modifiers are
> > external_only
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +This fixes Issue https://github.com/Igalia/meta-webkit/issues/185
> > +"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer = red Label on
> > video"
> > +
> > +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128
> > support"
> > +Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
> > +Part-of:
> > <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
> > +
> > +Upstream-status: backport
> > [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> > +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> > +---
> > + src/gallium/drivers/v3d/v3d_screen.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> > b/src/gallium/drivers/v3d/v3d_screen.c
> > +index a5c94db..edde17d 100644
> > +--- a/src/gallium/drivers/v3d/v3d_screen.c
> > ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> > +@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct
> > pipe_screen *pscreen,
> > +         for (i = 0; i < *count; i++) {
> > +                 modifiers[i] = v3d_available_modifiers[i];
> > +                 if (external_only)
> > +-                        external_only[i] = false;
> > ++                        external_only[i] =
> > util_format_is_yuv(format);
> > +        }
> > + }
> > + 
> > diff --git a/meta/recipes-graphics/mesa/files/0003-v3d-
> > DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> > b/meta/recipes-graphics/mesa/files/0003-v3d-
> > DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> > new file mode 100644
> > index 0000000000..17a612ea7e
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0003-v3d-
> > DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch
> > @@ -0,0 +1,37 @@
> > +From cd2dce0257608fde2b9dd21429d1d7356e37abe1 Mon Sep 17 00:00:00
> > 2001
> > +From: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> > +Date: Thu, 29 Apr 2021 18:47:53 +0200
> > +Subject: [PATCH] v3d: DRM_FORMAT_MOD_BROADCOM_SAND128 only
> > available for NV12
> > + format.
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +We were exposing as available DRM_FORMAT_MOD_BROADCOM_SAND128 for
> > +any format.
> > +
> > +Fixes: 95c4f0f91098 "v3d: Enables DRM_FORMAT_MOD_BROADCOM_SAND128
> > support"
> > +Reviewed-by: Alejandro Piñeiro <apinheiro@igalia.com>
> > +Part-of:
> > <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524>
> > +
> > +Upstream-status: backport
> > [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524]
> > +Signed-off-by: pablo saavedra <psaavedra@igalia.com>
> > +---
> > + src/gallium/drivers/v3d/v3d_screen.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/src/gallium/drivers/v3d/v3d_screen.c
> > b/src/gallium/drivers/v3d/v3d_screen.c
> > +index edde17d..684f912 100644
> > +--- a/src/gallium/drivers/v3d/v3d_screen.c
> > ++++ b/src/gallium/drivers/v3d/v3d_screen.c
> > +@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct
> > pipe_screen *pscreen,
> > +         int i;
> > +         int num_modifiers = ARRAY_SIZE(v3d_available_modifiers);
> > + 
> > ++        /* Expose DRM_FORMAT_MOD_BROADCOM_SAND128 only for
> > PIPE_FORMAT_NV12 */
> > ++        if (format != PIPE_FORMAT_NV12)
> > ++                num_modifiers--;
> > ++
> > +         if (!modifiers) {
> > +                 *count = num_modifiers;
> > +                 return;
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index a85f94c75e..8d8871aa5d 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -19,6 +19,10 @@ SRC_URI =
> > "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >             file://0002-meson.build-make-TLS-ELF-optional.patch \
> >             file://0001-meson-misdetects-64bit-atomics-on-mips-
> > clang.patch \
> >             file://0001-futex.h-Define-__NR_futex-if-it-does-not-
> > exist.patch \
> > +           file://0001-v3d-YUV-formats-at-
> > is_dmabuf_modifier_supported-are-.patch \
> > +           file://0002-v3d-YUV-formats-at-query_dmabuf_modifiers-
> > are-extern.patch \
> > +           file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-
> > available-f.patch \
> > +           file://0001-freedreno-YUV-formats-are-supported-as-
> > external-only.patch \
> >             "
> > 
> >  SRC_URI[sha256sum] =
> > "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"


--=-LI0kA4Dlcbt98Z+93Exo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Thu, 2021-09-23 at 18:01 +0200, Alexander =
Kanavin wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div><div>I=
 would strongly suggest that you get everything merged upstream first befor=
e adding the patches to oe-core.<br></div><div><br></div></div></div></bloc=
kquote><div><br></div><div>I kindly accept your recommendation but&nbsp;cou=
ld I make also a question?: Couldn't it be enough just setting the 0001-fre=
edreno-YUV-formats-are-supported-as-external-only.patch with "Upstream-stat=
us:&nbsp;<span style=3D"font-family: sans-serif; font-size: 12.7px; font-we=
ight: 700; orphans: 2; widows: 2;">Submitted"</span><span style=3D"font-fam=
ily: sans-serif; font-size: 12.7px; orphans: 2; widows: 2;"> [1].</span></d=
iv><div><br></div><div>[1]&nbsp;<a href=3D"https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/12991" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991</a></div><div><b=
r></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div>Even then, this sh=
ould go to master first, as we do not want the situation when honister has =
these fixes, but master does not.</div><div dir=3D"ltr"><br></div></div></b=
lockquote><div><br></div><div>I assume this point affects only to the 0001-=
freedreno-YUV-formats-are-supported-as-external-only.patch patch since the =
other commits are already in Mesa 20.2 (version available in Honister) and =
they are not required for Honister and next Am I right?</div><div><br></div=
><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729=
fcf solid;padding-left:1ex"><div dir=3D"ltr"><br><div>Backport must be capi=
talized.<br></div><div><br></div><div>Alex</div></div><div><br></div><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 23 Sept =
2021 at 17:17, Pablo Saavedra Rodi?o &lt;<a href=3D"mailto:psaavedra@igalia=
.com">psaavedra@igalia.com</a>&gt; wrote:<br></div><blockquote type=3D"cite=
" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1e=
x"><div>freedreno,v3d: YUV formats are supported as external-only dmabuf<br=
>modifiers.<br></div><div><br>This patch fix red label issues on video for =
Raspberry 4-64 Mesa VC4<br>driver and for iMX53 Adreno A200 GPU using the M=
esa Freedreno driver<br></div><div><br>Issue was originally reported in met=
a-webkit [1] and later contributed<br>in Mesa [2]&nbsp; where it was alread=
y merged in master.<br></div><div><br>* Commits for VC4 [3] had been nomina=
ted for stable 21.1 and already in<br>&nbsp; 21.2 (available in honister).<=
br>* Commit for Freedreno [4] also reported (not merged yet).<br></div><div=
><br>[1] <a href=3D"https://github.com/Igalia/meta-webkit/issues/185" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Igalia/meta-webkit/iss=
ues/185</a><br>[2] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/me=
rge_requests/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/mesa/mesa/-/merge_requests/10524</a><br>[3] <a href=3D"https:/=
/gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10534" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reques=
ts/10534</a><br>[4] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/12991" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fr=
eedesktop.org/mesa/mesa/-/merge_requests/12991</a><br></div><div><br>Signed=
-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" target=
=3D"_blank">psaavedra@igalia.com</a>&gt;<br>---<br>&nbsp;...rmats-are-suppo=
rted-as-external-only.patch | 34 +++++++++++++++++<br>&nbsp;...at-is_dmabuf=
_modifier_supported-are-.patch | 35 ++++++++++++++++++<br>&nbsp;...at-query=
_dmabuf_modifiers-are-extern.patch | 34 +++++++++++++++++<br>&nbsp;...OD_BR=
OADCOM_SAND128-only-available-f.patch | 37 +++++++++++++++++++<br>&nbsp;met=
a/recipes-graphics/mesa/mesa.inc&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&=
nbsp; 4 ++<br>&nbsp;5 files changed, 144 insertions(+)<br>&nbsp;create mode=
 100644 meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-sup=
ported-as-external-only.patch<br>&nbsp;create mode 100644 meta/recipes-grap=
hics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.p=
atch<br>&nbsp;create mode 100644 meta/recipes-graphics/mesa/files/0002-v3d-=
YUV-formats-at-query_dmabuf_modifiers-are-extern.patch<br>&nbsp;create mode=
 100644 meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_S=
AND128-only-available-f.patch<br></div><div><br>diff --git a/meta/recipes-g=
raphics/mesa/files/0001-freedreno-YUV-formats-are-supported-as-external-onl=
y.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-YUV-formats-are-s=
upported-as-external-only.patch<br>new file mode 100644<br>index 0000000000=
..9688ac1619<br>--- /dev/null<br>+++ b/meta/recipes-graphics/mesa/files/000=
1-freedreno-YUV-formats-are-supported-as-external-only.patch<br>@@ -0,0 +1,=
34 @@<br>+From e5b33a4b744a3114ff054ae577ac7802d9221490 Mon Sep 17 00:00:00=
 2001<br>+From: Pablo Saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com" =
target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>+Date: Thu, 23 Sep 2021 1=
0:23:56 +0200<br>+Subject: [PATCH] freedreno: YUV formats are supported as =
external-only dmabuf<br>+ modifiers<br>+<br>+Based on <a href=3D"https://gi=
tlab.freedesktop.org/mesa/mesa/-/merge_requests/10524" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/=
10524</a><br>+<br>+Co-authored-by: Alberto Garcia &lt;<a href=3D"mailto:ber=
to@igalia.com" target=3D"_blank">berto@igalia.com</a>&gt;<br>+Co-authored-b=
y: Jose Maria Casanova Crespo &lt;<a href=3D"mailto:jmcasanova@igalia.com" =
target=3D"_blank">jmcasanova@igalia.com</a>&gt;<br>+Signed-off-by: Pablo Sa=
avedra &lt;<a href=3D"mailto:psaavedra@igalia.com" target=3D"_blank">psaave=
dra@igalia.com</a>&gt;<br>+<br>+Upstream-Status: Pending [<a href=3D"https:=
//gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/12991</a>]<br>+Signed-off-by: Pablo Saavedra &lt;<a href=3D"mailto:psaa=
vedra@igalia.com" target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>+---<br=
>+ src/gallium/drivers/freedreno/freedreno_screen.c | 2 +-<br>+ 1 file chan=
ged, 1 insertion(+), 1 deletion(-)<br>+<br>+diff --git a/src/gallium/driver=
s/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_sc=
reen.c<br>+index a9cd0e2..dc2b79d 100644<br>+--- a/src/gallium/drivers/free=
dreno/freedreno_screen.c<br>++++ b/src/gallium/drivers/freedreno/freedreno_=
screen.c<br>+@@ -804,7 +804,7 @@ fd_screen_query_dmabuf_modifiers(struct pi=
pe_screen *pscreen,<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;modifiers[num] =3D screen-&gt;supported_mod=
ifiers[i];<br>+ <br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;if (external_only)<br>+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; external_only[num] =3D 0;<br>++&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; external_only[n=
um] =3D util_format_is_yuv(format);<br>+ <br>+&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;num++;<br>+&nbsp; &nbsp; &nbsp; &nbsp;}<br>+-- <b=
r>+2.30.2<br>+<br>diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-YU=
V-formats-at-is_dmabuf_modifier_supported-are-.patch b/meta/recipes-graphic=
s/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patc=
h<br>new file mode 100644<br>index 0000000000..9e90a07c8e<br>--- /dev/null<=
br>+++ b/meta/recipes-graphics/mesa/files/0001-v3d-YUV-formats-at-is_dmabuf=
_modifier_supported-are-.patch<br>@@ -0,0 +1,35 @@<br>+From 389bffa0981bba6=
0f9d081063c150fb17e497c4a Mon Sep 17 00:00:00 2001<br>+From: Jose Maria Cas=
anova Crespo &lt;<a href=3D"mailto:jmcasanova@igalia.com" target=3D"_blank"=
>jmcasanova@igalia.com</a>&gt;<br>+Date: Thu, 29 Apr 2021 18:15:27 +0200<br=
>+Subject: [PATCH] v3d: YUV formats at is_dmabuf_modifier_supported are<br>=
+ external_only<br>+MIME-Version: 1.0<br>+Content-Type: text/plain; charset=
=3DUTF-8<br>+Content-Transfer-Encoding: 8bit<br>+<br>+This fixes Issue <a h=
ref=3D"https://github.com/Igalia/meta-webkit/issues/185" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/Igalia/meta-webkit/issues/185</a><br>=
+"Issue Raspberry 4-64 + Mesa VC4 driver + Gstreamer =3D red Label on video=
"<br>+<br>+Fixes: 6ee10ab3de86 "gallium: Add pipe_screen::is_dmabuf_modifie=
r_supported"<br>+Reviewed-by: Alejandro Pi=C3=B1eiro &lt;<a href=3D"mailto:=
apinheiro@igalia.com" target=3D"_blank">apinheiro@igalia.com</a>&gt;<br>+Pa=
rt-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requ=
ests/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop=
.org/mesa/mesa/-/merge_requests/10524</a>&gt;<br>+<br>+Upstream-status: bac=
kport [<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/10524" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/10524</a>]<br>+Signed-off-by: pablo saavedra &l=
t;<a href=3D"mailto:psaavedra@igalia.com" target=3D"_blank">psaavedra@igali=
a.com</a>&gt;<br>+---<br>+ src/gallium/drivers/v3d/v3d_screen.c | 2 +-<br>+=
 1 file changed, 1 insertion(+), 1 deletion(-)<br>+<br>+diff --git a/src/ga=
llium/drivers/v3d/v3d_screen.c b/src/gallium/drivers/v3d/v3d_screen.c<br>+i=
ndex 4f69c20..a5c94db 100644<br>+--- a/src/gallium/drivers/v3d/v3d_screen.c=
<br>++++ b/src/gallium/drivers/v3d/v3d_screen.c<br>+@@ -670,7 +670,7 @@ v3d=
_screen_is_dmabuf_modifier_supported(struct pipe_screen *pscreen,<br>+&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; ARRAY_SIZE(v3d_available_=
modifiers); i++) {<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;if (v3d_available_modifiers[i] =3D=3D modifier) {<br>+&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;if (external_only)<br>+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *external_=
only =3D false;<br>++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *external_only =
=3D util_format_is_yuv(format);<br>+ <br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;<br>+&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>diff --gi=
t a/meta/recipes-graphics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_m=
odifiers-are-extern.patch b/meta/recipes-graphics/mesa/files/0002-v3d-YUV-f=
ormats-at-query_dmabuf_modifiers-are-extern.patch<br>new file mode 100644<b=
r>index 0000000000..d1658f9a87<br>--- /dev/null<br>+++ b/meta/recipes-graph=
ics/mesa/files/0002-v3d-YUV-formats-at-query_dmabuf_modifiers-are-extern.pa=
tch<br>@@ -0,0 +1,34 @@<br>+From a5f74e140cce671dd9a04d3b3541cd3faf91916b M=
on Sep 17 00:00:00 2001<br>+From: Jose Maria Casanova Crespo &lt;<a href=3D=
"mailto:jmcasanova@igalia.com" target=3D"_blank">jmcasanova@igalia.com</a>&=
gt;<br>+Date: Thu, 29 Apr 2021 18:37:25 +0200<br>+Subject: [PATCH] v3d: YUV=
 formats at query_dmabuf_modifiers are external_only<br>+MIME-Version: 1.0<=
br>+Content-Type: text/plain; charset=3DUTF-8<br>+Content-Transfer-Encoding=
: 8bit<br>+<br>+This fixes Issue <a href=3D"https://github.com/Igalia/meta-=
webkit/issues/185" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
Igalia/meta-webkit/issues/185</a><br>+"Issue Raspberry 4-64 + Mesa VC4 driv=
er + Gstreamer =3D red Label on video"<br>+<br>+Fixes: 95c4f0f91098 "v3d: E=
nables DRM_FORMAT_MOD_BROADCOM_SAND128 support"<br>+Reviewed-by: Alejandro =
Pi=C3=B1eiro &lt;<a href=3D"mailto:apinheiro@igalia.com" target=3D"_blank">=
apinheiro@igalia.com</a>&gt;<br>+Part-of: &lt;<a href=3D"https://gitlab.fre=
edesktop.org/mesa/mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a=
>&gt;<br>+<br>+Upstream-status: backport [<a href=3D"https://gitlab.freedes=
ktop.org/mesa/mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a>]<b=
r>+Signed-off-by: pablo saavedra &lt;<a href=3D"mailto:psaavedra@igalia.com=
" target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>+---<br>+ src/gallium/d=
rivers/v3d/v3d_screen.c | 2 +-<br>+ 1 file changed, 1 insertion(+), 1 delet=
ion(-)<br>+<br>+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gal=
lium/drivers/v3d/v3d_screen.c<br>+index a5c94db..edde17d 100644<br>+--- a/s=
rc/gallium/drivers/v3d/v3d_screen.c<br>++++ b/src/gallium/drivers/v3d/v3d_s=
creen.c<br>+@@ -655,7 +655,7 @@ v3d_screen_query_dmabuf_modifiers(struct pi=
pe_screen *pscreen,<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &=
lt; *count; i++) {<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;modifiers[i] =3D v3d_available_modifiers[i];<br>+&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (external_only)<br>+-&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; external_only[i] =3D false;<br>++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; external_only[i] =3D util_for=
mat_is_yuv(format);<br>+&nbsp; &nbsp; &nbsp; &nbsp; }<br>+ }<br>+ <br>diff =
--git a/meta/recipes-graphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_S=
AND128-only-available-f.patch b/meta/recipes-graphics/mesa/files/0003-v3d-D=
RM_FORMAT_MOD_BROADCOM_SAND128-only-available-f.patch<br>new file mode 1006=
44<br>index 0000000000..17a612ea7e<br>--- /dev/null<br>+++ b/meta/recipes-g=
raphics/mesa/files/0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-available-=
f.patch<br>@@ -0,0 +1,37 @@<br>+From cd2dce0257608fde2b9dd21429d1d7356e37ab=
e1 Mon Sep 17 00:00:00 2001<br>+From: Jose Maria Casanova Crespo &lt;<a hre=
f=3D"mailto:jmcasanova@igalia.com" target=3D"_blank">jmcasanova@igalia.com<=
/a>&gt;<br>+Date: Thu, 29 Apr 2021 18:47:53 +0200<br>+Subject: [PATCH] v3d:=
 DRM_FORMAT_MOD_BROADCOM_SAND128 only available for NV12<br>+ format.<br>+M=
IME-Version: 1.0<br>+Content-Type: text/plain; charset=3DUTF-8<br>+Content-=
Transfer-Encoding: 8bit<br>+<br>+We were exposing as available DRM_FORMAT_M=
OD_BROADCOM_SAND128 for<br>+any format.<br>+<br>+Fixes: 95c4f0f91098 "v3d: =
Enables DRM_FORMAT_MOD_BROADCOM_SAND128 support"<br>+Reviewed-by: Alejandro=
 Pi=C3=B1eiro &lt;<a href=3D"mailto:apinheiro@igalia.com" target=3D"_blank"=
>apinheiro@igalia.com</a>&gt;<br>+Part-of: &lt;<a href=3D"https://gitlab.fr=
eedesktop.org/mesa/mesa/-/merge_requests/10524" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524=
</a>&gt;<br>+<br>+Upstream-status: backport [<a href=3D"https://gitlab.free=
desktop.org/mesa/mesa/-/merge_requests/10524" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524</a>=
]<br>+Signed-off-by: pablo saavedra &lt;<a href=3D"mailto:psaavedra@igalia.=
com" target=3D"_blank">psaavedra@igalia.com</a>&gt;<br>+---<br>+ src/galliu=
m/drivers/v3d/v3d_screen.c | 4 ++++<br>+ 1 file changed, 4 insertions(+)<br=
>+<br>+diff --git a/src/gallium/drivers/v3d/v3d_screen.c b/src/gallium/driv=
ers/v3d/v3d_screen.c<br>+index edde17d..684f912 100644<br>+--- a/src/galliu=
m/drivers/v3d/v3d_screen.c<br>++++ b/src/gallium/drivers/v3d/v3d_screen.c<b=
r>+@@ -646,6 +646,10 @@ v3d_screen_query_dmabuf_modifiers(struct pipe_scree=
n *pscreen,<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int i;<br>+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;int num_modifiers =3D ARRAY_SIZE(v3d_available_modifier=
s);<br>+ <br>++&nbsp; &nbsp; &nbsp; &nbsp; /* Expose DRM_FORMAT_MOD_BROADCO=
M_SAND128 only for PIPE_FORMAT_NV12 */<br>++&nbsp; &nbsp; &nbsp; &nbsp; if =
(format !=3D PIPE_FORMAT_NV12)<br>++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; num_modifiers--;<br>++<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;if (!modifiers) {<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;*count =3D num_modifiers;<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>diff --git a/meta/recipes-graphics/=
mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc<br>index a85f94c75e..8d=
8871aa5d 100644<br>--- a/meta/recipes-graphics/mesa/mesa.inc<br>+++ b/meta/=
recipes-graphics/mesa/mesa.inc<br>@@ -19,6 +19,10 @@ SRC_URI =3D "<a href=
=3D"https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"nore=
ferrer" target=3D"_blank">https://mesa.freedesktop.org/archive/mesa-${PV}.t=
ar.xz</a> \<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0002-meson.=
build-make-TLS-ELF-optional.patch \<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \<br>&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch \<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;file://0001-v3d-YUV-formats-at-is_dmabuf_modifier_supported-are-.patch \=
<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0002-v3d-YUV-formats-a=
t-query_dmabuf_modifiers-are-extern.patch \<br>+&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;file://0003-v3d-DRM_FORMAT_MOD_BROADCOM_SAND128-only-availabl=
e-f.patch \<br>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-freedr=
eno-YUV-formats-are-supported-as-external-only.patch \<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; "<br></div><div><br>&nbsp;SRC_URI[sha256sum] =3D "=
565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"<br></div>=
</blockquote></div></blockquote><div><br></div><div><span></span></div></bo=
dy></html>

--=-LI0kA4Dlcbt98Z+93Exo--
