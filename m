Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (unknown [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 9DECC606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 03:21:16 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 78c4_05b2_059d2d08_1a02_4810_aeb5_b3fe7d5871b6;
	Tue, 30 May 2017 12:21:05 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BF26AC00E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:21:05 +0900 (JST)
Received: from G01JPEXCHKW14.g01.fujitsu.local
	(G01JPEXCHKW14.g01.fujitsu.local [10.0.194.53])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	981DFBD6511 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 12:21:04 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW14.g01.fujitsu.local (10.0.194.53) with Microsoft SMTP
	Server id 14.3.266.1; Tue, 30 May 2017 12:21:05 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 May 2017 12:22:21 +0900
Message-ID: <1496114541-14203-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] ltp: upgrade to 20170516
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
X-List-Received-Date: Tue, 30 May 2017 03:21:21 -0000
Content-Type: text/plain

1. Upgrade ltp from 20170116 to 20170516

2. Rename and Rebase patch file on 20170516
   0034-periodic_output.patch to
   0034-Add-periodic-output-for-long-time-test.patch

3. Delete the unnecessary patch
   0039-fcntl-fix-the-time-def-to-use-time_t.patch

4. Update the md5sum of licesce file
   Author's name and email address has been updated.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...4-Add-periodic-output-for-long-time-test.patch} | 40 +++++++++++++++-------
 ...0039-fcntl-fix-the-time-def-to-use-time_t.patch | 29 ----------------
 .../ltp/{ltp_20170116.bb => ltp_20170516.bb}       |  7 ++--
 3 files changed, 30 insertions(+), 46 deletions(-)
 rename meta/recipes-extended/ltp/ltp/{0034-periodic_output.patch => 0034-Add-periodic-output-for-long-time-test.patch} (44%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
 rename meta/recipes-extended/ltp/{ltp_20170116.bb => ltp_20170516.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch b/meta/recipes-extended/ltp/ltp/0034-Add-periodic-output-for-long-time-test.patch
similarity index 44%
rename from meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
rename to meta/recipes-extended/ltp/ltp/0034-Add-periodic-output-for-long-time-test.patch
index 59caefe..f6c729e 100644
--- a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
+++ b/meta/recipes-extended/ltp/ltp/0034-Add-periodic-output-for-long-time-test.patch
@@ -1,25 +1,36 @@
-Add periodic output for long time test.
+From c71cb1370b78193fbf4cde498c1f979f26e26219 Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Tue, 30 May 2017 12:05:30 +0900
+Subject: [PATCH] Add periodic output for long time test.
 
 This is needed in context of having scripts running ltp tests and
 waiting with a timeout for the output of the tests.
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+Rebase on 20170516
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 Upstream-Status: Pending
+---
+ .../kernel/controllers/memcg/stress/memcg_stress_test.sh      | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff -ruN a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
---- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 15:54:09.515049081 +0100
-+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh	2013-11-08 22:32:15.587370406 +0100
-@@ -37,7 +37,8 @@
+diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+index af1a708..452261a 100755
+--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
++++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+@@ -37,7 +37,8 @@ if [ "x$(grep -w memory /proc/cgroups | cut -f4)" != "x1" ]; then
          exit 0
  fi
  
--RUN_TIME=$(( 60 * 60 ))
+-RUN_TIME=$(( 15 * 60 ))
 +ONE_MINUTE=60
 +RUN_TIME=60
  
  cleanup()
  {
-@@ -62,7 +63,7 @@
+@@ -62,7 +63,7 @@ do_mount()
  # $1 - Number of cgroups
  # $2 - Allocated how much memory in one process? in MB
  # $3 - The interval to touch memory in a process
@@ -28,16 +39,19 @@ diff -ruN a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/tes
  run_stress()
  {
  	do_mount;
-@@ -81,7 +82,11 @@
+@@ -81,7 +82,11 @@ run_stress()
  		eval /bin/kill -s SIGUSR1 \$pid$i 2> /dev/null
  	done
  
 -	sleep $4
-+	for i in $(seq 0 $(($4-1)))
-+	do
-+		eval echo "Started $i min ago. Still alive... " 
-+		sleep $ONE_MINUTE
-+	done
++        for i in $(seq 0 $(($4-1)))
++        do
++                eval echo "Started $i min ago. Still alive... " 
++                sleep $ONE_MINUTE
++        done
  
  	for i in $(seq 0 $(($1-1)))
  	do
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch b/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
deleted file mode 100644
index c0c1dad..0000000
--- a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7bce3d223494803cb32897cabe66119076e53d89 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:23:51 +0800
-Subject: [PATCH 5/5] fcntl: fix the time() def to use time_t
-
-This fixes the build on X32, where long is 32-bit rather than 64-bit.
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/syscalls/fcntl/fcntl14.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl14.c b/testcases/kernel/syscalls/fcntl/fcntl14.c
-index c61eb24..99e3867 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl14.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl14.c
-@@ -775,7 +775,7 @@ void dochild(void)
- 
- void run_test(int file_flag, int file_mode, int seek, int start, int end)
- {
--	extern long time();
-+	extern time_t time();
- 
- 	fail = 0;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20170116.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20170116.bb
rename to meta/recipes-extended/ltp/ltp_20170516.bb
index a5494bc..b1fcc05 100644
--- a/meta/recipes-extended/ltp/ltp_20170116.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
     file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
     file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+    file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
     file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
     file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "2c8457b0769fc026e4e1772f4c2a6da0be63a631"
+SRCREV = "6c6c6ca40afb3611e52486f670085762ff451e91"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
@@ -47,10 +47,9 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
            file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
-           file://0034-periodic_output.patch \
+           file://0034-Add-periodic-output-for-long-time-test.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0039-fcntl-fix-the-time-def-to-use-time_t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


