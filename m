Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.17154.1629907286458421696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 09:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17PG1MGx007266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Aug 2021 09:01:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 09:01:22 -0700
Received: from vme.wrs.com (172.25.44.7) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Wed, 25 Aug 2021 09:01:22 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <anuj.mittal@intel.com>, <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] openssl: upgrade from 1.1.1k to 1.1.1l
Date: Wed, 25 Aug 2021 12:01:21 -0400
Message-ID: <20210825160121.162473-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Includes fixes for:

CVE: CVE-2021-3711
CVE: CVE-2021-3712

as described by:
   https://www.openssl.org/news/secadv/20210824.txt

Ptest results on qemux86-64 with kvm:
   All tests successful.
   Files=158, Tests=2532, 93 wallclock secs \
     ( 1.31 usr  0.14 sys + 73.43 cusr 12.65 csys = 87.53 CPU)
   Result: PASS
   DURATION: 93

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index e518cb6a02..9ea5c4c81f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -28,7 +28,7 @@ SRC_URI_append_riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
+SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2

