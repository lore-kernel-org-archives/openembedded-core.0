Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A464A61011
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:57:24 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2013 08:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="359591698"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2013 08:57:13 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id CD9586A47F9;
	Thu, 12 Sep 2013 04:09:02 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 14:09:00 +0300
Message-Id: <1378984140-11843-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] scripts/contrib/build-perf-test.sh: record size in kb and remove extra spaces
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
X-List-Received-Date: Thu, 12 Sep 2013 15:57:25 -0000

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index ce0fb9a..be3b648 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -170,6 +170,7 @@ fi
 # Disabling the network sanity check helps a bit (because of my crappy network connection and/or proxy)
 echo "CONNECTIVITY_CHECK_URIS =\"\"" >> conf/local.conf
 
+
 #
 # Functions
 #
@@ -284,7 +285,7 @@ test1_p1 () {
     do_rmsstate
     do_sync
     bbtime $IMAGE
-    s=`du -sh tmp | sed 's/tmp//'`
+    s=`du -s tmp | sed 's/tmp//' | sed 's/[ \t]*$//'`
     SIZES[(( size_count++ ))]="$s"
     log "SIZE of tmp dir is: $s"
     log "Buildstats are saved in $OUTDIR/buildstats-test1"
@@ -307,7 +308,7 @@ test1_p3 () {
     do_sync
     bbtime $IMAGE
     sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
-    s=`du -sh tmp | sed 's/tmp//'`
+    s=`du -s tmp | sed 's/tmp//' | sed 's/[ \t]*$//'`
     SIZES[(( size_count++ ))]="$s"
     log "SIZE of tmp dir is: $s"
     log "Buildstats are saved in $OUTDIR/buildstats-test13"
-- 
1.8.3.1


