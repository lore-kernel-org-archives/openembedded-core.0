Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.18953.1603023020788392614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aHzkHloa;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id h5so8318961wrv.7
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZWY8Geo+sxKWG7gxW2642kngJeI0zuY1TYMZFoDS18=;
        b=aHzkHloaFFxx7i2OqBasYmQVAFFxxAJgAr8DXPakVX+asI+dngN24nYfSbA+NuYEy5
         W5Q2ndRBIMjDcqcpNXuySa65XjjsuENZYKTH5Px8edxI6NKkXGOhnBiPCI1IQFOx/Lfj
         fNlJUMgquJVuF0QngWGO/hMVYe46/tRj/DD+E3f43azF4m8/Vb0q3d/0hKFfDVg6sP9X
         K0IGSdR6KAn0+qeLver4qxBN5nGyblOhwS5nUQMXf31Xrm5AeP8mN8GVp9iKYdAVjbz1
         r6L5gnARk89r+KMPzWekQWR5ihKnbVXinPqWc0mtXPQRNIVCcqfXvT/yxhXCZ/iNZbYk
         qWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZWY8Geo+sxKWG7gxW2642kngJeI0zuY1TYMZFoDS18=;
        b=YzPK3ZhBtbMbYNt6QAevp7t0Ul3oHL0ZOCkHYpqzCcVeLj3Qo871G0U16J9fnN35Z9
         8YBUxTmLg78hqdE7fUp9pQPqiWrEdnnn/Y8maDn92jGE2rn8ti3B8MlIKnVcinEfY6p8
         BBBha+hAfnf4ZSmnOZza2W3PexeLxUC2q4YUezGCoM4st1g7NehEmN+UUmyyjhmIk/F0
         zf2xXmZAUXLb92CSYEwNl08tL0kIh2jLpvpzHLcer5bUbYBRA46lWYydn1ShHw5XYJ0z
         dlcII0LE+NmhQqxNJ1YEPWgjxhprMDb4gTjD8XrD6r6UKP1fsF4uB4UOS5Qktva23QV8
         pCCg==
X-Gm-Message-State: AOAM53179nHfIeeU1v47/PCbfjFD/1xmy3sstGfcSk82cmkrk3rr6KgL
	H43WB6WgHsHnWpwedTVQVYbEKivyF6WUCg==
X-Google-Smtp-Source: ABdhPJySBLApGKcnIxQkLWsbNF9unvbDkAehaxLy7+Uha/mpaSTam//eelRMWEoRC3NFLi0gIXziKg==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr14081318wro.88.1603023018730;
        Sun, 18 Oct 2020 05:10:18 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:17 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 00/20] Updates the gstreamer to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:42 +0100
Message-Id: <20201018121002.1417335-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
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

Jose Quaresma (20):
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
 ...bb => gstreamer1.0-plugins-good_1.18.0.bb} |  17 +-
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
 39 files changed, 350 insertions(+), 880 deletions(-)
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
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.18.0.bb} (84%)
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
2.28.0

