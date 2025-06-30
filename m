Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFA6C8303F
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35175.1751274807907310760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rXEtxoxz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274810; x=1782810810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GjX5xTZidm2CpbwkwnB/VrUMnssG3IxiKhqHvUykXFs=;
  b=rXEtxoxzlVzSjKfortsKtJvUtwqzOR5tAkN9LjKFicSUj2uyDaGZzgui
   K7ILI/ZyF27P0wSJ/RSfJCnoREpkm5y+fJ19ayp+2yOA2m7DVG/lTW10y
   XiRq0IK7AFD1m6FfQnHbgmEQ532W0Uv4k7ZpI9wSHnIAW9Da9XLlaTFXU
   tn9ibUy3/Cec8eXYGZd/DgStV83rIv7OtVgGGEW9L50axAUuK+znVYLH7
   X9KHVdlyxxJhgnfF4L7a9PMpsL4X+P+Kwmf0sguHjW+f5YOteRwA97TW/
   1sg9tNY6mnESVWyp8ALhWNgfeEofXfF0PzldrRbNgXJs6cSA9F5H6VsP0
   A==;
X-CSE-ConnectionGUID: faGM2DF3T1WrLixx87TxhQ==
X-CSE-MsgGUID: OhFOuwfNTO2gp7LPhE/v4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573494"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573494"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 63D8742A326
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:29 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 9B7DF1C00298
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:28 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CD97B4E2E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:28 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B854D1A0073;
	Mon, 30 Jun 2025 17:13:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/37] lttng-ust: upgrade 2.13.9 -> 2.14.0
Date: Mon, 30 Jun 2025 17:12:59 +0800
Message-ID: <20250630091315.1897-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219478

From: Wang Mingyu <wangmy@fujitsu.com>

0001-lttng-ust-common-link-with-liburcu-explicitly.patch
0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
refreshed for 2.14.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-lttng-ust-common-link-with-liburcu-explicitly.patch | 6 +++---
 ...thon-lttngust-Makefile.am-Add-install-lib-to-setup.patch | 6 +++---
 .../lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb}      | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.9.bb => lttng-ust_2.14.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
index ceb240680b..b72c453b96 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -1,4 +1,4 @@
-From 1b6bbf14de8fdfe60e446c93969e29bc2cf5f2dc Mon Sep 17 00:00:00 2001
+From 4cdaf17efc66423aec5e3c094b9a1c31683e1a10 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 5 Sep 2021 10:44:19 +0200
 Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-common/Makefile.am
-index 1ccc290..6531fa0 100644
+index c350edc..09212a7 100644
 --- a/src/lib/lttng-ust-common/Makefile.am
 +++ b/src/lib/lttng-ust-common/Makefile.am
-@@ -16,6 +16,7 @@ liblttng_ust_common_la_SOURCES = \
+@@ -18,6 +18,7 @@ liblttng_ust_common_la_SOURCES = \
  
  liblttng_ust_common_la_LIBADD = \
  	$(top_builddir)/src/common/libcommon.la \
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index 7bbe5c216e..faddf55402 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From 30660997d220602202d8dc7264e49095a1581947 Mon Sep 17 00:00:00 2001
+From 92fd7a205aff290a6f20c08e62f72094100c3689 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 20 Feb 2024 12:19:06 +0000
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
@@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makefile.am
-index d53e21d..283901e 100644
+index 30db9fb..d46b6ee 100644
 --- a/src/python-lttngust/Makefile.am
 +++ b/src/python-lttngust/Makefile.am
-@@ -45,7 +45,7 @@ install-exec-local: build-python-bindings.stamp
+@@ -47,7 +47,7 @@ install-exec-local: build-python-bindings.stamp
  	if [ "$(DESTDIR)" != "" ]; then \
  		opts="$$opts --root=$(DESTDIR)"; \
  	fi; \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index dd7657e0cc..1a15c5b420 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
 LICENSE = "LGPL-2.1-or-later & MIT & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e196bf7adbed3f712"
+SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
 
 CVE_PRODUCT = "ust"
 
-- 
2.43.0


