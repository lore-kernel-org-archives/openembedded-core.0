Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A1D117483F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599813"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:07 +0300
Message-Id: <20180404111321.10824-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/22] bash-completion: update to 2.8
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{bash-completion_2.7.bb => bash-completion_2.8.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.7.bb => bash-completion_2.8.bb} (86%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.7.bb b/meta/recipes-support/bash-completion/bash-completion_2.8.bb
similarity index 86%
rename from meta/recipes-support/bash-completion/bash-completion_2.7.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.8.bb
index f519b3f3da4..85064343e30 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.7.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.8.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "28117492bdc9408438e6041683a423ce"
-SRC_URI[sha256sum] = "41ba892d3f427d4a686de32673f35401bc947a7801f684127120cdb13641441e"
+SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
+SRC_URI[sha256sum] = "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
@@ -25,7 +25,7 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in mount umount rfkill; do
+	for i in mount umount; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
 }
-- 
2.16.1


