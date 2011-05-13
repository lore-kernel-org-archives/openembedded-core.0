Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1xs-0002ur-Nc
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:40:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 May 2011 16:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; d="scan'208";a="435896252"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2011 16:37:20 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:36:49 -0700
Message-Id: <e251063dc87feecb4dd21fd5c380b3e3cf796f2e.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Subject: [RFC PATCH 02/10] create-pull-request: whitespace cleanup
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
X-List-Received-Date: Fri, 13 May 2011 23:40:13 -0000

Indent with tabs, not spaces, to be consistent with other bash scripts.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |   78 +++++++++++++++++++++---------------------
 1 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 225a89a..b7e015a 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -28,42 +28,42 @@ EOM
 
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
 
 
@@ -72,9 +72,9 @@ fi
 WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$CONTRIB_BRANCH"
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
@@ -106,13 +106,13 @@ EOM
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
1.7.1



