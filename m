Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RmpCt-0006IE-4u
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 17:14:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0GG7DrA020742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 08:07:13 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Jan 2012 08:07:12 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 00:06:52 +0800
Message-ID: <8f7adf2a95ff646afaba649da635642dc614062d.1326729399.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326729399.git.zumeng.chen@windriver.com>
References: <cover.1326729399.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] babeltrace: Integrated from version 0.8
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
X-List-Received-Date: Mon, 16 Jan 2012 16:15:03 -0000
Content-Type: text/plain

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
1.7.5.4



