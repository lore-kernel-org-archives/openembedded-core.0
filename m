Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63873731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:09:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2016 20:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="1007162944"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2016 20:09:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:09:16 +1200
Message-Id: <2b0cb44041183e9d75f5cb636eb4115686807a21.1467169702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467169702.git.paul.eggleton@linux.intel.com>
References: <cover.1467169702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467169702.git.paul.eggleton@linux.intel.com>
References: <cover.1467169702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] local.conf.sample.extended: drop RPM4 example
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
X-List-Received-Date: Wed, 29 Jun 2016 03:09:44 -0000

We don't have RPM4 support anymore, so there's no point including this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample.extended | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index a95703d..da4820d 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -372,16 +372,6 @@
 #IPK_HIERARCHICAL_FEED = "1"
 #
 
-# Using RPM4
-#
-# Currently the rootfs_rpm code has a hard depends on rpmresolve:do_populate_sysroot,
-# when using rpm4 the rpmresolve code will not compile due to a missing header file.
-# That dependency needs to be removed when using RPM4, also the PREFERRED_VERSION needs
-# to be set. This example shows how to enable rpm4
-# PREFERRED_VERSION_rpm = "4.11.2"
-# PREFERRED_VERSION_rpm-native = "4.11.2"
-# RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"
-
 #
 # Use busybox/mdev for system initialization
 #
-- 
2.5.5


