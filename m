Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1312B60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 22:58:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2014 15:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,600,1406617200"; 
	d="scan'208,223";a="608776927"
Received: from qana.jf.intel.com ([10.7.198.170])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2014 15:58:54 -0700
Received: by qana.jf.intel.com (Postfix, from userid 1000)
	id 8DD7912611B5; Thu, 25 Sep 2014 16:00:01 -0700 (PDT)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 15:59:56 -0700
Message-Id: <1411685996-3462-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] nss.inc: Fix LICENSE
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
X-List-Received-Date: Thu, 25 Sep 2014 22:59:03 -0000

From reading the COPYING and various license headers, the nss
LICENSE was incorrect. It's actually MPL-2.0 (not 1.1) with a
few different Or instances.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-support/nss/nss.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index d706c43..beb2cae 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -8,7 +8,7 @@ v3 certificates, and other security standards."
 HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
 SECTION = "libs"
 
-LICENSE = "MPL-1.1 GPL-2.0 LGPL-2.1"
+LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
 
 LIC_FILES_CHKSUM = "file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc859"
-- 
1.9.0


