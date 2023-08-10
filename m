Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605C9C04A94
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 09:17:35 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.13335.1691659051052680625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J+3ZwTdc;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bbbbb77b38so5107985ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691659050; x=1692263850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BjNncUZBEu8BAIKPViANnf2lTv7aaP5spsfaeVCzbg=;
        b=J+3ZwTdcqM4M3hRI5212d56pfypTJ9XvD5W0LZwXdu1ExvD8tvAhLKQc2AirEazEzl
         NmBrN6kEBQy1WiRETGrtLrzww7pfLkySLIm8rxRxcae9anKHe9yngFIcvOz3jJ7s9DPm
         /yKCSDRnZoWeekSPukOV6SXkXC9xSwztNU6fa77IisWGo+GQ/dVGJcPuXQAP+uS6O674
         x/rNXA4b0tlaI/iiKgnxy/qbaj2vYolxs1VVUNDOjY+4WZG/j65zYpY9aa1n8XHvmqvy
         zg0D1HiL9DsOA+7u36b0GxsGN4hmFFUX4yvSL/qjL+V/uPd9b6kdpvGB/62WHMLTFEZd
         mIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659050; x=1692263850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BjNncUZBEu8BAIKPViANnf2lTv7aaP5spsfaeVCzbg=;
        b=Sp4hfjV+9ds73eh//rIOSIY0CelwEXL7ak4R+ENGZyAwM61r0yRW7+lMVfoy5snALt
         JB7ZINikxzjraT9DBoHnGy8LZdv3Evg9B4xUxQ+yy/J05dFjJ5x6lXQ4WX7M1K9aPb4X
         QUQU5K8nMqJGADAqjcZDXgsEufkRjSATAmRqZI9K+7OTUUg9A6kCXb2M5VGy9SlQdhUs
         rpB/XlitQRxFUOyx3r2bdMdEYB6+IJbr09zxQPSdEntjfuRWGQxi1hn6OkZDkDODhck3
         g5fL6gBvEv8U/eFzpj0XOa53BNGBxGq+gAZy5nwyEYy9f4w+2hPX6paWcJYe2tvhY0u7
         oMSg==
X-Gm-Message-State: AOJu0YxAN7+UUf1OUX14EFp1Iql8O1hGGIW9R75yEdYg8Hy5T4FWswq3
	BrCT9cX2pDMF7TobnswUfgqDg19l3SScbQ==
X-Google-Smtp-Source: AGHT+IENFMcQS3s9+dYa/98Z0uBaiDBd4VuD5ODjpQ6sId6ZVyeqxOIU51FICS/KpmvGCLQEhqRf4g==
X-Received: by 2002:a17:902:f7d4:b0:1bd:a22a:d40a with SMTP id h20-20020a170902f7d400b001bda22ad40amr677290plw.2.1691659050044;
        Thu, 10 Aug 2023 02:17:30 -0700 (PDT)
Received: from localhost.localdomain ([2409:4060:10c:37c5:9724:a5b9:2030:1da4])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902f69100b001b03cda6389sm1186127plg.10.2023.08.10.02.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:17:29 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] kea: upgrade to v2.4.0
Date: Thu, 10 Aug 2023 10:17:21 +0100
Message-Id: <20230810091721.8123-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185728

Changes:
Update license checksum: change in copyright year.
Update sha256sum for new version.

An additinal patch to fix the reproducible build failure which is
still under discussion with upstream.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...1-kea-fix-reproducible-build-failure.patch | 62 +++++++++++++++++++
 .../kea/{kea_2.2.0.bb => kea_2.4.0.bb}        |  5 +-
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.4.0.bb} (92%)

diff --git a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
new file mode 100644
index 0000000000..8a5bd00302
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
@@ -0,0 +1,62 @@
+From f9bcfed5a1d44d9211c5f6eba403a9898c8c9057 Mon Sep 17 00:00:00 2001
+From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
+Date: Tue, 8 Aug 2023 19:03:13 +0100
+Subject: [PATCH] kea: fix reproducible build failure
+
+New version of Kea has started using path of build-dir instead of
+src-dir which results in reproducible builds failure.
+Use src-dir as is used in v2.2.0
+
+Upstream-Status: Pending
+https://gitlab.isc.org/isc-projects/kea/-/issues/3007
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


