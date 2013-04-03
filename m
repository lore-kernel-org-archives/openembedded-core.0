Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UNPlc-00035Q-ER
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:38:31 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 3 Apr 2013
	17:21:11 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 98C32288AF7;
	Wed,  3 Apr 2013 17:21:11 +0200 (CEST)
From: <maxin.john@enea.com>
To: <bogdan.a.marinescu@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Wed, 3 Apr 2013 17:20:57 +0200
Message-ID: <1365002457-22392-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org, "Maxin
	B. John" <maxin.john@enea.com>
Subject: [PATCH] lttng: updated lttng-ust to 2.1.2
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
X-List-Received-Date: Wed, 03 Apr 2013 15:38:31 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

lttng-ust: upgrade to the latest version 2.1.2
Also updated HOMEPAGE and BUGTRACKER.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb |   33 --------------------------
 meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb |   33 ++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
deleted file mode 100644
index 782e9db..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
-DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
-HOMEPAGE = "http://lttng.org/lttng2.0"
-BUGTRACKER = "n/a"
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
-SRCREV = "05356aa2a4dca0bc9bfd716d2d6723e3941851dc"
-PV = "2.1.1"
-PR = "r0"
-PE = "2"
-
-SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
-	   file://depends-liblttng-ust-tracepoin.patch \
-	   "
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
new file mode 100644
index 0000000..93852b0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
@@ -0,0 +1,33 @@
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
+SRCREV = "3f7a0876566a432ad2cc2b27a2725641e36da92d"
+PV = "2.1.2"
+PR = "r0"
+PE = "2"
+
+SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
+	   file://depends-liblttng-ust-tracepoin.patch \
+	   "
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+	( cd ${S}; ${S}/bootstrap )
+}
-- 
1.7.5.4



