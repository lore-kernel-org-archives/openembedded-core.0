Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4w0K-0005D7-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:41:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 08:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190888392"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 08:28:19 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 17:33:06 +0300
Message-Id: <22322a4c60a2d659715613754b3e98b4de44b877.1345818232.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
Subject: [PATCH 3/4] kconfig-frontends: upgrade to 3.5
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
X-List-Received-Date: Fri, 24 Aug 2012 15:41:01 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...g-frontends_3.4.bb => kconfig-frontends_3.5.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.4.bb => kconfig-frontends_3.5.bb} (88%)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
similarity index 88%
rename from meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
rename to meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
index 9abfa75..277de03 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf"
 PR = "r0"
-PV = "3.4.0"
+PV = "3.5.0"
 SPIN = "0"
 SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
-SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
-SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
+SRC_URI[md5sum] = "0e476b35f321234e0c2bea953461b46f"
+SRC_URI[sha256sum] = "567a556db5dc5f5c63e9d9fc9a45918ce870e3423407715a495e11b67e70b2f2"
 
 S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
 
-- 
1.7.9.5



