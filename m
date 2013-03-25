Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UK6Dw-0003cI-UT
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 13:10:01 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 25 Mar 2013 12:53:02 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 2CEC3289AA0;
	Mon, 25 Mar 2013 12:53:02 +0100 (CET)
From: <maxin.john@enea.com>
To: <radu.moisan@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 25 Mar 2013 12:52:58 +0100
Message-ID: <1364212378-14144-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: anders.roxell@enea.com, "Maxin B. John" <maxin.john@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng: babeltrace: Update to upstream version 1.1.0
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
X-List-Received-Date: Mon, 25 Mar 2013 12:10:01 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Also updated the BUGTRACKER

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.0.3.bb |   23 -----------------------
 meta/recipes-kernel/lttng/babeltrace_1.1.0.bb |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
 create mode 100644 meta/recipes-kernel/lttng/babeltrace_1.1.0.bb

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.0.3.bb b/meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
deleted file mode 100644
index fe1c04f..0000000
--- a/meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Babeltrace - Trace Format Babel Tower"
-DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
-HOMEPAGE = "http://www.efficios.com/babeltrace/"
-BUGTRACKER = "n/a"
-
-LICENSE = "MIT & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
-
-inherit autotools
-
-DEPENDS = "glib-2.0 util-linux popt"
-
-SRCREV = "9eaf25433864cefc40242e0257a0177ef4515930"
-PV = "1.0+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.1.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.1.0.bb
new file mode 100644
index 0000000..dd7e056
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace_1.1.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Babeltrace - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://www.efficios.com/babeltrace/"
+BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
+
+LICENSE = "MIT & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
+
+inherit autotools
+
+DEPENDS = "glib-2.0 util-linux popt"
+
+SRCREV = "c99b1910bea848e8f0ae5641bb63b8f4f84f3ec0"
+PV = "1.1+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+	( cd ${S}; ${S}/bootstrap )
+}
-- 
1.7.5.4



