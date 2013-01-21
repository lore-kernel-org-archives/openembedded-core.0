Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TxQ7n-0005kO-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 23:46:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2013 14:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,508,1355126400"; d="scan'208";a="276669937"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.40])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2013 14:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 14:30:24 -0800
Message-Id: <1358807424-10570-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] blktrace: fix install issue
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
X-List-Received-Date: Mon, 21 Jan 2013 22:46:06 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 80cb14c..a318f0e 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "libaio"
 
 SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
 
-PR = "r5"
+PR = "r6"
 PV = "1.0.5+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
@@ -20,3 +20,9 @@ EXTRA_OEMAKE = "\
     'LDFLAGS=${LDFLAGS}' \
 "
 PARALLEL_MAKE = ""
+
+do_install() {
+	oe_runmake ARCH="${ARCH}" prefix=${prefix} \
+		mandir=${mandir} DESTDIR=${D} install
+}
+
-- 
1.8.0.2



