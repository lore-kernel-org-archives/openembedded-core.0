Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3F460111
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 02:46:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u192kvEW009930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Feb 2016 18:46:57 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.9) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Feb 2016 18:46:56 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Feb 2016 21:46:50 -0500
Message-ID: <1454986011-17895-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.4.2
MIME-Version: 1.0
Subject: [PATCH 1/2] Remove obsolete references to exmap
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
X-List-Received-Date: Tue, 09 Feb 2016 02:46:58 -0000
Content-Type: text/plain

Exmap was a useful tool but it appears to be unsupported.
Remove it from the sample local.conf and remove the
commented lines from the profile tools packagegroup.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/local.conf.sample                                        | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 11449e8..38ee656 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -108,7 +108,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "eclipse-debug"  - add Eclipse remote debugging support
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
+#  "tools-profile"  - add profiling tools (oprofile, lttng, valgrind)
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
 #  "debug-tweaks"   - make an image suitable for development
 #                     e.g. ssh root access has a blank password
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 80f5933..59d930b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -67,9 +67,6 @@ VALGRIND_mips64n32 = ""
 VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 
-#    exmap-console
-#    exmap-server
-
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
     ${LTTNGUST} \
-- 
2.4.2


