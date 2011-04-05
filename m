Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8Y-0000uG-I5
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2011 14:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="414360851"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2011 14:48:02 -0700
Message-Id: <d58a3bc98caf168b46ec8018e0d3792989eac56b.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Mon, 4 Apr 2011 15:07:12 -0700
Date: Tue, 05 Apr 2011 14:48:02 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 5/6] desktop-file-utils: Add SRC_URI checksums
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:10 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../desktop-file-utils-native_0.15.bb              |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb
index 3ed7475..b971c7e 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.15.bb
@@ -11,3 +11,6 @@ SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-f
 inherit autotools native
 
 S = "${WORKDIR}/desktop-file-utils-${PV}"
+
+SRC_URI[md5sum] = "2fe8ebe222fc33cd4a959415495b7eed"
+SRC_URI[sha256sum] = "c463d851fb057acd53800cfc4f8ae39dcbcad7f03b4bd547288e95b6de53b022" 
-- 
1.7.1



