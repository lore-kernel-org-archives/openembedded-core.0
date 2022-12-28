Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD4EC4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 20:34:17 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.189622.1672259651732001924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 12:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHKfI3rb;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id v23so7380982ljj.9
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu8YbsHvz/1w1RvjuHWoR+icWTwSPEOG1x9ZNgv3TXA=;
        b=OHKfI3rbFpDIruaOxuLthEMweyESEgQAAF4eoZ4jU9mnMWSscpAQdQDA2t/JoPpXzr
         FhA5PynNLNw7+/cSAZgGSgcRrcRXJolv1NFN6G5YcIwprGdMNrhyPLNdlc5mQVzZ/hxk
         cH4tV+YjpYuBQ4xFS27zjvS1dbdcrH8HsI8m5BfRW1K1MBGkG4fKs0Y4vOIfx7cR+Ksf
         dIqwZmWOTu0XIT2h+jk/PBlOZDWHugllprXMZO3OPlz9ysn3e+otWmrgLTOCZlL2cLtf
         w7w+fyX0eSZmQRrggjkOtKJ3Un51Sf4yp3f6w0MaJ9clHa0Tru/ydjb55TqvQjQwS3bR
         TpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iu8YbsHvz/1w1RvjuHWoR+icWTwSPEOG1x9ZNgv3TXA=;
        b=kFP+mfb/b7HXBT0zNdAq1GtmkfYwdQVo3USYkv6Yr8x6+PgCawBoZGX5RNFCZ94BXW
         jKd2Y/khWiHIafkOO8r6MUx/eSreMhT8QlTUsIgpTP1HZLzxud0gSCIUOKluJYAg/Wx+
         PnQ28P3kKK5dcuy4Z8hAmKqeq2FL7DISOc50NLps6xqj0U7IEWU4qiWxrB3l/SqZ/5WS
         CdPVA38yl4aeLpqJ5UbMzXRTPretn4G0jpMFa3TAtEzKVyk7zGN40Td63oiqyMvUlrlD
         Dc89nn6SgdoqQq8IKJ2jTh+C0U3LyXjF7deD4uwAeirhZmSur0T7MUdCIoCgnGDxxg/R
         yKQg==
X-Gm-Message-State: AFqh2krTT2aPjhBcCNfi+7/XG5DsaDQ8QaosMLyQOHdFVsgnShCYucYV
	CfAskmQYAXwlpp7iWJfKuj4iN6+ozzTBfJxpicU=
X-Google-Smtp-Source: AMrXdXuwWBVwQIhsLmkl52aA+36h0KMeSq3vTcGqAZ4hbQ7akcDFvh7K5jsZdSqSG23qXl9se06C1lrRZu3js6kO1qs=
X-Received: by 2002:a05:651c:168a:b0:27a:2285:411b with SMTP id
 bd10-20020a05651c168a00b0027a2285411bmr2083667ljb.33.1672259649535; Wed, 28
 Dec 2022 12:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20221228202649.91106-1-vince@underview.tech>
In-Reply-To: <20221228202649.91106-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Dec 2022 21:33:57 +0100
Message-ID: <CANNYZj9ekRRe1WSD-6YOPqFGBrP6crW2m+R4QgQZQ=qG9GZoLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa-gl: allow mesa (gbm) to compile without backend
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 20:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175087

This is not a backport. The upstream code does not have the change
that the patch introduces:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gbm/main/backend.c

Please do a proper upstream submission, and do not tell untruths in
your submissions here. You do not want your future contributions to be
viewed with suspicion.

Alex

On Wed, 28 Dec 2022 at 21:27, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Commit introduces a patch that allows for gbm to
> be built with an empty backend. There are situation
> where mesa-gl is the preferred provider for virtual/libgbm,
> virtual/libgl, virtual/mesa, etc... But the x11 DISTRO_FEATURE
> isn't included this leads to build errors such as
>
> | /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function
> `find_backend':
> | backend.c:(.text.find_backend+0xa4): undefined reference to
> `gbm_dri_backend'
> | /../../../ld:
> src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
> undefined reference to `gbm_dri_backend'
> | collect2: error: ld returned 1 exit status
>
> Add patch bypasses compilation issue by excluding gbm dri backend.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  ...0001-undefined-reference-gbm-backend.patch | 51 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb  |  6 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch b/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
> new file mode 100644
> index 0000000000..66ab52fdaa
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-undefined-reference-gbm-backend.patch
> @@ -0,0 +1,51 @@
> +Fix gbm compile without dri
> +
> +Upstream-Status: Backport
> +
> +Only required if mesa-gl is the preferred provider
> +of virtual/libgl, etc and the x11 DISTRO_FEATURE
> +not included.
> +
> +Patch allows for gbm to be built with an
> +empty backend. Thera are situation where mesa-gl
> +is the preferred provider for virtual/libgbm,
> +virtual/libgl, etc... But the x11 DISTRO_FEATURE
> +isn't included this leads to build errors such as
> +
> +| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
> +| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
> +| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
> +undefined reference to `gbm_dri_backend'
> +| collect2: error: ld returned 1 exit status
> +
> +Relevant previous mesa bug:
> +* https://bugs.freedesktop.org/show_bug.cgi?id=78225
> +
> +Build libgbm without backend if its known that libgbm
> +won't be utilized in OE system image.
> +
> +Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> +Index: mesa-22.2.3/src/gbm/main/backend.c
> +===================================================================
> +--- mesa-22.2.3.orig/src/gbm/main/backend.c
> ++++ mesa-22.2.3/src/gbm/main/backend.c
> +@@ -42,7 +42,9 @@
> + #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
> + #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
> +
> ++#ifdef HAVE_DRI
> + extern const struct gbm_backend gbm_dri_backend;
> ++#endif
> +
> + struct gbm_backend_desc {
> +    const char *name;
> +@@ -51,7 +53,9 @@ struct gbm_backend_desc {
> + };
> +
> + static const struct gbm_backend_desc builtin_backends[] = {
> ++#ifdef HAVE_DRI
> +    { "dri", &gbm_dri_backend },
> ++#endif
> + };
> +
> + #define BACKEND_LIB_SUFFIX "_gbm"
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> index f2bc8f6b5b..1571002317 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> @@ -6,6 +6,12 @@ PROVIDES = "virtual/libgl virtual/mesa"
>
>  S = "${WORKDIR}/mesa-${PV}"
>
> +SRC_URI:append = "\
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://0001-undefined-reference-gbm-backend.patch', d)} \
> +  "
> +
> +TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
> +
>  # At least one DRI rendering engine is required to build mesa.
>  # When no X11 is available, use osmesa for the rendering engine.
>  PACKAGECONFIG ??= "opengl ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175086): https://lists.openembedded.org/g/openembedded-core/message/175086
> Mute This Topic: https://lists.openembedded.org/mt/95926733/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

