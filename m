Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DAA6277228
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893685987"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:36 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:07 +0000
Message-Id: <4df77b79cf9ded923721b47de270b2c43c21cc18.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 03/10] hardlink: add new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 14:52:37 -0000

---
 meta/recipes-extended/hardlink/hardlink_0.3.0.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-extended/hardlink/hardlink_0.3.0.bb

diff --git a/meta/recipes-extended/hardlink/hardlink_0.3.0.bb b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
new file mode 100644
index 0000000..2e06ac2
--- /dev/null
+++ b/meta/recipes-extended/hardlink/hardlink_0.3.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "hardlink is a tool which replaces multiple copies of a file with hardlinks."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://hardlink.c;endline=22;md5=168464a4fc92fa7389c53b0755b39fbb"
+
+SRC_URI = "http://jak-linux.org/projects/hardlink/${BPN}_${PV}.tar.xz"
+SRC_URI[md5sum] = "72f1a460adb6874c151deab766e434ad"
+SRC_URI[sha256sum] = "e8c93dfcb24aeb44a75281ed73757cb862cc63b225d565db1c270af9dbb7300f"
+
+DEPENDS = "libpcre attr"
+
+do_compile () {
+	oe_runmake 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
+}
+
+do_install () {
+	oe_runmake install 'DESTDIR=${D}' 'PREFIX=${prefix}' BINDIR='${bindir}'
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.5.0


