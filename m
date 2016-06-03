Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D1F4B7750E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440254"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:56 +0300
Message-Id: <2d294bd19f5b1f1384537a065a2dd93f2f05cae3.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/25] iso-codes: update to 3.68
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:28 -0000

License file has been renamed, but still contains LGPLv2.1

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.65.bb => iso-codes_3.68.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.65.bb => iso-codes_3.68.bb} (64%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.65.bb b/meta/recipes-support/iso-codes/iso-codes_3.68.bb
similarity index 64%
rename from meta/recipes-support/iso-codes/iso-codes_3.65.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.68.bb
index 0b78dc4..f8bcc48 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.65.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.68.bb
@@ -1,10 +1,10 @@
 SUMMARY = "ISO language, territory, currency, script codes and their translations"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fbc093901857fcd118f065f900982c24"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "890a08d4f962748e0a0758a8aa471896"
-SRC_URI[sha256sum] = "834de5193c8489eedeaf6509457a9b13476702386ae1f3ed4f391a349d630320"
+SRC_URI[md5sum] = "a5ce7d78b80f6d29150883d892f2e185"
+SRC_URI[sha256sum] = "5881cf7caa5adfffb14ade99138949324c28a277babe8d07dafbff521acef9d1"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.8.1


