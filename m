Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn1-0001ej-0q
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720780"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:02 -0800
Message-Id: <7a8588c26ac9ec93d05c8a2102dd000015b3d29a.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 02/26] json-glib: Update to 0.14.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{json-glib_0.14.0.bb => json-glib_0.14.2.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.14.0.bb => json-glib_0.14.2.bb} (78%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
similarity index 78%
rename from meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
index 8635bf0..bdc9dfb 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.14.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "6ba14cc2cc9582250451ff645c20a779"
-SRC_URI[archive.sha256sum] = "efa6a22711c99208feef3bdcd6692573640ac7635725417024980b80990a2966"
+SRC_URI[archive.md5sum] = "5716a181a2b85268f53a1fb0c8024c4a"
+SRC_URI[archive.sha256sum] = "b62cb148ae49d30d8ad807912ba3c7cf189459e2d75233620aae411cf8ea6c04"
 
 inherit gnome gettext
 
-- 
1.7.6.4



