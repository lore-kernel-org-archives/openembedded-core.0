Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 6BF176EAB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 15:53:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,686,1389740400"; d="scan'208";a="42956046"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 19 Mar 2014 16:53:23 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 19 Mar 2014 16:53:23 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 19 Mar 2014 16:53:23 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 16:46:09 +0100
Message-ID: <1395243969-1148-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [RFC][PATCH] linux-dummy: provide kernel-modules (empty) package
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
X-List-Received-Date: Wed, 19 Mar 2014 15:53:33 -0000
Content-Type: text/plain

Like it is done in kernel.bbclass

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index bab1ac1..5d29f5c 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -1,16 +1,22 @@
-SECTION = "kernel"
 SUMMARY = "Dummy Linux kernel"
 DESCRIPTION = "Dummy Linux kernel, to be selected as the preferred \
 provider for virtual/kernel to satisfy dependencies for situations \
 where you wish to build the kernel externally from the build system."
-LICENSE = "GPLv2"
+SECTION = "kernel"
 
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
 
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
+PACKAGES_DYNAMIC += "^kernel-firmware-.*"
+
+PACKAGES += "kernel-modules"
+FILES_kernel-modules = ""
+ALLOW_EMPTY_kernel-modules = "1"
+DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
 #COMPATIBLE_MACHINE = "your_machine"
 
@@ -20,19 +26,19 @@ SRC_URI = "file://COPYING.GPL"
 S = "${WORKDIR}"
 
 do_configure() {
-        :
+	:
 }
 
 do_compile () {
-        :
+	:
 }
 
 do_install() {
-        :
+	:
 }
 
 do_bundle_initramfs() {
-        :
+	:
 }
 
 do_deploy() {
-- 
1.8.5.4


