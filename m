Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6A67017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 857DC1811A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MFPyGLRd52dW
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 1517B1812E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F32A714E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id E7AAF145E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id E65D0106C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhDX9014454
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhDQp014451
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:08 +0100
Message-Id: <4a6a01609f606577256c399a91554cccf745fa3b.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
Subject: [PATCH 3/6] oe-init-build-env*: Remove unnecessary differences between the scripts
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:18 -0000

While at it, also fix:
* consistent indentation (four spaces)
* unset temporary variables
* use $(...) instead of `...`

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 oe-init-build-env        | 21 ++++++++++-----------
 oe-init-build-env-memres | 30 +++++++++++++++---------------
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index baab827..53873e6 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -33,12 +33,12 @@ else
     THIS_SCRIPT="$(pwd)/oe-init-build-env"
 fi
 if [ -n "$BBSERVER" ]; then
-   unset BBSERVER
+    unset BBSERVER
 fi
 
 if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
-   echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
-   exit 1
+    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
+    exit 1
 fi
 
 if [ -z "$OEROOT" ]; then
@@ -47,16 +47,15 @@ if [ -z "$OEROOT" ]; then
 fi
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
-     TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
-     [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
+    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
+    [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
 unset THIS_SCRIPT OEROOT BBPATH
 
 # Shutdown any bitbake server if the BBSERVER variable is not set
-if [ -z "$BBSERVER" ] && [ -f bitbake.lock ] ; then
-    grep ":" bitbake.lock > /dev/null && BBSERVER=`cat bitbake.lock` bitbake --status-only
-    if [ $? = 0 ] ; then
-	echo "Shutting down bitbake memory resident server with bitbake -m"
-	BBSERVER=`cat bitbake.lock` bitbake -m
+if [ -z "$BBSERVER" ] && [ -f bitbake.lock ]; then
+    grep ":" bitbake.lock > /dev/null && BBSERVER=$(cat bitbake.lock) bitbake --status-only
+    if [ $? = 0 ]; then
+        echo "Shutting down bitbake memory resident server with bitbake -m"
+        BBSERVER=$(cat bitbake.lock) bitbake -m
     fi
 fi
-
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index b0c7421..08d255c 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -41,12 +41,12 @@ else
     THIS_SCRIPT="$(pwd)/oe-init-build-env"
 fi
 if [ -n "$BBSERVER" ]; then
-  unset BBSERVER
+    unset BBSERVER
 fi
 
-if [ -z "$ZSH_NAME" ] && [ "x$0" = "x$THIS_SCRIPT" ]; then
-   echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
-   exit 1
+if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
+    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
+    exit 1
 fi
 
 if [ -z "$OEROOT" ]; then
@@ -55,30 +55,30 @@ if [ -z "$OEROOT" ]; then
 fi
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
-    $OEROOT/scripts/oe-setup-builddir && \
-    [ -n "$BUILDDIR" ] && cd $BUILDDIR
+    TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
+    [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
 unset THIS_SCRIPT OEROOT BBPATH
 
 res=1
-if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null ; then
-    BBSERVER=`cat bitbake.lock` bitbake --status-only
+if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null; then
+    BBSERVER=$(cat bitbake.lock) bitbake --status-only
     res=$?
 fi
 
-if [ $res != 0 ] ; then
+if [ $res != 0 ]; then
     bitbake --server-only -t xmlrpc -B localhost:$port
 fi
 
-if [ $port = -1 ] ; then
+if [ $port = -1 ]; then
     export BBSERVER=localhost:-1
     echo "Bitbake server started on demand as needed, use bitbake -m to shut it down"
 else
-    export BBSERVER=`cat bitbake.lock`
+    export BBSERVER=$(cat bitbake.lock)
 
-    if [ $res = 0 ] ; then
-	echo "Using existing bitbake server at: $BBSERVER, use bitbake -m to shut it down"
+    if [ $res = 0 ]; then
+        echo "Using existing bitbake server at: $BBSERVER, use bitbake -m to shut it down"
     else
-	echo "Bitbake server started at: $BBSERVER, use bitbake -m to shut it down"
+        echo "Bitbake server started at: $BBSERVER, use bitbake -m to shut it down"
     fi
-    unset res
 fi
+unset port res
-- 
2.1.0


