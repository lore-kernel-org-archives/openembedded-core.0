Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A8DC0015E
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 08:46:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.83913.1691570757899800491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 01:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ku6dcAvd;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6874d1c8610so4763799b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691570757; x=1692175557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CcooeNBRCZ26CpPM62hzdv0Joivzkd07z1Em6Tz1zQ=;
        b=ku6dcAvdUzrJ5u46axoIWDtS5CxUtGKLabyisc1fgpb+8cUdcLvfqlsfGi+FUR4DxR
         h6vNlyzFwEXmbbZEE0HjPBHfyUPxVFna4/vPR7Yx4wY4drWNTa6DK11Lxzp/mJz9xREC
         GLKH+Kxkev+L5WF3eVhi2blsyleu09Q4FN2x5sRYcrcaEkhts3xS5fHIfS8sSdTNIYuN
         MYVL020C4Cn8lHMVlfDSa0N6ZALQt8gY5qcvQFF6Juv3+YBamSEAAkr1ZvYOqw77ed+F
         ogwiJSAd4KH5g0dtRuaGRyHIL8433ur4xpuB9Lz0V0e/6WAirRdtNGLBHODbrIyYPSy0
         Vdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691570757; x=1692175557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5CcooeNBRCZ26CpPM62hzdv0Joivzkd07z1Em6Tz1zQ=;
        b=Lpf05Zdfd8Cx/gVgvcWwWRvfM5d/e2ssegBFVETDEFR3XWfd0qVjyGG3WWFzE2N3CJ
         CtaM2UErYWv4axFJutrcGN6pyPnfBG96sY4SKtuBVPh9oPx30lXIzW42hBTi9Gdte+Q+
         rO6A/DJtWC//W6kZ33UW6/vRfxz+O7BJYfLPyCp7DexOkClY5e0MbRlc5Jle1O3f+H2H
         F17UvtV2BZ8v3CReuB2Kt+bvEHgJjYRmI99V+kYp+syjknwTfuKI6QSB37y1VLi2zvia
         mIcM9qFGu0UqMgBZ/320HkyyNDhBN7mZvdja97f7Uv9HrKarGLgMLF8sk+fCjOjYJx3T
         DZDw==
X-Gm-Message-State: AOJu0Yy88G2kNW3pvMazxxZpo/IX6pulQnfpA45C/TrBj2Md7hOXRaaD
	dxXhWep1ETNSSs//M99Nlqbn3PQKVM8=
X-Google-Smtp-Source: AGHT+IGjbWORYykEYtUJ5zLkQjch6FRsRukcYrdaZJCs07Ggit24hpTEHf/xgn3GhN/yCPwCI3HTcA==
X-Received: by 2002:a05:6a00:188f:b0:67f:d4e2:3dd7 with SMTP id x15-20020a056a00188f00b0067fd4e23dd7mr1861321pfh.21.1691570756875;
        Wed, 09 Aug 2023 01:45:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8005:8fc9:b43a:ffa3:6ed8:9b69])
        by smtp.gmail.com with ESMTPSA id a26-20020a62e21a000000b0064d74808738sm9439393pfi.214.2023.08.09.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:45:56 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] kea: upgrade to v2.5.0
Date: Wed,  9 Aug 2023 09:45:50 +0100
Message-Id: <20230809084550.9390-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 08:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185691

Changes:
Update license checksum: change in copyright year.
Update sha256sum for new version.

An additinal patch to fix the reproducible build failure.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...1-kea-fix-reproducible-build-failure.patch | 58 +++++++++++++++++++
 .../kea/{kea_2.2.0.bb => kea_2.5.0.bb}        |  5 +-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
 rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.5.0.bb} (92%)

diff --git a/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
new file mode 100644
index 0000000000..645b5a2de3
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-kea-fix-reproducible-build-failure.patch
@@ -0,0 +1,58 @@
+From f9bcfed5a1d44d9211c5f6eba403a9898c8c9057 Mon Sep 17 00:00:00 2001
+From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
+Date: Tue, 8 Aug 2023 19:03:13 +0100
+Subject: [PATCH] kea: fix reproducible build failure
+
+New version of Kea has started using path of build-dir instead of
+src-dir which results in reproducible builds failure.
+Use src-dir as is used in v2.2.0
+
+Upstream-Status: Inappropriate [oe-core specific]
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
diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.5.0.bb
similarity index 92%
rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
rename to meta/recipes-connectivity/kea/kea_2.5.0.bb
index 2c2e5a74dd..cf341b2f01 100644
--- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.5.0.bb
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
+SRC_URI[sha256sum] = "5b1553cd50928976925b82e5f7f2792f8e9e9244cad66820bc640fb3d50428f8"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.39.2


