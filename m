Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnA-0001hN-Gt
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720790"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:08 -0800
Message-Id: <0649eb65a857444bffe8c74302dfe50e39911e37.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 08/26] xprop: Update to 1.2.1
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xprop_1.2.0.bb => xprop_1.2.1.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.0.bb => xprop_1.2.1.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.0.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.0.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
index dc53b98..6c07230 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
@@ -15,5 +15,5 @@ DEPENDS += " libxmu virtual/libx11"
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "e6d0673a1e1e469f0a6220a6868fb94b"
-SRC_URI[sha256sum] = "53508c082b03dbbfd68489cb21392023f3e62ca9c921e1fb39b92ad10fbe6b9c"
+SRC_URI[md5sum] = "d5529dc8d811efabd136ca2d8e857deb"
+SRC_URI[sha256sum] = "07907a189099b8a000406b5ca6c5346df238a9e1fe3b32dc59f48fe0ad12f1a3"
-- 
1.7.6.4



