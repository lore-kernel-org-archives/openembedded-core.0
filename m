Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382BDC54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 08:50:08 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.3970.1711443001429661981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 01:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fwnbeFlJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d48f03a8bbso56375971fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711442999; x=1712047799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXVYUhxvNxUIEACHD2+O13qT709/+v6jC+56YduyGDk=;
        b=fwnbeFlJxJxppaRJg+enxCPpfbF6FaJB0tRXUyJzaA+8rq5OL7mGf6OYyNXg/YncOS
         Oe8xkjVSudQpvM8jR14/KUTV6beziSY9O2tYgqKPn4krEnv6dAdiQxHeKwfDar0GCuID
         l2/TPZylZIxVHA8B8U255CIprxXK90d/qI03r2xFrbteZCwZny35Dv9x1eWZeQHxZU0+
         h+wBJfpkxirgmNvAY3mRc0FK3VgqqS+W5S+aZxbJX9RWhmCAhFEDzpJ4bnTS3Ddm8pq6
         kKhatzNk3Ii5+U7n1Qc13a3x9dfJ52sAMsdyJKCJpO6KMiaKDbqouJgeidSn9HMLySIB
         RNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442999; x=1712047799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXVYUhxvNxUIEACHD2+O13qT709/+v6jC+56YduyGDk=;
        b=F0fuhZayrsqu9G6nzl1XJG5kXCc90IH4Obz8EvQyfF5OBX+ZiwSN7OwtqBor3D/dck
         IHShXTusKrYYwdk5SViBF8rwWhwTMBatRMT2cqluKYSyRgoEUCMnuDL6x8xtMLMaz8X7
         VAg5KhR7Gh8QJsrf/YMtuckkaVjqxZ3sxJI/1yibSEgVZPAvbrSEXnCMH6kLdSs+tFyc
         CfpReDVg0YvqPdBWTxxd24N3dFyB3ig5JOv0ZYLShJdTl1iQmvWwrUqpiWPfpKFd/pH7
         E4tnvYutu4nYkFI8i0xfL+Tu+vKA+ibShdMk5WFKNXnEOjDz7jwRZhoWBN6LWURidaXS
         Fozw==
X-Gm-Message-State: AOJu0YwtzTPfL/Cwi3WUckkJPBO48Z+VImECe5iaAPNRJgxl+LIHGZ5s
	TumGOZrvZW56ZvmfJ4yPNSUDvI04WidA4neRAYL+WtWaQICVyVmBf5fQG+QFd8LXMW6SiQNKKUy
	S9sIrZtTCoksbkmsSVHRf26E6UL0Dv8HX
X-Google-Smtp-Source: AGHT+IE+EpyD4opRw4QMnflhI+gTzj3JbrOk7ALC5avglGSAUg2pyhtXWb5zAMm97qPtiJ1xM4SdCYDsMQhz7T71XBo=
X-Received: by 2002:a2e:ba14:0:b0:2d4:8c28:4ab7 with SMTP id
 p20-20020a2eba14000000b002d48c284ab7mr269229lja.22.1711442999181; Tue, 26 Mar
 2024 01:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com> <1711413292-3025-17-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1711413292-3025-17-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Mar 2024 09:49:48 +0100
Message-ID: <CANNYZj873frnjZPZgapj8t0OgX7uDCjP+BpFjDRdT2Gs+XjVdw@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH 17/34] mesa: upgrade 24.0.2 -> 24.0.3
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 08:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197530

Don't forget the mesa-gl recipe in those updates.

Alex

On Tue, 26 Mar 2024 at 01:37, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> refreshed for 24.0.3
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
>  meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
>  .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}         |  0
>  3 files changed, 6 insertions(+), 9 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> index f6d95c8982..1711e22585 100644
> --- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> @@ -1,4 +1,4 @@
> -From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
> +From 051f41beda540f0ae77b341db01a6de83c9e938a Mon Sep 17 00:00:00 2001
>  From: Markus Volk <f_l_k@t-online.de>
>  Date: Fri, 8 Mar 2024 15:53:11 +0100
>  Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> @@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index 25e92ea5f95..3956e19c08f 100644
> +index 2db6185..741b5d1 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -818,6 +818,7 @@ if _opencl != 'disabled'
> +@@ -813,6 +813,7 @@ if _opencl != 'disabled'
>       error('The Clover OpenCL state tracker requires rtti')
>     endif
>
> @@ -29,7 +29,7 @@ index 25e92ea5f95..3956e19c08f 100644
>     with_gallium_opencl = true
>     with_opencl_icd = _opencl == 'icd'
>   else
> -@@ -842,7 +843,7 @@ if with_gallium_rusticl
> +@@ -837,7 +838,7 @@ if with_gallium_rusticl
>   endif
>
>   dep_clc = null_dep
> @@ -39,7 +39,7 @@ index 25e92ea5f95..3956e19c08f 100644
>   endif
>
>  diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> -index 8d73544c6d8..1dae56d1b2b 100644
> +index 8d73544..1dae56d 100644
>  --- a/src/compiler/meson.build
>  +++ b/src/compiler/meson.build
>  @@ -79,7 +79,7 @@ subdir('nir')
> @@ -51,6 +51,3 @@ index 8d73544c6d8..1dae56d1b2b 100644
>     subdir('clc')
>   endif
>   if with_gallium
> ---
> -2.44.0
> -
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index a8088e6fb6..b08ec873a0 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>  "
>
> -SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
> +SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
> rename to meta/recipes-graphics/mesa/mesa_24.0.3.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197506): https://lists.openembedded.org/g/openembedded-core/message/197506
> Mute This Topic: https://lists.openembedded.org/mt/105150531/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

