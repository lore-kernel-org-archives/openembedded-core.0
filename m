Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D3DD67078F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:01:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2014 12:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="460085525"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2014 12:01:14 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 14:01:10 -0500
Message-Id: <7e2acb41efc8a44331b7849e73c3ca49a8ec5c3d.1406052643.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <3d7c44a6df1f49a78f9d169f337e3041aad9e430.1406052643.git.tom.zanussi@linux.intel.com>
References: <3d7c44a6df1f49a78f9d169f337e3041aad9e430.1406052643.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406052643.git.tom.zanussi@linux.intel.com>
References: <cover.1406052643.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/3] wic: Add help entry for wic kickstart
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
X-List-Received-Date: Tue, 22 Jul 2014 19:01:15 -0000

Previous patches added help for 'wic kickstart' but forgot to add an
entry in the main help page showing its availability.  Add an entry
for it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index a7e7830..848aa9a 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -90,6 +90,7 @@ wic_usage = """
  Help topics:
     overview           wic overview - General overview of wic
     plugins            wic plugins - Overview and API
+    kickstart          wic kickstart - wic kickstart reference
 
  See 'wic help <COMMAND or HELP TOPIC>' for more information on a specific
  command or help topic.
-- 
1.8.3.1


