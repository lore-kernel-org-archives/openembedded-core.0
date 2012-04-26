Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SNCIL-00033f-2u
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 02:10:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Apr 2012 17:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="136829586"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2012 17:01:00 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 17:00:58 -0700
Message-Id: <d1db208602e2b244f311d8d971b0f42f1ecb6437.1335398393.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1335398393.git.nitin.a.kamble@intel.com>
References: <cover.1335398393.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] libproxy: fix compilations with gcc 4.7
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
X-List-Received-Date: Thu, 26 Apr 2012 00:10:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libproxy/libproxy_fix_for_gcc4.7.patch         |   30 ++++++++++++++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch

diff --git a/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch b/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
new file mode 100644
index 0000000..a772f09
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy/libproxy_fix_for_gcc4.7.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/20
+Fixes this issue with gcc 4.7
+
+| cd /srv/home/nitin/builds/bERROR: Function failed: do_compile (see /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/temp/log.do_compile.7514 for further information)
+| uild-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy && /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++   -Dlibproxy_EXPORTS -D_POSIX_C_SOURCE=1 -DLIBEXECDIR=\"/usr/libexec\" -DMM_MODULE_BUILTIN=config_sysconfig -fvisibility=hidden    -m64  --sysroot=/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fpermissive -O2 -g -fPIC -I/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7 -I/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64/usr/include/glib-2.0 -I/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86-64/usr/lib/glib-2.0/include    -o CMakeFiles/libproxy.dir/modules/config_sysconfig.cpp.o -c /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
+| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp: In function 'bool should_use_sysconfig()':
+| /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp:107:18: error: 'getuid' was not declared in this scope
+| make[2]: *** [libproxy/CMakeFiles/libproxy.dir/modules/config_sysconfig.cpp.o] Error 1
+| make[2]: Leaving directory `/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7'
+| make[1]: *** [libproxy/CMakeFiles/libproxy.dir/all] Error 2
+| make[1]: Leaving directory `/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/libproxy-0.4.7-r3/libproxy-0.4.7'
+| make: *** [all] Error 2
+| ERROR: oe_runmake failed
+NOTE: package libproxy-0.4.7-r3: task do_compile: Failed
+
+Index: libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
+===================================================================
+--- libproxy-0.4.7.orig/libproxy/modules/config_sysconfig.cpp
++++ libproxy-0.4.7/libproxy/modules/config_sysconfig.cpp
+@@ -21,6 +21,7 @@
+ #include <cstdlib>
+ #include <map>
+ #include <fstream>
++#include <unistd.h>
+ 
+ #include "../extension_config.hpp"
+ using namespace libproxy;
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 6d99861..e3721a8 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
 
 DEPENDS = "gconf"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
            file://g++-namepace.patch \
+           file://libproxy_fix_for_gcc4.7.patch \
           "
 
 SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
-- 
1.7.7



