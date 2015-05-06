Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 27BF573C8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 16:19:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 09:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="706182353"
Received: from jashore-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.219])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2015 09:19:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 17:19:25 +0100
Message-Id: <9e79983e9069021c828aa46a1be35e88fefe5003.1430929064.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] classes/buildstats: whitespace cleanup
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
X-List-Received-Date: Wed, 06 May 2015 16:19:39 -0000

* Drop trailing whitespace
* Use spaces around equals in assignments
* Replace an errant tab with spaces

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildstats.bbclass | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 4844264..f15c45d 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -3,12 +3,12 @@ BNFILE = "${BUILDSTATS_BASE}/.buildname"
 DEVFILE = "${BUILDSTATS_BASE}/.device"
 
 ################################################################################
-# Build statistics gathering. 
+# Build statistics gathering.
 #
 # The CPU and Time gathering/tracking functions and bbevent inspiration
-# were written by Christopher Larson and can be seen here: 
+# were written by Christopher Larson and can be seen here:
 # http://kergoth.pastey.net/142813
-# 
+#
 ################################################################################
 
 def get_process_cputime(pid):
@@ -43,36 +43,36 @@ def set_device(e):
     except:
         pass
     ############################################################################
-    # We look for the volume TMPDIR lives on. To do all disks would make little 
+    # We look for the volume TMPDIR lives on. To do all disks would make little
     # sense and not give us any particularly useful data. In theory we could do
     # something like stick DL_DIR on a different partition and this would
     # throw stats gathering off. The same goes with SSTATE_DIR. However, let's
-    # get the basics in here and work on the cornercases later. 
+    # get the basics in here and work on the cornercases later.
     # A note. /proc/diskstats does not contain info on encryptfs, tmpfs, etc.
     # If we end up hitting one of these fs, we'll just skip diskstats collection.
     ############################################################################
-    device=os.stat(tmpdir)
-    majordev=os.major(long(device.st_dev))
-    minordev=os.minor(long(device.st_dev))
+    device = os.stat(tmpdir)
+    majordev = os.major(long(device.st_dev))
+    minordev = os.minor(long(device.st_dev))
     ############################################################################
-    # Bug 1700: 
+    # Bug 1700:
     # Because tmpfs/encryptfs/ramfs etc inserts no entry in /proc/diskstats
     # we set rdev to NoLogicalDevice and search for it later. If we find NLD
     # we do not collect diskstats as the method to collect meaningful statistics
-    # for these fs types requires a bit more research. 
+    # for these fs types requires a bit more research.
     ############################################################################
-    rdev="NoLogicalDevice"
+    rdev = "NoLogicalDevice"
     try:
         with open("/proc/diskstats", "r") as f:
             for line in f:
                 if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
-                    rdev=line.split()[2]
+                    rdev = line.split()[2]
     except:
         pass
     file = open(e.data.getVar('DEVFILE', True), "w")
     file.write(rdev)
     file.close()
-    
+
 def get_device(e):
     file = open(e.data.getVar('DEVFILE', True))
     device = file.readline()
@@ -84,7 +84,7 @@ def get_diskstats(dev):
     ############################################################################
     # For info on what these are, see kernel doc file iostats.txt
     ############################################################################
-    DSTAT_KEYS = ['ReadsComp', 'ReadsMerged', 'SectRead', 'TimeReads', 'WritesComp', 'SectWrite', 'TimeWrite', 'IOinProgress', 'TimeIO', 'WTimeIO']  
+    DSTAT_KEYS = ['ReadsComp', 'ReadsMerged', 'SectRead', 'TimeReads', 'WritesComp', 'SectWrite', 'TimeWrite', 'IOinProgress', 'TimeIO', 'WTimeIO']
     try:
         with open("/proc/diskstats", "r") as f:
             for x in f:
@@ -106,9 +106,9 @@ def get_diskdata(var, dev, data):
     newdiskdata = get_diskstats(dev)
     for key in olddiskdata.iterkeys():
         diskdata["Start"+key] = str(int(olddiskdata[key]))
-        diskdata["End"+key] = str(int(newdiskdata[key]))    
+        diskdata["End"+key] = str(int(newdiskdata[key]))
     return diskdata
-    
+
 def set_timedata(var, data, server_time=None):
     import time
     if server_time:
@@ -137,7 +137,7 @@ def get_timedata(var, data, server_time=None):
     else:
         cpuperc = None
     return timediff, cpuperc
-    
+
 def write_task_data(status, logfile, dev, e):
     bn = get_bn(e)
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
@@ -164,7 +164,7 @@ def write_task_data(status, logfile, dev, e):
             for key in sorted(diskdata.iterkeys()):
                 file.write(key + ": " + diskdata[key] + "\n")
     if status is "passed":
-	    file.write("Status: PASSED \n")
+        file.write("Status: PASSED \n")
     else:
         file.write("Status: FAILED \n")
     file.write("Ended: %0.2f \n" % e.time)
@@ -189,7 +189,7 @@ python run_buildstats () {
         bn = get_bn(e)
         set_device(e)
         device = get_device(e)
-        
+
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         try:
             bb.utils.mkdirhier(bsdir)
@@ -209,7 +209,7 @@ python run_buildstats () {
         file.write("\n")
         file.write("Build Started: %0.2f \n" % time.time())
         file.close()
-                
+
     elif isinstance(e, bb.event.BuildCompleted):
         bn = get_bn(e)
         device = get_device(e)
@@ -260,10 +260,10 @@ python run_buildstats () {
         write_task_data("passed", os.path.join(taskdir, e.task), device, e)
         if e.task == "do_rootfs":
             bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-            bs=os.path.join(bsdir, "build_stats")
-            file = open(bs,"a") 
+            bs = os.path.join(bsdir, "build_stats")
+            file = open(bs,"a")
             rootfs = e.data.getVar('IMAGE_ROOTFS', True)
-            rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read() 
+            rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read()
             file.write("Uncompressed Rootfs size: %s" % rootfs_size)
             file.close()
 
@@ -274,8 +274,8 @@ python run_buildstats () {
         taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         write_task_data("failed", os.path.join(taskdir, e.task), device, e)
         ########################################################################
-        # Lets make things easier and tell people where the build failed in 
-        # build_status. We do this here because BuildCompleted triggers no 
+        # Lets make things easier and tell people where the build failed in
+        # build_status. We do this here because BuildCompleted triggers no
         # matter what the status of the build actually is
         ########################################################################
         build_status = os.path.join(bsdir, "build_stats")
-- 
2.1.0


