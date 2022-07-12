Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A89C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 06:42:47 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.6131.1657608158503849699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 23:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: yue.tao@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 26C6gXtB006889
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 23:42:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Jul 2022 23:42:33 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 11 Jul 2022 23:42:32 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [master][PATCH] gnupg: upgrade to 2.3.7 to fix CVE-2022-34903
Date: Tue, 12 Jul 2022 14:42:30 +0800
Message-ID: <20220712064230.18101-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 06:42:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167895

Signed-off-by: Yue Tao <yue.tao@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.6.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.6.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.7.bb
index f35eb8c75a..da2b1c4deb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.6.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "21f7fe2fc5c2f214184ab050977ec7a8e304e58bfae2ab098fec69f8fabda9c1"
+SRC_URI[sha256sum] = "ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


