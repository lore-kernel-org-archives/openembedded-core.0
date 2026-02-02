Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFDCD172AE
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 01:36:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43397.1769996209126815819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 17:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fBTjRBvD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769996207; x=1801532207;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uu9nONRrSE2lFX9SqmV/NCE7mvxwIfshYnGCrgu6VE0=;
  b=fBTjRBvDcGeD9gWmodsT9GzxT6hY4dOq0sC/NSrlcJ9Q7fVYei1YlMq2
   7EAnNvkIef3AS4GOLf1/K9v8rIRY8QbiiFeO9t8oiBv+vfLYFcBPK1ofs
   54DVXgicfTXOgNfEIjMscg0vV68M+sOWt5YUctpHEn5zfafx7B06K2vjc
   5dtNBfBz2/eNZoeJ+5bc+Asin6AzTZN00UmCeXjrQDMTfyNq4sW94Lzoe
   Axv/U+uWxJnA82LPKkD1jiwsLfRycExdFSVgIvF1Qe/L5ani4zxJaPwxf
   pfAbaJtLRJwO+gG3nJ3bXoC6KMxija/9/92Pggyc3X+klk0vFS3jMeRix
   Q==;
X-CSE-ConnectionGUID: y1KhX4DsRLuAEC2wJ+YlOA==
X-CSE-MsgGUID: KcmnSXoGSiGGW1nJs0SsbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="228749482"
X-IronPort-AV: E=Sophos;i="6.21,267,1763391600"; 
   d="scan'208";a="228749482"
Received: from unknown (HELO mail.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:36:45 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 5ABC21C1C707
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Feb 2026 01:36:47 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0F31518000D5
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Feb 2026 01:36:47 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9EB8E2000221
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Feb 2026 01:36:44 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6 v2] python3-appdirs: Add new recipe
Date: Mon,  2 Feb 2026 09:36:40 +0800
Message-ID: <20260202013640.14467-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 01:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230340

Move it from meta-openembedded to openembedded-core as it is required by hotdoc 0.17.4.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-appdirs_1.4.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb

diff --git a/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
new file mode 100644
index 0000000000..c027e80b28
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
+HOMEPAGE = "https://github.com/ActiveState/appdirs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+PTEST_PYTEST_DIR = "test"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


