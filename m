Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFz-0003uj-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:22 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:44 -0700
Message-Id: <bbe950b26d267d333a0794fa9d302edb75194449.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 15/30] create-pull-request: alphabetize arguments
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
X-List-Received-Date: Wed, 18 May 2011 22:30:20 -0000

From: Darren Hart <dvhart@linux.intel.com>

Some initial cleanup prior to a significant overhaul.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.3.4



