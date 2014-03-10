Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A274D6F09E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 11:51:28 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 10 Mar 2014 12:51:27 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id E43FC28208D;
	Mon, 10 Mar 2014 12:51:27 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Mar 2014 12:51:26 +0100
Message-ID: <1394452286-65337-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] ptest: Don't enable ptest for nativesdk and cross-canadian packages
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
X-List-Received-Date: Mon, 10 Mar 2014 11:51:31 -0000
Content-Type: text/plain

The ptest is useful in context of deployment to the target hence
we don't need ptest for nativesdk and cross-canadian packages

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/classes/ptest.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index c37dfac..5c5505d 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -8,6 +8,8 @@ SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
 PTEST_ENABLED = "${@base_contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED_class-native = ""
+PTEST_ENABLED_class-nativesdk = ""
+PTEST_ENABLED_class-cross-canadian = ""
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
 
-- 
1.7.10.4


