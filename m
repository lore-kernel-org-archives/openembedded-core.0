Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCB6CD3424
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 07:58:19 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2677.1777708697944606967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 00:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J0JMPmTG;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so1159115b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777708697; x=1778313497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6NKFeP7mDFTpT9TKC3DTofDtImA9VR+DDX3dMzCyhg=;
        b=J0JMPmTGCrmNVBxdp7lLK389U9GTIVb7yJVwqM6EbdUGilDcm/DM9muF9AXwMiyBow
         e2h/NOP0jNBQadsUt6wTbd2ELsrCTTelFFV6x3g4ph8qRcyLy0g6N6EK4c8Wt2eq7Q2H
         482bWN+5UAEINeqrEoVdjp7AZVcUOJhJFSMCZMycy1EsgqHoXdcj0raTr+/tLqaGuAvX
         yxAqHErhOwFAgO4wJ91ORHiYS8gXH+T3MzW6DBwyrQqOvFIjsYcrMrxjtsxvI6w/XTp5
         TKZzYoeDKxNVNUq5aYJLBQXF8jy8IvHQgYBDtvWN1hYQ0qeZVjj8RyHSu3vxOBcWU4Tz
         hlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777708697; x=1778313497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6NKFeP7mDFTpT9TKC3DTofDtImA9VR+DDX3dMzCyhg=;
        b=Eu0HKLlrErxUsCX/KFSNGiaPeqetmwLkfKtizS1eD7l0QQR7eUWOobZG9b7vXWaGy8
         hHXFSFbUbR8x3YJXtDXjBlBw8X4/HZk4QvbKKPU7uTlrMviQosE8efPLf1TCHhbpSmwW
         TNYj8wM48yfR1LcE1WsV4FxFhMUcVlPvYQwQ3QlWUv77KhJWzCBxyP/LnmLI854IAx2R
         DxMptMOk121iquXI6NqdciRj+IUwNyeXgU+t0yfSUVcdQu9LOljXG0oPCdqNeixgWQ0Q
         FsWBra2cr2VdGoCNKZeUL1oX0c5Ps1enPmVobshjWWcNCwuy5XhscJWbyUD/4k0I0OOm
         xL4A==
X-Gm-Message-State: AOJu0Yyqi0K27f8386U9+j4a9uBtTUuDfptdVZdnIReF+7V4KAq4FaO4
	XAHhwshCEXskVX/ojeuyDhIWdLvyoQHneNeDQRzPWiNV+JsfdjQjnG0nlozgbNIp
X-Gm-Gg: AeBDievyOwwqgjoJwpQz+ZCcX5afdqpmYv5d8YUShMXKEx9ofII2KhagL5AEKr2//Tn
	FMx81mfYRIiueVJotw/W/7oXath1PkHopfeXSKjLjDRCB+3hLEu2wryLP5wj4A8Iai2Mp4NJrUs
	PSmlqsrHH8/aNm5yyWau+SOSRx0vhke0ckGHcctKYZFp8X5Lh8T2z3BY/9JungFAPV5JtK1grNC
	VkrtlgplwXJMjK2uZzzyuSth4o2mk52CoCh81e5imTaJC6gQCEM/OMG1G+wwwCeHCxyHbRHQOfV
	Mcmzxf/xaoEFTds+1CMKtgM5UZLAZzcTKlx/YAlmJhcaKBOpaXtasqskORskpHfhxkQ+nMPcW5B
	Knhaygugg5bniF7KwJYnWEEAsSEbgQdvm5opHvQPL+DVIaV3fz478c8Kci9wQakkB2R+c1Lgoda
	ImbIl7Aa1ku6Cs+zKRlpE6su+XdFbkuv+GA1+QtRGqRdKlWJg=
X-Received: by 2002:a05:6a00:3d4a:b0:82c:e19d:cabd with SMTP id d2e1a72fcca58-8352d01f1d3mr2321309b3a.10.1777708697014;
        Sat, 02 May 2026 00:58:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8352bfe7a49sm1814568b3a.46.2026.05.02.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 00:58:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH] nghttp2: upgrade 1.68.1 -> 1.69.0
Date: Sat,  2 May 2026 19:58:08 +1200
Message-ID: <20260502075808.1860034-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 07:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236306

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch which is now merged in the upstream version.

Changelog:
https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 26 -------------------
 .../{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb}  |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb} (74%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
deleted file mode 100644
index 32adb05e07..0000000000
--- a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
-From: Ankur Tyagi <ankur.tyagi85@gmail.com>
-Date: Sun, 9 Nov 2025 12:45:25 +1300
-Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
-
-Remove hard coded path to fix installation on 64-bit arch.
-
-Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 98e3dbe7..3b6a4400 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
- set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
- set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
- set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
--set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
-+set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
- set(NGHTTP2_VERSION ${PROJECT_VERSION})
- 
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
similarity index 74%
rename from meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
index 71d5eef8d6..1d9a1b38a2 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
-    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
 "
 
-SRC_URI[sha256sum] = "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2"
+SRC_URI[sha256sum] = "1fb324b6ec2c56f6bde0658f4139ffd8209fa9e77ce98fd7a5f63af8d0e508ad"
 
 inherit cmake manpages python3native github-releases
 

