Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GDD-0001Jt-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181564"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:45 +0300
Message-Id: <8e17503c17df6c116e846775fd819bbb67b65d04.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED REQUEST 58/64] pigz: Update to upstream version 2.2.5
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Björn Stenberg <bjst@enea.com>

Also added beginline/endline to LIC_FILES_CHKSUM to not track whole pigz.c.

Signed-off-by: Bjorn Stenberg <bjst@enea.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/pigz/pigz_2.2.4.bb |   11 -----------
 meta/recipes-extended/pigz/pigz_2.2.5.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb
 create mode 100644 meta/recipes-extended/pigz/pigz_2.2.5.bb

diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-extended/pigz/pigz_2.2.4.bb
deleted file mode 100644
index 1cb9d08..0000000
--- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require pigz.inc
-
-PR = "r3"
-
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "9df2a3c742524446fa4e797c17e8fd85"
-SRC_URI[sha256sum] = "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31eddc7666c914160e"
-LIC_FILES_CHKSUM = "file://pigz.c;md5=53f47c097bbf11b937a421b1816a8dc5"
diff --git a/meta/recipes-extended/pigz/pigz_2.2.5.bb b/meta/recipes-extended/pigz/pigz_2.2.5.bb
new file mode 100644
index 0000000..76c7c6c
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
@@ -0,0 +1,9 @@
+require pigz.inc
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "188f769ccedc403893d03049ad31e969"
+SRC_URI[sha256sum] = "e37498cbf3a475d7ebe2519751188c29564bf8dd27ba68bd3c7fe1ac08792759"
+LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
-- 
1.7.7.6



