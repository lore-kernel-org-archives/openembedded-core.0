Return-Path: <chee.yang.lee@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Feb 2020 08:08:08 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B1E7960C79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 08:08:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2020 00:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,439,1574150400"; d="scan'208";a="434706314"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2020 00:01:01 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 16:00:59 +0800
Message-Id: <1581667260-55575-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] bash: include patch 12-16
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
X-List-Received-Date: Fri, 14 Feb 2020 08:08:10 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/bash/bash_5.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index 0c7b234..8ff9e6e 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -16,6 +16,11 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-009;apply=yes;striplevel=0;name=patch009 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-010;apply=yes;striplevel=0;name=patch010 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-011;apply=yes;striplevel=0;name=patch011 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-012;apply=yes;striplevel=0;name=patch012 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-013;apply=yes;striplevel=0;name=patch013 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-014;apply=yes;striplevel=0;name=patch014 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-015;apply=yes;striplevel=0;name=patch015 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-016;apply=yes;striplevel=0;name=patch016 \
            file://execute_cmd.patch \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -50,6 +55,16 @@ SRC_URI[patch010.md5sum] = "19b41e73b03602d0e261c471b53e670c"
 SRC_URI[patch010.sha256sum] = "d6fbc325f0b5dc54ddbe8ee43020bced8bd589ddffea59d128db14b2e52a8a11"
 SRC_URI[patch011.md5sum] = "414339330a3634137081a97f2c8615a8"
 SRC_URI[patch011.sha256sum] = "2c4de332b91eaf797abbbd6c79709690b5cbd48b12e8dfe748096dbd7bf474ea"
+SRC_URI[patch012.md5sum] = "1870268f62b907221b078ad109e1fa94"
+SRC_URI[patch012.sha256sum] = "2943ee19688018296f2a04dbfe30b7138b889700efa8ff1c0524af271e0ee233"
+SRC_URI[patch013.md5sum] = "40d923af4b952b01983ed4c889ae2653"
+SRC_URI[patch013.sha256sum] = "f5d7178d8da30799e01b83a0802018d913d6aa972dd2ddad3b927f3f3eb7099a"
+SRC_URI[patch014.md5sum] = "57857b22053c8167677e5e5ac5c6669b"
+SRC_URI[patch014.sha256sum] = "5d6eee6514ee6e22a87bba8d22be0a8621a0ae119246f1c5a9a35db1f72af589"
+SRC_URI[patch015.md5sum] = "c4c6ea23d09a74eaa9385438e48fdf02"
+SRC_URI[patch015.sha256sum] = "a517df2dda93b26d5cbf00effefea93e3a4ccd6652f152f4109170544ebfa05e"
+SRC_URI[patch016.md5sum] = "a682ed6fa2c2e7a7c3ba6bdeada07fb5"
+SRC_URI[patch016.sha256sum] = "ffd1d7a54a99fa7f5b1825e4f7e95d8c8876bc2ca151f150e751d429c650b06d"
 
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.7.4


