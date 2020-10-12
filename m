Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.39505.1602506202808599070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jNV9aAvG;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id h5so8924757wrv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62ilkNpZASbT6geYsNG8luNBigmAQB96SNztkGE3NOg=;
        b=jNV9aAvG8D68m+yIg3vYTqGE3CtUw7Jdyr/uaPWKJahg9Eys+lven3VvvP+OO5qeyl
         522WJiQ9IKhjvzfk+2+bVmRyJW4pct3/eynTimV/OyLFBX41LD4cquCCXk82cbzyF0lA
         uveFqcMgw4nk8VZ2MM7PTEoUlgiCffk3A84Ahz1Akogb0a/bYSdgM3Vr1GYbKQ2v33lW
         hF02vQZ69d2CY63oEhvv6QEJMGLi6r9CVaZXbw0gJk1VtVUqK9ImM6DL0s77wPHMBQnl
         rJIFmLq9b1BrZJJNTnZOJdjIVUUOucvzQW5aU4C5i2O6ageS6beYtKGcnDc6HyHoKNEy
         W4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62ilkNpZASbT6geYsNG8luNBigmAQB96SNztkGE3NOg=;
        b=svSZxXEvKVvk3wqh71t7Aa7qrPRqRpjXeYVXKtkAieG8weSVL8XlPVDgvSEQDDKTiZ
         PP4vAuPwQ100uIu4okEfF+gAhBmaHg5HDN3ykanDkklT7ekuWDxCoZSOGE1WF/l74Tum
         c5P2dbKbf3MI0y8YmlRueJX7uBt85Ox3/HBjjh39X5B4QnCnbGQm6V8hR5Mze6SpcAJG
         o8FUn2az70Ix7oSYiEDr8Pj8hckw1vvd/cicezdjofCbAExN0eNWaYaxz2C2zyXoVh8R
         Rmb2z22CR3j7WhkozOpQdkFI4jOpLThW5h7DoniGjbv8m32kgWZIGmz1AR9VsBEBMWh8
         Jf4w==
X-Gm-Message-State: AOAM530CNQncVqsB4gZ82DbiphmrbmW2X+eybt4nygOupYuiMDmfxZrc
	EcpfA8ZV8+EvoZLdN5x5Txyc5zYvM1Dk7w==
X-Google-Smtp-Source: ABdhPJwthqLFCyuF+gm5gHZjx7N100efq7eqmhariP0BPfab4oX9T5tU7/x03rHxEC7oxusIxLZR5g==
X-Received: by 2002:adf:e444:: with SMTP id t4mr31719858wrm.58.1602506200598;
        Mon, 12 Oct 2020 05:36:40 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:39 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 02/13] gstreamer1.0-plugins-base: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:09 +0100
Message-Id: <20201012123620.2095778-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
    * 0002-meson-Add-variables-for-gir-files.patch
      Removed since these are included in 1.18.0

    API and plugin documentation are no longer built with gtk_doc.
    The gtk_doc documentation has been removed in favour of a new unified
    documentation module built with hotdoc.
    Distributors should use the documentation release tarball instead of trying
    to package hotdoc and building the documentation from scratch.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...02-meson-Add-variables-for-gir-files.patch | 235 ------------------
 ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
 ...v-fb-Make-sure-config.h-is-included.patch} |  10 +-
 ...04-glimagesink-Downrank-to-marginal.patch} |  10 +-
 ...bb => gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
 7 files changed, 40 insertions(+), 305 deletions(-)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{get-caps-from-src-pad-when-query-caps.patch => 0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch} (77%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0003-ssaparse-enhance-SSA-text-lines-parsing.patch => 0002-ssaparse-enhance-SSA-text-lines-parsing.patch} (97%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0005-viv-fb-Make-sure-config.h-is-included.patch => 0003-viv-fb-Make-sure-config.h-is-included.patch} (73%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0009-glimagesink-Downrank-to-marginal.patch => 0004-glimagesink-Downrank-to-marginal.patch} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.18.0.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index a4727e23ea..046faa5d9d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,7 +1,7 @@
