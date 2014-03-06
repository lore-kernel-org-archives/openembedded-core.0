Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB7A6F59E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:09:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 09:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="493590062"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2014 09:09:38 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:28 -0600
Message-Id: <dc3a1e7880668e9afa9c9ee3834332dda0f0362c.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394124934.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394124934.git.tom.zanussi@linux.intel.com>
References: <cover.1394124934.git.tom.zanussi@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] lttng-ust: Add version 2.4.0
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
X-List-Received-Date: Thu, 06 Mar 2014 17:09:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tom Zanussi <tom.zanussi@intel.com>

This updates lttng-ust to 2.4.0, codenamed Époque Opaque, needed
for interoperability with lttng-modules and the 3.14 (dev) kernel.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
new file mode 100644
index 0000000..9f806c1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
+DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
+HOMEPAGE = "http://lttng.org/ust"
+BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
+
+LICENSE = "LGPLv2.1+ & BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
+                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+inherit autotools lib_package
+
+DEPENDS = "liburcu util-linux"
+
+# For backwards compatibility after rename
+RPROVIDES_${PN} = "lttng2-ust"
+RREPLACES_${PN} = "lttng2-ust"
+RCONFLICTS_${PN} = "lttng2-ust"
+
+SRCREV = "5ba5bf7fba804d2de773ae1c71106a8ed856c56a"
+PV = "2.4.0"
+PE = "2"
+
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.4 \
+	   "
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend () {
+	( cd ${S}; ${S}/bootstrap )
+}
-- 
1.8.3.1


