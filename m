Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E46CE77233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 21:50:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2017 13:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,260,1477983600"; d="scan'208";a="215837919"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.102.206])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2017 13:50:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 20 Jan 2017 13:50:26 -0800
Message-Id: <1484949027-12097-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2 v2] xserver-xf86-config: add glamoregl
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
X-List-Received-Date: Fri, 20 Jan 2017 21:50:29 -0000

When using the modesetting with glamor and MUSL, the glamoregl
library needs to be pre-loaded, so add it to the list here.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
index 72e4fbf..23fcdc7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -6,4 +6,5 @@ Section "Module"
     Load "int10"
     Load "vbe"
     Load "vgahw"
+    Load "glamoregl"
 EndSection
-- 
2.7.4


