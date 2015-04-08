Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDFAB6E268
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 06:16:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t386GJ2R004251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 23:16:19 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Apr 2015 23:16:18 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 14:08:47 +0800
Message-ID: <1428473327-5500-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: module overload rdpends on overloading
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
X-List-Received-Date: Wed, 08 Apr 2015 06:16:18 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix perl runtime issue:

* Can't locate overloading.pm in @INC (you may need to install the
overloading module ...) at /usr/lib64/perl/5.20.0/overload.pm line 83.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
index 041471a..e39663c 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.20.0.inc
@@ -1841,6 +1841,7 @@ RDEPENDS_${PN}-module-overloading += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-overload += "${PN}-module-mro"
 RDEPENDS_${PN}-module-overload += "${PN}-module-scalar-util"
 RDEPENDS_${PN}-module-overload += "${PN}-module-warnings-register"
+RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
 RDEPENDS_${PN}-module-package-constants += "${PN}-module-if"
 RDEPENDS_${PN}-module-package-constants += "${PN}-module-strict"
 RDEPENDS_${PN}-module-package-constants += "${PN}-module-vars"
-- 
1.9.1


