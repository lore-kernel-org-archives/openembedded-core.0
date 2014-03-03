Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6C306F596
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 10:56:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s23AuCVf015597
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 02:56:12 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 02:56:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 18:55:57 +0800
Message-ID: <71c31d0357e2abbd9a7fd3d636f96ea1caff8992.1393839207.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393839207.git.hongxu.jia@windriver.com>
References: <cover.1393839207.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/2] bash: upgrade to 4.3
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
X-List-Received-Date: Mon, 03 Mar 2014 10:56:13 -0000
Content-Type: text/plain

The bash-4.2-patches is obsolete.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../bash/{bash-4.2 => bash}/execute_cmd.patch      |  0
 .../mkbuiltins_have_stringize.patch                |  0
 .../bash/{bash-4.2 => bash}/run-ptest              |  0
 .../bash/{bash-4.2 => bash}/test-output.patch      |  0
 meta/recipes-extended/bash/bash_4.2.bb             | 50 ----------------------
 meta/recipes-extended/bash/bash_4.3.bb             | 18 ++++++++
 6 files changed, 18 insertions(+), 50 deletions(-)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/execute_cmd.patch (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/mkbuiltins_have_stringize.patch (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/run-ptest (100%)
 rename meta/recipes-extended/bash/{bash-4.2 => bash}/test-output.patch (100%)
 delete mode 100644 meta/recipes-extended/bash/bash_4.2.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.3.bb

diff --git a/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch b/meta/recipes-extended/bash/bash/execute_cmd.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
rename to meta/recipes-extended/bash/bash/execute_cmd.patch
diff --git a/meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-4.2/mkbuiltins_have_stringize.patch
rename to meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
similarity index 100%
rename from meta/recipes-extended/bash/bash-4.2/run-ptest
rename to meta/recipes-extended/bash/bash/run-ptest
diff --git a/meta/recipes-extended/bash/bash-4.2/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-4.2/test-output.patch
rename to meta/recipes-extended/bash/bash/test-output.patch
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
deleted file mode 100644
index fefe7b7..0000000
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-PR = "r6"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-004;apply=yes;striplevel=0;name=patch004 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-005;apply=yes;striplevel=0;name=patch005 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-006;apply=yes;striplevel=0;name=patch006 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-007;apply=yes;striplevel=0;name=patch007 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-008;apply=yes;striplevel=0;name=patch008 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=yes;striplevel=0;name=patch009 \
-           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://run-ptest \
-           "
-
-SRC_URI[tarball.md5sum] = "3fb927c7c33022f1c327f14a81c0d4b0"
-SRC_URI[tarball.sha256sum] = "a27a1179ec9c0830c65c6aa5d7dab60f7ce1a2a608618570f96bfa72e95ab3d8"
-SRC_URI[patch001.md5sum] = "1100bc1dda2cdc06ac44d7e5d17864a3"
-SRC_URI[patch001.sha256sum] = "8d6ca028576c4af23e660a2fbc2112221a11c8a785c0b37f033967e5cd12b47a"
-SRC_URI[patch002.md5sum] = "30e7948079921d3261efcc6a40722135"
-SRC_URI[patch002.sha256sum] = "febac927e199aceeba2004908d971d4afb49b521796c3f42d1166f9fbbfbcef9"
-SRC_URI[patch003.md5sum] = "9ea06decec43a198f3d7cf29acc602f8"
-SRC_URI[patch003.sha256sum] = "5a0a7c15018c87348ea87cb0beea14345faf878dbb0e25c17fa70677194cb4cd"
-SRC_URI[patch004.md5sum] = "fb48f6134d7b013135929476aa0c250c"
-SRC_URI[patch004.sha256sum] = "4e34b0f830d2583d56e14225a66937abc81f45bbafcd2eb49daf61c9462140c1"
-SRC_URI[patch005.md5sum] = "e70e45de33426b38153b390be0dbbcd4"
-SRC_URI[patch005.sha256sum] = "a81749e73004b81cfdf0fe075bec365dc1fef756ee5e3fd142821e317d1459a0"
-SRC_URI[patch006.md5sum] = "ce4e5c484993705b27daa151eca242c2"
-SRC_URI[patch006.sha256sum] = "c91148945a2ddafa792682d7c8668c59e7e645eae1334b15b0d5d9ad22634bd1"
-SRC_URI[patch007.md5sum] = "88d1f96db29461767602e2546803bda7"
-SRC_URI[patch007.sha256sum] = "405826acf443dd1084f236a15cb76d7f0ee2dbe5edff45c5fb836db571fb7e95"
-SRC_URI[patch008.md5sum] = "24c574bf6d6a581e300823d9c1276af6"
-SRC_URI[patch008.sha256sum] = "23080d11a60a78941210e2477f6bca066b45db03defa60da86fd765107ba2437"
-SRC_URI[patch009.md5sum] = "4c5835f2fbab36c4292bb334977e5b6d"
-SRC_URI[patch009.sha256sum] = "e7ed5440b4c19765786e90e4f1ded43195d38b3e4d1c4b39fcc23de9a74ccb20"
-SRC_URI[patch010.md5sum] = "0a51602b535ef661ee707be6c8bdb373"
-SRC_URI[patch010.sha256sum] = "acfc5482c25e6923116fcf4b4f7f6345b80f75ad7299749db4b736ad67aa43dc"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
new file mode 100644
index 0000000..25b7410
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -0,0 +1,18 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
+           file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
+           "
+
+SRC_URI[tarball.md5sum] = "81348932d5da294953e15d4814c74dd1"
+SRC_URI[tarball.sha256sum] = "afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.1.2


