Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48B0C61CE8
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11728.1749026745768639669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fKKkjuOx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026746; x=1780562746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lwRosKZsPW6I+ddPtEJtpvRv0lAOUdjJ20XV4kZhk7I=;
  b=fKKkjuOxWt/sqja4uWcloAIbzvuou6kJGarSu6aPEzhf9EfxQjCxLsNP
   c9cMi5vMP5kNkonOc3oWPbB5HOnWSII5PZBZ0DuPl/NSIac0V2e1T0B5t
   V7PkW2griMNwUuYGE0Te706SZPAbBzhU4qmiuBjTLOYwWZXygHnBdvJTP
   fpJ5VBMITdeVzz1YZ8gGrFnXdZslA1Z0d0bofnV+QZgyNNUHytx+z0zg3
   J2u08SsKUEh4qGuJ8FswrMsAb636Z+K5ZTxn2RYctGR0mMgv/0he/AIC9
   V0DdoZTt/02KTS8fyKDWs+r9dJLLZkHOGtlWRCl6S/MalfHvTLnl7uRUu
   g==;
X-CSE-ConnectionGUID: E3eOzCPNTa6Gaj5PRr8xUg==
X-CSE-MsgGUID: nA2AnFFlShu8oLzSfAcQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="190102945"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="190102945"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E892C13CA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5163DD4C19
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED7F11A009A;
	Wed,  4 Jun 2025 16:45:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/45] python3-pycryptodome: upgrade 3.22.0 -> 3.23.0
Date: Wed,  4 Jun 2025 16:45:17 +0800
Message-ID: <20250604084524.864-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217883

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
deleted file mode 100644
index c65b2a71fc..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "fd7ab568b3ad7b77c908d7c3f7e167ec5a8f035c64ff74f10d47a4edd043d723"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
new file mode 100644
index 0000000000..2528162ff8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
+
-- 
2.43.0


