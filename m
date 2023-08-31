Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149D3C83F28
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:54:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8809.1693450452599780543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109452383"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109452383"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:54:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78FEFD29EB
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:54:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7B51D948C
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:54:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F1E486C8D;
	Thu, 31 Aug 2023 11:54:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.42.0 -> 3.43.0
Date: Thu, 31 Aug 2023 10:53:45 +0800
Message-Id: <1693450425-28605-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-2.301700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqykob0Y35+HFNEA
	nAuyokV24CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN3/KVtfZiSDpjgELkIsyIqMrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SXnPFetbKBbmRMgBtjXa8AKu+4u9t7Kq3vtqmjikGm9jHWwx+onKB/opDu
	bXo3S16f1G/2QkRdxc8a1rtpI5GqH+AvRd6lXKoS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186957

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add support for Contentless-Delete FTS5 Indexes.
-Enhancements to the date and time functions:
-Added the octet_length(X) SQL function.
-Added the sqlite3_stmt_explain() API.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.42.0.bb => sqlite3_3.43.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.42.0.bb => sqlite3_3.43.0.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb b/meta/recipes-support/sqlite/sqlite3_3.43.0.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.42.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.0.bb
index 8783f620f4..e6d7bb9cd5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.0.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
+SRC_URI[sha256sum] = "49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1"
 
-- 
2.34.1


