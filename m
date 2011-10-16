Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFLVz-000288-6q
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 09:52:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2011 00:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="63341608"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2011 00:46:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 00:46:07 -0700
Message-Id: <d2a709126af590d46dafc5b777c833b796da9b02.1318751027.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/14] resolvconf: Update to 1.61
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
X-List-Received-Date: Sun, 16 Oct 2011 07:52:11 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/resolvconf_1.61.bb                  |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
new file mode 100644
index 0000000..4d265b6
--- /dev/null
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
@@ -0,0 +1,33 @@
+SUMMARY = "name server information handler"
+DESCRIPTION = "Resolvconf is a framework for keeping track of the system's \
+information about currently available nameservers. It sets \
+itself up as the intermediary between programs that supply \
+nameserver information and programs that need nameserver \
+information."
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+AUTHOR = "Thomas Hood"
+HOMEPAGE = "http://packages.debian.org/resolvconf"
+DEPENDS = "bash"
+RDEPENDS_${PN} = "bash"
+PR = "r0"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
+
+do_compile () {
+	:
+}
+
+do_install () {
+	install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
+	cp -pPR etc/* ${D}${sysconfdir}/
+	chown -R root:root ${D}${sysconfdir}/
+	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0644 README ${D}${docdir}/${P}/
+	install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
+}
+
+PACKAGE_ARCH = "all"
+
-- 
1.7.6.2



