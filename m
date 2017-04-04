Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6D44F72F4D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 22:20:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 04 Apr 2017 15:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="73618121"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 04 Apr 2017 15:20:01 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 15:22:11 -0700
Message-Id: <9151a715d15043697c8e3e92d387a1b417317c17.1491344268.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1491344268.git.brian.avery@intel.com>
References: <cover.1491344268.git.brian.avery@intel.com>
Subject: [PATCH 2/2] meta-ide-support: exclude this recipe from rm_work
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
X-List-Received-Date: Tue, 04 Apr 2017 22:20:00 -0000

The results of meta-ide-support are used by utilities like runqemu and
runqemu-extract-sdk.  Since the usr/bin that meta-ide-support creates is
subsequently removed bu rm_work, we exclude this recipe from the rm_work
list.

[YOCTO #11119]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/recipes-core/meta/meta-ide-support.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 1c4aded..0692ec8 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
 PR = "r3"
+RM_WORK_EXCLUDE += "${PN}"
 
 inherit meta toolchain-scripts nopackages
 
-- 
1.9.1


