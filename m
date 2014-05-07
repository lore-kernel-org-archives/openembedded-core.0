Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C75F360781
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 06:28:54 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Wed, 7 May 2014
	08:28:49 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id EBACB28C882;
	Wed,  7 May 2014 08:28:49 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 May 2014 08:28:47 +0200
Message-ID: <1399444127-6075-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] perl: update ptest package dependency list
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
X-List-Received-Date: Wed, 07 May 2014 06:28:58 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Add "sed" in the ptest runtime package dependency list

[YOCTO #6260]

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 9ef7d0a..b1f1cb9 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -47,4 +47,4 @@ python populate_packages_prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc"
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed"
-- 
1.7.10.4


