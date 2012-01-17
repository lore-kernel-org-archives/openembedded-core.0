Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006um-GK
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633111"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:41 -0800
Message-Id: <37700fc9253462fc4f3b2d13fc27bb3fde1d0f54.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 56/62] babeltrace: Integrated from version 0.8
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:57 -0000

From: Zumeng Chen <zumeng.chen@windriver.com>

It provides trace read and write libraries, as well as a trace converter.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb |   28 +++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
new file mode 100644
index 0000000..0b4a122
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Babeltrace - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://www.efficios.com/babeltrace/"
+BUGTRACKER = "n/a"
+
+LICENSE = "MIT & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
+
+inherit autotools
+
+DEPENDS = "gtk+ util-linux"
+
+SRCREV = "efc5077568403009493d1d72e94f292838825e51"
+PV = "0.8+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+	${S}/bootstrap
+}
+
+# Due to liburcu not building for MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-- 
1.7.6.5



