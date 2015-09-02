Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B48E77041
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 22:24:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t82MOKOW021349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Sep 2015 15:24:24 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 2 Sep 2015 15:24:20 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Sep 2015 15:24:20 -0700
Message-ID: <1441232660-3941-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] debianutils: create package for run-parts
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
X-List-Received-Date: Wed, 02 Sep 2015 22:24:26 -0000
Content-Type: text/plain

Also add an RDEPENDS to dpkg so it will still
pull in run-parts.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../debianutils/debianutils_4.5.1.bb               |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.5.1.bb b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
index 9e5dd70..6b665fb 100644
--- a/meta/recipes-support/debianutils/debianutils_4.5.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.5.1.bb
@@ -26,8 +26,17 @@ do_install_append() {
     fi
 }
 
+# Note that we package the update-alternatives name.
+#
+PACKAGES =+ "${PN}-run-parts"
+FILES_${PN}-run-parts = "${base_bindir}/run-parts.debianutils"
+
+RDEPENDS_${PN} += "${PN}-run-parts"
+
+
 ALTERNATIVE_PRIORITY="100"
-ALTERNATIVE_${PN} = "add-shell installkernel remove-shell run-parts savelog tempfile which"
+ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
+ALTERNATIVE_${PN}-run-parts = "run-parts"
 
 ALTERNATIVE_LINK_NAME[add-shell]="${sbindir}/add-shell"
 ALTERNATIVE_LINK_NAME[installkernel]="${sbindir}/installkernel"
-- 
1.7.9.5


