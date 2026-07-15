Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66ACC44519
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12406.1784134077582862964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LYuwQtOL;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44cd237446cso1497533fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134077; x=1784738877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pc+eaclg8vSOjinXmnN+zBjbFbAzT7vcFvrnDvut6bs=;
        b=LYuwQtOLCpCjMdcDnmvzoMuWCZYsiYAhH8hzmIbNVq1CL7ek/kxisAoLLdUWH7zwoi
         MgZiRX9ioCZxWRq5Ni/TQZTsMKp5ZreGEuaWwDDhqDejI3mIihcFmQhRKjDQIiOlkCAF
         /WCITOKXcbv/oGb7ShrSvDhIHeZGgrQrlVOgsnXshE3D3jl1dUuHm89RBHKktUuCpUeX
         D2/DiAYoTcFqDjnYFBJgQK9WX1U7ljJF2MKw1aEpw5qmFDwAfUdrYGt+kR/G8F6RDoBP
         kPXBweYZvSr9zRgi4yBDIHZ/LpB/b44Or8oOsj6JVseA/p0keVsVWoEU2z1w2qjYZzJi
         zVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134077; x=1784738877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pc+eaclg8vSOjinXmnN+zBjbFbAzT7vcFvrnDvut6bs=;
        b=Hb6NX8nAmd71QoB+qDM9rB21BkPhsxvrLJyjyzQRGGeAeSR55lrBNkVg+jE77wTDf3
         YJpGksxqjWIXRnEU9YZrudze6sbaLOIX3iWeJwggkE7FfXM+oAMHrEx4hKv96R2jAOEf
         jPrmoWP7A79DhEm7gcXvaVwgPrtCh/eeK74v7CACRJ2zvGVjhiPAHTmhcyWnY37CzCRA
         5eEnwzMHay1LUSQpCAbFyyAVPrNGflUUnWtlp+cEf8tnUYVnld/CVbuq5h9MZcw3qiBO
         4cayEdqPzylCSzw5Xan3vDfQdz2ZPaQRO5A7OZtcrPotNSro+WtJILEG22CjH3Jy2MAb
         StOQ==
X-Gm-Message-State: AOJu0Ywiv/7d/tUpoFd9/TAZKHyBHz8rGmW2pd8qjhkbGCWehMvsompF
	OhaqSkZErpwCZWrrlqtEHpaYIRMrGjA4OmyNebIVNTtQX9yUJYgFrQG65X0Y2Q==
X-Gm-Gg: AfdE7ckMKezs9+DevNPtjjmikZUn3HrQZ/JUJ/q64/W0NAUULrKSAPkDcyj6I1ZryqN
	olUvqsWC78b8sXnU8+7A0k45tE+pXkKUq6dcVY1E7kVCypkcwMGTncXQ9VSvgpHKa7wbR2C6VXQ
	sEOEZdH9dzfA3TKRUb7n4+ZZEG4pMLW8iyoZhtb2sxoxMerbggdkS0m9Gj3S6bIF6QPUqZF36Dq
	+O6Sb/dr+ZNvuJTU0tmm8J8Dz8irVuVjg+j54bkecZ0NEMKWL4FfUt9RcyNCipFn1Kp2oOLsznI
	nVNCdP/90Jy1seym89dRhTMRuO516tDuc/C7vyKNGS9RjKp8ncai0vsZRaYu9KIk7t4Fr74qR53
	UaRuKhpusA8tH81ceKijVeVIu2+TSnAYQDMfrsNmaQF/qlgIksUanaa+o1QLReM1GgECXCXBXcL
	kfam6DMzLZ
X-Received: by 2002:a05:6870:8193:b0:448:558c:d8cb with SMTP id 586e51a60fabf-451f153e304mr9971358fac.41.1784134076663;
        Wed, 15 Jul 2026 09:47:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 20/25] meta-selftest: Change license on test recipes
Date: Wed, 15 Jul 2026 10:45:16 -0600
Message-ID: <20260715164739.364323-21-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241013

The "CLOSED" license now issues a warning that it should be replaced
with a LicenseRef, so remove it from the test file in favor of declaring
an MIT license

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb  | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-ignored.bb     | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb   | 3 ++-
 .../recipes-test/devtool/devtool-test-long-filename.bb         | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb  | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb      | 3 ++-
 meta-selftest/recipes-test/logging-test/logging-test.bb        | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb | 3 ++-
 .../recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb      | 3 ++-
 .../recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb        | 3 ++-
 .../recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb        | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb    | 3 ++-
 13 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
index f12bee0b3d..467df669df 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
@@ -1,5 +1,6 @@
 SUMMARY = "devtool test for overrides and patches"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
index c7740eb118..6ea4fa71fb 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://${BPN}.tar.gz \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index 54463fed98..aad3a62f1f 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://file1 \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
index 3653403a2e..ce0a468403 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://${BPN}.tar.gz \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
index 0146be4c52..fbfb456bf9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://file1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
index 966142431b..0351a1e3bb 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://devtool-test-subdir.tar.gz \
diff --git a/meta-selftest/recipes-test/logging-test/logging-test.bb b/meta-selftest/recipes-test/logging-test/logging-test.bb
index ac3fb46f45..b08678ac58 100644
--- a/meta-selftest/recipes-test/logging-test/logging-test.bb
+++ b/meta-selftest/recipes-test/logging-test/logging-test.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Destined to fail"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 deltask do_patch
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
index 21f06782fb..76ea0e895d 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Produce a broken la file"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
index e748310fc4..ee1c99a97e 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Produce a broken pc file"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
index 106ddd5426..3926bd9bf2 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Check that shebang does not exceed 256 characters"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
index 36a682c53d..9e5c72e5b1 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PROVIDES = "virtual/sysroot-test"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
index 67172f3cab..d84b8c6282 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PROVIDES = "virtual/sysroot-test"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
index 560487c159..dc265dbe35 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Virtual provider sysroot test"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/sysroot-test"
 
-- 
2.54.0


