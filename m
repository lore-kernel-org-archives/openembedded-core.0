Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1S8w4s-0003r0-PT
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Mar 2012 17:01:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Mar 2012 08:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120138092"
Received: from unknown (HELO localhost) ([10.255.15.231])
	by azsmga001.ch.intel.com with ESMTP; 17 Mar 2012 08:52:57 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2012 10:51:36 -0500
Message-Id: <dc127ecec85a23905fe098a9e9fa2bbb593dca56.1331999294.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1331999294.git.tom.zanussi@intel.com>
References: <cover.1331999294.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] blktrace: update to version 1.0.5
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
X-List-Received-Date: Sat, 17 Mar 2012 16:01:59 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Update blktrace to reflect the newer 1.0.5 tag.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 3439a1f..dbc07c5 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-SRCREV = "0abccbcb5d1a538028ffcb3869d646d29bf5812b"
+SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
 
-PR = "r3"
-PV = "1.0.3+git${SRCPV}"
+PR = "r4"
+PV = "1.0.5+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
            file://blktrace-makefile.patch"
-- 
1.7.0.4



