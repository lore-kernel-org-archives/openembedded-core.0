Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.17202.1627891957039651790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 01:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1728CYpt031309
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 2 Aug 2021 01:12:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1728CYaN028422
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Aug 2021 01:12:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 01:12:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 01:12:33 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [Hardknott][PATCH] nettle: update 3.7.2 -> 3.7.3
Date: Mon, 2 Aug 2021 16:10:11 +0800
Message-ID: <20210802081011.45443-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Alexander Kanavin <alex.kanavin@gmail.com>

fix CVE-2021-3580

(From OE-Core rev: 219c89310264f99c2c43bb80e437a8a1e8e3217a)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.2.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.2.bb
rename to meta/recipes-support/nettle/nettle_3.7.3.bb
index f8f3360086..031500d741 100644
--- a/meta/recipes-support/nettle/nettle_3.7.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
+SRC_URI[sha256sum] = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1

