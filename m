Return-Path: <antoine.coutant@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49E0C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:34:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13974.1706020461956821749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=yBIh5J/Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: antoine.coutant@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40ec3535225so747085e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706020460; x=1706625260; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mFiTGZe6T1hVaQNXKl2VnYAy87OUq7PkGhNHXbUQNw=;
        b=yBIh5J/Q59Z16wd1vjcVKfjIj2vEl8LFdsYmyAuU4jYE7Z3enjPoX5G5mWUzSN+qcL
         iY7tI5nfLfOEr+4zjEJDodLHFf1lKAHbJIv8GtS2uEDyki4Toyc92hfDv7MTuruYPfJv
         l1eGlIGFU+tWyQqyNDq3hTTF+sgyfHL4UgtK0ORHnce5qqo/epCpDFAbwWqaAca7BVNF
         DN4NAckJ8fhktsfqM+PCoD0doq3YIHPji9y+Nh6YuIbPjvsl2L99itZ5dDee9/F7DsyZ
         0GkVVvYOQ/u9+Lg4C3c7WQAIfzpktlLNqxaW8HVGq2A5nYt/2uQmLITsRWfQbQS2sWZ4
         BioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706020460; x=1706625260;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mFiTGZe6T1hVaQNXKl2VnYAy87OUq7PkGhNHXbUQNw=;
        b=eqMYmcHW6v323lu41liVdxDlTxV4rec9RaxjKWy7aFl2gJPggNc0HwlwbeNb52mOZl
         +XDVhrzafwFiYtrg0sp89QaUBKfBWZYRtMDLT5o+pGyAeqyXiUCpQl/0mYS55oRX7h1d
         NYx49L0Ap/a0A7YhQzQhsJpupTlCR7U5QQk+KhpF+UaWirWrSZQQynFaVpOm3CLSu3a1
         LF7CFPEm73vSBbK0mZUiP89/+jNJndmElYSn7Od+KD3I+tIgIxECGEXaxUx9ON2YJt0s
         3RRxJtH+gNwgnRvBSEzZEb6k34ueCA/Sv+VBtXMcJLDqr08tMecGD6ijS1vP7S3Fe9GC
         cFMQ==
X-Gm-Message-State: AOJu0YyJe5tQoRIhIts94xRvxk6zug9keopx6FvvKqlT2/ULrmsFqjH8
	edJ4SDR2U/T9bSQKmDK0R0MbMEZbQcX2RiNIJ29jC43sjLgiwzgUWzLVtFcnh2k=
X-Google-Smtp-Source: AGHT+IEly6dG4bY4kNWqlVGTMBWy0ZyvCrSUFidllP832pOu2tuAOXcgMdCa5EPAF4LR8hz3C4mjuw==
X-Received: by 2002:a05:600c:ac3:b0:40e:73fb:7d with SMTP id c3-20020a05600c0ac300b0040e73fb007dmr324120wmr.293.1706020460329;
        Tue, 23 Jan 2024 06:34:20 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr. [90.12.67.126])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b0040e56830a35sm42678435wmo.18.2024.01.23.06.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 06:34:20 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------Y57OuO5cSr5kqMDZVxNXqSdp"
Message-ID: <7151703d-5ffd-4452-a7b4-0f6595aa1b59@smile.fr>
Date: Tue, 23 Jan 2024 15:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] mesa: fix building of RustiCL + nouveau
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-4-dmitry.baryshkov@linaro.org>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <20231230191444.1204808-4-dmitry.baryshkov@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194243

