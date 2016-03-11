Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF386FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 03:11:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 Mar 2016 19:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,318,1455004800"; d="scan'208";a="934391620"
Received: from scheong2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.99])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2016 19:11:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 16:10:57 +1300
Message-Id: <3a8ee645c4f16f9cefbc2e21a868a0c915685a3e.1457665814.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457665814.git.paul.eggleton@linux.intel.com>
References: <cover.1457665814.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457665814.git.paul.eggleton@linux.intel.com>
References: <cover.1457665814.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/buildhistory: record a few more variables for extensible SDK
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
X-List-Received-Date: Fri, 11 Mar 2016 03:11:29 -0000

We've recently added SDK_EXT_TYPE and SDK_RECRDEP_TASKS and these will
have an effect on the size and functionality of the SDK, so record them
in sdk-info.txt.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index fac7fed..0b3b7ce 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -646,7 +646,8 @@ def buildhistory_get_sdkvars(d):
         return ""
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
-        sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL"
+        # Extensible SDK uses some additional variables
+        sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL SDK_EXT_TYPE SDK_RECRDEP_TASKS"
     listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
     return outputvars(sdkvars, listvars, d)
 
-- 
2.5.0


