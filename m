Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D9F01771BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 15:25:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2016 08:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,396,1459839600"; d="scan'208";a="992295513"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2016 08:25:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9A2176A4008
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 09:13:12 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 18:26:03 +0300
Message-Id: <1464708363-19038-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] openssl: fix the dangling libcrypto.a symlink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2016 15:25:45 -0000

Update libcrypto.a symlink to the proper location.

[YOCTO #9523]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 3412c66..1a0031e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -195,7 +195,7 @@ do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
 	cp Configure config e_os.h ${D}${PTEST_PATH}
 	cp -r -L include ${D}${PTEST_PATH}
-	ln -sf ${base_libdir}/libcrypto.a ${D}${PTEST_PATH}
+	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
 	ln -sf ${libdir}/libssl.a ${D}${PTEST_PATH}
 	mkdir -p ${D}${PTEST_PATH}/crypto
 	cp crypto/constant_time_locl.h ${D}${PTEST_PATH}/crypto
-- 
2.4.0


