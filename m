Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3486D7848A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:05:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 14:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="137891216"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.130])
	by orsmga005.jf.intel.com with ESMTP; 15 Aug 2017 14:05:43 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 16:05:34 -0500
Message-Id: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] packagegroup-python3: add packagegroup
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
X-List-Received-Date: Tue, 15 Aug 2017 21:05:49 -0000

Many of the most usual python3 modules are missing when
trying to import them to python3 in images built with
python3-core installed.

This change creates the python3 packagegroup, containing
the most usual python3 packages to be installed for images
featuring complete python functionality by using the
FEATURES_PACKAGES variable to define python3 as a new feature
and then adding it to the image to build.

[YOCTO #10667]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../packagegroups/packagegroup-python3.bb          | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/packagegroups/packagegroup-python3.bb

diff --git a/meta/recipes-devtools/packagegroups/packagegroup-python3.bb b/meta/recipes-devtools/packagegroups/packagegroup-python3.bb
new file mode 100644
index 0000000..ab83460
--- /dev/null
+++ b/meta/recipes-devtools/packagegroups/packagegroup-python3.bb
@@ -0,0 +1,85 @@
+SUMMARY = "Provides a basic set of python3 packages"
+
+DEPENDS = "python3-native"
+
+PR = "1"
+
+inherit packagegroup
+
+RPROVIDES_${PN} = "python3"
+
+RDEPENDS_${PN} = "\
+    libpython3 \
+    libpython3-staticdev \
+    python3-pyvenv \
+    python3-dbg \
+    python3-2to3 \
+    python3-argparse \
+    python3-asyncio \
+    python3-audio \
+    python3-codecs \
+    python3-compile \
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-ctypes \
+    python3-curses \
+    python3-datetime \
+    python3-db \
+    python3-debugger \
+    python3-dev \
+    python3-difflib \
+    python3-distutils \
+    python3-doctest \
+    python3-email \
+    python3-enum \
+    python3-fcntl \
+    python3-gdbm \
+    python3-html \
+    python3-idle \
+    python3-image \
+    python3-importlib \
+    python3-io \
+    python3-json \
+    python3-lang \
+    python3-logging \
+    python3-mailbox \
+    python3-math \
+    python3-mime \
+    python3-mmap \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-netserver \
+    python3-numbers \
+    python3-pickle \
+    python3-pkgutil \
+    python3-pprint \
+    python3-profile \
+    python3-pydoc \
+    python3-re \
+    python3-readline \
+    python3-reprlib \
+    python3-resource \
+    python3-selectors \
+    python3-shell \
+    python3-signal \
+    python3-smtpd \
+    python3-sqlite3 \
+    python3-sqlite3-tests \
+    python3-stringold \
+    python3-subprocess \
+    python3-syslog \
+    python3-terminal \
+    python3-tests \
+    python3-textutils \
+    python3-threading \
+    python3-tkinter \
+    python3-typing \
+    python3-unittest \
+    python3-unixadmin \
+    python3-xml \
+    python3-xmlrpc \
+    python3-modules \
+    python3-misc \
+    python3-man \
+    "
-- 
2.7.4


