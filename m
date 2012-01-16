Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RmpCt-0006D9-4Y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 17:14:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0GG7AML013477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 08:07:10 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Jan 2012 08:07:09 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 00:06:49 +0800
Message-ID: <5bcdb396eb0f70de8dde135d598552b0fddcd676.1326729399.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326729399.git.zumeng.chen@windriver.com>
References: <cover.1326729399.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] lttng-ust: Update to 2.0
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

This patch intended to integrate the LTTng UST 2.0 package, which
contains the userspace tracer library to trace userspace codes.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb |   30 ++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
new file mode 100644
index 0000000..87d866e
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
+DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
+HOMEPAGE = "http://lttng.org/lttng2.0"
+BUGTRACKER = "n/a"
+
+LICENSE = "LGPLv2.1+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
+                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+inherit autotools
+
+DEPENDS = "liburcu util-linux"
+
+SRCREV = "eeee05f35f014a8c068e0d29b18629cafbfdfc1d"
+PV = "1.9.4+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
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



