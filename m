Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.6475.1601503943236493072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sLWNj2Nc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id q4so679351pjh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6XiMkdRuQQQC4OX3mY5699njuBXIgLgoI+vncPEQ7fU=;
        b=sLWNj2NczdR3UgVTaUBXl/hK99fUb8sbAKG5E8P9fxmzBIYtCajNfk2DtKfWyX2Esb
         jROrqg5vVxKujdbgSTYrPlzhFVJaJCR0wzbNBNlB2JaI9dR7RcIWTmHnaUWBpmZUVJGR
         zSKC26nj5j5VSuMx+E9HSX1s0e3yEn8jxSnQEN0MfLVmENolYDAYj3Cpo8igRIH/hJ0L
         1CTvXycF0yQFvii35KrPy01ylpxDIKB24vOkknItrpMp9pEzPgHkuAdvhHwKnLZGr+OK
         sanshY40lEaQhcqK7ivJ0zETHqRD6Ze5M565F6Ngi9TeoyHgGiSYfqX1omPkCOCpbuEL
         dUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6XiMkdRuQQQC4OX3mY5699njuBXIgLgoI+vncPEQ7fU=;
        b=mi8w5FT8omT7bRTrXQ2YXRGKThpwYqAUarjPQkxdioK4/q9lxKtdJKGXsbxk5wb/Po
         Fr6Ge8l4oVQeKl3rYvqCKc6elQpQyX/le4Tr1YZifb+DJY17aAuEcyQK+8/Ni6W9tTW5
         I7jvQQed5fkF4JyjgzNmTLTAcKN5kT2fjTQxIiakgPXTR5kYNa2k45Ckj8Yqk0jYGa1m
         MrZ69lAHAjMijNF4YY49HcoSqaKRA3v+xCN7gkwk7eKeTJSB3sHtFxgoajCrukwwjXgo
         Q2myZqF+nXgeEMuv3RVq0truw8ah2e0WXLx0oFoEcxHkIKfU265ghuprMtjWHfrj+kPY
         Xl4w==
X-Gm-Message-State: AOAM532SR0cZLsE8YG3mAKQQZd/t2B3fznUmxBAPeeaiV2HxyR2jzgI3
	/svEzylu/s4/TOmtq11dRCOyQEd3GwcCDnQxrhE=
X-Google-Smtp-Source: ABdhPJw6F9jcupPX0xFgZ87CIUamlP2x7C+hchUmrwY9uajHhd0e7eJUfMTGuQQ9YZnxmhOk4bt4uw==
X-Received: by 2002:a17:90a:1188:: with SMTP id e8mr4428049pja.185.1601503942365;
        Wed, 30 Sep 2020 15:12:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/41] libx11: fix CVE-2020-14363
Date: Wed, 30 Sep 2020 12:11:10 -1000
Message-Id: <5919afe43083d9d0b818c26ca4d6c175efa0f7b5.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libx11/CVE-2020-14363.patch      | 36 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch
new file mode 100644
index 0000000000..60045e2890
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14363.patch
@@ -0,0 +1,36 @@
+From acdaaadcb3d85c61fd43669fc5dddf0f8c3f911d Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 13 Aug 2020 18:02:58 +0200
+Subject: [PATCH] Fix an integer overflow in init_om()
+
+CVE-2020-14363
+
+This can lead to a double free later, as reported by Jayden Rivers.
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/acdaaadcb3d85c61fd43669fc5dddf0f8c3f911d]
+CVE: CVE-2020-14363
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ modules/om/generic/omGeneric.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/modules/om/generic/omGeneric.c b/modules/om/generic/omGeneric.c
+index c44acb88..406cec93 100644
+--- a/modules/om/generic/omGeneric.c
++++ b/modules/om/generic/omGeneric.c
+@@ -1908,7 +1908,8 @@ init_om(
+     char **required_list;
+     XOrientation *orientation;
+     char **value, buf[BUFSIZ], *bufptr;
+-    int count = 0, num = 0, length = 0;
++    int count = 0, num = 0;
++    unsigned int length = 0;
+ 
+     _XlcGetResource(lcd, "XLC_FONTSET", "on_demand_loading", &value, &count);
+     if (count > 0 && _XlcCompareISOLatin1(*value, "True") == 0)
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 84e0e4457e..ebd2640743 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
             file://libx11-whitespace.patch \
             file://CVE-2020-14344.patch \
+            file://CVE-2020-14363.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.17.1

