Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlY7-0000MD-Nu
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490564"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:20:56 -0800
Message-Id: <7585e8e535230d1c328dd6a4019d4601e5b0bae5.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 03/10] kconfig-frontends: Update to 3.6
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
X-List-Received-Date: Wed, 14 Nov 2012 22:35:13 -0000
X-List-Received-Date: Wed, 14 Nov 2012 22:35:13 -0000
X-List-Received-Date: Wed, 14 Nov 2012 22:35:13 -0000

(From OE-Core rev: 800ec42d0cb3c994ba15c0ce7e4f5a6e312012a4)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...g-frontends_3.5.bb => kconfig-frontends_3.6.bb} |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.5.bb => kconfig-frontends_3.6.bb} (88%)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.6.bb
similarity index 88%
rename from meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
rename to meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.6.bb
index 96899b8..d1fdc0e 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.5.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.6.bb
@@ -11,12 +11,13 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf"
-PR = "r1"
-PV = "3.5.0"
+PR = "r0"
+PV = "3.6.0"
 SPIN = "0"
 SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
-SRC_URI[md5sum] = "0e476b35f321234e0c2bea953461b46f"
-SRC_URI[sha256sum] = "567a556db5dc5f5c63e9d9fc9a45918ce870e3423407715a495e11b67e70b2f2"
+
+SRC_URI[md5sum] = "91ca87abb3c99c3fd40a7babb05ec507"
+SRC_URI[sha256sum] = "3084989a9b146688f318b5524dfb7ab3ba47c9cef355d1aebaa520befdb48da0"
 
 S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
 
-- 
1.7.7.6



