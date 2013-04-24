Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47r-0004XV-5b
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:09:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 10:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632592"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:56 +0100
Message-Id: <cb302265eaa302cf0e5b871bfe8852211a900763.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/21] ptest-runner: add SUMMARY, DESCRIPTION and HOMEPAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 18:09:07 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
index 6b866d4..c7ee595 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_1.0.bb
@@ -1,3 +1,8 @@
+SUMMARY = "A simple shell script to run all installed ptests"
+DESCRIPTION = "The ptest-runner package installs a ptest-runner \
+shell script which loops through all installed ptest test suites and \
+runs them in sequence."
+HOMEPAGE = "https://wiki.yoctoproject.org/wiki/Ptest"
 SRC_URI += "file://ptest-runner"
 
 LICENSE = "MIT"
-- 
1.7.10.4



