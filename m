Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UYOtu-0005TZ-2w
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 00:56:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2013 15:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,607,1363158000"; d="scan'208";a="331267700"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.170])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2013 15:38:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 15:38:18 -0700
Message-Id: <1367620698-25780-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1367620698-25780-1-git-send-email-sgw@linux.intel.com>
References: <1367620698-25780-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] packagegroup-core-x11-sato: Add udev-extraconf to maintain compatibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 22:56:39 -0000

Since we have removed udev-extraconf as a RRECOMMENDS in udev
add it back here to maintain compatibility

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index a4413be..a7fee55 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -41,6 +41,7 @@ RDEPENDS_${PN}-base = "\
     shutdown-desktop \
     libsdl \
     ${NETWORK_MANAGER} \
+    udev-extraconf \
     "
 
 # pcmanfm doesn't work on mips
-- 
1.8.0.2



