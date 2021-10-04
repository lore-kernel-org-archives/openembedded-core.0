Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F0BC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 10:27:52 +0000 (UTC)
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
 by mx.groups.io with SMTP id smtpd.web11.7443.1633343270915564085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 03:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 194.138.37.40, mailfrom: andrej.valek@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 194ARm1F021010
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 4 Oct 2021 12:27:48 +0200
Received: from md3hr6tc.ad001.com ([139.22.41.65])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 194ARlKQ006551;
	Mon, 4 Oct 2021 12:27:48 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: 1.34.0 -> 1.34.1
Date: Mon,  4 Oct 2021 12:27:31 +0200
Message-Id: <20211004102731.72934-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 10:27:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156580

- update to next stable version 1.34.1

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../{busybox-inittab_1.34.0.bb => busybox-inittab_1.34.1.bb}    | 0
 .../busybox/{busybox_1.34.0.bb => busybox_1.34.1.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.34.0.bb => busybox-inittab_1.34.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.34.0.bb => busybox_1.34.1.bb} (95%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.34.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.34.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.34.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.34.1.bb
diff --git a/meta/recipes-core/busybox/busybox_1.34.0.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
similarity index 95%
rename from meta/recipes-core/busybox/busybox_1.34.0.bb
rename to meta/recipes-core/busybox/busybox_1.34.1.bb
index 51df1df05f..6aed0f0476 100644
--- a/meta/recipes-core/busybox/busybox_1.34.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
@@ -51,4 +51,4 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "ec8d1615edb045b83b81966604759c4d4ac921434ab4011da604f629c06074ce"
+SRC_URI[tarball.sha256sum] = "415fbd89e5344c96acf449d94a6f956dbed62e18e835fc83e064db33a34bd549"
-- 
2.31.1


