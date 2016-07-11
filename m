Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F06796FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642441"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:47 +0300
Message-Id: <1468247633-24172-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/8] bash-completion: update to 2.3
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:51 -0000

Drop files that are no longer present upstream.
Package cmake modules.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{bash-completion_2.1.bb => bash-completion_2.3.bb}      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.1.bb => bash-completion_2.3.bb} (71%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.1.bb b/meta/recipes-support/bash-completion/bash-completion_2.3.bb
similarity index 71%
rename from meta/recipes-support/bash-completion/bash-completion_2.1.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.3.bb
index 4126262..5e6c1d8 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.1.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.3.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SECTION = "console/utils"
 
-SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
-SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
+SRC_URI[md5sum] = "6697dc47adfe70cab5023b7b8186ad57"
+SRC_URI[sha256sum] = "b2e081af317f3da4fff3a332bfdbebeb5514ebc6c2d2a9cf781180acab15e8e9"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
@@ -25,12 +25,9 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su mount umount; do
+	for i in mount umount; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
-
-	# Delete files for networkmanager
-	rm ${D}${datadir}/${BPN}/completions/nmcli
 }
 
 RDEPENDS_${PN} = "bash"
@@ -40,4 +37,6 @@ PACKAGES =+ "${PN}-extra"
 FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
     ${datadir}/${BPN}/helpers/"
 
+FILES_${PN}-dev += "${datadir}/cmake"
+
 BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


