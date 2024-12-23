Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1B3E7719B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.10442.1734945082255578133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cEVO38dF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8K9KirwfsFbG1vAMgkUXR1W6CoAsT1E+Y3xzNqqhK6I=;
  b=cEVO38dFwFdK2uFzD9r2yMKZn711eKx8gEPzKX3smfXWKChxDDYe24Uj
   Fvs4iv+dG6etPYKbXx5iJSheAneNZrlBd6i0eXaDz4D3rHxVmHCreg2C6
   BuvJhep0CJtm9npezVTT2lNZ8kc66X+o9hjXQUYhMTLwegXaacbkrSr5r
   KuaPfYk3jr5muykuJAIYt1iVwI7pN3EOtlRd6jRUyTkMAejqSuLo3+plA
   a+StLNDqjbtVf5B0i/k/VkiFJF90K7b4EGPKjlRhb6S/4gsCMM02Q6kQh
   EDILs4NGhCnPWOJafpLyeKgyfY3Lvs53CLXOM55SOP46y39nEoo2DOgvY
   Q==;
X-CSE-ConnectionGUID: 95MxfioHQkiwqDhETtJDlw==
X-CSE-MsgGUID: 9pWxd1nKQ8yyewg0mh1FWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184685043"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184685043"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BBA24C2269
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9141CD4C3B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33FCC1021B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CCA8B1A006C;
	Mon, 23 Dec 2024 17:11:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/22] python3-psutil: upgrade 6.1.0 -> 6.1.1
Date: Mon, 23 Dec 2024 17:10:56 +0800
Message-Id: <1734945065-4373-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v9ZD5CwN3C0B5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S/upjf3UscjfJihHxinnQ+Ica0R1z32FONsD7GNTzKgnA33
	t5M1Tr20MrVHUhpiBgOA8If/eJ/e136tsLFYxkQetxr5Ot5imQS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209024

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_6.1.0.bb => python3-psutil_6.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_6.1.0.bb => python3-psutil_6.1.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.1.0.bb b/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_6.1.0.bb
rename to meta/recipes-devtools/python/python3-psutil_6.1.1.bb
index bbff7f3fe5..854161830a 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a"
+SRC_URI[sha256sum] = "cf8496728c18f2d0b45198f06895be52f36611711746b7f30c464b422b50e2f5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


