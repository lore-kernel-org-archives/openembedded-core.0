Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UaMBs-0005Vh-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:27:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2013 01:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,639,1363158000"; d="scan'208";a="331275913"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2013 01:08:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 11:09:51 +0300
Message-Id: <1368086991-14242-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: upgrade to 2.36.1
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
X-List-Received-Date: Thu, 09 May 2013 08:27:12 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../glib-2.0/{glib-2.0_2.36.0.bb => glib-2.0_2.36.1.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.0.bb => glib-2.0_2.36.1.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb
index a042972..7437004 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "2047dff287473450593edecb18f79c17"
-SRC_URI[sha256sum] = "455a8abe8692c5174bcc7ffa15b96a7521a2f2f9fb47594405927c35cb9bb227"
+SRC_URI[md5sum] = "a3bbee44a13facb5a3cab18be5ece14c"
+SRC_URI[sha256sum] = "7de37586794e92c024feebe5d306bf5f245fef4803c3666af1ae8dac6ee10b24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10.4



