Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.15091.1602947723561238383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QEBDGhY8;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h7so6725524wre.4
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IhEYeb3E7XAnjNDRrohGtWoVplAjonWRBXxqgnxK6aQ=;
        b=QEBDGhY8E+gBXanRWXTyz+ihvjhSD2tc+j8Viwfur7kpaYdd1SBW27KXf8VSsQphFq
         pRJSKVGyZGbSBs1keD1t6jch5V8yqTNclfIbmxxHp0AzUlyKKPsW9JwqZLuuBGroDxkc
         fXryKuojwNcXOmziwqyOEWFZVvbsJgjm/VTl3bH1fj6NmVl7gbVRYpYRFfPxwRrmBhXA
         M4zbZ4J2UVcv5/CTAvO4Idkf1yxFY3TA3ej9SrcJtgbvso6mFuJHLWBuBAA7BpjM/44E
         zokYtIotp8rvzR4cBggGANR5T+vOEqVBjk3u3mrBCPvdxCBI72WnOelY/9TejJIph1lB
         dynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IhEYeb3E7XAnjNDRrohGtWoVplAjonWRBXxqgnxK6aQ=;
        b=J7R/dEDtLHWsEdghIBpBAgnoOwVTMvDF74QQsmmu5uCJQBovqE2vgpIlG5kvGGiQVN
         AkrRXcRkCjHlmY055sn0HrY4KwqEXEiYdOygLd9ksoEM+1jkF92j9TemgO4LDEtBAFJj
         i1RvWA7JYR0eevNyySP8DsLXilST0LMDBLjCiqWLUZxtISRi9QReE9xi5cGSZ8mD3V9t
         hbXHMp94BSIAJ/Kg8mukE/M4/NwIgTZwS2Rv+KEuOOktpVGjeY6EGuZu34M/JOj6Lpo8
         k8oUU51O9xdOSYsoovMmRqziAE0W5H8U3fQQ+BDHL8boSfZV6igdhvp2GtJGgTxM6qCm
         vsJQ==
X-Gm-Message-State: AOAM531sxU78H/hFQc/Mh6X/B5JrGe34whREARlPyP4h2082OW8SORC1
	swdxtA0sUqugeID673lNK4sBGlTzOl+5Tw==
X-Google-Smtp-Source: ABdhPJz10SVIxvrLvzAF3dr0vgmbixwV9kt8Lc3ms6c0IGqPxbiJWadgftQ4KC5lpMtpFlXm1ko9Wg==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr10320773wrq.311.1602947721737;
        Sat, 17 Oct 2020 08:15:21 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:21 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 00/13] Updates the gstreamer to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:11 +0100
Message-Id: <20201017151524.31550-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V2:
- Fixes the build of vulkan plugin
- Fixes pacth headers
- Upgrade orc 0.4.31 -> 0.4.32

This series depends on another series that add the receipe shaderc.
The shaderc provides the tools needed to build
the gstreamer plugin vulkan present on gstreamer1.0-plugins-bad.
https://patchwork.openembedded.org/series/26618/

Jose Quaresma (13):
  gstreamer1.0: upgrade to version 1.18.0
  gstreamer1.0-plugins-base: upgrade to version 1.18.0
  gstreamer1.0-plugins-good: upgrade to version 1.18.0
  gstreamer1.0-plugins-bad: upgrade to version 1.18.0
  gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
  gstreamer1.0-python: upgrade to version 1.18.0
  gstreamer1.0-rtsp-server: upgrade to version 1.18.0
  gstreamer1.0-vaapi: upgrade to version 1.18.0
  gst-examples: upgrade to version 1.18.0
  gst-devtools: add version 1.18.0
  gstreamer1.0-omx: upgrade to version 1.18.0
  gstreamer1.0-libav: upgrade to version 1.18.0
  orc: Upgrade 0.4.31 -> 0.4.32

 .../orc/{orc_0.4.31.bb => orc_0.4.32.bb}      |   3 +-
 ...ct-has-a-different-signature-on-musl.patch |  10 +-
 .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
 ...001-Make-player-examples-installable.patch |  24 +-
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |   2 +-
 .../gstreamer/gst-validate_1.16.2.bb          |  25 --
 .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  21 ++
 ...x_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} |   4 +-
 ...alized-warnings-when-compiling-with.patch} |   8 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...avoid-including-sys-poll.h-directly.patch} |   8 +-
 ...sentinals-for-gst_structure_get-etc.patch} |  43 ++--
 ...ssing-opencv-data-dir-in-yocto-buil.patch} |   8 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.0.bb} |  40 +--
 ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...02-meson-Add-variables-for-gir-files.patch | 235 ------------------
 ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
 ...v-fb-Make-sure-config.h-is-included.patch} |   8 +-
 ...04-glimagesink-Downrank-to-marginal.patch} |   8 +-
 ...bb => gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
 ...defines-GLsync-to-fix-compile-on-som.patch |  70 ------
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |   8 +-
 ...bb => gstreamer1.0-plugins-good_1.18.0.bb} |  17 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.0.bb} |   5 +-
 ...son.build-fix-builds-with-python-3.8.patch |  24 --
 ....16.2.bb => gstreamer1.0-python_1.18.0.bb} |   8 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ....bb => gstreamer1.0-rtsp-server_1.18.0.bb} |   9 +-
 .../0001-vaapsink-downgrade-to-marginal.patch |  46 ----
 ...1.16.2.bb => gstreamer1.0-vaapi_1.18.0.bb} |  16 +-
 ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +-
 ...002-Remove-unused-valgrind-detection.patch | 112 +++++++++
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...eson-Add-option-for-installed-tests.patch} |  20 +-
 .../0003-meson-Add-valgrind-feature.patch     |  74 ------
 .../gstreamer/gstreamer1.0/capfix.patch       |  37 ---
 ...er1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} |  32 +--
 39 files changed, 351 insertions(+), 866 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gst-validate => gst-devtools}/0001-connect-has-a-different-signature-on-musl.patch (76%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb => gst-examples_1.18.0.bb} (96%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch => 0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch} (80%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{avoid-including-sys-poll.h-directly.patch => 0002-avoid-including-sys-poll.h-directly.patch} (79%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{ensure-valid-sentinels-for-gst_structure_get-etc.patch => 0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch} (69%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/{opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch => 0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.18.0.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{get-caps-from-src-pad-when-query-caps.patch => 0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch} (81%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-meson-Add-variables-for-gir-files.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0003-ssaparse-enhance-SSA-text-lines-parsing.patch => 0002-ssaparse-enhance-SSA-text-lines-parsing.patch} (98%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0005-viv-fb-Make-sure-config.h-is-included.patch => 0003-viv-fb-Make-sure-config.h-is-included.patch} (80%)
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/{0009-glimagesink-Downrank-to-marginal.patch => 0004-glimagesink-Downrank-to-marginal.patch} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.18.0.bb} (78%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.18.0.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.18.0.bb} (80%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.18.0.bb} (74%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.18.0.bb} (82%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-option-for-installed-tests.patch => 0003-meson-Add-option-for-installed-tests.patch} (97%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} (72%)

-- 
2.28.0

