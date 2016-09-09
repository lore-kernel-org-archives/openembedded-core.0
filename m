Return-Path: <brian.avery@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BAFAF771A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 16:23:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 09 Sep 2016 09:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,305,1470726000"; 
   d="scan'208";a="6602296"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga005.jf.intel.com with ESMTP; 09 Sep 2016 09:23:54 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 09:25:16 -0700
Message-Id: <6a196e65f59d0d020d815d9c155eeaabaab4c40a.1473437950.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1473437950.git.brian.avery@intel.com>
References: <cover.1473437950.git.brian.avery@intel.com>
Subject: [PATCH 1/1] testimage: add createrepo-native to testimage depends
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
X-List-Received-Date: Fri, 09 Sep 2016 16:23:53 -0000

The smart tests need createrepo to be in the native sysroot. It needs
to be one of the depends for testimage.

Signed-off-by: bavery <brian.avery@intel.com>
---
 meta/classes/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e42c5ac..263d539 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -67,6 +67,7 @@ TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
-- 
1.9.1


