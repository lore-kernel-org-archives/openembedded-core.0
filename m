Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 54C63780A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:08:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="1150897101"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.21.85])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2017 12:08:29 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 20:08:21 +0100
Message-Id: <20170712190821.7396-2-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170712190821.7396-1-joshua.g.lock@intel.com>
References: <20170712190821.7396-1-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] x86-base: build only hddimg, rather than iso and hddimg, for x86 machines
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

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index bfacdf5..a29641a 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
-IMAGE_FSTYPES ?= "live"
+IMAGE_FSTYPES ?= "hddimg"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-- 
2.9.4


