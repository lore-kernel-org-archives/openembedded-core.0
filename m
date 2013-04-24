Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47q-0004XJ-KX
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:09:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 10:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632541"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:52 +0100
Message-Id: <5f19a73b9d9bdf017809ccd61fbe17194eb948b7.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 15/21] rgb: add SUMMARY and DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:09:07 -0000

Prevent this getting the default DESCRIPTION of "X application" from
xorg-app-common.inc.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xorg-app/rgb_1.0.5.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb b/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
index 602ee09..26d4f1b 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.0.5.bb
@@ -1,4 +1,11 @@
 require xorg-app-common.inc
+
+SUMMARY = "X11 color name database"
+DESCRIPTION = "This package includes both the list mapping X color names \
+to RGB values (rgb.txt) and, if configured to use a database for color \
+lookup, the rgb program to convert the text file into the binary database \
+format."
+
 DEPENDS += " xproto util-macros"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
 PE = "1"
-- 
1.7.10.4



