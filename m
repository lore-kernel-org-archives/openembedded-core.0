Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 277A472FB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:26:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 12:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,346,1491289200"; d="scan'208";a="100919712"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.128.138])
	by orsmga005.jf.intel.com with ESMTP; 15 May 2017 12:26:22 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:26:17 -0500
Message-Id: <1494876377-21309-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] create-pull-request: Fix alternatives case construct syntax
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
X-List-Received-Date: Mon, 15 May 2017 19:26:25 -0000

Each alternative in options case construct must be
sepparated by a double semicolon.
This change adds the double semicolon for the "t)" option.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 scripts/create-pull-request | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 46d6538..aa21612 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -112,6 +112,7 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
 		;;
         t)
                 IN_REPLY_TO="$OPTARG"
+                ;;
 	esac
 done
 
-- 
2.7.4


