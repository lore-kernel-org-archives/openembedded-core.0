Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34DC37017B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:23:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2016 14:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,569,1455004800"; d="scan'208";a="944713031"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2016 14:23:17 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:19:16 +0000
Message-Id: <b8fd2a2bad566a5514f2812aa80db029c67dba22.1462194553.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/6] oeqa/runexported.py: Remove host dumper
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
X-List-Received-Date: Mon, 02 May 2016 21:23:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The host dumper is used to get information about the host
running the test when a test fails. This is used for the
autobuilders of Yocto Project.

Now that exported tests have thier own class the host dumper
is not necessary anymore.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runexported.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index cc89e13..f333879 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -116,16 +116,11 @@ def main():
     for key in loaded["target"].keys():
         setattr(target, key, loaded["target"][key])
 
-    host_dumper = get_host_dumper(d)
-    host_dumper.parent_dir = loaded["host_dumper"]["parent_dir"]
-    host_dumper.cmds = loaded["host_dumper"]["cmds"]
-
     target.exportStart()
     tc = ExportTestContext(d)
 
     setattr(tc, "d", d)
     setattr(tc, "target", target)
-    setattr(tc, "host_dumper", host_dumper)
     for key in loaded.keys():
         if key != "d" and key != "target" and key != "host_dumper":
             setattr(tc, key, loaded[key])
-- 
2.6.6


