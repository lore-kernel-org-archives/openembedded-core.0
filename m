Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A360B77085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 23:51:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2016 15:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,382,1449561600"; d="scan'208";a="874500806"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2016 15:51:55 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon,  1 Feb 2016 15:51:51 -0800
Message-Id: <1454370711-19839-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] populate_sdk_ext: Add SSTATE_MIRRORS to config blacklist
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
X-List-Received-Date: Mon, 01 Feb 2016 23:52:00 -0000

SSTATE_MIRRORS used by the builder may not be the same as what the
installer of the sdk will use. Therefore blacklist SSTATE_MIRRORS from
the builder configuration. Note: the actual SSTATE_MIRRORS for the sdk
can be added using sdk_extra_conf.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a115127..da7fdfb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -19,7 +19,12 @@ SDK_EXT = ""
 SDK_EXT_task-populate-sdk-ext = "-ext"
 
 SDK_LOCAL_CONF_WHITELIST ?= ""
-SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION BB_NUMBER_THREADS PARALLEL_MAKE PRSERV_HOST"
+SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
+                             BB_NUMBER_THREADS \
+                             PARALLEL_MAKE \
+                             PRSERV_HOST \
+                             SSTATE_MIRRORS \
+                            "
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
-- 
2.5.0


