Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 7A3F26D268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 23:43:49 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id DE31D2203CA;
	Thu, 29 Nov 2018 12:43:48 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:43:40 +1300
Message-Id: <20181128234345.19191-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128234345.19191-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128234345.19191-1-douglas.royds@taitradio.com>
Subject: [PATCH v4 3/8] openssl ptest: Strip build host paths from configdata.pm
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
X-List-Received-Date: Wed, 28 Nov 2018 23:43:51 -0000

This file contains CC, CPP, CFLAGS, CXXFLAGS and the like.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 3629f7e6a1..deeb865a6f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -156,6 +156,7 @@ do_install_append_class-nativesdk () {
 	sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
+PTEST_BUILD_HOST_FILES += "configdata.pm"
 do_install_ptest () {
 	# Prune the build tree
 	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-- 
2.17.1


