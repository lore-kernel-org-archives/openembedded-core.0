Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDE7D775FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 02:01:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2A21UO8023859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Mar 2017 18:01:30 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 9 Mar 2017 18:01:29 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Mar 2017 18:01:29 -0800
Message-ID: <1489111289-10519-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] pkgconfig: specify --disable-indirect-deps to configure
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
X-List-Received-Date: Fri, 10 Mar 2017 02:01:29 -0000
Content-Type: text/plain

This preserves the current behaviour because the auto
test by configure will never return yes.  ./libtool is
needed by the test and it will never exist.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 422c5f3..dc44992 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -22,6 +22,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+# Because of a faulty test, the current auto mode always evaluates to no,
+# so just continue that behaviour.
+#
+EXTRA_OECONF += "--disable-indirect-deps"
+
 PACKAGECONFIG ??= "glib"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
-- 
1.7.9.5


