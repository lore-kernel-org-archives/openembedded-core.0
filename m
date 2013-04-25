Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UVLIT-0001JB-DD
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:29:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 05:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="301763205"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2013 05:10:58 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id DC4DC2C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 05:10:49 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:10:59 +0300
Message-Id: <52b460987211f4305bcad34e428a385e6bc1d973.1366891465.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1366891465.git.stefanx.stanacar@intel.com>
References: <cover.1366891465.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/3] scripts/contrib/build-perf-test.sh: use the same identation everywhere
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 12:29:15 -0000

Some functions didn't used the same identation as the rest of them,
let's fix that.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 44a902c..f48220a 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -257,36 +257,36 @@ do_sync () {
 #        - report size, remove INHERIT
 
 test1_p1 () {
-log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
-bbnotime "$IMAGE -c fetchall"
-do_rmtmp
-do_rmsstate
-do_sync
-bbtime "$IMAGE"
-log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
-log "Buildstats are saved in $OUTDIR/buildstats-test1"
-mv tmp/buildstats $OUTDIR/buildstats-test1
+    log "Running Test 1, part 1/3: Measure wall clock of bitbake $IMAGE and size of tmp/ dir"
+    bbnotime "$IMAGE -c fetchall"
+    do_rmtmp
+    do_rmsstate
+    do_sync
+    bbtime "$IMAGE"
+    log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+    log "Buildstats are saved in $OUTDIR/buildstats-test1"
+    mv tmp/buildstats $OUTDIR/buildstats-test1
 }
 
 
 test1_p2 () {
-log "Running Test 1, part 2/3: bitbake virtual/kernel -c cleansstate and time bitbake virtual/kernel"
-bbnotime "virtual/kernel -c cleansstate"
-do_sync
-bbtime "virtual/kernel"
+    log "Running Test 1, part 2/3: bitbake virtual/kernel -c cleansstate and time bitbake virtual/kernel"
+    bbnotime "virtual/kernel -c cleansstate"
+    do_sync
+    bbtime "virtual/kernel"
 }
 
 test1_p3 () {
-log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
-echo "INHERIT += \"rm_work\"" >> conf/local.conf
-do_rmtmp
-do_rmsstate
-do_sync
-bbtime "$IMAGE"
-sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
-log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
-log "Buildstats are saved in $OUTDIR/buildstats-test13"
-mv tmp/buildstats $OUTDIR/buildstats-test13
+    log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
+    echo "INHERIT += \"rm_work\"" >> conf/local.conf
+    do_rmtmp
+    do_rmsstate
+    do_sync
+    bbtime "$IMAGE"
+    sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
+    log "SIZE of tmp dir is: `du -sh tmp | sed 's/tmp//'`"
+    log "Buildstats are saved in $OUTDIR/buildstats-test13"
+    mv tmp/buildstats $OUTDIR/buildstats-test13
 }
 
 
@@ -296,11 +296,11 @@ mv tmp/buildstats $OUTDIR/buildstats-test13
 # Pre: populated sstate cache
 
 test2 () {
-#assuming test 1 has run
-log "Running Test 2: Measure wall clock of bitbake $IMAGE -c rootfs with sstate"
-do_rmtmp
-do_sync
-bbtime "$IMAGE -c rootfs"
+    # Assuming test 1 has run
+    log "Running Test 2: Measure wall clock of bitbake $IMAGE -c rootfs with sstate"
+    do_rmtmp
+    do_sync
+    bbtime "$IMAGE -c rootfs"
 }
 
 
@@ -314,14 +314,14 @@ bbtime "$IMAGE -c rootfs"
 
 
 test3 () {
-log "Running Test 3: Parsing time metrics (bitbake -p)"
-log "   Removing tmp/cache && cache"
-rm -rf tmp/cache cache
-bbtime "-p"
-log "   Removing tmp/cache/default-eglibc/"
-rm -rf tmp/cache/default-eglibc/
-bbtime "-p"
-bbtime "-p"
+    log "Running Test 3: Parsing time metrics (bitbake -p)"
+    log "   Removing tmp/cache && cache"
+    rm -rf tmp/cache cache
+    bbtime "-p"
+    log "   Removing tmp/cache/default-eglibc/"
+    rm -rf tmp/cache/default-eglibc/
+    bbtime "-p"
+    bbtime "-p"
 }
 
 
-- 
1.8.1.4



