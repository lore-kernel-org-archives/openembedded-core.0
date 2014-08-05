Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EC63960559
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 00:17:46 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2014 17:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,801,1400050800"; d="scan'208";a="464940467"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.151])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2014 17:17:38 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 17:16:11 -0700
Message-Id: <1407197771-18736-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Matt Fleming <matt.fleming@intel.com>,
	"Glenn P. Williamson" <glenn.p.williamson@intel.com>
Subject: [PATCH] kexec-tools: Create separate package for vmcore-dmesg
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
X-List-Received-Date: Tue, 05 Aug 2014 00:17:53 -0000

The kexec-tools recipe already specifies separate packages for kexec and
kdump. Thus, it follows that a separate package can also be used to install
vmcore-dmesg granularly.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
index a5c1ced..1bb7e9f 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
@@ -7,7 +7,8 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
 SRC_URI[md5sum] = "2309ba43981cb6d39d07ac3a9aac30ab"
 SRC_URI[sha256sum] = "dde5c38be39882c6c91f0129647349c4e1943b077d3020af1970b481ee954eb0"
 
-PACKAGES =+ "kexec kdump"
+PACKAGES =+ "kexec kdump vmcore-dmesg"
 
 FILES_kexec = "${sbindir}/kexec"
 FILES_kdump = "${sbindir}/kdump"
+FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
-- 
1.9.1


