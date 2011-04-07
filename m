Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvZ-0008M4-Ib
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2011 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="906923627"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2011 14:37:38 -0700
Message-Id: <ec1261f4e1837e792ad43f718795433ace3933bc.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 17:57:34 -0700
Date: Thu, 07 Apr 2011 14:37:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 06/11] chkconfig: Update to 1.3.49
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:45 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{chkconfig_1.3.49.bb => chkconfig_1.3.51.bb}   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.49.bb => chkconfig_1.3.51.bb} (83%)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb
similarity index 83%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb
index 83adb14..3f810b6 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb
@@ -15,8 +15,9 @@ DEPENDS = "libnewt popt"
 PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2"
-SRC_URI[md5sum] = "9b5e91d25f4f3b21f4c0bdf55a721431"
-SRC_URI[sha256sum] = "775100a9d6f70fbd8f33ed24b560b6842161fc496c21b1fc6d2aed646f9d855f"
+
+SRC_URI[md5sum] = "0a7e5b271084abf368919b51fd917750"
+SRC_URI[sha256sum] = "bfa83a8f69f5127ab772eee33a48f3c1839efac1a622ab484d2f688264d13929"
 
 inherit autotools gettext
 
-- 
1.7.1



