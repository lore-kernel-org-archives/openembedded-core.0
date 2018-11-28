Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 124A76C5FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:53:24 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 6B4E32204C5;
	Wed, 28 Nov 2018 17:53:24 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:53:12 +1300
Message-Id: <20181128045316.24102-5-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128045316.24102-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
Subject: [PATCH 4/8] openssl: Strip perl version from installed ptest configdata.pm file
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
X-List-Received-Date: Wed, 28 Nov 2018 04:53:25 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index deeb865a6f..042e023de5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -157,6 +157,7 @@ do_install_append_class-nativesdk () {
 }
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
+PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
 	# Prune the build tree
 	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-- 
2.17.1


