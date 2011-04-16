Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQm-0006EI-3X
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910410728"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:54:12 -0700
Message-Id: <d26f47d616513070db549341576ded2234c65929.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 01:03:33 +0800
Date: Fri, 15 Apr 2011 23:54:12 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 24/58] xproto: upgrade from 7.0.20 to the latest version 7.0.21
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:32 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Update LIC_FILES_CHKSUM as the new COPYING added "Copyright years" and added
a new section of MIT-style license.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{xproto_7.0.20.bb => xproto_7.0.21.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.20.bb => xproto_7.0.21.bb} (57%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.20.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb
similarity index 57%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.20.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb
index dea1667..17b3793 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.20.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.21.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "This package provides the basic headers for the X Window \
 System."
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=93ae8952e7d02d855516fbf2efb9a0d2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
 
 PR = "r0"
 PE = "1"
@@ -14,6 +14,6 @@ PE = "1"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "65633168e5315c19defb4652cd3d83c1"
-SRC_URI[sha256sum] = "3fe87fe47d9b795e60ba3715d71f90f9929d57e9048f1d2a6ebb558e5aee9e2a"
+SRC_URI[md5sum] = "c5a93a69b701cf81925fab02b35b0d0e"
+SRC_URI[sha256sum] = "38ee2f032c3a9e30504593f8b5e6c1161a6629daba93748a71c6f70c16f65548"
 
-- 
1.7.1.1



