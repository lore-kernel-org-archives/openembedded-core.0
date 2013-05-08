Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5q2-0001e5-6c
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:59:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858603"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:15 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:52 +0300
Message-Id: <1368024119-4149-3-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 2/9] json-glib: updated from 0.15.2 to 0.16.0
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
X-List-Received-Date: Wed, 08 May 2013 15:00:42 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../json-glib/{json-glib_0.15.2.bb => json-glib_0.16.0.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.15.2.bb => json-glib_0.16.0.bb} (79%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.15.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
similarity index 79%
rename from meta/recipes-gnome/json-glib/json-glib_0.15.2.bb
rename to meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
index 2307f76..071d663 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.15.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "494332526f87956d05f32a9b12f3f286"
-SRC_URI[archive.sha256sum] = "f090cd94acc85989e033d72028fa70863d05092ae5bba6b454e70c132b24cdde"
+SRC_URI[archive.md5sum] = "bbca11f32509d6eb3f54d24156e7312d"
+SRC_URI[archive.sha256sum] = "e4a3fd2f399e4c148aad608e6ed0a94095f2ddde9dd12f5aa2f072ecae5c1d37"
 
 inherit gnome gettext
 
-- 
1.7.10.4



