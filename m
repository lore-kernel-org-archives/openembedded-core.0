Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F762CF6C17
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:08:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2150.1767776876476476298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HdyOa1Zd;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767776876; x=1799312876;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LvQc1qrRdxX8dWGWxvAbU6ECnTK1wlpygwmlILaUXpE=;
  b=HdyOa1Zd6YlM5+GR8shrpnA1kK3K0iK3WP7XNWaDQamEjQ3xyPTU6/w/
   WiU99B6e4zRJ2F/OBnwF/c6B72kKxGV6Pw2DPOccvKv9IKQetmE5Kal/B
   nyulCRXTpmSgXNcL3bZfWukcfsCyPjIAsfNPELxuqFova6NHwLzvQKFbb
   tv6EhwkXaEZEfpTXw6S9qlV+P2wYaKb9PjW3NCgZnpKgDv3yxzdqriecG
   +JDhrTK1jXmV+okyBFwfLLF85C79ryV522hWEA4vZznxefFlxCtS8zmkc
   9pyaj2jBixstWM5M17u8jIC3ZkED/D7k12NxTS0M6V3931su72cQIYnEF
   w==;
X-CSE-ConnectionGUID: ZQF0XoQzSzymOCK1OM+C+A==
X-CSE-MsgGUID: 5e7YbDlCRpWV0ptXxpG7IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225689733"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225689733"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 18:07:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id AE6ACC01B38
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 09:07:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 636C9C041FC
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 09:07:54 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3AEA31801131
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 09:07:51 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-pyzstd: upgrade 0.17.0 -> 0.19.1
Date: Wed,  7 Jan 2026 17:07:43 +0800
Message-ID: <20260107090744.844-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228962

1.Changelog:
  Fix SeekableZstdFile write table entries on 32-bits architectures when there is a huge number of entries.

2.Remove 0001-Remove-setuptools-version-limit-of-74.patch as setuptools was removed in pyproject.toml.

3.Remove do_configure:append as there is no setup.py in 0.19.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
 ...std_0.17.0.bb => python3-pyzstd_0.19.1.bb} | 10 +++----
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
 rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb => python3-pyzstd_0.19.1.bb} (53%)

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
deleted file mode 100644
index f2910322ff..0000000000
--- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-version-limit-of-74.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 14:38:31 -0700
-Subject: [PATCH] Remove setuptools version limit of '74'
-
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
-support beyond that which is needed for python 3.9 on windows. We
-do not have this problem on Linux
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index dd885e4..5d4d511 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- # setuptools 64+ support --build-option
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
--requires = ["setuptools>=64,<74"]
-+requires = ["setuptools>=64"]
- backend-path = ["build_script"]
- build-backend = "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
similarity index 53%
rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
index af7069b6ed..154e591f4b 100644
--- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
@@ -9,12 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Remove-setuptools-version-limit-of-74.patch"
-SRC_URI[sha256sum] = "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21b81764fa208c1db6"
+SRC_URI[sha256sum] = "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d586937830a8afc7d72"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest python_hatchling 
 
-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
+DEPENDS += "python3-hatch-vcs-native"
-- 
2.43.0


