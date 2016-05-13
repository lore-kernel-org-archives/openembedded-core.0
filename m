Return-Path: <kad@kad.name>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 21A396FF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 11:11:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 04:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,613,1455004800"; d="scan'208";a="805506482"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 13 May 2016 04:11:57 -0700
Received: from akanevsk-mac01.fi.intel.com (akanevsk-mac01.fi.intel.com
	[10.237.66.43])
	by linux.intel.com (Postfix) with ESMTP id 472796A4006;
	Fri, 13 May 2016 04:59:29 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 14:11:45 +0300
Message-Id: <1463137905-96266-1-git-send-email-kad@kad.name>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] image_types: adjust default level of XZ compression
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
X-List-Received-Date: Fri, 13 May 2016 11:12:01 -0000

XZ extreme compression method usually uses a lot more CPU time with not
that often big saving on space. Same goes with -6 level of compression.
Compression level -3 usually the best balance for time/size, especially
on big images.

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f74ae18..6315fc4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -34,7 +34,7 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
-XZ_COMPRESSION_LEVEL ?= "-e -6"
+XZ_COMPRESSION_LEVEL ?= "-3"
 XZ_INTEGRITY_CHECK ?= "crc32"
 XZ_THREADS ?= "-T 0"
 
-- 
2.8.2


