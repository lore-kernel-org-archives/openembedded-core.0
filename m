Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8F2C3ABDB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.45916.1747040638854317555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bd/RrNN6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sKX03zdnDPPYJaxoWsgmixbqzbvLAySTecZ6IayJddM=;
  b=bd/RrNN6+H3MoT/ZQqz546wNYZBGkLHFUGewqiwHkglZviN9O0o/Ufhp
   ovmxBy/Y5ygCgjZ4a9BhYHu2ADYcndt/WHVHHGRFj4d1PKWFNvfeKvct4
   vAN5CXUbohAiwQC0gCgjejc+YOFzPiGHmNSvO236Rte8jdAa1q84tMGsg
   blZlhUoZK5eQS1nG2bszBvDFWXlyc4ggrQ+YEQZUFqvl2U0W3a0c0h+Mp
   dTUPpbtVYugMiTgTTlKvdQiRLjxGfQg+cE3gUHcwzX/oa81Y+Ktizx3+5
   Bry4Sk1rktCPZpslp1K2rUymNlfFfrfxPYXuxvgnadJQ5gz7fIlLBQAC4
   g==;
X-CSE-ConnectionGUID: G8pUL5XcTU+2+NclddumdQ==
X-CSE-MsgGUID: CpMpU7HsRU2J4IQnGaVfvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="202056478"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="202056478"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AA8BD5004
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C90DCFB76
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A7F1C1A009A;
	Mon, 12 May 2025 17:03:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/56] ca-certificates: upgrade 20241223 -> 20250419
Date: Mon, 12 May 2025 17:02:50 +0800
Message-Id: <1747040619-7566-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216305

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
refreshed for 20250419

0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
removed since it's included in 20250419

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ertdata2pem.py-print-a-warning-for-e.patch |  6 ++--
 ...icates-don-t-use-Debianisms-in-run-p.patch |  6 ++--
 ...ca-certificates-add-a-sysroot-option.patch | 36 -------------------
 ...0241223.bb => ca-certificates_20250419.bb} |  3 +-
 4 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20241223.bb => ca-certificates_20250419.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index da2a247e51..1226508c98 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 630736f427c0a1bd0be0b5a2f6d51d63b2c4c9fd Mon Sep 17 00:00:00 2001
+From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index 52d41ca..bdb2c8a 100644
+index dbe3e9c..496e05d 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -138,7 +138,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index cad30929f5..1a29da756f 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 348163df412e53b1b7ec3e81ae5f22caa0227c37 Mon Sep 17 00:00:00 2001
+From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
@@ -22,10 +22,10 @@ Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 36cdd9a..2d3e1fe 100755
+index 91d8024..1e737b9 100755
 --- a/sbin/update-ca-certificates
 +++ b/sbin/update-ca-certificates
-@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
+@@ -210,9 +210,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
    echo "Running hooks in $HOOKSDIR..."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch b/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
deleted file mode 100644
index ba5bb69657..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0002-sbin-update-ca-certificates-add-a-sysroot-option.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d6bb773745c2e95fd1a414e916fbed64e0d8df66 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 31 Mar 2025 17:42:25 +0200
-Subject: [PATCH] sbin/update-ca-certificates: add a --sysroot option
-
-This allows using the script in cross-compilation environments
-where the script needs to prefix the sysroot to every other
-directory it operates on. There are individual options
-to set those directories, but using a common prefix option
-instead is a lot less clutter and more robust.
-
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/13]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- sbin/update-ca-certificates | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 4bb77a0..1e737b9 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -59,6 +59,14 @@ do
-     --hooksdir)
-       shift
-       HOOKSDIR="$1";;
-+    --sysroot)
-+      shift
-+      SYSROOT="$1"
-+      CERTSCONF="$1/${CERTSCONF}"
-+      CERTSDIR="$1/${CERTSDIR}"
-+      LOCALCERTSDIR="$1/${LOCALCERTSDIR}"
-+      ETCCERTSDIR="$1/${ETCCERTSDIR}"
-+      HOOKSDIR="$1/${HOOKSDIR}";;
-     --help|-h|*)
-       echo "$0: [--verbose] [--fresh]"
-       exit;;
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
index 676e9e0c78..f06a30bd6d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
@@ -14,10 +14,9 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03"
+SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://0002-sbin-update-ca-certificates-add-a-sysroot-option.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
-- 
2.43.0


