Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 823456FE55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283377"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:08 -0700
Message-Id: <f868f5e95de5e2cf715934a4984ab3856bcb3fa2.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] libbsd: Upgrade to 0.7.0
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

COPYING file changed in year, but no license changes

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libbsd/{libbsd_0.6.0.bb => libbsd_0.7.0.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.6.0.bb => libbsd_0.7.0.bb} (76%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.6.0.bb b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
similarity index 76%
rename from meta/recipes-support/libbsd/libbsd_0.6.0.bb
rename to meta/recipes-support/libbsd/libbsd_0.7.0.bb
index 70926bf..902666d 100644
--- a/meta/recipes-support/libbsd/libbsd_0.6.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.7.0.bb
@@ -9,12 +9,13 @@ DESCRIPTION = "This library provides useful functions commonly found on BSD syst
 
 HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 LICENSE = "BSD-4-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=98a015f07e71239b058398054f506f07"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f1530ea92aeaa1c5e2547cfd43905d8c"
 SECTION = "libs"
 DEPENDS = ""
 
 SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f6c75f0a9818e323a589bcbd560a0eb4"
-SRC_URI[sha256sum] = "9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62"
+
+SRC_URI[md5sum] = "fcceb4e66fd448ca4ed42ba22a8babb0"
+SRC_URI[sha256sum] = "0f3b0e17e5c34c038126e0a04351b11e23c6101a7d0ce3beeab29bb6415c10bb"
 
 inherit autotools pkgconfig
-- 
1.8.3.1


