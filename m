Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB627731D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3D70018150
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hN1t6k7WCQJ4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:14 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id B066618154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9B187176C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 99F081769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 95A46104C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4C8cDUX002043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4C8cDY2002042
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2016 10:38:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:37:59 +0200
Message-Id: <64bb2e4864f70a74ebc5594ade577116b1fdf7e3.1463042237.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
Subject: [PATCHv2 12/16] grub2.inc: Use SYSROOT_DIRS_BLACKLIST to exclude dirs from the sysroot
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
X-List-Received-Date: Thu, 12 May 2016 08:38:17 -0000

---
 meta/recipes-bsp/grub/grub2.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 146dde6..dd1ffe2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -63,7 +63,4 @@ do_configure_prepend() {
 
 # grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
 # conflicted, remove it since no one uses it.
-SYSROOT_PREPROCESS_FUNCS_class-target += "remove_sysroot_mkconfig_lib"
-remove_sysroot_mkconfig_lib() {
-    rm -r "${SYSROOT_DESTDIR}${datadir}/grub/grub-mkconfig_lib"
-}
+SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
-- 
2.1.0


