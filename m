Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B20777713
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 10B4C18242
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id wwWAVmIr+gOO
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id ACAF21825C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AFE31E07D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 900321E07C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 847D7390
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23Ld55g028262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 22:39:05 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23Ld5nn028261
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 22:39:05 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 22:39:03 +0100
Message-Id: <2cf27987b3ddae7a7996c7e7dc845717fec94170.1488577082.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488577082.git.pkj@axis.com>
References: <cover.1488577082.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv4 6/6] bitbake.conf: Add ${COREBASE}/scripts/blacklisted to ${PATH}
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
X-List-Received-Date: Fri, 03 Mar 2017 21:39:07 -0000

The scripts/blacklisted directory contains dummy tools that blocks out
the corresponding tool from the host installation. It is excpected
that the correct version of the tools are instead built and installed
to the RSS for recipes that need any of these tools.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ade0eff..a6c44d1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -446,7 +446,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
-PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:${COREBASE}/scripts/blacklisted:"
 export PATH
 
 ##################################################################
-- 
2.9.0


