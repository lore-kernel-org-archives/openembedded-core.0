Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7P-00084L-AV
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453922"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:58 -0700
Message-Id: <435f8bf05aca3c97e21f0231b692d3251b98db30.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/19] libsoup-2.4: upgrade to 2.38.1
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:55 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* newer webkit-efl needs 2.37.4 or newer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb => libsoup-2.4_2.38.1.bb} (55%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
similarity index 55%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
index 8e6ef26..c04918e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.38.1.bb
@@ -6,14 +6,14 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
-PR = "r1"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.36/libsoup-${PV}.tar.bz2"
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9c03fc033da61deaf5b403e9e9c884b8"
-SRC_URI[sha256sum] = "c387eefd8214c458965b1d6e3490cea33b5bb6c81798cac90cde96136dc19401"
+SRC_URI[md5sum] = "d13fb4968acea24c26b83268a308f580"
+SRC_URI[sha256sum] = "71b8923fc7a5fef9abc5420f7f3d666fdb589f43a8c50892d584d58b3c513f9a"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.7.6



