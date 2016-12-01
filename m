Return-Path: <linus.svensson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB3271B2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8D6C518462
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jksBnR8A0s2C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 70F7218147
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49C071E09E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DD9E1E09C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: from lnxlinussn.se.axis.com (lnxlinussn.se.axis.com [10.94.48.1])
	by seth.se.axis.com (Postfix) with ESMTP id 31540584
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:59 +0100 (CET)
Received: by lnxlinussn.se.axis.com (Postfix, from userid 21014)
	id 200193A099; Thu,  1 Dec 2016 17:23:59 +0100 (CET)
From: linus.svensson@axis.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 17:23:37 +0100
Message-Id: <1480609418-3264-2-git-send-email-linus.svensson@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Thu, 01 Dec 2016 16:29:08 -0000

From: Linus Svensson <linussn@axis.com>

Meson is a build system designed to be fast and as user firendly as
possible. Find out more about meson at mesonbuild.com.

This patch is based on a prototype patch by
Ross Burton <ross.burton@intel.com>.

Signed-off-by: Linus Svensson <linussn@axis.com>
---
 meta/recipes-devtools/meson/meson_0.36.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson_0.36.0.bb

diff --git a/meta/recipes-devtools/meson/meson_0.36.0.bb b/meta/recipes-devtools/meson/meson_0.36.0.bb
new file mode 100644
index 0000000..1ec7e3e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson_0.36.0.bb
@@ -0,0 +1,15 @@
+HOMEPAGE = "http://mesonbuild.com"
+SUMMARY = "A high performance build system"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "dfdd190c5f10a67bb40e6cf93944dd43"
+SRC_URI[sha256sum] = "dc087ec40dacb5e256e6ee6467f2d004faf4ef284d3c1ce5e89faa1e16540950"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "ninja python3-core python3-modules"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


