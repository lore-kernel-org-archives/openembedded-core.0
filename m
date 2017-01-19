Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0178471D99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:37:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2017 12:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="32866545"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2017 12:37:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 09:37:08 +1300
Message-Id: <058274df30e9aa5cd2f4a3e5c0c1c69c707ad17b.1484858212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484858212.git.paul.eggleton@linux.intel.com>
References: <cover.1484858212.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] create-pull-request: fix for OE cgit URL change
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
X-List-Received-Date: Thu, 19 Jan 2017 20:37:14 -0000

The /cgit.cgi/ part is no longer valid in cgit URLs on
git.openembedded.org as of recent infrastructure changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index a88f35a..e82858b 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -168,7 +168,7 @@ case "$REMOTE_URL" in
 		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*git.openembedded.org*)
-		WEB_URL="http://cgit.openembedded.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		WEB_URL="http://cgit.openembedded.org/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
 	*github.com*)
 		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
-- 
2.5.5


