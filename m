Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVWzo-0002m1-7M
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:21:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 15:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81082401"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:14:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:14:53 -0800
Message-Id: <567a6c3b389ab98bb8f1f258c33cdc1afa0a162b.1322608290.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322608290.git.josh@linux.intel.com>
References: <cover.1322608290.git.josh@linux.intel.com>
In-Reply-To: <cover.1322608290.git.josh@linux.intel.com>
References: <cover.1322608290.git.josh@linux.intel.com>
Subject: [PATCH 2/4] json-glib: update to 0.14.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:21:52 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
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
1.7.7.3



