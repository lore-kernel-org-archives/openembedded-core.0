Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3116FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id A4DD52E1BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DGu+KHoVDH4u
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 017A02E171
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id DF129B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D45EC149E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id D1E281091
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhDAi014447
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhDSP014446
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:07 +0100
Message-Id: <4a8a1f444146dc68513a609702d374097c8d6201.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
Subject: [PATCH 2/6] oe-init-build-env*: Update/correct comment about specifying arguments
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:17 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 oe-init-build-env        | 8 ++++----
 oe-init-build-env-memres | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index f511b57..baab827 100755
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
index 6dd2b13..b0c7421 100755
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


