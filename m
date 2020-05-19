Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.13125.1589899883006209454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i+wRQdQY;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id p21so6505932pgm.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SedP2y4TrLSmdRSBuF+eOoNj3gAK/VvhFGqvwqYNlN4=;
        b=i+wRQdQY99hmxKMIDATbO13XAKhahSaGwbtkd2Nvk3k0tOualaeD96G/kLFe8jPU9O
         Jm4qY2SJYacQ2UEwMlh66e64p+hkK+Fl65AQ2YKoYqenO6BBJRBF33f/xoe0VOpA/Ww4
         2lj4spmD6ipNHNIXV1UTt6Ws1EaQqDU8nXSXnNbO95arIkIWX6iVm3n4BOEcvnGmwmkO
         5HACd5+EFA4X9MWDQwKUe6nDuOGiY+iocEkCna+97C/Y3CHGCw+cFazWDKxlSAuAoGe4
         EK9MOZ0RjWj2sitj8QiBHuQV83Q8xltIph1hhjjwuv2dfDUezh+Uod67f35C8oyX9LjH
         UnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SedP2y4TrLSmdRSBuF+eOoNj3gAK/VvhFGqvwqYNlN4=;
        b=kuFBvZxthHTqCG3V39PxMrFCaPPowsjiQpUDTe8ErmhBvGhMPBcT5CrvJvvqx+a8r0
         ym/8mePss6tSVRn/4FdjHHyUIV2t0AIQzi4lcPrj268g9rVJ4XQ8n2ZYbMi/U7+jFEDo
         46OjMSA8+m+syT1mnxnlL8ai3DuBZv5KwhPKcQMZ0LVf28jzLQLoLN0vBC1rrRYrDF22
         CkXGseeqGL/jyduMZEYOOkHqdJNeB5glk+R4bG6vMaH04MicMRwJEeCWeTx82lwV4Csz
         oTQDDV5Oey7BnnsbYUEBy1EVbUoSlLTfMMowUDIYAcKzo247+qakDqIxp1Y7a1KxSnn2
         xebA==
X-Gm-Message-State: AOAM530RVaIdDVtOQf6UyA4I8bPFLY4EXH1PWjBItNhu+MRN+5Ijze7N
	gfHc21Ey/+XDn6WStHxBLh8Spue+
X-Google-Smtp-Source: ABdhPJxe9d/b/FMYE3DuM5h4kaMEwQBvgGANdxz0x14LBL1x19nNbLC6UPNkA86cgJqw/zDd18Rh5g==
X-Received: by 2002:a63:3609:: with SMTP id d9mr19815764pga.354.1589899882319;
        Tue, 19 May 2020 07:51:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 2/8] python: Upgrade 2.7.17 -> 2.17.18
Date: Tue, 19 May 2020 07:51:09 -0700
Message-Id: <65ab890bbdd5b104867d80b721be117a9d269aff.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

From: Adrian Bunk <bunk@stusta.de>

LICENSE checksum changed due to 2019 -> 2020 update.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python-native_2.7.17.bb => python-native_2.7.18.bb}    | 0
 meta/recipes-devtools/python/python.inc                     | 6 +++---
 .../python/{python_2.7.17.bb => python_2.7.18.bb}           | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.17.bb => python-native_2.7.18.bb} (100%)
 rename meta/recipes-devtools/python/{python_2.7.17.bb => python_2.7.18.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.17.bb b/meta/recipes-devtools/python/python-native_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-native_2.7.17.bb
rename to meta/recipes-devtools/python/python-native_2.7.18.bb
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index a2424a67bf..bd214e8f8b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,13 +5,13 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "b3b6d2c92f42a60667814358ab9f0cfd"
-SRC_URI[sha256sum] = "4d43f033cdbd0aa7b7023c81b0e986fd11e653b5248dac9144d508f11812ba41"
+SRC_URI[md5sum] = "fd6cc8ec0a78c44036f825e739f36e5a"
+SRC_URI[sha256sum] = "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.18.bb
similarity index 100%
rename from meta/recipes-devtools/python/python_2.7.17.bb
rename to meta/recipes-devtools/python/python_2.7.18.bb
-- 
2.17.1

