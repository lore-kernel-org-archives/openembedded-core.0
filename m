Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14FD570410
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 09:08:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2014 02:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,630,1400050800"; d="scan'208";a="570468158"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2014 02:08:35 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jul 2014 12:08:50 +0300
Message-Id: <fc1e780d3862d570820104c388a20e2b6d832c89.1404896873.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404896873.git.roxana.ciobanu@intel.com>
References: <cover.1404896873.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1404896873.git.roxana.ciobanu@intel.com>
References: <cover.1404896873.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] image.bbclass: add ROOTFS_POSTPROCESS_COMMAND to rootfs[vardeps]
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
X-List-Received-Date: Wed, 09 Jul 2014 09:08:48 -0000

    Changes to ROOTFS_POSTPROCESS_COMMAND require the rootfs
    for the image to be rebuilt.

    [YOCTO #6502]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a03b880..e088bdb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -75,7 +75,7 @@ LDCONFIGDEPEND_libc-musl = ""
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
-do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
+do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
-- 
1.9.1


