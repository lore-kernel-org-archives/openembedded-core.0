Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D6783731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 273882E1B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ZQgQD9xqjnDX
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id C1B442E1BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id AA966160B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9E06015EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 9C7E91022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRIOp028646
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRIjB028645
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:02 +0200
Message-Id: <4a255f272f1810f3f7e73415dcfde86f45314e6b.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 02/16] u-boot-fw-utils: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:23 -0000

---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
index dfda5c1..79f1548 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
@@ -40,10 +40,7 @@ do_install_class-cross () {
 	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
 }
 
-SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
-uboot_fw_utils_cross() {
-	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
-}
+SYSROOT_DIRS_append_class-cross = " ${bindir_cross}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 BBCLASSEXTEND = "cross"
-- 
2.1.0


