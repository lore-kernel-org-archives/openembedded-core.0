Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BC2B26BA1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 05:24:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2013 22:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,965,1367996400"; d="scan'208";a="386929151"
Received: from unknown (HELO localhost) ([10.255.15.83])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2013 22:24:30 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 00:24:29 -0500
Message-Id: <c5b965fbc9d5b94dbe8d4ec2d864e429db5e0e57.1377580874.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1377580874.git.tom.zanussi@linux.intel.com>
References: <cover.1377580874.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] lttng-modules: Update to 2.2.1 based release
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
X-List-Received-Date: Tue, 27 Aug 2013 05:24:49 -0000

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 3a92879..351b0c8 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "1b26381c19dd2d9fa41f52d8dc13b15b8dd32c7c"
-PV = "2.2.0+git${SRCPV}"
+SRCREV = "10fe4e3f10c9ce1f2963bd118b91895a67e955ee"
+PV = "2.2.1+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.7.11.4