-From 41de2ec64ab06bb58c82c1659adaa3811bc5bcf8 Mon Sep 17 00:00:00 2001
+From f9d48cd85ee68207733b1b91a00453462c33524a Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
-Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
+Subject: [PATCH 1/4] ENGR00312515: get caps from src pad when query caps
 
 https://bugzilla.gnome.org/show_bug.cgi?id=728312
 
@@ -9,6 +9,7 @@ Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
 
+%% original patch: get-caps-from-src-pad-when-query-caps.patch
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -17,10 +18,10 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 8a127c8..71c5d78
+index f545857..62d10ef
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1777,6 +1777,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
@@ -40,3 +41,6 @@ index 8a127c8..71c5d78
      default:
        res = gst_pad_query_default (pad, parent, query);
        break;
+-- 
+2.28.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 49ab471414..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 30672ba7d134553e59935ddc875104adba26f25c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Thu, 17 Oct 2019 20:06:24 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [30672ba7d134553e59935ddc875104adba26f25c]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 264d84c9e..c8147c224 100644
---- a/meson.build
-+++ b/meson.build
-@@ -372,7 +372,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
deleted file mode 100644
index ca85744c19..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
+++ /dev/null
@@ -1,235 +0,0 @@
-From 685731e989dc074a4b0d48b6c8062e2738f09719 Mon Sep 17 00:00:00 2001
-From: Thibault Saunier <tsaunier@igalia.com>
-Date: Mon, 22 Oct 2018 11:44:37 +0200
-Subject: [PATCH] meson: Add variables for gir files
-
-And flatten list of sources for dependencies
-
-Upstream-Status: Backport [685731e989dc074a4b0d48b6c8062e2738f09719]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- gst-libs/gst/allocators/meson.build | 5 +++--
- gst-libs/gst/app/meson.build        | 6 ++++--
- gst-libs/gst/audio/meson.build      | 5 +++--
- gst-libs/gst/pbutils/meson.build    | 5 +++--
- gst-libs/gst/rtp/meson.build        | 6 ++++--
- gst-libs/gst/rtsp/meson.build       | 5 +++--
- gst-libs/gst/sdp/meson.build        | 6 ++++--
- gst-libs/gst/tag/meson.build        | 5 +++--
- gst-libs/gst/video/meson.build      | 5 +++--
- 9 files changed, 30 insertions(+), 18 deletions(-)
-
-diff --git a/gst-libs/gst/allocators/meson.build b/gst-libs/gst/allocators/meson.build
-index 364baeebf..56f156dc3 100644
---- a/gst-libs/gst/allocators/meson.build
-+++ b/gst-libs/gst/allocators/meson.build
-@@ -22,7 +22,7 @@ gstallocators = library('gstallocators-@0@'.format(api_version),
- allocators_gen_sources  = []
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/allocators/allocators.h' ]
--  allocators_gen_sources += [gnome.generate_gir(gstallocators,
-+  allocators_gir = gnome.generate_gir(gstallocators,
-     sources : gst_allocators_sources + gst_allocators_headers,
-     namespace : 'GstAllocators',
-     nsversion : api_version,
-@@ -33,7 +33,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : [gst_dep]
--  )]
-+  )
-+  allocators_gen_sources += allocators_gir
- endif
- 
- allocators_dep = declare_dependency(link_with: gstallocators,
-diff --git a/gst-libs/gst/app/meson.build b/gst-libs/gst/app/meson.build
-index 81dd0f42c..7a90f5e10 100644
---- a/gst-libs/gst/app/meson.build
-+++ b/gst-libs/gst/app/meson.build
-@@ -32,7 +32,7 @@ gstapp = library('gstapp-@0@'.format(api_version),
- 
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/app/app.h' ]
--  app_gen_sources += [gnome.generate_gir(gstapp,
-+  app_gir = gnome.generate_gir(gstapp,
-     sources : app_sources + app_headers + [gstapp_c] + [gstapp_h],
-     namespace : 'GstApp',
-     nsversion : api_version,
-@@ -43,7 +43,9 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : [gst_dep, gst_base_dep]
--  )]
-+  )
-+
-+  app_gen_sources += app_gir
- endif
- 
- app_dep = declare_dependency(link_with: gstapp,
-diff --git a/gst-libs/gst/audio/meson.build b/gst-libs/gst/audio/meson.build
-index 0e4efab2e..2a449d4bf 100644
---- a/gst-libs/gst/audio/meson.build
-+++ b/gst-libs/gst/audio/meson.build
-@@ -153,7 +153,7 @@ gstaudio = library('gstaudio-@0@'.format(api_version),
- 
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/audio/audio.h' ]
--  audio_gen_sources += [gnome.generate_gir(gstaudio,
-+  audio_gir = gnome.generate_gir(gstaudio,
-     sources : audio_src + audio_headers + [gstaudio_c] + [gstaudio_h],
-     namespace : 'GstAudio',
-     nsversion : api_version,
-@@ -164,7 +164,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : gstaudio_deps
--  )]
-+  )
-+  audio_gen_sources += [audio_gir]
- endif
- 
- audio_dep = declare_dependency(link_with : gstaudio,
-diff --git a/gst-libs/gst/pbutils/meson.build b/gst-libs/gst/pbutils/meson.build
-index 2faf62622..0e96722fd 100644
---- a/gst-libs/gst/pbutils/meson.build
-+++ b/gst-libs/gst/pbutils/meson.build
-@@ -63,7 +63,7 @@ pbutils = library('gstpbutils-@0@'.format(api_version),
- pbutils_gen_sources = [gstpbutils_h, gst_pbutils_version_h]
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/pbutils/pbutils.h' ]
--  pbutils_gen_sources += [gnome.generate_gir(pbutils,
-+  pbutils_gir = gnome.generate_gir(pbutils,
-     sources : pbutils_sources + pbutils_headers + [gstpbutils_h, gst_pbutils_version_h],
-     namespace : 'GstPbutils',
-     nsversion : api_version,
-@@ -74,7 +74,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : gstpbutils_deps
--  )]
-+  )
-+  pbutils_gen_sources += [pbutils_gir]
- endif
- 
- pbutils_dep = declare_dependency(link_with : pbutils,
-diff --git a/gst-libs/gst/rtp/meson.build b/gst-libs/gst/rtp/meson.build
-index f47ec6592..7ea6658d5 100644
---- a/gst-libs/gst/rtp/meson.build
-+++ b/gst-libs/gst/rtp/meson.build
-@@ -49,7 +49,7 @@ gst_rtp = library('gstrtp-@0@'.format(api_version),
- rtp_gen_sources = [gstrtp_enum_h]
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/rtp/rtp.h' ]
--  rtp_gen_sources += [gnome.generate_gir(gst_rtp,
-+  rtp_gir = gnome.generate_gir(gst_rtp,
-     sources : rtp_sources + rtp_headers + [gstrtp_enum_c] + [gstrtp_enum_h],
-     namespace : 'GstRtp',
-     nsversion : api_version,
-@@ -60,7 +60,9 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : gstrtp_deps
--  )]
-+  )
-+
-+  rtp_gen_sources += [rtp_gir]
- endif
- 
- 
-diff --git a/gst-libs/gst/rtsp/meson.build b/gst-libs/gst/rtsp/meson.build
-index 27e309d5a..3632adceb 100644
---- a/gst-libs/gst/rtsp/meson.build
-+++ b/gst-libs/gst/rtsp/meson.build
-@@ -54,7 +54,7 @@ gst_rtsp = library('gstrtsp-@0@'.format(api_version),
- rtsp_gen_sources = [gstrtsp_h]
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/rtsp/rtsp.h' ]
--  rtsp_gen_sources += [gnome.generate_gir(gst_rtsp,
-+  rtsp_gir = gnome.generate_gir(gst_rtsp,
-     sources : rtsp_sources + rtsp_headers + [gstrtsp_c] + [gstrtsp_h],
-     namespace : 'GstRtsp',
-     nsversion : api_version,
-@@ -65,7 +65,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : gstrtsp_deps + [sdp_dep]
--  )]
-+  )
-+  rtsp_gen_sources += [rtsp_gir]
- endif
- 
- rtsp_dep = declare_dependency(link_with : gst_rtsp,
-diff --git a/gst-libs/gst/sdp/meson.build b/gst-libs/gst/sdp/meson.build
-index 62c18b732..24cdb5293 100644
---- a/gst-libs/gst/sdp/meson.build
-+++ b/gst-libs/gst/sdp/meson.build
-@@ -23,7 +23,7 @@ gstsdp = library('gstsdp-@0@'.format(api_version),
- sdp_gen_sources  = []
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/sdp/sdp.h' ]
--  sdp_gen_sources += [gnome.generate_gir(gstsdp,
-+  sdp_gir = gnome.generate_gir(gstsdp,
-     sources : gst_sdp_sources + gst_sdp_headers,
-     namespace : 'GstSdp',
-     nsversion : api_version,
-@@ -34,7 +34,9 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : rtsp_deps
--  )]
-+  )
-+
-+  sdp_gen_sources += [sdp_gir]
- endif
- 
- sdp_dep = declare_dependency(link_with: gstsdp,
-diff --git a/gst-libs/gst/tag/meson.build b/gst-libs/gst/tag/meson.build
-index 27e66fd63..5ec37392a 100644
---- a/gst-libs/gst/tag/meson.build
-+++ b/gst-libs/gst/tag/meson.build
-@@ -93,7 +93,7 @@ gsttag = library('gsttag-@0@'.format(api_version),
- 
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/tag/tag.h' ]
--  tag_gen_sources += [gnome.generate_gir(gsttag,
-+  tag_gir = gnome.generate_gir(gsttag,
-     sources : tag_sources + tag_headers + [gsttag_h] + [gsttag_c],
-     namespace : 'GstTag',
-     nsversion : api_version,
-@@ -104,7 +104,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : tag_deps
--  )]
-+  )
-+  tag_gen_sources += [tag_gir]
- endif
- 
- tag_dep = declare_dependency(link_with: gsttag,
-diff --git a/gst-libs/gst/video/meson.build b/gst-libs/gst/video/meson.build
-index 5b35e1943..bf77aa157 100644
---- a/gst-libs/gst/video/meson.build
-+++ b/gst-libs/gst/video/meson.build
-@@ -138,7 +138,7 @@ gstvideo = library('gstvideo-@0@'.format(api_version),
- 
- if build_gir
-   gst_gir_extra_args = gir_init_section + [ '--c-include=gst/video/video.h' ]
--  video_gen_sources += [gnome.generate_gir(gstvideo,
-+  video_gir = gnome.generate_gir(gstvideo,
-     sources : video_sources + video_headers + [gstvideo_c] + [gstvideo_h],
-     namespace : 'GstVideo',
-     nsversion : api_version,
-@@ -149,7 +149,8 @@ if build_gir
-     install : true,
-     extra_args : gst_gir_extra_args,
-     dependencies : gstvideo_deps
--  )]
-+  )
-+  video_gen_sources += [video_gir]
- endif
- 
- video_dep = declare_dependency(link_with : gstvideo,
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 9e95524057..318ff72a02 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,7 +1,7 @@
-From 918c96b24d10f61b7455b4cef3bab490849d0d77 Mon Sep 17 00:00:00 2001
+From f587861bbe12ad0b10370f835592746aafedbf56 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
-Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
+Subject: [PATCH 2/4] ssaparse: enhance SSA text lines parsing.
 
 some parser will pass in the original ssa text line which starts with "Dialog:"
 and there's are maybe multiple Dialog lines in one input buffer.
@@ -10,8 +10,9 @@ Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 
+%% original patch: 0003-ssaparse-enhance-SSA-text-lines-parsing.patch
 ---
- gst/subparse/gstssaparse.c | 150 ++++++++++++++++++++++++++++++++++++++++-----
+ gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
  mode change 100644 => 100755 gst/subparse/gstssaparse.c
 
@@ -225,3 +226,6 @@ index c849c08..4b9636c
  
    if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
      GstSegment segment;
+-- 
+2.28.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
similarity index 73%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 6e53d2e8b5..0d148ff8b5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,19 +1,21 @@
-From bec38a0c2e2958927c42b2f9ae939969b7c4a326 Mon Sep 17 00:00:00 2001
+From 153f3b83a3fed77785bd1420bed8bbafa2d791b3 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
-Subject: [PATCH] viv-fb: Make sure config.h is included
+Subject: [PATCH 3/4] viv-fb: Make sure config.h is included
 
 This prevents build errors due to missing GST_API_* symbols
 
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+
+%% original patch: 0005-viv-fb-Make-sure-config.h-is-included.patch
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 05e1f6229..96ce5e685 100644
+index 05e1f62..96ce5e6 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
@@ -28,5 +30,5 @@ index 05e1f6229..96ce5e685 100644
  
  #ifdef BUILDING_GST_GL
 -- 
-2.17.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
index e8094f459e..dab77894b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
@@ -1,7 +1,7 @@
-From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
+From 79841a02ee754eba736cb32aaf2ed2b2fc0483d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Sep 2015 19:47:32 +0300
-Subject: [PATCH] glimagesink: Downrank to marginal
+Subject: [PATCH 4/4] glimagesink: Downrank to marginal
 
 On desktop, where there is good OpenGL, xvimagesink will come up first,
 on other platforms, OpenGL can't be trusted because it's either software (like
@@ -10,12 +10,14 @@ in a VM) or broken (like on embedded)., so let ximagesink come above.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+%% original patch: 0009-glimagesink-Downrank-to-marginal.patch
 ---
  ext/gl/gstopengl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index a4b2540..0ccaacd 100644
+index 302e845..463be9c 100644
 --- a/ext/gl/gstopengl.c
 +++ b/ext/gl/gstopengl.c
 @@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)
@@ -28,5 +30,5 @@ index a4b2540..0ccaacd 100644
    }
  
 -- 
-2.1.4
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index 6563b6f738..a04af186f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -1,26 +1,22 @@
 require gstreamer1.0-plugins-common.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
-
-SRC_URI = " \
-            https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
-            file://get-caps-from-src-pad-when-query-caps.patch \
-            file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-            file://0002-meson-Add-variables-for-gir-files.patch \
-            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-            file://0005-viv-fb-Make-sure-config.h-is-included.patch \
-            file://0009-glimagesink-Downrank-to-marginal.patch \
-            "
-SRC_URI[md5sum] = "3fdb32823535799a748c1fc14f978e2c"
-SRC_URI[sha256sum] = "b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
+           file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
+           file://0003-viv-fb-Make-sure-config.h-is-included.patch \
+           file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://0004-glimagesink-Downrank-to-marginal.patch \
+           "
+SRC_URI[md5sum] = "5ea9dc2692335e03170c3639901c2d83"
+SRC_URI[sha256sum] = "762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823cdb7897"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
 DEPENDS += "iso-codes util-linux zlib"
 
-inherit gobject-introspection gtk-doc
+inherit gobject-introspection
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
@@ -72,18 +68,16 @@ OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '',
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
 OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' egl', '', d)}"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dgl-graphene=disabled \
     ${@get_opengl_cmdline_list('gl_api', d.getVar('OPENGL_APIS'), d)} \
     ${@get_opengl_cmdline_list('gl_platform', d.getVar('OPENGL_PLATFORMS'), d)} \
     ${@get_opengl_cmdline_list('gl_winsys', d.getVar('OPENGL_WINSYS'), d)} \
 "
 
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = "enabled"
-GTKDOC_MESON_DISABLE_FLAG = "disabled"
-
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/include/gst/gl/gstglconfig.h"
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
-- 
2.28.0

