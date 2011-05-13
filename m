Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1xG-0002tT-9T
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:39:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 May 2011 16:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="642516294"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 16:36:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:36:19 -0700
Message-Id: <f2b71f7e3ede5b5dda0acfad436fc8295621e014.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Subject: [RFC PATCH 01/10] create-pull-request: alphabetize arguments
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
X-List-Received-Date: Fri, 13 May 2011 23:39:34 -0000

Some initial cleanup prior to a significant overhaul.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 5ad7666..225a89a 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -9,14 +9,14 @@ usage() {
 CMD=$(basename $0)
 cat <<EOM
 Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] -b contrib_branch
+  -b contrib_branch   Branch-name in the git.pokylinux.org/poky-contrib tree
   -h                  Display this help message
-  -o output_dir       Specify the output directory for the messages (default: pull-PID)
+  -i commit_id        Ending commit (default: HEAD)
   -m msg_body_file    The file containing a blurb to be inserted into the summary email
+  -o output_dir       Specify the output directory for the messages (default: pull-PID)
+  -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
   -r relative_to      Starting commit (default: master)
-  -i commit_id        Ending commit (default: HEAD)
-  -b contrib_branch   Branch-name in the git.pokylinux.org/poky-contrib tree
   -s subject          The subject to be inserted into the summary email
-  -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
 
  Examples:
    $CMD -b nitin/basic
@@ -27,7 +27,7 @@ EOM
 }
 
 # Parse and validate arguments
-while getopts "b:hi:m:o:r:s:p:" OPT; do
+while getopts "b:hi:m:o:p:r:s:" OPT; do
     case $OPT in
     b)
         CONTRIB_BRANCH="$OPTARG"
-- 
1.7.1



