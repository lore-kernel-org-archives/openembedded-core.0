Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG0-0003ul-DF
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:23 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:45 -0700
Message-Id: <d63da1d695d792339ef4668919b9612df3e3b9c0.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 16/30] create-pull-request: whitespace cleanup
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

Indent with tabs, not spaces, to be consistent with other bash scripts.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/create-pull-request |   78 +++++++++++++++++++++---------------------
 1 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 658b9c2..b911a64 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -29,42 +29,42 @@ EOM
 
 # Parse and validate arguments
 while getopts "b:hi:m:o:p:r:s:" OPT; do
-    case $OPT in
-    b)
-        CONTRIB_BRANCH="$OPTARG"
-        ;;
-    h)
-        usage
-        exit 0
-        ;;
-    i)
-        COMMIT_ID="$OPTARG"
-        ;;
-    m)
-        BODY="$OPTARG"
-        if [ ! -e "$BODY" ]; then
-            echo "ERROR: Body file does not exist"
-            exit 1
-        fi
-        ;;
-    o)
-        ODIR="$OPTARG"
-        ;;
-    p)
-        PREFIX="$OPTARG"
-        ;;
-    r)
-        RELATIVE_TO="$OPTARG"
-        ;;
-    s)
-        SUBJECT="$OPTARG"
-        ;;
-    esac
+	case $OPT in
+	b)
+		CONTRIB_BRANCH="$OPTARG"
+		;;
+	h)
+		usage
+		exit 0
+		;;
+	i)
+		COMMIT_ID="$OPTARG"
+		;;
+	m)
+		BODY="$OPTARG"
+		if [ ! -e "$BODY" ]; then
+			echo "ERROR: Body file does not exist"
+			exit 1
+		fi
+		;;
+	o)
+		ODIR="$OPTARG"
+		;;
+	p)
+		PREFIX="$OPTARG"
+		;;
+	r)
+		RELATIVE_TO="$OPTARG"
+		;;
+	s)
+		SUBJECT="$OPTARG"
+		;;
+	esac
 done
 
 if [ -z "$CONTRIB_BRANCH" ]; then
-    usage
-    exit 1
+	usage
+	exit 1
 fi
 
 
@@ -73,9 +73,9 @@ fi
 WEB_URL="$WEB_URL_PREFIX$CONTRIB_BRANCH"
 wget -q $WEB_URL -O /dev/null
 if [ $? -ne 0 ]; then
-    echo "WARNING: Branch '$CONTRIB_BRANCH' was not found on the contrib git tree."
-    echo "         Please check your contrib-branch parameter before sending."
-    echo ""
+	echo "WARNING: Branch '$CONTRIB_BRANCH' was not found on the contrib git tree."
+	echo "         Please check your contrib-branch parameter before sending."
+	echo ""
 fi
 
 if [ -e $ODIR ]; then
@@ -107,13 +107,13 @@ EOM
 # If the user specified a message body, insert it into the cover letter and
 # remove the BLURB token.
 if [ -n "$BODY" ]; then
-    sed -i "/BLURB HERE/ r $BODY" "$CL"
-    sed -i "/BLURB HERE/ d" "$CL"
+	sed -i "/BLURB HERE/ r $BODY" "$CL"
+	sed -i "/BLURB HERE/ d" "$CL"
 fi
 
 # If the user specified a subject, replace the SUBJECT token with it.
 if [ -n "$SUBJECT" ]; then
-    sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
+	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
 fi
 
 
-- 
1.7.3.4



