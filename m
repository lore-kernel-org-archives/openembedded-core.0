Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 065507845A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 14:44:56 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7HEivbl005974
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 16:44:57 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v7HEiur6019895;
	Thu, 17 Aug 2017 16:44:56 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id DEC02213577;
	Thu, 17 Aug 2017 16:44:56 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 16:44:45 +0200
Message-Id: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Thu, 17 Aug 2017 14:44:57 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 9a80f43..771714d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -72,7 +72,7 @@ CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
 # Postinsts don't seem to be run for nativesdk packages when populating SDKs.
 CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
 do_install_append_class-nativesdk () {
-    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
+    SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-certificates
 }
 
 do_install_append_class-native () {
-- 
2.1.4


