Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGUz-0007bT-5O
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:57:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 15:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81299157"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 15:50:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:50:15 -0800
Message-Id: <f31cc94aa15a1db94d64128ff0e1ba7b1b2fc6a0.1322783370.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
Subject: [PATCH 3/6] sysstat: Update to 10.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2011 23:57:05 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{sysstat_10.0.2.bb => sysstat_10.0.3.bb}       |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.0.2.bb => sysstat_10.0.3.bb} (42%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.2.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
similarity index 42%
rename from meta/recipes-extended/sysstat/sysstat_10.0.2.bb
rename to meta/recipes-extended/sysstat/sysstat_10.0.3.bb
index bd559d8..d445e88 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
@@ -4,7 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 PR = "r0"
 
-
-
-SRC_URI[md5sum] = "0253058fed65e9394c49255821b8803e"
-SRC_URI[sha256sum] = "c89c7baa904f47aa62f3829a90f87509207bfc26ce11c3c4ec415d027ed3f78a"
+SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
+SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
-- 
1.7.6.4



