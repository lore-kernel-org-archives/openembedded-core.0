Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA0267FD54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 05:26:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 21:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="374488821"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 20 Jan 2020 21:26:48 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 13:26:46 +0800
Message-Id: <1579584407-14563-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] bash: include patch 8-11
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
X-List-Received-Date: Tue, 21 Jan 2020 05:26:48 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/bash/bash_5.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index eadc822..0c7b234 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -12,6 +12,10 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-008;apply=yes;striplevel=0;name=patch008 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-009;apply=yes;striplevel=0;name=patch009 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-010;apply=yes;striplevel=0;name=patch010 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-011;apply=yes;striplevel=0;name=patch011 \
            file://execute_cmd.patch \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -38,6 +42,14 @@ SRC_URI[patch006.md5sum] = "4a8ee95adb72c3aba03d9e8c9f96ece6"
 SRC_URI[patch006.sha256sum] = "d68529a6ff201b6ff5915318ab12fc16b8a0ebb77fda3308303fcc1e13398420"
 SRC_URI[patch007.md5sum] = "411560d81fde2dc5b17b83c3f3b58c6f"
 SRC_URI[patch007.sha256sum] = "17b41e7ee3673d8887dd25992417a398677533ab8827938aa41fad70df19af9b"
+SRC_URI[patch008.md5sum] = "dd7cf7a784d1838822cad8d419315991"
+SRC_URI[patch008.sha256sum] = "eec64588622a82a5029b2776e218a75a3640bef4953f09d6ee1f4199670ad7e3"
+SRC_URI[patch009.md5sum] = "c1b3e937cd6dccbb7fd772f32812a0da"
+SRC_URI[patch009.sha256sum] = "ed3ca21767303fc3de93934aa524c2e920787c506b601cc40a4897d4b094d903"
+SRC_URI[patch010.md5sum] = "19b41e73b03602d0e261c471b53e670c"
+SRC_URI[patch010.sha256sum] = "d6fbc325f0b5dc54ddbe8ee43020bced8bd589ddffea59d128db14b2e52a8a11"
+SRC_URI[patch011.md5sum] = "414339330a3634137081a97f2c8615a8"
+SRC_URI[patch011.sha256sum] = "2c4de332b91eaf797abbbd6c79709690b5cbd48b12e8dfe748096dbd7bf474ea"
 
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.7.4


