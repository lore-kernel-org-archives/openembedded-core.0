Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eY-0007V9-LB
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916398"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:56 -0700
Message-Id: <0ecde42c563d69a53acbf0d3982fd66ddd1cb249.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 03/18] sysstat: Update to 10.1.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/sysstat/{sysstat_10.1.4.bb => sysstat_10.1.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.4.bb => sysstat_10.1.5.bb} (44%)

diff --git a/meta/recipes-extended/sysstat/sysstat_10.1.4.bb b/meta/recipes-extended/sysstat/sysstat_10.1.5.bb
similarity index 44%
rename from meta/recipes-extended/sysstat/sysstat_10.1.4.bb
rename to meta/recipes-extended/sysstat/sysstat_10.1.5.bb
index d7fe93b..7513fd2 100644
--- a/meta/recipes-extended/sysstat/sysstat_10.1.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_10.1.5.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "0a8e9f69c66fc6737e6645e22eed3275"
-SRC_URI[sha256sum] = "7a39a923dbb4c50752a5b8227f4e76fbfea2b2545bd7faf9c168a5dc8e031dc9"
+SRC_URI[md5sum] = "cdf66d6acd5c8cab709e07980b77ea6b"
+SRC_URI[sha256sum] = "81f1fdcea991f6c4e64a7a65cd9045ec2418be3379d8a80db7dec59bb7b6d3c8"
-- 
1.8.0.2



