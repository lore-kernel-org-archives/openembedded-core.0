Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C01EEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7612.1690875706217164017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="127862275"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="127862275"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:44 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3B5ECD7E2
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:41 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B751D5D16
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C56002FC8177;
	Tue,  1 Aug 2023 16:41:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libarchive: upgrade 3.6.2 -> 3.7.1
Date: Tue,  1 Aug 2023 15:41:15 +0800
Message-Id: <1690875687-21573-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10-5.006700-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrLfNU/r2ov2emQTCqZT6QS13D
	BH9waf7YlSuPsBnyugvUw09eu4b0WHLZ5LbXFw+rCtzGvPCy/m7GrCYQ4FUp6pBz1ZAU7t9TZQE
	rc2nx50cSVwN+MCRbrS+pDoI1xD+uSh82fl89D9cM4vXj8NEd0AwMqNovfwOolPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDe9VsdrlGzy3rKPJ48qPWiV/iZ1aNsYG7nWCd
	6QvVzbewzGI3+1EDSPOeOtoiFWQseVHGbcDbAq6FEUknJ/kEl4BpRCTkRk5SfoLR4+zsDTtLa13
	Fo3TPRbex6QKMjfdtDROxLs78NqoO+XsTeg0FFpobK2adWobCiAKCjHzw8v9ESfqWqCP/1QH0A3
	pLqsuP2SCLmZIMX6zQFdVDl0ENIU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185198

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    SEGV and stack buffer overflow in verbose mode of cpio
    bsdunzip updated to match latest upstream code
    miscellaneous functional bugfixes
    build fixes on multiple platforms
    bsdunzip: new tool ported from FreeBSD
    drop-in replacement for Info-ZIP unzip, not yet ported for Windows
    7zip reader: support for Zstandard compression
    7zip reader: support for ARM64 filter
    zstd filter: support for multi-frame zstd archives
    pax: fix year 2038 problem on platforms with 64-bit time_t
    Windows: Universal Windows Platform (UWP) fixes and improvements
    Windows: bcrypt usage fixes and improvements
    Windows: time function usage fixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/{libarchive_3.6.2.bb => libarchive_3.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.6.2.bb => libarchive_3.7.1.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.7.1.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.6.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.1.bb
index 4169a012fd..e40c3e7ed0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.1.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
+SRC_URI[sha256sum] = "5d24e40819768f74daf846b99837fc53a3a9dcdf3ce1c2003fe0596db850f0f0"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


