Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9A3C001DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7571.1687850367094775525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122336881"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122336881"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 44739D29E8
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B4DAD5C3B
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C0EA16C833;
	Tue, 27 Jun 2023 16:19:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libassuan: upgrade 2.5.5 -> 2.5.6
Date: Tue, 27 Jun 2023 15:17:01 +0800
Message-Id: <1687850250-20040-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--7.330800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuKso3EN6f9DMgU
	Z+leFWPuHkgP5UWh3zW4VxGFQBNJeO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WaaNlF1efden0wGN2ThlUwL/5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2FR9
	Hau8GO7qfDnZdVcKQkiYQ9A79FYm5l+Z6nzvlhZwGkuOAMcfOWjZiKXyI2L/K1U1YE7XPbWQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183447

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix logging of confidential data.  [rA0fc31770fa]
 * Fix memory wiping.  [T5977]
 * Fix macOS build problem.  [T5440,T5610]
 * Upgrade autoconf stuff.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.5.bb b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.5.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.6.bb
index 2bab3ac955..7e899e7399 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.5.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4"
+SRC_URI[sha256sum] = "e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.34.1


