Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1E7B6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 878A018186
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UewNmfDQzIvf
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id E30871816C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CBCB7108C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C10A7140F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id BE8F310D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2HBEG34026161
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2HBEGsC026160
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2016 12:14:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:14:09 +0100
Message-Id: <43513e870080f79131d2463dc8ddb5319dfca0cb.1458213205.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
Subject: [PATCHv2 2/7] oe-init-build-env*: Update/correct comment about specifying arguments
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
X-List-Received-Date: Thu, 17 Mar 2016 11:14:18 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 oe-init-build-env        | 8 ++++----
 oe-init-build-env-memres | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 7b922b3..fa9eacd 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -19,11 +19,11 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 #
-# Normally this is called as '. ./oe-init-build-env builddir'
+# Normally this is called as '. ./oe-init-build-env <builddir>'
 #
-# This works in most shells (not dash), but not all of them pass arg1 when
-# being sourced.   To workaround the shell limitation use "set arg1" prior 
-# to sourcing this script.
+# This works in most shells (not dash), but not all of them pass the arguments
+# when being sourced.  To workaround the shell limitation use "set <builddir>"
+# prior to sourcing this script.
 #
 if [ -n "$BASH_SOURCE" ]; then
     THIS_SCRIPT=$BASH_SOURCE
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 092d4fe..41c09d8 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -19,11 +19,11 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 #
-# Normally this is called as '. ./oe-init-build-env builddir <portnumber> <builddir>'
+# Normally this is called as '. ./oe-init-build-env-memres <portnumber> <builddir>'
 #
-# This works in most shells (not dash), but not all of them pass arg1 when
-# being sourced.   To workaround the shell limitation use "set arg1" prior 
-# to sourcing this script.
+# This works in most shells (not dash), but not all of them pass the arguments
+# when being sourced.  To workaround the shell limitation use "set <portnumber>
+# <builddir>" prior to sourcing this script.
 #
 if [ -z "$1" ]; then
     echo "No port specified, using dynamically selected port"
-- 
2.1.0


