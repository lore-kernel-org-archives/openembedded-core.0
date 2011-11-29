Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn7-0001hN-Gw
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720789"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:07 -0800
Message-Id: <7a7119edcd85837571af6fca07fc52a3fd8a83ea.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 07/26] xkbcomp: Update to 1.2.3
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{xkbcomp_1.2.1.bb => xkbcomp_1.2.3.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.1.bb => xkbcomp_1.2.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
index 0cf334a..d8b3e7a 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
 
 DEPENDS += "libxkbfile"
 
-SRC_URI[md5sum] = "885b4d8a7c8c7afb3312d31934cb3549"
-SRC_URI[sha256sum] = "b7612527914402d091424a93bc16f0d4d8778b4a874171f3f3dc681c690e65eb"
+SRC_URI[md5sum] = "35622a497894c1cff9182d42696c3e27"
+SRC_URI[sha256sum] = "7598e8f44e2643c96d2e37aa44f344f6c48f1a262fc9207154353195b760cb16"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.6.4



