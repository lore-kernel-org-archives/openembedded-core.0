Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhR-0008QH-Hw
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197453"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:12 -0800
Message-Id: <91813c0fbf0b08a2c4e75dd4324d3bcc5cec1701.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/36] mkfontdir: Update to version 1.0.7
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.6.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/mkfontdir_1.0.6.bb
rename to meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
index 3dcbca1..db6d2b4 100644
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
@@ -18,5 +18,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4fcf2b90cadbfc15009b9e124dc3a3f"
 
-SRC_URI[md5sum] = "dc342dd8858416254bb5f71a9ddce589"
-SRC_URI[sha256sum] = "55d56c6310f8d2268cb8978e838d01d27c7d70e30282c373c5a935ab3fb8c859"
+SRC_URI[md5sum] = "18c429148c96c2079edda922a2b67632"
+SRC_URI[sha256sum] = "56d52a482df130484e51fd066d1b6eda7c2c02ddbc91fe6e2be1b9c4e7306530"
-- 
1.7.7.6



