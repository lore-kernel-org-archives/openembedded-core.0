Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8136025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 23:27:33 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 28 Sep 2016 16:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,412,1470726000"; d="scan'208";a="14805254"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga004.jf.intel.com with ESMTP; 28 Sep 2016 16:27:35 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 16:27:34 -0700
Message-Id: <1475105254-15660-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] genericx86-64.conf: Add SERIAL_CONSOLES_CHECK = "ttyS0"
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
X-List-Received-Date: Wed, 28 Sep 2016 23:27:34 -0000

Trying to start getty on a non-existent console will spew I/O errors
into auth.log on some hardware. Avoid this behavior by checking that
ttyS0 is a console that exists.

Fixes [YOCTO #10291].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta-yocto-bsp/conf/machine/genericx86-64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index ceee247..d843fd2 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -8,3 +8,5 @@ require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 PREFERRED_VERSION_linux-yocto_genericx86-64 ?= "4.8%"
+
+SERIAL_CONSOLES_CHECK = "ttyS0"
-- 
2.5.5


