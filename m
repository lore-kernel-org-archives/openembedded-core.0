Return-Path: <nobuta.keiya@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E6DC43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 11:08:22 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web08.6637.1666177693468046054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 04:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: nobuta.keiya@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="80934081"
X-IronPort-AV: E=Sophos;i="5.95,196,1661785200"; 
   d="scan'208";a="80934081"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 19 Oct 2022 20:08:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1F7ED3EA9
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1173BF629
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com [10.126.195.136])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id 04C10405F794A
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
From: Keiya Nobuta <nobuta.keiya@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] create-spdx: Remove ";name=..." for downloadLocation
Date: Wed, 19 Oct 2022 19:57:37 +0900
Message-Id: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 11:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171965

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 meta/classes/create-spdx.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 47dd12c383..c190ad3889 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -459,6 +459,7 @@ python do_create_spdx() {
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
+            s = s.split(';')[0]
             recipe.downloadLocation = s
             break
     else:
-- 
2.25.1


