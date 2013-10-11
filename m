Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B18F46CF15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506403"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:09 -0700
Message-Id: <7cffbd55a9fd290ec9551e2c88485226e2b5eb69.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 03/18] xz: Add nativesdk for Python3 nativesdk dependency
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:28 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/xz/xz_5.1.2alpha.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.1.2alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
index 93099b0..92c3dd9 100644
--- a/meta/recipes-extended/xz/xz_5.1.2alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
@@ -22,4 +22,4 @@ FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir
 FILES_liblzma-staticdev = "${libdir}/liblzma.a"
 FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1


