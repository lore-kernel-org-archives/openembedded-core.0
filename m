Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 87AA96D306
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Oct 2013 07:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="378321886"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by azsmga001.ch.intel.com with ESMTP; 22 Oct 2013 07:24:11 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:23:59 -0500
Message-Id: <56d056343c8362f29e71dcc85e8e41a089f55eb3.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 04/10] wic: Remove dependency on myurlgrab module
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:09 -0000

mylrlgrab is in grabber, which imports rpm.  For current
functionality, we don't need to grab urls or import rpm, so remove the
dependency.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/misc.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 2c4a3ac..95241d7 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -42,7 +42,6 @@ xmlparse = cElementTree.parse
 from mic import msger
 from mic.utils.errors import CreatorError, SquashfsError
 from mic.utils.fs_related import find_binary_path, makedirs
-from mic.utils.grabber import myurlgrab
 from mic.utils.proxy import get_proxy_for
 from mic.utils import runner
 
-- 
1.8.3.1


