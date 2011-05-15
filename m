Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEm-00068M-Vw
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2011 18:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="747339714"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2011 18:32:26 -0700
Message-Id: <e94432e63282baec832f978aa639da3814d3a94a.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 11:09:39 +0200
Date: Sat, 14 May 2011 18:32:26 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 08/15] glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
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
X-List-Received-Date: Sun, 15 May 2011 01:35:17 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise notes like this are shown:
  NOTE: multiple providers are available for runtime glib-2.0-utils (glib-2.0-nativesdk, glib-2.0)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match glib-2.0-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 83f1990..f015fd3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -18,10 +18,10 @@ require glib-2.0.inc
 DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
-PACKAGES =+ "glib-2.0-utils "
+PACKAGES =+ "${PN}-utils "
 
 LEAD_SONAME = "libglib-2.0.*"
-FILES_glib-2.0-utils = "${bindir}/*"
+FILES_${PN}-utils = "${bindir}/*"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.1.1



