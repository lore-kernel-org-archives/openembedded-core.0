Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B68C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 03:19:31 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.1728.1642562370448561243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20J3JT19014664
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:19:29 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20J3JSIs016614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:19:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 18 Jan 2022 19:19:28 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 18 Jan 2022 19:19:27 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] socat: update SRC_URI
Date: Wed, 19 Jan 2022 11:19:27 +0800
Message-ID: <20220119031927.2535-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 03:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160689

From: Mingli Yu <mingli.yu@windriver.com>

The orginal one is unaccessible now.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index 5a13af91bc..0a1b65a8ca 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+SRC_URI = "http://www.dest-unreach.org/socat/download/Archive/socat-${PV}.tar.bz2 \
 "
 
 SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
-- 
2.17.1


