Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42215731CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 22:25:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 14:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,296,1449561600"; d="scan'208";a="881619308"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 14:25:24 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: poky@yoctoproject.org
Date: Thu, 14 Jan 2016 16:27:04 -0600
Message-Id: <bae3519051fc355e6fdd7dc49eb80a100b56e1d2.1452808373.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org,
	georgex.l.musat@intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 3/3] Update dev-manual to point to the new ptest-runner2.
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
X-List-Received-Date: Thu, 14 Jan 2016 22:25:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index dbf493a..767f51c 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -7488,8 +7488,8 @@
                 <title>Running ptest</title>
 
                 <para>
-                    The <filename>ptest-runner</filename> package installs a
-                    shell script that loops through all installed ptest test
+                    The <filename>ptest-runner2</filename> package installs a
+                    program that loops through all installed ptest test
                     suites and runs them in sequence.
                     Consequently, you might want to add this package to
                     your image.
-- 
2.1.4


