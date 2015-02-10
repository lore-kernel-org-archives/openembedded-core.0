Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C3248601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:57:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2015 09:57:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="525490078"
Received: from rrocha2-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.248.117])
	by orsmga003.jf.intel.com with ESMTP; 10 Feb 2015 09:49:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 09:57:44 -0800
Message-Id: <1423591064-10016-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] lib/oe/lsb.py: Fix up for dash
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
X-List-Received-Date: Tue, 10 Feb 2015 17:58:00 -0000

Remove the leading -e when using dash which does not use -e with echo

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oe/lsb.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index b53f361..50c1d472 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -9,6 +9,7 @@ def release_dict():
 
     data = {}
     for line in output.splitlines():
+        if line.startswith("-e"): line = line[3:]
         try:
             key, value = line.split(":\t", 1)
         except ValueError:
-- 
2.1.0


