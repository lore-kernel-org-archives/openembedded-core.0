Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hg-0005dE-VA
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 15:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="643485550"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 15:26:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:02 -0700
Message-Id: <c93ec77ae2f3de80f66dcf1e641a98e283035cab.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Subject: [RFC PATCH v2 02/15] create-pull-request: whitespace cleanup
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
X-List-Received-Date: Mon, 16 May 2011 22:29:05 -0000

Indent with tabs, not spaces, to be consistent with other bash scripts.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
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
1.7.1



