Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1028.1603478625573651560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fS3V7gOJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id l20so1105289wme.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGF2AkS1lCHeW23hLWU06UqA4sLU0sXsoFworlGq6v4=;
        b=fS3V7gOJoY8+3r4nhI5+kxKt+Z7FPznS+qICWu3YUYT1D/yIYnjL9NEEGQuxEEFn3J
         L75cX34/SDZpQypi0Kf64GjnI05/HojFh7cid6gzDmMudz/T33CJBmN8yKuH9272ijo8
         6FCVc0Yd6U39NsM7YpMAeiPbtI+X/jyiMyQ4li/aFV9rrviAkXQzerCgaO6VqjP/yrPU
         Xm3KlGRxcFwGqYMvTdtofbXyd3kUWaP0vMOQEhZ1+B8Djhxcfkjn/mvoeduelmo2Zyma
         nwl7Ei7ap/XPdYmqs5DXU6Lhb/y7OOoe/eiStrlV+cnttI3lS8XVw+C3kKXFklgSLed9
         tPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nGF2AkS1lCHeW23hLWU06UqA4sLU0sXsoFworlGq6v4=;
        b=hW5Mv/DCs5EKIM2iwyIiDVorzhee5FjCfkV7DDeo/O53GJRMRPws6u0V33pfgEFf/h
         CHB1KNNo6ukuEqBHkxkGUmVnCbYdsFzbLdRKUpHBvj/VRbyJbya4EgnyASt7vfyGG+Uz
         xxdfbj4bpz/ZYB/HCUHCHeoQvqu+PUMPX5R56r4VTNYwvLv34r/KkuvOIObIjfd426xt
         4IAauClum/bsl/ZxtVqeGQgyapV3WVUyE9ePrDwm4QYmydHIfT8bsZEnCK+63gXAdnz3
         auxEYGb9+SJEpARCv9EnPr9NCN5ZveN+4BHMnl7E42t6Y8mId4EpnOUtIuX763TgVAfr
         xr5Q==
X-Gm-Message-State: AOAM530EzXFCPTeKPbV0027gy9y4CgQdeM9f1pIh87Ws97vM59pxYMRa
	7jOmXbv9fes127dhnF1bykS+S9o8rzODHQ==
X-Google-Smtp-Source: ABdhPJx9eQiL6t4T3cOnU+ZR+BLHs7gzLC4YZohWYz2wY6YhanvPy6FfI2xU4vdVRxWucmWDwEEdWQ==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr3478652wmk.127.1603478620812;
        Fri, 23 Oct 2020 11:43:40 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:40 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:11 +0100
Message-Id: <20201023184132.3208737-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V2:
- Fixes the build of vulkan plugin
- Fixes pacth headers
- Upgrade orc 0.4.31 -> 0.4.32

V3:
- gstreamer1.0: Fix reproducibility issue around libcap
- gstreamer1.0-python: install append is not need any more
- gstreamer1.0-plugins-[good/bad]: disable new meson options
- gstreamer1.0-plugins-[base/good/bad]: add new meson option as PACKAGECONFIG
- Update pacth headers

V4:

- gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland

Jose Quaresma (21):
  gstreamer1.0: upgrade to version 1.18.0
  gstreamer1.0: Fix reproducibility issue around libcap
  gstreamer1.0-plugins-base: upgrade to version 1.18.0
  gstreamer1.0-plugins-base: add new meson option as PACKAGECONFIG
  gstreamer1.0-plugins-good: upgrade to version 1.18.0
  gstreamer1.0-plugins-good: disable new meson options
  gstreamer1.0-plugins-good: add new meson option as PACKAGECONFIG
  gstreamer1.0-plugins-bad: upgrade to version 1.18.0
  gstreamer1.0-plugins-bad: disable new meson options
  gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
  gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
  gstreamer1.0-python: upgrade to version 1.18.0
  gstreamer1.0-python: install append is not need any more
  gstreamer1.0-rtsp-server: upgrade to version 1.18.0
  gstreamer1.0-vaapi: upgrade to version 1.18.0
  gst-examples: upgrade to version 1.18.0
  gstreamer1.0-omx: upgrade to version 1.18.0
  gstreamer1.0-libav: upgrade to version 1.18.0
  gst-devtools: add version 1.18.0 (gst-validate -> gst-devtools)
  orc: Upgrade 0.4.31 -> 0.4.32
  gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland

 .../orc/{orc_0.4.31.bb => orc_0.4.32.bb}      |   3 +-
 ...ct-has-a-different-signature-on-musl.patch |  10 +-
 .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
 ...001-Make-player-examples-installable.patch |  24 +-
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |   4 +-
 .../gstreamer/gst-validate_1.16.2.bb          |  25 --
 .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  21 ++
 ...x_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} |   4 +-
 ...alized-warnings-when-compiling-with.patch} |   8 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...avoid-including-sys-poll.h-directly.patch} |   8 +-
 ...sentinals-for-gst_structure_get-etc.patch} |  43 ++--
 ...ssing-opencv-data-dir-in-yocto-buil.patch} |   8 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.0.bb} |  38 +--
 ...t-caps-from-src-pad-when-query-caps.patch} |  12 +-
 ...even-when-cross-compiling-if-introsp.patch |  36 ---
 ...02-meson-Add-variables-for-gir-files.patch | 235 ------------------
 ...arse-enhance-SSA-text-lines-parsing.patch} |  10 +-
 ...v-fb-Make-sure-config.h-is-included.patch} |   8 +-
 ...04-glimagesink-Downrank-to-marginal.patch} |   8 +-
 ...bb => gstreamer1.0-plugins-base_1.18.0.bb} |  32 +--
 ...defines-GLsync-to-fix-compile-on-som.patch |  70 ------
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |   8 +-
 ...bb => gstreamer1.0-plugins-good_1.18.0.bb} |  21 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.0.bb} |   5 +-
 ...son.build-fix-builds-with-python-3.8.patch |  24 --
 ....16.2.bb => gstreamer1.0-python_1.18.0.bb} |  24 +-
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
 ...er1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} |  29 +--
 39 files changed, 353 insertions(+), 881 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gst-validate => gst-devtools}/0001-connect-has-a-different-signature-on-musl.patch (76%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb => gst-examples_1.18.0.bb} (91%)
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
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.18.0.bb} (81%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.18.0.bb} (50%)
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
2.29.0

