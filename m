Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RknA7-0002WB-9q
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 02:39:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0B1W5hb016266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:32:05 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 17:32:05 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 09:31:44 +0800
Message-ID: <c8f13a45200c8f7b4b04d0b69b360548db4d63c4.1326244852.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326244852.git.zumeng.chen@windriver.com>
References: <cover.1326244852.git.zumeng.chen@windriver.com>
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
X-List-Received-Date: Wed, 11 Jan 2012 01:39:37 -0000
Content-Type: text/plain

It provides trace read and write libraries, as well as a trace converter.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb |   28 +++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
new file mode 100644
index 0000000..76a76c3
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Babeltrace - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://www.efficios.com/babeltrace/"
+BUGTRACKER = "n/a"
+
+LICENSE = "MIT & GPLV2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
+
+inherit autotools
+
+DEPENDS = "gtk+ util-linux"
+
+SRCREV = "31e670293588d7882a232bc14b93d5e956fa43f4"
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



