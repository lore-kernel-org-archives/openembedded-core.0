Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 446B87723C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 18:23:27 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jan 2017 10:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="57252194"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.128.79])
	by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2017 10:23:27 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:23:02 -0600
Message-Id: <68979356f918f819a41f6ed6bf407fa3a2726a07.1485193773.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1485193773.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1485193773.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [bitbake-selftest][PATCH 2/2] bitbake: selftest: add bb.tests.event to bitbake-selftest
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
X-List-Received-Date: Mon, 23 Jan 2017 18:23:27 -0000

Tests for bitbake event module were created on bb.tests.event.
This change is to include them on the default test list in
bitbake-selftest script.

[YOCTO #10368]

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 bitbake/bin/bitbake-selftest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/bin/bitbake-selftest b/bitbake/bin/bitbake-selftest
index 380e003..afe1603 100755
--- a/bitbake/bin/bitbake-selftest
+++ b/bitbake/bin/bitbake-selftest
@@ -28,6 +28,7 @@ except RuntimeError as exc:
 tests = ["bb.tests.codeparser",
          "bb.tests.cow",
          "bb.tests.data",
+         "bb.tests.event",
          "bb.tests.fetch",
          "bb.tests.parse",
          "bb.tests.utils"]
-- 
2.7.4


