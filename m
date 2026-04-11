Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15CAF3ED4D
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 12:52:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.194489.1775911965867385222
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 05:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xkCqdmIf;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so20728335e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775911964; x=1776516764; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOGEezv5yvGGq6/bvlNOH1UvN8kXf7yK24M9zaT5n10=;
        b=xkCqdmIfMsSjHhllngQufx4AsHezv3yHUloTEKJ2yUBoK4oF7lqGDf7bIEjQ5dM3tj
         WUgI6paGSsk0Qo8cCotPvHQTVw+6FR+77mgqVKYOFYoHu6ILF+rXNoeFJwOX6Qhe20FC
         lsx1gb+ejVY/rWgUfz5Idhu2PGMrueQ0FhSt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911964; x=1776516764;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOGEezv5yvGGq6/bvlNOH1UvN8kXf7yK24M9zaT5n10=;
        b=Qwu5JMEVobFUPfKLuvaz6Ity+/iI/kT3DBOqh7RAZlYulsKSs6blZiuv5W5KxFDz7f
         tsoH51JfwE++/6eUMSBqEA13cEeTE2AdM2RozJ18/j0sxNnFD9R5tbssjDUWpMDDP5mx
         3/TGS81581m9qw2cQxaboBwEztAd72QxHwnDoxryGgx/60b2DY3j3eRcF+c1pLk0t0yo
         bIign/2XqaHWenK9dKwHW8QZwCRDJ4ErQi8cxH4Z1TYAwjj1LzyrBsJRYFDfu9r21dBj
         LJkFMq4oXF4HHSu+NIAS9szvNT1tNSib9JJd1BACpVY+zEZTGRN1AQeL8nwTaPFSFyco
         4zBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4wWR9Ei/h1tmmyugvuRvkPpUm/WmCiCX3Xze6SEE3lq6S6Q8vrhaSvLP6nVEq+vIRwZRtSxDcxE7WHuxd1A/i7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw16ghY5bWftwUP7Vj6iOeM2cvHCp7KyCVA9KFnqGcRBVTiz8ds
	q3/mJKWBJSzagJBT7hSl347asRdvYBAV455edgtjWwPbyfkkcu/kukkjbwPTh7xZvf4=
X-Gm-Gg: AeBDiesnFwKxl+BK9kwdDhbRFcaPsrG1b6pInN7jCJvQoHDsjRUlxNwm+ECHwQVv+yZ
	dtBTMva9/wRBBANXnI2S6GTRFv7mqxWBNQx1sfwAMNEZptUPWwyWISFH5zVdbprrwZ1BpxqYGi0
	1Xmbf0CYp5Sxt6j5dUyiXU45GZMtNuDIJ5PXSYwJry1oE9erCtN/eWdH57obas6UE0OcsjUKTrb
	4iJRrb5EFv4oF6LstavYW9Shl2kFuJk4ZHoiEw7aPhlJAkj5T1fRpPa6WZYji1FQW/mB8yhHpOx
	tNI60CbiliB+TmY3Z+MM7NemXGwBTulE4GsVMbqtP2eJ9kZSLDdNXyn+tqq154tiYqoHHpM9KIn
	PdAUclF3fkceCuwxHUVn99j6EjrKOgwyVcdituzztiEe+5PPXn35OqqsrxuT+I32ZR5bSrGcHEC
	JjEOELCS3FmNzmwwWqsRX8jV1pubyX3BgpE6AJq7N2Ctcbb4+TvxJ74RluhPSLtAaPmvRDAyj59
	6CK/fFKOJb4ER1BSvwMVdX2ZA==
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr64036365e9.26.1775911964209;
        Sat, 11 Apr 2026 05:52:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888c12sm166549945e9.3.2026.04.11.05.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:52:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 14:52:43 +0200
Message-Id: <DHQC912RAJRW.1MLR6Y2ATF68X@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH] virglrenderer: Fix build with
 glibc 2.43+
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Khem Raj" <raj.khem@gmail.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>
To: <martin.jansa@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260410061205.1473776-1-martin.jansa@gmail.com>
In-Reply-To: <20260410061205.1473776-1-martin.jansa@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 12:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235046

On Fri Apr 10, 2026 at 8:12 AM CEST, Martin Jansa via lists.openembedded.or=
g wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Thanks Martin,

With this patch, the build progress further but, now, ovmf-native fails to =
build:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/25/step=
s/25/logs/stdio (line 16662).
(I could reproduce that locally with my ubuntu26.04 container)

There is a patch for master[0] but the patches inside it do not apply clean=
ly on the whinlatter version.

[0]: https://lore.kernel.org/openembedded-core/20260409122225.1069828-1-zbo=
szor@gmail.com/

Can you send the backport?

Regards,

>  ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
>  .../virglrenderer/virglrenderer_1.1.1.bb      |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/000=
1-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-u=
se-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphi=
cs/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INI=
T-when-presen.patch
> new file mode 100644
> index 0000000000..1740d7605f
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glib=
c-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
> @@ -0,0 +1,55 @@
> +From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
> +From: Dave Airlie <airlied@redhat.com>
> +Date: Fri, 7 Nov 2025 13:14:56 +1000
> +Subject: [PATCH] c11/threads: fix build on c23
> +
> +C23/glibc is now including once_init in stdlib.h
> +
> +https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-=
107b-5a8a15521083@redhat.com/#213088
> +
> +Just fix up our use of it.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglre=
nderer/-/merge_requests/1567]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +--- a/src/mesa/compat/c11/threads_posix.h
> ++++ b/src/mesa/compat/c11/threads_posix.h
> +@@ -51,7 +51,9 @@ Configuration macro:
> + #include <pthread.h>
> +
> + /*---------------------------- macros ----------------------------*/
> ++#ifndef __once_flag_defined
> + #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
> ++#endif
> + #ifdef INIT_ONCE_STATIC_INIT
> + #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
> + #else
> +@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
> + typedef pthread_t       thrd_t;
> + typedef pthread_key_t   tss_t;
> + typedef pthread_mutex_t mtx_t;
> ++#ifndef __once_flag_defined
> + typedef pthread_once_t  once_flag;
> +-
> ++#endif
> +
> + /*
> + Implementation limits:
> +@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
> +
> + /*--------------- 7.25.2 Initialization functions ---------------*/
> + // 7.25.2.1
> ++#ifndef __once_flag_defined
> + static inline void
> + call_once(once_flag *flag, void (*func)(void))
> + {
> +     pthread_once(flag, func);
> + }
> +-
> ++#endif
> +
> + /*------------- 7.25.3 Condition variable functions -------------*/
> + // 7.25.3.1
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b=
/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> index 89dd25de70..be4385ada6 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
> @@ -12,6 +12,7 @@ DEPENDS =3D "libdrm libepoxy python3-pyyaml-native virt=
ual/egl virtual/libgbm"
>  SRCREV =3D "0f1f43929724a6a414c01a29bc51feccb445c2f0"
>  SRC_URI =3D "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=
=3Dmain;protocol=3Dhttps;tag=3D${PV} \
>             file://0001-meson.build-use-python3-directly-for-python.patch=
 \
> +           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-pre=
sen.patch \
>             "
> =20
>  inherit meson pkgconfig features_check


--=20
Yoann Congal
Smile ECS