This is a multi-part message in MIME format.
--------------Y57OuO5cSr5kqMDZVxNXqSdp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/12/2023 20:14, Dmitry Baryshkov wrote:
> Incorporate a patch by Karol Herbst, fixing nouveau / libgalliumvl
> dependency.
>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
> ---
>   meta/recipes-graphics/mesa/files/26680.patch | 236 +++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc          |   1 +
>   2 files changed, 237 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/files/26680.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/26680.patch b/meta/recipes-graphics/mesa/files/26680.patch
> new file mode 100644
> index 000000000000..a42b7667edee
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/26680.patch
> @@ -0,0 +1,236 @@
> +From daf4935359cb3c88606536924e346ead5e4b2137 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:19:34 +0100
> +Subject: [PATCH 1/7] gallium/vl: stub vl_video_buffer_create_as_resource
> +
> +It's used by radeonsi
> +
> +Signed-off-by: Karol Herbst<kherbst@redhat.com>
> +Upstream-Status: Pending [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26680]
> +---
> + src/gallium/auxiliary/vl/vl_stubs.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
> +index 194e7a8700b6b..89e5f28128909 100644
> +--- a/src/gallium/auxiliary/vl/vl_stubs.c
> ++++ b/src/gallium/auxiliary/vl/vl_stubs.c
> +@@ -146,6 +146,16 @@ vl_create_mpeg12_decoder(struct pipe_context *pipe,
> +    return NULL;
> + }
> +
> ++struct pipe_video_buffer *
> ++vl_video_buffer_create_as_resource(struct pipe_context *pipe,
> ++                                   const struct pipe_video_buffer *tmpl,
> ++                                   const uint64_t *modifiers,
> ++                                   int modifiers_count)
> ++{
> ++   assert(0);
> ++   return NULL;
> ++}
> ++
> + /*
> +  * vl_zscan
> +  */
> +--
> +GitLab
> +
> +
> +From 5dd1598b5ac988d3ef53adc9dcb1f2bc1788513c Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Sat, 30 Dec 2023 20:00:33 +0100
> +Subject: [PATCH 2/7] gallium/vl: remove stubs which are already defined in
> + mesa_util
> +
> +---
> + src/gallium/auxiliary/vl/vl_stubs.c | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
> +index 89e5f28128909..fcdbd9850428b 100644
> +--- a/src/gallium/auxiliary/vl/vl_stubs.c
> ++++ b/src/gallium/auxiliary/vl/vl_stubs.c
> +@@ -155,9 +155,3 @@ vl_video_buffer_create_as_resource(struct pipe_context *pipe,
> +    assert(0);
> +    return NULL;
> + }
> +-
> +-/*
> +- * vl_zscan
> +- */
> +-const int vl_zscan_normal[] = {0};
> +-const int vl_zscan_alternate[] = {0};
> +--
> +GitLab
> +
> +
> +From 6df28bce29d34da949f84739f52a5eff7fb01b80 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:20:08 +0100
> +Subject: [PATCH 3/7] rusticl: link against libgalliumvl_stub
> +
> +---
> + src/gallium/targets/rusticl/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/gallium/targets/rusticl/meson.build b/src/gallium/targets/rusticl/meson.build
> +index b2963fe6dfa76..e1acaca7e68e3 100644
> +--- a/src/gallium/targets/rusticl/meson.build
> ++++ b/src/gallium/targets/rusticl/meson.build
> +@@ -42,6 +42,7 @@ librusticl = shared_library(
> +   ],
> +   link_whole : librusticl,
> +   link_with : [
> ++    libgalliumvl_stub,
> +     libpipe_loader_static,
> +     libswdri,
> +     libswkmsdri,
> +--
> +GitLab
> +
> +
> +From b158c041e2b89c73fd16be945286efa7dcf9b75f Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:28:48 +0100
> +Subject: [PATCH 4/7] frontend/nine: link against libgalliumvl_stub
> +
> +---
> + src/gallium/targets/d3dadapter9/meson.build | 9 +--------
> + 1 file changed, 1 insertion(+), 8 deletions(-)
> +
> +diff --git a/src/gallium/targets/d3dadapter9/meson.build b/src/gallium/targets/d3dadapter9/meson.build
> +index 282859fd93266..c6f1a0dc2a287 100644
> +--- a/src/gallium/targets/d3dadapter9/meson.build
> ++++ b/src/gallium/targets/d3dadapter9/meson.build
> +@@ -27,7 +27,7 @@ gallium_nine_c_args = []
> + gallium_nine_ld_args = []
> + gallium_nine_link_depends = []
> + gallium_nine_link_with = [
> +-    libgallium, libnine_st,
> ++    libgallium, libgalliumvl_stub, libnine_st,
> +     libpipe_loader_static, libws_null, libwsw, libswdri,
> +     libswkmsdri,
> + ]
> +@@ -37,13 +37,6 @@ if with_ld_version_script
> +   gallium_nine_link_depends += files('d3dadapter9.sym')
> + endif
> +
> +-if (with_gallium_va or with_gallium_vdpau or with_gallium_omx != 'disabled' or
> +-    with_dri)
> +-  gallium_nine_link_with += libgalliumvl
> +-else
> +-  gallium_nine_link_with += libgalliumvl_stub
> +-endif
> +-
> + libgallium_nine = shared_library(
> +   'd3dadapter9',
> +   files('description.c', 'getproc.c', 'drm.c'),
> +--
> +GitLab
> +
> +
> +From 9d3192871d5038f73317fd2770118dc0ba08e6d4 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:29:14 +0100
> +Subject: [PATCH 5/7] dri: link against libgalliumvl_stub
> +
> +---
> + src/gallium/targets/dri/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/targets/dri/meson.build b/src/gallium/targets/dri/meson.build
> +index 83925248b17e6..e50581dc121e6 100644
> +--- a/src/gallium/targets/dri/meson.build
> ++++ b/src/gallium/targets/dri/meson.build
> +@@ -50,7 +50,7 @@ libgallium_dri = shared_library(
> +   link_args : [ld_args_build_id, ld_args_gc_sections, gallium_dri_ld_args],
> +   link_depends : gallium_dri_link_depends,
> +   link_with : [
> +-    libdri, libmesa, libgalliumvl,
> ++    libdri, libmesa, libgalliumvl_stub,
> +     libgallium, libglapi, libpipe_loader_static, libws_null, libwsw, libswdri,
> +     libswkmsdri,
> +   ],
> +--
> +GitLab
> +
> +
> +From 2039ab261c5fc7f41139514e969ac83e17731cbf Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:29:20 +0100
> +Subject: [PATCH 6/7] wgl: link against libgalliumvl_stub
> +
> +---
> + src/gallium/targets/wgl/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/targets/wgl/meson.build b/src/gallium/targets/wgl/meson.build
> +index eaca0aec86b50..6ec171b741a0d 100644
> +--- a/src/gallium/targets/wgl/meson.build
> ++++ b/src/gallium/targets/wgl/meson.build
> +@@ -38,7 +38,7 @@ libgallium_wgl = shared_library(
> +   ],
> +   link_whole : [libwgl],
> +   link_with : [
> +-    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl
> ++    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl_stub,
> +   ],
> +   dependencies : [
> +     dep_ws2_32, idep_nir, idep_mesautil, driver_swrast,
> +--
> +GitLab
> +
> +
> +From dac47334c7ae336854991ffb4f564b007abd8585 Mon Sep 17 00:00:00 2001
> +From: Karol Herbst<kherbst@redhat.com>
> +Date: Thu, 14 Dec 2023 03:20:25 +0100
> +Subject: [PATCH 7/7] gallium/drivers: do not link against libgalliumvl
> + directly
> +
> +libgalliumvl_stub was added so not all frontends have to link in full
> +video accleration support, shaving off around 100kB of binary size.
> +---
> + src/gallium/drivers/d3d12/meson.build    | 2 +-
> + src/gallium/drivers/r600/meson.build     | 1 -
> + src/gallium/drivers/radeonsi/meson.build | 2 +-
> + 3 files changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/gallium/drivers/d3d12/meson.build b/src/gallium/drivers/d3d12/meson.build
> +index aba1f3da056f8..c12e8f35267a1 100644
> +--- a/src/gallium/drivers/d3d12/meson.build
> ++++ b/src/gallium/drivers/d3d12/meson.build
> +@@ -133,5 +133,5 @@ libd3d12 = static_library(
> +
> + driver_d3d12 = declare_dependency(
> +   compile_args : '-DGALLIUM_D3D12',
> +-  link_with : [libd3d12, libgalliumvl],
> ++  link_with : [libd3d12],
> + )
> +diff --git a/src/gallium/drivers/r600/meson.build b/src/gallium/drivers/r600/meson.build
> +index 023719a3a16f2..974b59d4594b9 100644
> +--- a/src/gallium/drivers/r600/meson.build
> ++++ b/src/gallium/drivers/r600/meson.build
> +@@ -185,7 +185,6 @@ libr600 = static_library(
> +     inc_src, inc_mapi, inc_mesa, inc_include, inc_gallium, inc_gallium_aux, inc_amd_common,
> +     inc_gallium_drivers,
> +   ],
> +-  link_with : [ libgalliumvl ],
> +   dependencies: [dep_libdrm_radeon, dep_elf, dep_llvm, idep_nir, idep_nir_headers],
> + )
> +
> +diff --git a/src/gallium/drivers/radeonsi/meson.build b/src/gallium/drivers/radeonsi/meson.build
> +index 29afa87c0b654..c89c417b02c08 100644
> +--- a/src/gallium/drivers/radeonsi/meson.build
> ++++ b/src/gallium/drivers/radeonsi/meson.build
> +@@ -168,7 +168,7 @@ libradeonsi = static_library(
> + driver_radeonsi = declare_dependency(
> +   compile_args : '-DGALLIUM_RADEONSI',
> +   link_with : radeonsi_gfx_libs + [
> +-    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm, libgalliumvl
> ++    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm
> +   ],
> +   dependencies : idep_nir,
> + )
> +--
> +GitLab
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index a192562a7935..7cebe45fa2bc 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,6 +18,7 @@ SRC_URI ="https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \ 
> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch 
> \ file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \ 
> file://0001-gallium-Fix-build-with-llvm-17.patch \ + 
> file://26680.patch \ "
>   
>   SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"

Dmitry, All,


The patch you added contains 7 commits. I think it would be better to 
split it into 7 different patches so 1 commit = 1 patch. Indeed, it 
would be simpler to do a rebase if necessary.

This is also what Yocto recommends for kernel patches:

https://docs.yoctoproject.org/kernel-dev/common.html?highlight=applying+patches#applying-patches 
<https://docs.yoctoproject.org/kernel-dev/common.html?highlight=applying+patches#applying-patches>


What do you think about it ?

I can do it if you don’t have time.

---

Regards,

Antoine Coutant

--------------Y57OuO5cSr5kqMDZVxNXqSdp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/12/2023 20:14, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Incorporate a patch by Karol Herbst, fixing nouveau / libgalliumvl
dependency.

Signed-off-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@linaro.org">&lt;dmitry.baryshkov@linaro.org&gt;</a>
---
 meta/recipes-graphics/mesa/files/26680.patch | 236 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc          |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/26680.patch

diff --git a/meta/recipes-graphics/mesa/files/26680.patch b/meta/recipes-graphics/mesa/files/26680.patch
new file mode 100644
index 000000000000..a42b7667edee
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/26680.patch
@@ -0,0 +1,236 @@
+From daf4935359cb3c88606536924e346ead5e4b2137 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:19:34 +0100
+Subject: [PATCH 1/7] gallium/vl: stub vl_video_buffer_create_as_resource
+
+It's used by radeonsi
+
+Signed-off-by: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Upstream-Status: Pending [<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26680">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26680</a>]
+---
+ src/gallium/auxiliary/vl/vl_stubs.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
+index 194e7a8700b6b..89e5f28128909 100644
+--- a/src/gallium/auxiliary/vl/vl_stubs.c
++++ b/src/gallium/auxiliary/vl/vl_stubs.c
+@@ -146,6 +146,16 @@ vl_create_mpeg12_decoder(struct pipe_context *pipe,
+    return NULL;
+ }
+ 
++struct pipe_video_buffer *
++vl_video_buffer_create_as_resource(struct pipe_context *pipe,
++                                   const struct pipe_video_buffer *tmpl,
++                                   const uint64_t *modifiers,
++                                   int modifiers_count)
++{
++   assert(0);
++   return NULL;
++}
++
+ /*
+  * vl_zscan
+  */
+-- 
+GitLab
+
+
+From 5dd1598b5ac988d3ef53adc9dcb1f2bc1788513c Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Sat, 30 Dec 2023 20:00:33 +0100
+Subject: [PATCH 2/7] gallium/vl: remove stubs which are already defined in
+ mesa_util
+
+---
+ src/gallium/auxiliary/vl/vl_stubs.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
+index 89e5f28128909..fcdbd9850428b 100644
+--- a/src/gallium/auxiliary/vl/vl_stubs.c
++++ b/src/gallium/auxiliary/vl/vl_stubs.c
+@@ -155,9 +155,3 @@ vl_video_buffer_create_as_resource(struct pipe_context *pipe,
+    assert(0);
+    return NULL;
+ }
+-
+-/*
+- * vl_zscan
+- */
+-const int vl_zscan_normal[] = {0};
+-const int vl_zscan_alternate[] = {0};
+-- 
+GitLab
+
+
+From 6df28bce29d34da949f84739f52a5eff7fb01b80 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:20:08 +0100
+Subject: [PATCH 3/7] rusticl: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/rusticl/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/targets/rusticl/meson.build b/src/gallium/targets/rusticl/meson.build
+index b2963fe6dfa76..e1acaca7e68e3 100644
+--- a/src/gallium/targets/rusticl/meson.build
++++ b/src/gallium/targets/rusticl/meson.build
+@@ -42,6 +42,7 @@ librusticl = shared_library(
+   ],
+   link_whole : librusticl,
+   link_with : [
++    libgalliumvl_stub,
+     libpipe_loader_static,
+     libswdri,
+     libswkmsdri,
+-- 
+GitLab
+
+
+From b158c041e2b89c73fd16be945286efa7dcf9b75f Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:28:48 +0100
+Subject: [PATCH 4/7] frontend/nine: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/d3dadapter9/meson.build | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/gallium/targets/d3dadapter9/meson.build b/src/gallium/targets/d3dadapter9/meson.build
+index 282859fd93266..c6f1a0dc2a287 100644
+--- a/src/gallium/targets/d3dadapter9/meson.build
++++ b/src/gallium/targets/d3dadapter9/meson.build
+@@ -27,7 +27,7 @@ gallium_nine_c_args = []
+ gallium_nine_ld_args = []
+ gallium_nine_link_depends = []
+ gallium_nine_link_with = [
+-    libgallium, libnine_st,
++    libgallium, libgalliumvl_stub, libnine_st,
+     libpipe_loader_static, libws_null, libwsw, libswdri,
+     libswkmsdri,
+ ]
+@@ -37,13 +37,6 @@ if with_ld_version_script
+   gallium_nine_link_depends += files('d3dadapter9.sym')
+ endif
+ 
+-if (with_gallium_va or with_gallium_vdpau or with_gallium_omx != 'disabled' or
+-    with_dri)
+-  gallium_nine_link_with += libgalliumvl
+-else
+-  gallium_nine_link_with += libgalliumvl_stub
+-endif
+-
+ libgallium_nine = shared_library(
+   'd3dadapter9',
+   files('description.c', 'getproc.c', 'drm.c'),
+-- 
+GitLab
+
+
+From 9d3192871d5038f73317fd2770118dc0ba08e6d4 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:29:14 +0100
+Subject: [PATCH 5/7] dri: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/dri/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/targets/dri/meson.build b/src/gallium/targets/dri/meson.build
+index 83925248b17e6..e50581dc121e6 100644
+--- a/src/gallium/targets/dri/meson.build
++++ b/src/gallium/targets/dri/meson.build
+@@ -50,7 +50,7 @@ libgallium_dri = shared_library(
+   link_args : [ld_args_build_id, ld_args_gc_sections, gallium_dri_ld_args],
+   link_depends : gallium_dri_link_depends,
+   link_with : [
+-    libdri, libmesa, libgalliumvl,
++    libdri, libmesa, libgalliumvl_stub,
+     libgallium, libglapi, libpipe_loader_static, libws_null, libwsw, libswdri,
+     libswkmsdri,
+   ],
+-- 
+GitLab
+
+
+From 2039ab261c5fc7f41139514e969ac83e17731cbf Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:29:20 +0100
+Subject: [PATCH 6/7] wgl: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/wgl/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/targets/wgl/meson.build b/src/gallium/targets/wgl/meson.build
+index eaca0aec86b50..6ec171b741a0d 100644
+--- a/src/gallium/targets/wgl/meson.build
++++ b/src/gallium/targets/wgl/meson.build
+@@ -38,7 +38,7 @@ libgallium_wgl = shared_library(
+   ],
+   link_whole : [libwgl],
+   link_with : [
+-    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl
++    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl_stub,
+   ],
+   dependencies : [
+     dep_ws2_32, idep_nir, idep_mesautil, driver_swrast,
+-- 
+GitLab
+
+
+From dac47334c7ae336854991ffb4f564b007abd8585 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <a class="moz-txt-link-rfc2396E" href="mailto:kherbst@redhat.com">&lt;kherbst@redhat.com&gt;</a>
+Date: Thu, 14 Dec 2023 03:20:25 +0100
+Subject: [PATCH 7/7] gallium/drivers: do not link against libgalliumvl
+ directly
+
+libgalliumvl_stub was added so not all frontends have to link in full
+video accleration support, shaving off around 100kB of binary size.
+---
+ src/gallium/drivers/d3d12/meson.build    | 2 +-
+ src/gallium/drivers/r600/meson.build     | 1 -
+ src/gallium/drivers/radeonsi/meson.build | 2 +-
+ 3 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/gallium/drivers/d3d12/meson.build b/src/gallium/drivers/d3d12/meson.build
+index aba1f3da056f8..c12e8f35267a1 100644
+--- a/src/gallium/drivers/d3d12/meson.build
++++ b/src/gallium/drivers/d3d12/meson.build
+@@ -133,5 +133,5 @@ libd3d12 = static_library(
+ 
+ driver_d3d12 = declare_dependency(
+   compile_args : '-DGALLIUM_D3D12',
+-  link_with : [libd3d12, libgalliumvl],
++  link_with : [libd3d12],
+ )
+diff --git a/src/gallium/drivers/r600/meson.build b/src/gallium/drivers/r600/meson.build
+index 023719a3a16f2..974b59d4594b9 100644
+--- a/src/gallium/drivers/r600/meson.build
++++ b/src/gallium/drivers/r600/meson.build
+@@ -185,7 +185,6 @@ libr600 = static_library(
+     inc_src, inc_mapi, inc_mesa, inc_include, inc_gallium, inc_gallium_aux, inc_amd_common,
+     inc_gallium_drivers,
+   ],
+-  link_with : [ libgalliumvl ],
+   dependencies: [dep_libdrm_radeon, dep_elf, dep_llvm, idep_nir, idep_nir_headers],
+ )
+ 
+diff --git a/src/gallium/drivers/radeonsi/meson.build b/src/gallium/drivers/radeonsi/meson.build
+index 29afa87c0b654..c89c417b02c08 100644
+--- a/src/gallium/drivers/radeonsi/meson.build
++++ b/src/gallium/drivers/radeonsi/meson.build
+@@ -168,7 +168,7 @@ libradeonsi = static_library(
+ driver_radeonsi = declare_dependency(
+   compile_args : '-DGALLIUM_RADEONSI',
+   link_with : radeonsi_gfx_libs + [
+-    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm, libgalliumvl
++    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm
+   ],
+   dependencies : idep_nir,
+ )
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a192562a7935..7cebe45fa2bc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz\file://0001-meson.build-check-for-all-linux-host_os-combinations.patch\file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch\file://0001-gallium-Fix-build-with-llvm-17.patch\+file://26680.patch\">"https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://26680.patch \
 "</a>
 
 SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"</pre>
    </blockquote>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-0dda6da9-7fff-bab8-f685-fcabe4f2f5ad"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Dmitry, All,</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The patch you added contains 7 commits. I think it would be better to split it into 7 different patches so 1 commit = 1 patch. Indeed, it would be simpler to do a rebase if necessary.</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">This is also what Yocto recommends for kernel patches:</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a
href="https://docs.yoctoproject.org/kernel-dev/common.html?highlight=applying+patches#applying-patches"
        style="text-decoration:none;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#1155cc;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://docs.yoctoproject.org/kernel-dev/common.html?highlight=applying+patches#applying-patches</span></a></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">What do you think about it ? </span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">I can do it if you don’t have time.</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">---</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Regards,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Antoine Coutant</span></p>
  </body>
</html>

--------------Y57OuO5cSr5kqMDZVxNXqSdp--

