Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QreR1-0005VL-3e
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:13:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="36969611"
Received: from unknown (HELO localhost) ([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2011 16:08:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: bruce.ashfield@windriver.com, tom.zanussi@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 16:08:19 -0700
Message-Id: <d8d741ad0c13336e0736ea4dbeb9b1212c78dea0.1313092152.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1313092152.git.dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
Subject: [PATCH 06/10] meta-rt: rename minimal-rt images to -rt, drop live image
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
X-List-Received-Date: Thu, 11 Aug 2011 23:13:12 -0000

Remove "minimal" from the image recipe names for -rt. Additional recipes types
will be added (-rt-sdk for example) and there is no need to keep so many image
type descriptors.

Drop the -live image as it is now obsolete.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../{core-image-minimal-rt.bb => core-image-rt.bb} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-rt/images/{core-image-minimal-rt.bb => core-image-rt.bb} (78%)

diff --git a/meta-rt/images/core-image-minimal-rt.bb b/meta-rt/images/core-image-rt.bb
similarity index 78%
rename from meta-rt/images/core-image-minimal-rt.bb
rename to meta-rt/images/core-image-rt.bb
index 32a9b92..e11f159 100644
--- a/meta-rt/images/core-image-minimal-rt.bb
+++ b/meta-rt/images/core-image-rt.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2010 Intel Corporation.
 #
 
-DESCRIPTION = "Minimal Real-Time Linux Image"
+DESCRIPTION = "Real-Time Linux Image"
 DEPENDS = "linux-yocto-rt"
 
 require recipes-core/images/core-image-minimal.bb
-- 
1.7.6



