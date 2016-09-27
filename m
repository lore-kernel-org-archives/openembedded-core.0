Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0A37065C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:10:13 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1bowpb-0006a6-O2 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2016 11:10:15 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 27 Sep 2016 11:10:15 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 13:10:08 -0500
Message-ID: <1474999808-27704-3-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474999808-27704-1-git-send-email-nathan_lynch@mentor.com>
References: <1474999808-27704-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl: module-overload needs module-overloading
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
X-List-Received-Date: Tue, 27 Sep 2016 18:10:14 -0000
Content-Type: text/plain

This dependency was manually added in 3dec9ad1cd6a ("perl: module
overload rdpends on overloading") but was (mistakenly?) removed by
06d43a90acbe ("perl: 5.20.0 -> 5.22.0").  Restore it.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
index 5f853cc9115a..2c497fe6ab9f 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
@@ -20,6 +20,7 @@ RDEPENDS_${PN}-pod += "perl"
 RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
 RDEPENDS_${PN}-module-thread-queue += "${PN}-module-attributes"
+RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
 
 
 # Depends list
-- 
2.7.4


