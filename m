Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5873CC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 06:34:39 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.115250.1698042869292892703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 23:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125503084"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125503084"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 15:34:26 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EE1B9D9DA9
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 15:34:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C413CFB9B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 15:34:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA351E2057
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 15:34:22 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 596EE1A0072;
	Mon, 23 Oct 2023 14:34:22 +0800 (CST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Qiu Tingting <qiutt@fujitsu.com>
Subject: [PATCH V1] cairo:Add ptest support
Date: Mon, 23 Oct 2023 14:34:15 +0800
Message-Id: <1698042855-3883-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.005
X-TMASE-Result: 10--9.387500-10.000000
X-TMASE-MatchedRID: SHPZLDJt6hRSuJfEWZSQfBMxKDqgAFSz3hng3KTHeTZM+b8yxBqvA3X2
	dWwZpMyXzQCB72FLaNpJtskS4r/ddbxTpz2zW+LJpSXVpBS+ilY3l2plwgrtWCD1HdXyqDnEuxW
	P7AlD8NMppiuzBwGFPv+EMOr9fJmZL/tBTZzO5Q0K3Ma88LL+blK6+0HOVoSoQ9Fx1nQpmTwNle
	G9Mx1C72vorjl+8pW03Tu5wqq1RK/rGT8oppN8UHV7tdtvoibaQR7lWMXPA1uMJxigKCCiSz3vM
	QJZlrWjQRQJ+QZ3RDPJLskA7oOiDt592rd90GpVupDIC9422Dqe/UuOBUIY4jMM67DQIVkSigWi
	i6tzEwNwU8SANxEnQtRK0ILOMd3Uh2EU0vzIu296UiYycCRZXp+PweRdWiCx92wasZo4p03z1Fs
	ykdoZca6UMTDMbox3UYB7V58oVjgq1U5B3sV3Xi9iVDu7EPf8oZoUnnV928KBAXl9LkPp6WO/fg
	CP/Sl24vM1YF6AJbbGXyXDzkRpVAtuKBGekqUpI/NGWt0UYPAS87BJtUyaG4pBP+Y2FFna2IfEb
	C0BbRQY7q+GaB1c/nxK8ruA57Zr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 06:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189614

From: Qiu Tingting <qiutt@fujitsu.com>

Add a ptest for cairo
- It is taking around 65s to execute with kvm, so added it to PTESTS_SLOW
- It contains 429 cases
- Below is parts of the run log:
  START: ptest-runner
  2023-10-17T05:56
  BEGIN: /usr/lib/cairo/ptest

  TESTING cairo-test-suite
  Compiled against cairo 1.16.0, running on 1.16.0.
  Compiled against pixman 0.42.2, running on 0.42.2.

  TESTING a1-bug
  a1-bug.image.argb32 [0x1]:  PASS

  ...
  TESTING fallback-resolution
  UNTESTED: fallback-resolution
  402 Passed, 13 Failed [0 crashed, 13 expected], 14 Skipped
  DURATION: 65
  END: /usr/lib/cairo/ptest
  2023-10-17T05:51
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-graphics/cairo/cairo/ptest.patch | 58 +++++++++++
 meta/recipes-graphics/cairo/cairo/run-ptest   | 20 ++++
 meta/recipes-graphics/cairo/cairo/skiplist    | 97 +++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 24 +++++
 5 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/ptest.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/run-ptest
 create mode 100644 meta/recipes-graphics/cairo/cairo/skiplist

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 680b01b3b5..aa8aeaaa1b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -89,6 +89,7 @@ PTESTS_PROBLEMS:append:riscv32 = " qemu"
 PTESTS_SLOW = "\
     apr \
     bzip2 \
+    cairo \
     coreutils \
     curl \
     dbus \
diff --git a/meta/recipes-graphics/cairo/cairo/ptest.patch b/meta/recipes-graphics/cairo/cairo/ptest.patch
new file mode 100644
index 0000000000..cbbafb1f0f
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/ptest.patch
@@ -0,0 +1,58 @@
+change cairo-test-suite output with ptest formate.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
+
+diff -rNu a/test/cairo-test-runner.c b/test/cairo-test-runner.c
+--- a/test/cairo-test-runner.c	2023-10-13 15:51:25.986798896 +0800
++++ b/test/cairo-test-runner.c	2023-10-16 13:57:41.323640064 +0800
+@@ -1011,9 +1011,9 @@
+ 		    }
+ 		}
+ 		targets[len-2] = '\0';
+-		_log (&runner.base, "\n%s: CRASH! (%s)\n", name, targets);
++		_log (&runner.base, "\nCRASH: %s (%s)\n", name, targets);
+ 	    } else {
+-		_log (&runner.base, "\n%s: CRASH!\n", name);
++		_log (&runner.base, "\nCRASH: %s\n", name);
+ 	    }
+ 	    runner.num_crashed++;
+ 	    runner.passed = FALSE;
+@@ -1033,9 +1033,9 @@
+ 		    }
+ 		}
+ 		targets[len-2] = '\0';
+-		_log (&runner.base, "%s: ERROR (%s)\n", name, targets);
++		_log (&runner.base, "ERROR: %s (%s)\n", name, targets);
+ 	    } else {
+-		_log (&runner.base, "%s: ERROR\n", name);
++		_log (&runner.base, "ERROR: %s\n", name);
+ 	    }
+ 	    runner.num_error++;
+ 	    runner.passed = FALSE;
+@@ -1055,20 +1055,20 @@
+ 		    }
+ 		}
+ 		targets[len-2] = '\0';
+-		_log (&runner.base, "%s: FAIL (%s)\n", name, targets);
++		_log (&runner.base, "FAIL: %s (%s)\n", name, targets);
+ 	    } else {
+-		_log (&runner.base, "%s: FAIL\n", name);
++		_log (&runner.base, "FAIL: %s\n", name);
+ 	    }
+ 	    runner.num_failed++;
+ 	    runner.passed = FALSE;
+ 	} else if (xfailed) {
+-	    _log (&runner.base, "%s: XFAIL\n", name);
++	    _log (&runner.base, "XFAIL: %s\n", name);
+ 	    runner.num_xfailed++;
+ 	} else if (skipped) {
+-	    _log (&runner.base, "%s: UNTESTED\n", name);
++	    _log (&runner.base, "UNTESTED: %s\n", name);
+ 	    runner.num_skipped++;
+ 	} else {
+-	    _log (&runner.base, "%s: PASS\n", name);
++	    _log (&runner.base, "PASS: %s\n", name);
+ 	    runner.num_passed++;
+ 	}
+ 	fflush (runner.base.log_file);
diff --git a/meta/recipes-graphics/cairo/cairo/run-ptest b/meta/recipes-graphics/cairo/cairo/run-ptest
new file mode 100644
index 0000000000..7ee3e26954
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# Define tar test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+
+# Clean old logs
+rm -rf cairo-test-suite.log
+rm -rf output
+
+CAIRO_TEST_TARGET=image ./cairo-test-suite -l > caselist
+for case in `cat skiplist`
+do
+    sed -i "s/${case}//g" caselist
+done
+
+CAIRO_TEST_TARGET=image CAIRO_TESTS=`cat caselist` ./cairo-test-suite
+
diff --git a/meta/recipes-graphics/cairo/cairo/skiplist b/meta/recipes-graphics/cairo/cairo/skiplist
new file mode 100644
index 0000000000..1dabffd88a
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/skiplist
@@ -0,0 +1,97 @@
+clear
+clip-operator
+clip-text
+culled-glyphs
+extended-blend-alpha-mask
+font-matrix-translation
+font-variations
+glyph-cache-pressure
+get-path-extents
+halo
+halo-transform
+inverse-text
+large-font
+mime-data
+negative-stride-image
+operator-clear
+operator-source
+overlapping-glyphs
+partial-clip-text-top
+partial-clip-text-bottom
+partial-clip-text-left
+partial-clip-text-right
+radial-gradient-source
+raster-source
+record-select-font-face
+record1414x-select-font-face
+record2x-select-font-face
+record90-select-font-face
+recordflip-whole-select-font-face
+recordflip-select-font-face
+select-font-face
+show-glyphs-advance
+show-text-current-point
+smask
+smask-text
+smp-glyph
+stride-12-image
+text-antialias-gray
+text-antialias-none
+text-antialias-subpixel
+text-antialias-subpixel-rgb
+text-antialias-subpixel-bgr
+text-antialias-subpixel-vrgb
+text-antialias-subpixel-vbgr
+text-glyph-range
+text-pattern
+text-rotate
+text-unhinted-metrics
+unbounded-operator
+user-font-proxy
+user-font-rescale
+pthread-show-text
+bitmap-font
+ft-font-create-for-ft-face
+ft-show-glyphs-positioning
+ft-show-glyphs-table
+ft-text-vertical-layout-type1
+ft-text-vertical-layout-type3
+ft-text-antialias-none
+clip-image
+clipped-surface
+composite-integer-translate-source
+composite-integer-translate-over
+extend-reflect
+extend-reflect-similar
+extend-repeat
+extend-repeat-similar
+filter-nearest-transformed
+mask
+mask-transformed-image
+mask-transformed-similar
+subsurface-image-repeat
+text-transform
+trap-clip
+xlib-expose-event
+pixman-downscale-fast-96
+pixman-downscale-fast-95
+pixman-downscale-fast-24
+pixman-downscale-good-96
+pixman-downscale-good-95
+pixman-downscale-good-24
+pixman-downscale-best-96
+pixman-downscale-best-95
+pixman-downscale-best-24
+pixman-downscale-nearest-96
+pixman-downscale-nearest-95
+pixman-downscale-nearest-24
+pixman-downscale-bilinear-96
+pixman-downscale-bilinear-95
+pixman-downscale-bilinear-24
+record-text-transform
+record1414x-text-transform
+record2x-text-transform
+record90-text-transform
+recordflip-whole-text-transform
+recordflip-text-transform
+
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index ffb813d290..8eedc73717 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -84,6 +84,30 @@ do_install:append () {
 		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
+# add for ptest support
+SRC_URI += " \
+    file://ptest.patch \
+    file://run-ptest \
+    file://skiplist \
+"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/test/
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    install --mode=755 ${B}/test/.libs/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/reference/
+    install --mode=755 ${S}/test/reference/* ${D}${PTEST_PATH}/tests/reference/
+
+    install --mode=755 ${WORKDIR}/skiplist ${D}${PTEST_PATH}/tests/
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+
+}
+
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
 SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
-- 
2.25.1


