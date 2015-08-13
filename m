Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 57C2676597
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 22:44:29 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 00:44:23 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 99B9828BA20;
	Fri, 14 Aug 2015 00:44:23 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Aug 2015 00:44:16 +0200
Message-ID: <1439505856-5672-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] quilt: fix the deps for ptest
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
X-List-Received-Date: Thu, 13 Aug 2015 22:44:32 -0000
Content-Type: text/plain

quilt ptest requires getopt and perl-module-overloading.

[YCOTO #8062]

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index ac7ef93..837b36b 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -57,5 +57,6 @@ do_install_ptest() {
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
-                        perl-module-text-parsewords bash \
-"
+                        perl-module-text-parsewords perl-module-overloading \
+                        bash util-linux-getopt \
+                       "
-- 
1.9.1


