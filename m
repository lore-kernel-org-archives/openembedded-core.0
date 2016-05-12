Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF10700F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 27A9018092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id xc8lE3bpa+4L
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 860E31814E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6CDA0176C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 6B8421774
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 69DE210E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4C8cDV7002024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4C8cDDB002023
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2016 10:38:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:37:55 +0200
Message-Id: <b1ff5b24caad2a72e1ddb7fa9c45f1b680332b8a.1463042237.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
Subject: [PATCHv2 08/16] base-files: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 12 May 2016 08:38:19 -0000

---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d391707..5333110 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -165,9 +165,7 @@ do_install_append_linuxstdbase() {
         done
 }
 
-sysroot_stage_all_append () {
-	sysroot_stage_dir ${D}${sysconfdir}/skel ${SYSROOT_DESTDIR}${sysconfdir}/skel
-}
+SYSROOT_DIRS += "${sysconfdir}/skel"
 
 PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
 FILES_${PN} = "/"
@@ -177,4 +175,3 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]} ${sysconfdir}/shells"
 CONFFILES_${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
-
-- 
2.1.0


