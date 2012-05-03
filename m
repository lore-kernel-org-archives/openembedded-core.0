Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQf-0006gj-4n
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772218"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:48 -0700
Message-Id: <ee772a84fe5bed0e376674b479d1688c69deef06.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/36] util-linux: Update to 2.21.1
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
X-List-Received-Date: Thu, 03 May 2012 02:06:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{util-linux-2.21 => util-linux}/MCONFIG        |    0
 .../{util-linux-2.21 => util-linux}/defines.h      |    0
 .../fix_NL_TIME_FIRST_WEEKDAY.patch                |    0
 .../{util-linux-2.21 => util-linux}/make_include   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../{util-linux-2.21 => util-linux}/swapargs.h     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 .../{util-linux_2.21.bb => util-linux_2.21.1.bb}   |    6 +++---
 12 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/fix_NL_TIME_FIRST_WEEKDAY.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.21 => util-linux}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.21.bb => util-linux_2.21.1.bb} (90%)

diff --git a/meta/recipes-core/util-linux/util-linux-2.21/MCONFIG b/meta/recipes-core/util-linux/util-linux/MCONFIG
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/MCONFIG
rename to meta/recipes-core/util-linux/util-linux/MCONFIG
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/defines.h b/meta/recipes-core/util-linux/util-linux/defines.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/defines.h
rename to meta/recipes-core/util-linux/util-linux/defines.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch b/meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
rename to meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/make_include b/meta/recipes-core/util-linux/util-linux/make_include
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/make_include
rename to meta/recipes-core/util-linux/util-linux/make_include
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
rename to meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/remove_sigsetmark.patch b/meta/recipes-core/util-linux/util-linux/remove_sigsetmark.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/remove_sigsetmark.patch
rename to meta/recipes-core/util-linux/util-linux/remove_sigsetmark.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/swapargs.h b/meta/recipes-core/util-linux/util-linux/swapargs.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/swapargs.h
rename to meta/recipes-core/util-linux/util-linux/swapargs.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/uclibc-__progname-conflict.patch
rename to meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/uclibc-compile.patch b/meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/uclibc-compile.patch
rename to meta/recipes-core/util-linux/util-linux/uclibc-compile.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-2.16-mount_lock_path.patch
rename to meta/recipes-core/util-linux/util-linux/util-linux-ng-2.16-mount_lock_path.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
rename to meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.1.bb
similarity index 90%
rename from meta/recipes-core/util-linux/util-linux_2.21.bb
rename to meta/recipes-core/util-linux/util-linux_2.21.1.bb
index c0c8bc6..12faba0 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r5"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -11,8 +11,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://fix_NL_TIME_FIRST_WEEKDAY.patch \
 "
 
-SRC_URI[md5sum] = "3c7a26963f3921c1e775a80330321870"
-SRC_URI[sha256sum] = "2813ae6fe0449b60402e122c2baf97f26aa53e6e2dd05591c6cbcdf67ffdb6c6"
+SRC_URI[md5sum] = "3d9ad37bf8c5a8e6d0e165b020cf9ba5"
+SRC_URI[sha256sum] = "4bf9641fd58454106589be8a8d1cfd61e7694f0a6912d8095d17b1fb94b85abe"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.7.7.6



