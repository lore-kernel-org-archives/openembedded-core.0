Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F3BC7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.35174.1751274806117355495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HRPmDs3Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274806; x=1782810806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/pDsZUFPyGssfixisXtavKfarOsAccOsHscovTIf+fc=;
  b=HRPmDs3ZDWE1diJeMTt5rHYfAJjq4zg3OIWpvhUsYzdXQXZ8XH6dQIGe
   5Xvz8s+K7xr5RMKCDPxONGxUTKFgb3PUpdtzoLiGjZQLe8Aj5Z/Qp8TSG
   sDE6ffG8I81DHxYtS0ES/gNMZcMwYmSOl8/K3/e0z/Ws2wHG9+DYeSfBq
   1ihvpXrrtgfy6MI0ATwTN3YahDVFuHCmZ2yoPdR2yNSK6+ONTfOccBcoo
   vqR7RZkmzsna3zE50/bmfphdJ/F274OjApPZ1ViAyECmJyINHoy5mL0De
   hh2k6jMNEg7uX0JHLGZej6yedkPe4xPrl+Zdv5dtunNhPUvVwAlZasq10
   g==;
X-CSE-ConnectionGUID: XROQJyWvRXy+O1hiOtwSuA==
X-CSE-MsgGUID: 8hKW/RyMS86h8kcIY6Gvug==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204535096"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204535096"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2E82A1C0008E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:24 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id A14DE1800317
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:23 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1142DBF3CC
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:22 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 940131A000B;
	Mon, 30 Jun 2025 17:13:21 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/37] btrfs-tools: upgrade 6.14 -> 6.15
Date: Mon, 30 Jun 2025 17:12:40 +0800
Message-ID: <20250630091315.1897-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219466

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- mkfs: new option --inode-flags to specify flags/attributes for inodes/directories/subvolumes
- check:
  fix false alert on missing checksum for hole
  in lowmem mode, fix false alerts when checking refs
- convert: check feature compatibility when enabling block-group-tree
- tune convert-bgt: fix resume of conversion
- rescue: add new command fix-data-checksum, selectively fix or find mismatching checksums
- other:
  new and updated tests
  documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.14.bb => btrfs-tools_6.15.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.14.bb => btrfs-tools_6.15.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
index 982d4830b5..88a6d11354 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
+SRCREV = "3da67f1c78bcbd7556f04d89e31aa4621face50b"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.43.0


