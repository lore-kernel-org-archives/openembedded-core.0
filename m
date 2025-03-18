Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC25C35FFB
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5354.1742278929917078327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uKJ9LY0A;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NFlFdw9yQkVdAdF1PNo7IZY4am+lOzUffU+nkIcCNag=;
  b=uKJ9LY0AlYifzlz7ENtQsz/XilbvuGlk6u4MBGxdi5b2cZxVMdMrsYOo
   LfAmG2zh5d9OqIktwewNZoG7JG4VBM4RioHrTCpJHK34LpomgD/XrrMYx
   rllsakRXhgycqBanfj0R0YOHr9zK8BZdHdZOHCSG4eFfFnJOKuFbAzkCA
   NPbiORFWkY69oXGjLFZXW96DTKq9BuzfxTYXV9ZH4uYnpj0ePodpuf49r
   FIy/z0x6evsdJ/F1MuA6+6OmiyqpR2aQDUolBY1ekjebkRHR8qLOVjWLV
   839CrYw8tZslnluhrPjTuXIBaIW2YvRtfJlfCphCCsvUm+eIqERVVAyxn
   Q==;
X-CSE-ConnectionGUID: vt+wIpsGQkivpTn05/kEkA==
X-CSE-MsgGUID: r3zO5+5zS7ithOYBl+snOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="193742809"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="193742809"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5F6ED4C3F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B070BDCA2
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 607DD1A009A;
	Tue, 18 Mar 2025 14:22:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/12] python3-pycryptodome: upgrade 3.21.0 -> 3.22.0
Date: Tue, 18 Mar 2025 14:21:49 +0800
Message-Id: <1742278912-2989-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
deleted file mode 100644
index 77664b22a5..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "f7787e0d469bdae763b876174cf2e6c0f7be79808af26b1da96f1a64bcf47297"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
new file mode 100644
index 0000000000..c65b2a71fc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.22.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "fd7ab568b3ad7b77c908d7c3f7e167ec5a8f035c64ff74f10d47a4edd043d723"
+
-- 
2.43.0


