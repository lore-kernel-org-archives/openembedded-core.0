Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 23B3D6BEFC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 12:51:51 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VHCYr-0002zz-B9 from Paul_Woegerer@mentor.com ;
	Wed, 04 Sep 2013 05:51:53 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 4 Sep 2013 05:51:53 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 4 Sep 2013 13:51:51 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:51:50 +0200
Message-ID: <1418088.Z3YHl7McGj@atv-pwoegere-l3.atv.mentorg.com>
Organization: Mentor Graphics, Embedded Software Division
User-Agent: KMail/4.11 (Linux/3.10.10-25.g8038aea-desktop; KDE/4.11.0; x86_64; ;
	)
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Sep 2013 12:51:53.0318 (UTC)
	FILETIME=[87AE0060:01CEA96D]
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] lttng-tools: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 12:51:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

---
 meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb | 31 --------------------------
 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb | 31 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
deleted file mode 100644
index 316f488..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SECTION = "devel"
-SUMMARY = "Linux Trace Toolkit Control"
-DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
-to extract program execution details from the Linux operating system \
-and interpret them."
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
-                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
-
-DEPENDS = "liburcu popt lttng-ust"
-
-SRCREV = "b1ebf16ce065a35149c39bc4f56ace3671706860"
-PV = "v2.2.3"
-
-SRC_URI = "git://git.lttng.org/lttng-tools.git"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-export KERNELDIR="${STAGING_KERNEL_DIR}"
-
-FILES_${PN} += "${libdir}/lttng/libexec/*"
-FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
-
-# Since files are installed into ${libdir}/lttng/libexec we match 
-# the libexec insane test so skip it.
-INSANE_SKIP_${PN} = "libexec"
-INSANE_SKIP_${PN}-dbg = "libexec"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
new file mode 100644
index 0000000..2e0ee15
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
@@ -0,0 +1,31 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit Control"
+DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
+to extract program execution details from the Linux operating system \
+and interpret them."
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
+                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+
+DEPENDS = "liburcu popt lttng-ust"
+
+SRCREV = "c9dc1289e040c542f96fbfd558267786816d5703"
+PV = "v2.3.0"
+
+SRC_URI = "git://git.lttng.org/lttng-tools.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+export KERNELDIR="${STAGING_KERNEL_DIR}"
+
+FILES_${PN} += "${libdir}/lttng/libexec/*"
+FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
+
+# Since files are installed into ${libdir}/lttng/libexec we match 
+# the libexec insane test so skip it.
+INSANE_SKIP_${PN} = "libexec"
+INSANE_SKIP_${PN}-dbg = "libexec"
-- 
1.8.4



