Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C33C678676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 14:20:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7GEKKRl019062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 16 Aug 2017 15:20:21 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dhzBE-0007Q3-Ie; Wed, 16 Aug 2017 15:20:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 15:20:19 +0100
Message-Id: <1502893219-28475-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502893219-28475-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1502893219-28475-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 16 Aug 2017 15:20:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] openssl: Add missing bash/python rdepends for ptest
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
X-List-Received-Date: Wed, 16 Aug 2017 14:20:22 -0000

ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/fuzz/helper.py contained in package openssl-ptest requires /usr/bin/python, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]
ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/test/certs/mkcert.sh contained in package openssl-ptest requires /bin/bash, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
index 8fedab5..711a959 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
@@ -146,7 +146,7 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions"
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
 FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
 
-- 
2.7.4


