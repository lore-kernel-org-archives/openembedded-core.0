Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQs-0006Ev-69
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219877"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:54:18 -0700
Message-Id: <f2cd2082a7a14115fb2bb95ec58dd0ba536a97fd.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 01:06:59 +0800
Date: Fri, 15 Apr 2011 23:54:17 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 27/58] libpciaccess: upgrade from 0.12.0 to the latest version 0.12.1
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:38 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Upgrade LIC_FILES_CHKSUM due to the only change in the new COPYING:
-Copyright 2007, 2008, 2009 Sun Microsystems, Inc.
+Copyright (c) 2007, 2008, 2009, Oracle and/or its affiliates.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...bpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.0.bb => libpciaccess_0.12.1.bb} (56%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
index d7417a2..b3091fd 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.12.1.bb
@@ -6,11 +6,11 @@ PCI bus and devices in a platform-independant way."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa44c26bc646c6c9d9619c73b94a6e31"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2c765efe1e0722c1badff5e54429b102"
 
 PR = "r0"
 
 DEPENDS += "xproto virtual/libx11"
 
-SRC_URI[md5sum] = "285e07976274572e1f1e68edee09b70a"
-SRC_URI[sha256sum] = "f6b3c00e1c0aab0729563115d3d798e14c9210b4e10fccb484efe1c5eae85657"
+SRC_URI[md5sum] = "d6363ee9f4df79f6fc47cba7c67b0d35"
+SRC_URI[sha256sum] = "cc47d7f0e48cf4eed972916b536fdc97788d7521915e3ae1cc92d540776d7344"
-- 
1.7.1.1



