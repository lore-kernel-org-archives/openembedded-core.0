Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 335AE783B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 2F8432E6C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id d-lUnNNq1vvx
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:16 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id DBDFA2E1DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C98791E070
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB3411E056
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A65F9DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FDrF1i010385
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FDrFoV010384
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 15:53:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:53:07 +0200
Message-Id: <1130a5ed8e9b7627bdcf82681211a03d4bbd553e.1497534748.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497534748.git.pkj@axis.com>
References: <cover.1497534748.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 05/11] texi2html: Add a dependency on perl
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
X-List-Received-Date: Thu, 15 Jun 2017 13:53:16 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/texi2html/texi2html_5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index ae64816f82..afd125b08f 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -27,3 +27,5 @@ do_install_append () {
 }
 
 FILES_${PN}-doc += "${datadir}/texinfo"
+
+RDEPENDS_${PN} = "perl"
-- 
2.12.0


