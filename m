Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A065C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 15:19:49 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.7639.1641568788391946103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 07:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 207FJlGT011084
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 07:19:47 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 207FJkKk022234
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 7 Jan 2022 07:19:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 7 Jan 2022 07:19:46 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 7 Jan 2022 07:19:45 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xserver-xorg: 21.1.1 -> 21.1.3
Date: Fri, 7 Jan 2022 23:19:18 +0800
Message-ID: <20220107151918.2061-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 15:19:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160264

From: Kai Kang <kai.kang@windriver.com>

Upgrade xserver-xorg from 21.1.1 to 21.1.3. It fixes CVE-2021-4008,
CVE-2021-4009, CVE-2021-4010, CVE-2021-4011 in 21.1.2.

Adjust indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
index 196d1edff5..3e076ecca7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
@@ -1,9 +1,9 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           "
-SRC_URI[sha256sum] = "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755"
+            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            "
+SRC_URI[sha256sum] = "61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


