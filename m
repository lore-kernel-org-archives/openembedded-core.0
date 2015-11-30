Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 701896011D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 13:42:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2015 05:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,364,1444719600"; d="scan'208";a="609938511"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2015 05:42:00 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AC6246A4005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:40:50 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 10:53:57 +0200
Message-Id: <1448873637-23617-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] kexec: update supported architecture list
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
X-List-Received-Date: Mon, 30 Nov 2015 13:42:27 -0000

Now, kexec is supported in mips, aarch64 and most of the machines within
powerpc family. So, remove those architecture specific restrictions.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 95b3988..acbae11 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -11,13 +11,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# kexec-tools doesn't work on Mips
+# kexec-tools doesn't work on e5500-64b yet
 KEXECTOOLS ?= "kexec"
-KEXECTOOLS_mips ?= ""
-KEXECTOOLS_mipsel ?= ""
-KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
-KEXECTOOLS_aarch64 ?= ""
 
 X11GLTOOLS = "\
     mesa-demos \
-- 
2.4.0


