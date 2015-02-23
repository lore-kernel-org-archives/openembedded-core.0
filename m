Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 730E7706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537433"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:42 +0000
Message-Id: <4e0dee8f4d0a2a759879917536b75ebe20bad08a.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] scripts/oe-buildenv-internal: add means of skipping SDK check during setup
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:55 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

The oe-buildenv-internal script checks if the user is already in an sdk
environment and errors if true. Add a way to skip this check.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index bba6f8f..9ed2721 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -24,7 +24,7 @@ if [ -z "$OEROOT" ]; then
     return 1
 fi
 
-if [ ! -z "$OECORE_SDK_VERSION" ]; then
+if [ -z "$OE_SKIP_SDK_CHECK" -a ! -z "$OECORE_SDK_VERSION" ]; then
     echo >&2 "Error: The OE SDK/ADT was detected as already being present in this shell environment. Please use a clean shell when sourcing this environment script."
     return 1
 fi
-- 
1.9.3


