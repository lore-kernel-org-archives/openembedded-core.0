Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 901C978352
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 03:17:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 20:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,336,1505804400"; d="scan'208";a="331471876"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.249.64.52])
	by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2017 20:17:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 16:16:12 +1300
Message-Id: <11083c0d85e4443807e5bd526df47bf97e653672.1509678875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1509678875.git.paul.eggleton@linux.intel.com>
References: <cover.1509678875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] scripts/send-pull-request: allow -C to be used multiple times
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
X-List-Received-Date: Fri, 03 Nov 2017 03:17:04 -0000

Allow -C to be specified multiple times in order to CC multiple people
instead of only taking the last specified value. (You can already use
commas to separate multiple recipients, but it makes sense to support
this usage as well as commas as separators may not be immediately
obvious).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/send-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 883deac..baa907d 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -82,7 +82,7 @@ while getopts "acC:hp:t:" OPT; do
 		GITSOBCC="--signed-off-by-cc"
 		;;
 	C)
-		EXTRA_CC="$OPTARG"
+		EXTRA_CC="$EXTRA_CC,$OPTARG"
 		;;
 	h)
 		usage
-- 
2.9.5


