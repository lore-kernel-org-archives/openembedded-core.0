Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 855896BCA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 12:51:46 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VHCYm-0002zW-Nn from Paul_Woegerer@mentor.com ;
	Wed, 04 Sep 2013 05:51:48 -0700
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 4 Sep 2013 05:51:48 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 4 Sep 2013 13:51:46 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:51:45 +0200
Message-ID: <8563861.p8X6iV9RD6@atv-pwoegere-l3.atv.mentorg.com>
Organization: Mentor Graphics, Embedded Software Division
User-Agent: KMail/4.11 (Linux/3.10.10-25.g8038aea-desktop; KDE/4.11.0; x86_64; ;
	)
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Sep 2013 12:51:48.0569 (UTC)
	FILETIME=[84D95C90:01CEA96D]
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] lttng-ust: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 12:51:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

---
 meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb | 31 ----------------------------
 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb | 31 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
deleted file mode 100644
index 103264b..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
-DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
-
-LICENSE = "LGPLv2.1+ & BSD & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
-                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-inherit autotools
-
-DEPENDS = "liburcu util-linux"
-
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "lttng2-ust"
-RREPLACES_${PN} = "lttng2-ust"
-RCONFLICTS_${PN} = "lttng2-ust"
-
-SRCREV = "481d245409b1caef7fc29790e53584eeb7d1d25d"
-PV = "2.2.1"
-PE = "2"
-
-SRC_URI = "git://git.lttng.org/lttng-ust.git \
-	   "
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
new file mode 100644
index 0000000..a3b1920
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
+DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
+HOMEPAGE = "http://lttng.org/ust"
+BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
+
+LICENSE = "LGPLv2.1+ & BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
+                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+inherit autotools
+
+DEPENDS = "liburcu util-linux"
+
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "lttng2-ust"
+RREPLACES_${PN} = "lttng2-ust"
+RCONFLICTS_${PN} = "lttng2-ust"
+
+SRCREV = "9f00ce32b103eed13524c876757b6611c5922382"
+PV = "2.3.0"
+PE = "2"
+
+SRC_URI = "git://git.lttng.org/lttng-ust.git \
+	   "
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+	( cd ${S}; ${S}/bootstrap )
+}
-- 
1.8.4



