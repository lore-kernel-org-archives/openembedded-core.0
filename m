Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 47F4D60D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:13:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIHD5MO012465 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:13:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LAXCJz8NgfRd
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:13:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIHCxfA012458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:13:01 GMT
Message-ID: <1387386775.6402.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 17:12:55 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] ptest: Disable for native recipes
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
X-List-Received-Date: Wed, 18 Dec 2013 17:13:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We don't use or otherwise care about ptest for native recipes. Its therefore
pointless to take the performance hit for them and we can disable them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 06dddf7..0ffef95 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -7,6 +7,7 @@ FILES_${PN}-ptest = "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
 PTEST_ENABLED = "${@base_contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
+PTEST_ENABLED_class-native = ""
 RDEPENDS_${PN}-ptest_virtclass-native = ""
 RDEPENDS_${PN}-ptest_virtclass-nativesdk = ""
 



