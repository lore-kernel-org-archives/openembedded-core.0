Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRN-0006H6-0H
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734220157"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:54:28 -0700
Message-Id: <7ff08083e80cec3ae8bbd536aad8b7739f909703.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 16:36:00 +0800
Date: Fri, 15 Apr 2011 23:54:27 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 32/58] xf86-input-vmmouse: upgrade from 12.6.10 to 12.7.0
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:09 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 ...use_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
index 6288507..9535a8f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xf86-input-mouse"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=622841c068a9d7625fbfe7acffb1a8fc"
 
-SRC_URI[md5sum] = "49c6e77851e9f7bc5cb7d85f061992f8"
-SRC_URI[sha256sum] = "a6369d5a860627f2a38842d5563045b263a459e534f6ae08df48f330f9a40910"
+SRC_URI[md5sum] = "dc77181330f983c7d0ec1ea1592c2ca7"
+SRC_URI[sha256sum] = "00e5d527a0d97e6b2a6e8c519e1339427e66fa0a43af026858655c7c62bd9e35"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
1.7.1.1



