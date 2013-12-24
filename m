Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5A07960E22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 23:47:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2013 15:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,545,1384329600"; d="scan'208";a="457319768"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 24 Dec 2013 15:47:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Dec 2013 15:47:32 -0800
Message-Id: <1387928852-14853-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387928852-14853-1-git-send-email-sgw@linux.intel.com>
References: <1387928852-14853-1-git-send-email-sgw@linux.intel.com>
Subject: [RFC PATCH 2/2] linux-libc-headers: add passwd-initial to ensure the sysroot get populated early
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
X-List-Received-Date: Tue, 24 Dec 2013 23:47:34 -0000

The headers are the first thing that get populated into sysroot, so add the
dependency on passwd-initial here.

[YOCTO #5612]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index f44b61c..a5a14a1 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -68,4 +68,4 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "unifdef-native"
+DEPENDS += "unifdef-native passwd-initial"
-- 
1.8.3.1


