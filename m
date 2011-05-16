Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hp-0005gt-FC
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124185"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:10 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:01 -0700
Message-Id: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Subject: [RFC PATCH v2 01/15] create-pull-request: alphabetize arguments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 22:29:14 -0000

Some initial cleanup prior to a significant overhaul.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 784b48c..658b9c2 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -10,14 +10,14 @@ usage() {
 CMD=$(basename $0)
 cat <<EOM
 Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -b contrib_branch
+  -b contrib_branch   Branch-name in the $PULL_URL
   -h                  Display this help message
-  -o output_dir       Specify the output directory for the messages (default: pull-PID)
+  -i commit_id        Ending commit (default: HEAD)
   -m msg_body_file    The file containing a blurb to be inserted into the summary email
+  -o output_dir       Specify the output directory for the messages (default: pull-PID)
+  -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
   -r relative_to      Starting commit (default: master)
-  -i commit_id        Ending commit (default: HEAD)
-  -b contrib_branch   Branch-name in the $PULL_URL
   -s subject          The subject to be inserted into the summary email
-  -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
 
  Examples:
    $CMD -b nitin/basic
@@ -28,7 +28,7 @@ EOM
 }
 
 # Parse and validate arguments
-while getopts "b:hi:m:o:r:s:p:" OPT; do
+while getopts "b:hi:m:o:p:r:s:" OPT; do
     case $OPT in
     b)
         CONTRIB_BRANCH="$OPTARG"
-- 
1.7.1



