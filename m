Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA87C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 03:38:56 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.27291.1641785935582504467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 19:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 20A3cqfp016846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Jan 2022 19:38:52 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 9 Jan 2022 19:38:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 9 Jan 2022 19:38:51 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 9 Jan 2022 19:38:50 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xserver-xorg: 21.1.2 -> 21.1.3
Date: Mon, 10 Jan 2022 11:38:45 +0800
Message-ID: <20220110033845.15496-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 03:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160320

From: Kai Kang <kai.kang@windriver.com>

Upgrade xserver-xorg from 21.1.2 to 21.1.3. And adjust indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xserver-xorg_21.1.2.bb => xserver-xorg_21.1.3.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.2.bb => xserver-xorg_21.1.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
index 60c18c0a47..3e076ecca7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.3.bb
@@ -1,9 +1,9 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           "
-SRC_URI[sha256sum] = "c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0"
+            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+            "
+SRC_URI[sha256sum] = "61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.17.1


