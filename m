Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8EE71B2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:51:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 05:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="1119047708"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.175.125])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2017 05:51:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:50:53 +1200
Message-Id: <20170413125053.18479-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <3542d868bf888db6595c211aaea6b49a398ba509.1492086458.git.paul.eggleton@linux.intel.com>
References: <3542d868bf888db6595c211aaea6b49a398ba509.1492086458.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/3] devtool: extract: drop erroneous bb.event.TaskStarted
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
X-List-Received-Date: Thu, 13 Apr 2017 12:51:05 -0000

This is a non-existent event - we already have the actual
bb.build.TaskSucceeded further down in the list hence why it wasn't
noticed earlier.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c3b65fb..5ff1e23 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -530,7 +530,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
 
         tinfoil.set_event_mask(['bb.event.BuildStarted',
                                 'bb.event.BuildCompleted',
-                                'bb.event.TaskStarted',
                                 'logging.LogRecord',
                                 'bb.command.CommandCompleted',
                                 'bb.command.CommandFailed',
-- 
2.9.3


