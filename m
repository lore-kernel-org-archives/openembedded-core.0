Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrW-0004tp-So
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752331"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:35 -0800
Message-Id: <0edbbd6a2a6046371ae0311898e6066037d9004e.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 109/113] automake: upgrade from 1.11.1 to 1.11.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:47 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/automake/automake.inc        |    1 -
 .../{automake_1.11.1.bb => automake_1.11.2.bb}     |    5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.11.1.bb => automake_1.11.2.bb} (88%)

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 25b0c0e..c259673 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -4,7 +4,6 @@ Standards. Automake requires the use of Autoconf."
 LICENSE = "GPLv2"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
-PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
 
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.2.bb
similarity index 88%
rename from meta/recipes-devtools/automake/automake_1.11.1.bb
rename to meta/recipes-devtools/automake/automake_1.11.2.bb
index 6bffecf..b7d43e8 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
@@ -37,8 +37,9 @@ SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
 	    file://python-libdir.patch"
 
-SRC_URI[md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
-SRC_URI[sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
+PR = "r0"
+SRC_URI[md5sum] = "18194e804d415767bae8f703c963d456"
+SRC_URI[sha256sum] = "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.7.6.4



