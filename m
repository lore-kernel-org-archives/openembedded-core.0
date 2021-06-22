Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.7776.1624360897170856426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V8HYxLUv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id s6so23080916edu.10
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=42uP7nwk1DKS6fSwWnJDtRsgXYDuikgTlUvQyezJHRk=;
        b=V8HYxLUvcI+io7dUbr3rfTU7jsR72OBzD1C3pNhIqItvirku0WGp3F7bd9Ap/gmJ/y
         MyETkEF2Us9YaKeldVfsuXI6d6rt3wI36hf+sXXpjYipYbo2KvP12MO6Vqg7Ty6qOf1S
         l6B6we5eWrOhVA3gzbOM9/NWIAiW4eKaIboCZ/aRo1dMGmUtHF5fOFTd66NZTMWzOHgY
         rUxm+LuoeVvdRG9EZQpqIbS6lEYBSh2J8jPozO6aM4XdDDzVmjpYBojbOB/LEDsuLfru
         7UdkXZaWuxW6HM6XjwL6MbqVW+B32J3YsQiVHtRlmmqI/1pgCygz3YJ+urYqLgTE8Trp
         wdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=42uP7nwk1DKS6fSwWnJDtRsgXYDuikgTlUvQyezJHRk=;
        b=lYn660fiIxLZxVoZymMwcScLoFojlGa2fB9XwlxxP5aCW5WcKDdL90/WjUnYP5up55
         CnFTZs2hc2TstyjJ+2FqUktD/BWiGpktQZL2CqhFQVEBAJqFFnwj8ejx1jmTy1nGSKZI
         vBT/r+DS0/9JXCSMVCAZ4bZzvvexoiKQOxFxep9xlATRyG6UOe1GzwqsPKysTo4T5JMO
         1YRM1yumx38igqhtebQmr9ZZYt9GoojVXeUvkt+bDPMCAZ+OgWxrAJEMBIKuIdb6jWMd
         Svy4x6G8H7+R7JZY394HTI5qFtqYafD5fUq1iln8oSGW1DoGTjAYuXtIoADUP1n53NFN
         hqBQ==
X-Gm-Message-State: AOAM532BjQ2q3CKRxbbB3U22n7DBlxZ6vNKDI6tY7N0wbaIXWkrBE4vp
	+E1fRtLPz8V6CnVFE+x677pxKN1WJvGbVw==
X-Google-Smtp-Source: ABdhPJzBKT0jwMaIJDVeyNYuUQsMS/NJPHVTJmOlXprPFTTRoPcqXEuyHLd4he+wO1K+dWyNSdeMfQ==
X-Received: by 2002:a05:6402:1d11:: with SMTP id dg17mr4358458edb.30.1624360895774;
        Tue, 22 Jun 2021 04:21:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/19] bluez5: upgrade 5.58 -> 5.59
Date: Tue, 22 Jun 2021 13:21:15 +0200
Message-Id: <20210622112126.2026646-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +-
 ....am-add-missing-mkdir-for-ell-shared.patch | 25 -------------------
 .../bluez5/{bluez5_5.58.bb => bluez5_5.59.bb} |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.58.bb => bluez5_5.59.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 635cad813e..f2d9a4f937 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -45,6 +45,7 @@ PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
@@ -53,7 +54,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
-           file://0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
deleted file mode 100644
index 03b42f73cb..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From d341ba650af1b7068d9ad034732b4f41b91bb2c1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 25 Apr 2021 18:56:41 +0200
-Subject: [PATCH] Makefile.am: add missing mkdir for ell/shared
-
-This addresses build errors out of source tree.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index be5d5c7..72ad425 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -623,6 +623,7 @@ lib/bluetooth/%.h: lib/%.h
- 	$(AM_V_GEN)$(LN_S) -f $(abspath $<) $@
- 
- ell/shared: Makefile
-+	$(AM_V_at)$(MKDIR_P) ell
- 	$(AM_V_GEN)for f in $(ell_shared) ; do \
- 		if [ ! -f $$f ] ; then \
- 			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb b/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.58.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.59.bb
index eb8475ec1e..7842eac76d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.59.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
+SRC_URI[sha256sum] = "046b95b386d0bfb2a16311fe799d517ee7735045512d89902c4ed701db477316"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.31.1

