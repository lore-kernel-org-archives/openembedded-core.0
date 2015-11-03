Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 513C5770A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 20:28:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2015 12:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,239,1444719600"; d="scan'208";a="841830764"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 03 Nov 2015 12:28:41 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 20:27:49 +0000
Message-Id: <1446582469-14531-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] yocto-bsp: Typo on the file extension
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
X-List-Received-Date: Tue, 03 Nov 2015 20:28:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

By mistake, the file was introduced with wrong extension, so changing to the
correct one.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (100%)

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
similarity index 100%
rename from scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
rename to scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
-- 
1.8.4.5


