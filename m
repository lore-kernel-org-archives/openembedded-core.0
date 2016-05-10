Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F0DEB731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 03:07:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 09 May 2016 20:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,603,1455004800"; d="scan'208";a="802704898"
Received: from wlee21-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.133])
	by orsmga003.jf.intel.com with ESMTP; 09 May 2016 20:07:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 15:06:43 +1200
Message-Id: <ed66f9d5d553c47bf3836460d3ecfe08cc81471a.1462849565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462849565.git.paul.eggleton@linux.intel.com>
References: <cover.1462849565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462849565.git.paul.eggleton@linux.intel.com>
References: <cover.1462849565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/populate_sdk_ext: adjust variable blacklisting
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
X-List-Received-Date: Tue, 10 May 2016 03:07:17 -0000

* Blacklist SSTATE_DIR, DL_DIR and TMPDIR by default to avoid problems
  such as the one mentioned in [YOCTO #9605].
* Blacklist BB_NUMBER_PARSE_THREADS since we already blacklist
  BB_NUMBER_THREADS and they may be set separately.

Fixes [YOCTO #9605].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 87518d1..a975d87 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -26,9 +26,13 @@ SDK_RECRDEP_TASKS ?= ""
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
                              BB_NUMBER_THREADS \
+                             BB_NUMBER_PARSE_THREADS \
                              PARALLEL_MAKE \
                              PRSERV_HOST \
                              SSTATE_MIRRORS \
+                             DL_DIR \
+                             SSTATE_DIR \
+                             TMPDIR \
                             "
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
-- 
2.5.5


