Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E137C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 17:10:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2016 10:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,415,1473145200"; d="scan'208";a="767258851"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Sep 2016 10:10:13 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 20:10:09 +0300
Message-Id: <1475169009-6003-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475169009-6003-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475169009-6003-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] build-perf-test-wrapper.sh: show defaults for '-a' and '-w'
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
X-List-Received-Date: Thu, 29 Sep 2016 17:10:13 -0000

Display default values for '-a' and '-w' command line arguments in the
usage help text.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 90dd545..97e24d8 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -19,6 +19,8 @@
 # oe-build-perf-test and archives the results.
 
 script=`basename $0`
+archive_dir=~/perf-results/archives
+
 usage () {
 cat << EOF
 Usage: $script [-h] [-c COMMITISH] [-C GIT_REPO]
@@ -26,16 +28,16 @@ Usage: $script [-h] [-c COMMITISH] [-C GIT_REPO]
 Optional arguments:
   -h                show this help and exit.
   -a ARCHIVE_DIR    archive results tarball here, give an empty string to
-                    disable tarball archiving
+                    disable tarball archiving (default: $archive_dir)
   -c COMMITISH      test (checkout) this commit
   -C GIT_REPO       commit results into Git
   -w WORK_DIR       work dir for this script
+                    (default: GIT_TOP_DIR/build-perf-test)
 EOF
 }
 
 
 # Parse command line arguments
-archive_dir=~/perf-results/archives
 commitish=""
 while getopts "ha:c:C:w:" opt; do
     case $opt in
-- 
2.6.6


