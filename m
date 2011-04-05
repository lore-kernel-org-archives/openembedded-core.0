Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8k-0000yV-N0
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2011 14:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="729554178"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2011 14:47:59 -0700
Message-Id: <ea33942ad5dd079dd448353f450cd894a599d082.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Tue, 22 Mar 2011 16:55:10 +0800
Date: Tue, 05 Apr 2011 14:47:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 1/6] xdg-utils: add xdg-utils to pass the lsb test
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:22 -0000

From: Kang Kai <kai.kang@windriver.com>

xdg-utils provides xdg-* scripts to pass the LSB 4.1 command check
Import from OE and add DESCRIPTION, PR and LIC_FILES_CHKSUM.

(From OE rev: 44985d56bc556786812a0a02d6219afd31a7381d)

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
new file mode 100644
index 0000000..695e4f3
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Basic desktop integration functions"
+
+DESCRIPTION = "The xdg-utils package is a set of simple scripts that provide basic \
+desktop integration functions for any Free Desktop, such as Linux. \
+They are intended to provide a set of defacto standards. \
+The following scripts are provided at this time: \
+xdg-desktop-icon \     
+xdg-desktop-menu \  
+xdg-email \ 
+xdg-icon-resource \
+xdg-mime \       
+xdg-open \     
+xdg-screensaver \ 
+"
+
+PR="r0"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
+
+SRC_URI = "http://portland.freedesktop.org/download/${PN}-${PV}.tgz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "348a5b91dc66426505022c74a64b2940"
+SRC_URI[sha256sum] = "21aeb7d16b2529b8d3975118f59eec09953e09f9a68d718159e98c90474b01ac"
-- 
1.7.1



