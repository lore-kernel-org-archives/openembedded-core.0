Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3448577A60
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 12:10:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2017 05:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,483,1498546800"; d="scan'208";a="1011511622"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Sep 2017 05:10:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 18A8358035B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 05:09:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 15:08:23 +0300
Message-Id: <9c7f6c121248284039c4c3cb62cf40cff426fa96.1504699594.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504699594.git.ed.bartosh@linux.intel.com>
References: <cover.1504699594.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/3] bmap-tools: upgrade to v3.4
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
X-List-Received-Date: Wed, 06 Sep 2017 12:10:32 -0000

Upgraded to the latest upstream release.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../bmap-tools/{bmap-tools_3.2.bb => bmap-tools_3.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb => bmap-tools_3.4.bb} (84%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
similarity index 84%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index b8ebe630815..3f75fad44b4 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/01org/bmap-tools.git"
-SRCREV = "96702a869220ab20830db916ec4ac595e1d97f92"
+SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
 
 S = "${WORKDIR}/git"
 
@@ -21,5 +21,5 @@ inherit setuptools
 BBCLASSEXTEND = "native"
 
 do_install_append_class-native() {
-    sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
+    sed -i -e 's|^#!.*/usr/bin/python-native/python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
 }
-- 
2.13.5


