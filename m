Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DAE5D731CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id ADF6D2E1D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id RRzabL+KqFVs
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:19 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E84322E1CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D1060160F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D03EC160E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CEBCF1022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4BHRIOw028662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:27:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4BHRIL0028661
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2016 19:27:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 19:27:06 +0200
Message-Id: <734e8f0bd42e7a2fe8f4ca97a2ac6c2137862a35.1462987580.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
In-Reply-To: <cover.1462987580.git.pkj@axis.com>
References: <cover.1462987580.git.pkj@axis.com>
Subject: [PATCH 06/16] shadow-sysroot: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Wed, 11 May 2016 17:27:24 -0000

---
 meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
index 697569c..ef01462 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.2.1.bb
@@ -21,12 +21,10 @@ S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}
-	install -p -m 755 ${S}/login.defs_shadow-sysroot ${D}${sysconfdir}/login.defs
+	install -p -m 644 ${S}/login.defs_shadow-sysroot ${D}${sysconfdir}/login.defs
 }
 
-sysroot_stage_all() {
-	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
-}
+SYSROOT_DIRS += "${sysconfdir}"
 
 # don't create any packages
 # otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot 
-- 
2.1.0


