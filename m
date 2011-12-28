Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfz2U-0005if-PM
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:19:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 11:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90309409"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.80])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 11:12:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 11:12:26 -0800
Message-Id: <146e7461f7c63a582e920bb40eda1ad37b9fdd4d.1325099431.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325099430.git.sgw@linux.intel.com>
References: <cover.1325099430.git.sgw@linux.intel.com>
Subject: [PATCH 5/6] util-linux: Update to 2.20.1
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
X-List-Received-Date: Wed, 28 Dec 2011 19:19:51 -0000

Add patch remove setting CC, LD and LDFLAGS on commandline
since they are passed correctly via configure. Those setting
also caused the configure information about -std=gnu99 from
being passed correctly.

Removed patch that was fixed upstream
Added scanf configuration, since this is a cross-compile target check

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 ++----
 .../{util-linux_2.19.1.bb => util-linux_2.20.1.bb} |   11 +++++------
 12 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.19.1.bb => util-linux_2.20.1.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/MCONFIG b/meta/recipes-core/util-linux/util-linux-2.20.1/MCONFIG
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/MCONFIG
rename to meta/recipes-core/util-linux/util-linux-2.20.1/MCONFIG
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/defines.h b/meta/recipes-core/util-linux/util-linux-2.20.1/defines.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/defines.h
rename to meta/recipes-core/util-linux/util-linux-2.20.1/defines.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/make_include b/meta/recipes-core/util-linux/util-linux-2.20.1/make_include
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/make_include
rename to meta/recipes-core/util-linux/util-linux-2.20.1/make_include
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/remove-lscpu.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/remove_sigsetmark.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/remove_sigsetmark.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/swapargs.h b/meta/recipes-core/util-linux/util-linux-2.20.1/swapargs.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/swapargs.h
rename to meta/recipes-core/util-linux/util-linux-2.20.1/swapargs.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-__progname-conflict.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-__progname-conflict.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-__progname-conflict.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-compile.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-compile.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/uclibc-compile.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-compile.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-2.16-mount_lock_path.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-2.16-mount_lock_path.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-2.16-mount_lock_path.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.19.1/util-linux-ng-replace-siginterrupt.patch
rename to meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index acc4a39..5445f4f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -18,7 +18,7 @@ DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
 
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.infradead.org/pub/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.bz2 \
            file://MCONFIG \
            file://swapargs.h \
            file://defines.h \
@@ -78,9 +78,7 @@ do_compile () {
 	install ${WORKDIR}/make_include ${S}/make_include
 	install ${WORKDIR}/swapargs.h ${S}/mount/swapargs.h
 	install ${WORKDIR}/defines.h ${S}/defines.h
-	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= \
-		'OPT=${CFLAGS}' 'CC=${CC}' 'LD=${LD}' \
-		'LDFLAGS=${LDFLAGS}'
+	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}' 
 }
 
 checklink() {
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.19.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.20.1.bb
index 82040ef..a569131 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.20.1.bb
@@ -1,5 +1,5 @@
-MAJOR_VERSION = "2.19"
-PR = "r12"
+MAJOR_VERSION = "2.20"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -8,11 +8,10 @@ LICENSE_util-linux-lscpu = "GPLv3+"
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \      
-            file://remove_sigsetmark.patch \
 "
 
-SRC_URI[md5sum] = "3eab06f05163dfa65479c44e5231932c"
-SRC_URI[sha256sum] = "d3eac4afcc687b3ae1ffedcab2dc12df84c7ba7045cce31386d2b7040a011c7d"
+SRC_URI[md5sum] = "079b37517fd4e002a2e6e992e8b4e361"
+SRC_URI[sha256sum] = "d16ebcda3e64ab88ed363d9c1242cdb7ccfd5e1f56c83d0c3b0638c23793bbe0"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
@@ -42,7 +41,7 @@ addtask remove_lscpu before do_configure after do_patch
 
 # fallocate is glibc 2.10, fallocate64 is glibc 2.11
 # we need to disable it for older versions
-EXTRA_OECONF += "ac_cv_func_fallocate=no"
+EXTRA_OECONF += "ac_cv_func_fallocate=no scanf_cv_type_modifier=as"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
 
 do_install_append () {
-- 
1.7.6.4



