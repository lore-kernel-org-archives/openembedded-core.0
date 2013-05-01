Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXed5-0001WK-1Q
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:31:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2013 14:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,591,1363158000"; d="scan'208";a="329800301"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 01 May 2013 14:14:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 14:16:31 -0700
Message-Id: <3e08ee882d4f5b07eae09616f4c25468be5c1ccc.1367442991.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] dmidecode: Add dmidecode to dev tools
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
X-List-Received-Date: Wed, 01 May 2013 21:31:59 -0000

Dmidecode reports information about your system's hardware as described
in your system BIOS according to the SMBIOS/DMI standard.

This recipe was updated to version 2.12 and cleaned up slightly from the
OE 2.10 version and proposed here for inclusion in oe-core.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
new file mode 100644
index 0000000..bdddf30
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
+HOMEPAGE = "http://www.nongnu.org/dmidecode/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+PR = "r0"
+
+SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+}
+
+do_unpack_extra() {
+	sed -i -e '/^prefix/s:/usr/local:${exec_prefix}:' Makefile
+}
+addtask unpack_extra after do_unpack before do_patch
+
+SRC_URI[md5sum] = "a406f3cbb27736491698697beeddb781"
+SRC_URI[sha256sum] = "913ff3055d563a62a420789b8ee33b038de9afa18ea61254760ddf8ab87a5088"
-- 
1.7.5.4



