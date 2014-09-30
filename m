Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFE6C71710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2014 10:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677688"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:55 -0700
Message-Id: <ecd9f225b218d10013e7e31a73748e1d7f716207.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
Subject: [PATCH 5/5] rootfs_rpm: remove hard depends on rpmresolve - WIP
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
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d85d001..ac17139 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -13,7 +13,6 @@ EXTRANATIVEPATH += "python-native"
 
 # opkg is needed for update-alternatives
 RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
-    rpmresolve-native:do_populate_sysroot \
     python-smartpm-native:do_populate_sysroot \
     createrepo-native:do_populate_sysroot \
     opkg-native:do_populate_sysroot"
-- 
1.8.3.1


