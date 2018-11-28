Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 2A9736C67D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:13:20 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id A70101C0684;
	Thu, 29 Nov 2018 10:13:21 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:13:15 +1300
Message-Id: <20181128211319.16648-5-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128211319.16648-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128211319.16648-1-douglas.royds@taitradio.com>
Subject: [PATCH v3 4/8] openssl: Strip perl version from installed ptest configdata.pm file
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
X-List-Received-Date: Wed, 28 Nov 2018 21:13:22 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


