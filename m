Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 24F45779C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:08:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="1150897088"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.21.85])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2017 12:08:26 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 20:08:20 +0100
Message-Id: <20170712190821.7396-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 1/2] image_types: remove Hob convenience variable
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
X-List-Received-Date: Wed, 12 Jul 2017 19:08:28 -0000

IMAGE_EXTENSION_live is no longer used. It was used by Hob to map the
live image type, but Hob is no longer part of the Bitbake codebase.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/image_types.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 92e0f2c..d04bb08 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -301,9 +301,6 @@ RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
 DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
 
-# Use IMAGE_EXTENSION_xxx to map image type 'xxx' with real image file extension name(s) for Hob
-IMAGE_EXTENSION_live = "hddimg iso"
-
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
-- 
2.9.4


