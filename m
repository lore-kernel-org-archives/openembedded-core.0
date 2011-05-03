Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJb-0001zj-Mk
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 May 2011 16:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="687688521"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 16:45:00 -0700
Message-Id: <77431fcb3305cb8ec93c219c5cc42ce5abc770c3.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 11:27:34 -0700
Date: Tue, 03 May 2011 16:45:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 30/33] libsoup-2.4: Update to 2.34.1
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
X-List-Received-Date: Tue, 03 May 2011 23:47:40 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...libsoup-2.4_2.32.2.bb => libsoup-2.4_2.34.1.bb} |    7 ++++---
 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb  |   11 -----------
 2 files changed, 4 insertions(+), 14 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.32.2.bb => libsoup-2.4_2.34.1.bb} (65%)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb
similarity index 65%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb
index 59b9150..f9e8de5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.32.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb
@@ -10,10 +10,11 @@ PR = "r0"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.32/libsoup-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libsoup/2.34/libsoup-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "846779d898c11f97b5de28a79ea82254"
+SRC_URI[sha256sum] = "a2f846af2c4c08e15eacc9879c8c9be4d85f8105f960f96a9ba3dbabd9ee517b"
 
-SRC_URI[md5sum] = "03f37350a2a31046ebabb8470e75abcc"
-SRC_URI[sha256sum] = "96e6973c8b7459523c0f44e7aec69528ff2fbd388e8ddc415f91bcc42f50777f"
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
deleted file mode 100644
index 9c65331..0000000
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "An HTTP library implementation in C"
-LICENSE = "GPL"
-SECTION = "x11/gnome/libs"
-
-DEPENDS = "glib-2.0 gnutls libxml2"
-
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.4/libsoup-${PV}.tar.bz2"
-S = "${WORKDIR}/libsoup-${PV}"
-
-inherit autotools pkgconfig
-
-- 
1.7.4.1



