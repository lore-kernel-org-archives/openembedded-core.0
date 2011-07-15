Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QhqXT-0006Bz-3T
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:07:15 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FM3CMg018958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:03:13 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 15:03:05 -0700
Message-Id: <d481ce0f7896af7699864f9f5ca4410b2d5e39f0.1310758615.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
Subject: [PATCH 1/5] mercurial-native: Add 1.9 version
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
X-List-Received-Date: Fri, 15 Jul 2011 22:07:15 -0000

This is based on 91c14caa8819b08def8ea99e02949e49604c2e86 from oe.dev
with an update to 1.9.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../mercurial/mercurial-native_1.9.bb              |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/mercurial/mercurial-native_1.9.bb

diff --git a/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
new file mode 100644
index 0000000..b4438a3
--- /dev/null
+++ b/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "python-native"
+PR = "r1"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
+SRC_URI[md5sum] = "d4842129fa2732eb6ed1180467bc32e2"
+SRC_URI[sha256sum] = "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e153edbb3b2f30123e0"
+
+S = "${WORKDIR}/mercurial-${PV}"
+
+inherit native
+
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
+
+do_install () {
+        oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
+}
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.7.0.4



