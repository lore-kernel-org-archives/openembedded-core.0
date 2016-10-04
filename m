Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4235F719D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:31:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 04 Oct 2016 02:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="768675560"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 02:31:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 22:31:15 +1300
Message-Id: <141df9b8b5bf6fcb1778a268dff245802817138e.1475573453.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: add: display a warning for deprecated -f/--fetch option
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
X-List-Received-Date: Tue, 04 Oct 2016 09:31:46 -0000

We want to remove the -f/--fetch option at some point (as you can now
specify a URL as a positional argument instead) so display a warning
that it's deprecated if it is used.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c8d7eb1..02ed235 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -74,7 +74,7 @@ def add(args, config, basepath, workspace):
         if args.fetchuri:
             raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
         else:
-            # FIXME should show a warning that -f/--fetch is deprecated here
+            logger.warn('-f/--fetch option is deprecated - you can now simply specify the URL to fetch as a positional argument instead')
             args.fetchuri = args.fetch
 
     if args.recipename:
-- 
2.5.5


