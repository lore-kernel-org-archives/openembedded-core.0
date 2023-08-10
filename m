Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF5C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 10:27:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14097.1691663216955941083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 03:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CEVX9TJd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bbc06f830aso5673165ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691663216; x=1692268016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alWH71zEXN2rk807pSaWLA0mW3FRu2x6YCDPFuqNbd8=;
        b=CEVX9TJdn/3YoD5qGLV8STvJ+oomqMV4Qk0JVjpa3K14wmcLJdED7jQ2mqNNvedHsx
         KE2aM2L2FQkADoYTs1zbsgM715fNud20hnCl8j91hG2uFqxfMTTPUrgi6QPDXbpQ08Ci
         /GO2d5CJYCBtiK0k8o9yl8gejEoSBMd/vOOwHGOUWO3PQrH7aTnZEzAv3jkjf0QOLoeV
         rkf5GKiee+GJX0CmhC0Pf5MxgHZCLTZjM6ffGuix4nMgpv1PLwy1wC1d4EOCyqLy6cKO
         zg3bseObE1rG8IhKgp8FPVqxlKBxRU8mkRTAmFtX16db2OroY4nuAk4D7D6rMdSAmtQa
         /w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691663216; x=1692268016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alWH71zEXN2rk807pSaWLA0mW3FRu2x6YCDPFuqNbd8=;
        b=Ob6x31hPak3MiNCIYfcp4UHHOEIGzAHxYIISMN4P8RGgE9EeTL27DFShJgUARM5dR5
         upaUrIJJZjnACvgk4X9NpFi9KH4AWcPZCDSdxAfWv5iWT1aRsPqcxwrOR57MX1OWGZse
         5CCWPeiDdf6o+wvmi9UJOdlF+PY87JU2waZi4XBVjXgKqmUIvhLfF3wVhj4TLZXTX5Bz
         DvBJRAAtBjSyQwEWIuvr5nuiDiLVQO9bMYGzq2DvJGOHhgMOZtimtu0BnDe06y61kAdf
         kQ3PcLafmFYJpNMeOAcBgum33uPzyeRkpFkMA84c8x9Og9lMP0LdngIz+b49/q8JyPSK
         bwXg==
X-Gm-Message-State: AOJu0YwJ1Lcr/fiuJ46214R07gHcjZA/q1xkcsR/laCVmDw3NpO2LOqV
	sSX7P7FbXdeQxyqI/nPbrblQ73lzPdJ/0Q==
X-Google-Smtp-Source: AGHT+IGsoMtZn5IxUwP9cv85UTy/brMpJhJfi2TJjjColOuynnJpyWvQEtq5ZOHy/V6uoDCQgYAr1w==
X-Received: by 2002:a17:902:dacf:b0:1ba:fe6a:3845 with SMTP id q15-20020a170902dacf00b001bafe6a3845mr2507671plx.11.1691663215907;
        Thu, 10 Aug 2023 03:26:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:4060:10c:37c5:9724:a5b9:2030:1da4])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090332d000b001b8b73da7b1sm1343128plr.227.2023.08.10.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:26:55 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] kea: upgrade to v2.4.0
Date: Thu, 10 Aug 2023 11:26:35 +0100
Message-Id: <20230810102635.9669-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 10:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185735

Changes:
Update license checksum: change in copyright year.
Update sha256sum for new version.

An additinal patch to fix the reproducible build failure which is
still under discussion with upstream.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...1-kea-fix-reproducible-build-failure.patch | 61 +++++++++++++++++++
 .../kea/{kea_2.2.0.bb => kea_2.4.0.bb}        |  5 +-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.4.0.bb} (92%)

diff --git a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
new file mode 100644
index 0000000000..ec49ccc897
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
@@ -0,0 +1,61 @@
+From f9bcfed5a1d44d9211c5f6eba403a9898c8c9057 Mon Sep 17 00:00:00 2001
+From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
+Date: Tue, 8 Aug 2023 19:03:13 +0100
+Subject: [PATCH] kea: fix reproducible build failure
+
+New version of Kea has started using path of build-dir instead of
+src-dir which results in reproducible builds failure.
+Use src-dir as is used in v2.2.0
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/3007]
+
+Upstream has confirmed the patch will not be accepted but discussions
+with upstream is still going on, we might have a proper solution later.
+
+Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
+---
+ src/bin/admin/kea-admin.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/bin/admin/kea-admin.in b/src/bin/admin/kea-admin.in
+index 034a0ee..8ab11ab 100644
+--- a/src/bin/admin/kea-admin.in
++++ b/src/bin/admin/kea-admin.in
+@@ -51,14 +51,14 @@ dump_qry=""
+ if test -f "@datarootdir@/@PACKAGE_NAME@/scripts/admin-utils.sh"; then
+     . "@datarootdir@/@PACKAGE_NAME@/scripts/admin-utils.sh"
+ else
+-    . "@abs_top_builddir@/src/bin/admin/admin-utils.sh"
++    . "@abs_top_srcdir@/src/bin/admin/admin-utils.sh"
+ fi
+ 
+ # Find the installed kea-lfc if available. Fallback to sources otherwise.
+ if test -x "@sbindir@/kea-lfc"; then
+     kea_lfc="@sbindir@/kea-lfc"
+ else
+-    kea_lfc="@abs_top_builddir@/src/bin/lfc/kea-lfc"
++    kea_lfc="@abs_top_srcdir@/src/bin/lfc/kea-lfc"
+ fi
+ 
+ # Prints out usage version.
+@@ -355,7 +355,7 @@ mysql_upgrade() {
+     # Check if there are any files in it
+     num_files=$(find "${upgrade_scripts_dir}" -name 'upgrade*.sh' -type f | wc -l)
+     if [ "$num_files" -eq 0 ]; then
+-        upgrade_scripts_dir=@abs_top_builddir@/src/share/database/scripts/mysql
++        upgrade_scripts_dir=@abs_top_srcdir@/src/share/database/scripts/mysql
+ 
+         # Check if the scripts directory exists at all.
+         if [ ! -d ${upgrade_scripts_dir} ]; then
+@@ -405,7 +405,7 @@ pgsql_upgrade() {
+     # Check if there are any files in it
+     num_files=$(find "${upgrade_scripts_dir}" -name 'upgrade*.sh' -type f | wc -l)
+     if [ "$num_files" -eq 0 ]; then
+-        upgrade_scripts_dir=@abs_top_builddir@/src/share/database/scripts/pgsql
++        upgrade_scripts_dir=@abs_top_srcdir@/src/share/database/scripts/pgsql
+ 
+         # Check if the scripts directory exists at all.
+         if [ ! -d ${upgrade_scripts_dir} ]; then
+-- 
+2.39.2
+
diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.4.0.bb
similarity index 92%
rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
rename to meta/recipes-connectivity/kea/kea_2.4.0.bb
index 2c2e5a74dd..316468754e 100644
--- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -17,8 +17,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
+           file://0001-kea-fix-reproducible-build-failure.patch \
            "
-SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
+SRC_URI[sha256sum] = "3a33cd08dc3319ff544e6bbf2c0429042106f4051ebe115dc1bb2625c95003f7"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.39.2


