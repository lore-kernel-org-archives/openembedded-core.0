Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.9539.1603981691651309265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ok/+CXYn;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id w14so2981834wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7oxcJo5A3Z0t6eQbB8JVk3U2e72aV2Zb5sFfXlkV20s=;
        b=Ok/+CXYnrn1Cw3bVsHWut5mERKPRgIKJr/cmgKaU/G27y/3yXxOuS4ZAaMm4sJZsmg
         YdKf1v322RWg7BkSadQvmtjmm6vKkbrgFXoP+0incatzxc7XEeieFOxJPmxDrQhqbLLP
         eEXKJaf72kYpoN9brxmxdwnxrRhSuu6Tz17hXFAW9lwHo7nNHllD80XStJZnEnqqfOu7
         tyn//9NoloDx60Y0QllF8OC2VtmZyaTU+VuKXWRNQDEp7Efx44hgtwTw4GgktYiTHXXt
         7J12xDS+nixn1zclHgIsm+P7gUcETR9xqZHLonYVWX1tj6ZaXsqrvCtGfAdZbm5Z2Mzj
         Vwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7oxcJo5A3Z0t6eQbB8JVk3U2e72aV2Zb5sFfXlkV20s=;
        b=EzytMBJtLV1VXKYt00zK/UCr/sfsSO/9jK1+uV1MReSOIYQg2eMaRn0RQRDJjsRKpl
         LVUnp+bfRzVfQuwyh0o0Mx9ocBCt/7gIep+3qHYVU96WgWtDGG/CjFLPeG1qSD1HXxHP
         voSqCchx+nfBmBo9xoFYR8kf64IoExJEf+X85BoA1afjPSmJuOSXLkdEWS1ahxY27HWg
         nn15tDIFaun9OPJFixo7qkKz2MJ2AO5LOYNm/AzP/ikwJeaXrdQnojZTeCAzZ9uei2Yp
         vQMCNc9RqLo0H56ByRzx9LsBtGlKPwhHrs9Jhzuh+m1v1dFoSYGEujw9G0QwQIzDp/8Q
         lG7A==
X-Gm-Message-State: AOAM531bCBBdp8+/6F+DXn0o6UbwW8e27fGFHwm30Pcv1LYv4wVsYF/j
	pqiMZtnP35r1vfHK0slQLhjUNTS5Nr2Y7A==
X-Google-Smtp-Source: ABdhPJz/ozKEUuw0nk75HBizc1aTt1C7PTu7m1Ppz2WcEP6OIWc/dlBwUfeljk8wKggMsx7bceHveQ==
X-Received: by 2002:adf:e549:: with SMTP id z9mr6391709wrm.12.1603981689470;
        Thu, 29 Oct 2020 07:28:09 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:07 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 00/22] Updates the gstreamer to version 1.18.0
Date: Thu, 29 Oct 2020 14:27:44 +0000
Message-Id: <20201029142806.1830504-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
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

V5:
- [PATCH v4 02] -> [PATCH v5 01] gstreamer1.0: Fix reproducibility issue around libcap
- [PATCH v4 01] -> [PATCH v5 02] gstreamer1.0: upgrade to version 1.18.0
- gstreamer1.0-libav: add comercial license flags as ffmpeg needs this

Jose Quaresma (22):
  gstreamer1.0: Fix reproducibility issue around libcap
  gstreamer1.0: upgrade to version 1.18.0
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
  gstreamer1.0-libav: add comercial license flags as ffmpeg needs this

 .../orc/{orc_0.4.31.bb => orc_0.4.32.bb}      |   3 +-
 ...ct-has-a-different-signature-on-musl.patch |  10 +-
 .../gstreamer/gst-devtools_1.18.0.bb          |  43 ++++
 ...001-Make-player-examples-installable.patch |  24 +-
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |   4 +-
 .../gstreamer/gst-validate_1.16.2.bb          |  25 --
 .../gstreamer/gstreamer1.0-libav_1.16.2.bb    |  35 ---
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb    |  23 ++
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
 .../gstreamer/gstreamer1.0/0004-capfix.patch  |  48 ++++
 .../gstreamer/gstreamer1.0/capfix.patch       |  37 ---
 ...er1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} |  29 +--
 40 files changed, 403 insertions(+), 881 deletions(-)
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
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} (72%)

-- 
2.29.1

