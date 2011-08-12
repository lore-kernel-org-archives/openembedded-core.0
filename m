Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma0-0004dv-GR
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2011 00:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809738"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:10 -0700
Message-Id: <3382bb3c220f6c09fe1bf16fb22bcc4b949e2d23.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/25] meta-rt: rename minimal-rt images to -rt, drop live image
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
X-List-Received-Date: Fri, 12 Aug 2011 07:54:56 -0000

From: Darren Hart <dvhart@linux.intel.com>

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
1.7.3.4



