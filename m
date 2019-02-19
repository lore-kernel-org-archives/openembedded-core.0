Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98CBE7C8A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:44:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J1iSNI011313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:44:38 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:44:18 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:53:14 +0800
Message-ID: <33498903f6eecdfd508add01a9ecd8c0997e426b.1550541019.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550541019.git.Qi.Chen@windriver.com>
References: <cover.1550541019.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sudo: upgrade to 1.8.27
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
X-List-Received-Date: Tue, 19 Feb 2019 01:44:47 -0000
Content-Type: text/plain

License-Update: copyright years updated

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                |  2 +-
 .../sudo/{sudo_1.8.26.bb => sudo_1.8.27.bb}        | 25 ++++++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.26.bb => sudo_1.8.27.bb} (66%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 7565503..90f2039 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=45f9838a00199411eb97075c1e6a3102 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=6c76b73603ac7763ab0516ebfbe67b42 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=4a162fc04b86b03f5632180fe6076cda \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.26.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
similarity index 66%
rename from meta/recipes-extended/sudo/sudo_1.8.26.bb
rename to meta/recipes-extended/sudo/sudo_1.8.27.bb
index 7823675..95b2c8d 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.26.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- doc/LICENSE
+# +++ doc/LICENSE
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#  
+# -   Copyright (c) 1994-1996, 1998-2018
+# +   Copyright (c) 1994-1996, 1998-2019
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#  
+#     Permission to use, copy, modify, and distribute this software for any
+# 
+#
+
 require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
@@ -7,8 +28,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "833084947d98e7745b94845f4b7a8a9a"
-SRC_URI[sha256sum] = "40da219a6f0341ccb22d04a98988e27f09b831d2561b14c6154067a49ef3fee2"
+SRC_URI[md5sum] = "b5c184b13b6b5de32af630af2fd013fd"
+SRC_URI[sha256sum] = "7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd33e2ec0"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


