Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9EF73172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:20:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="846866829"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 15 Jul 2016 05:20:11 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:20:03 +0300
Message-Id: <9d976515b9bce3c1e2c828d109d40d6cb98b4a30.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
References: <2ff7f7848e6bb8353b2de9012edbf6aa6eb84394.1468584725.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468584725.git.jussi.kukkonen@intel.com>
References: <cover.1468584725.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/5] matchbox-keyboard: Upgrade to 0.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 12:20:37 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{matchbox-keyboard_git.bb => matchbox-keyboard_0.1.1.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/matchbox-keyboard/{matchbox-keyboard_git.bb => matchbox-keyboard_0.1.1.bb} (96%)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
similarity index 96%
rename from meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
rename to meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index c7870cf..465f134 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "libfakekey expat libxft"
 
-SRCREV = "69d03e2aceb79cf7a616c07f8e0be4e1f9f7976b"
-PV = "0.0+git${SRCPV}"
-
+#SRCREV for 0.1.1
+SRCREV = "630d89068dc0a1e9199306d405cb32f892dfa4d3"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
-- 
2.1.4


