Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91B9A6DEA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:13:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATCDnEX027552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:13:49 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:13:50 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:14:20 +0800
Message-ID: <7c59e0554f75345579056308813d607a16efff26.1385727181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385727181.git.Qi.Chen@windriver.com>
References: <cover.1385727181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] busybox: add busybox_git.bb recipe
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
X-List-Received-Date: Fri, 29 Nov 2013 12:13:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add busybox_git.bb recipe so that it would be easier to hack with
busybox. Set DEFAULT_PREFERENCE to "-1" in the git recipe so that we
still use the busybox_1.21.1.bb recipe by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox-appletlib-dependency.patch             |    0
 ...usybox-list-suid-and-non-suid-app-configs.patch |    0
 ...sybox-sed-fix-sed-clusternewline-testcase.patch |    0
 .../busybox-sulogin-empty-root-password.patch      |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../busybox/{busybox-1.21.1 => busybox}/defconfig  |    0
 .../fail_on_no_media.patch                         |    0
 .../get_header_tar.patch                           |    0
 .../login-utilities.cfg                            |    0
 .../run-parts.in.usr-bin.patch                     |    0
 .../{busybox-1.21.1 => busybox}/stat-usr-bin.patch |    0
 ...estsuite-du-du-k-works-fix-false-positive.patch |    0
 .../watch.in.usr-bin.patch                         |    0
 meta/recipes-core/busybox/busybox_git.bb           |   53 ++++++++++++++++++++
 14 files changed, 53 insertions(+)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-list-suid-and-non-suid-app-configs.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-sed-fix-sed-clusternewline-testcase.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-sulogin-empty-root-password.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/fail_on_no_media.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/login-utilities.cfg (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/run-parts.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/stat-usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.21.1 => busybox}/watch.in.usr-bin.patch (100%)
 create mode 100644 meta/recipes-core/busybox/busybox_git.bb

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-list-suid-and-non-suid-app-configs.patch b/meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-list-suid-and-non-suid-app-configs.patch
rename to meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch b/meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch
rename to meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-sulogin-empty-root-password.patch b/meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-sulogin-empty-root-password.patch
rename to meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox/defconfig
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/defconfig
rename to meta/recipes-core/busybox/busybox/defconfig
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/fail_on_no_media.patch
rename to meta/recipes-core/busybox/busybox/fail_on_no_media.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/get_header_tar.patch b/meta/recipes-core/busybox/busybox/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/login-utilities.cfg b/meta/recipes-core/busybox/busybox/login-utilities.cfg
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/login-utilities.cfg
rename to meta/recipes-core/busybox/busybox/login-utilities.cfg
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/stat-usr-bin.patch b/meta/recipes-core/busybox/busybox/stat-usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/stat-usr-bin.patch
rename to meta/recipes-core/busybox/busybox/stat-usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/testsuite-du-du-k-works-fix-false-positive.patch b/meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/testsuite-du-du-k-works-fix-false-positive.patch
rename to meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
diff --git a/meta/recipes-core/busybox/busybox-1.21.1/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.21.1/watch.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
new file mode 100644
index 0000000..91ecff8
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -0,0 +1,53 @@
+require busybox.inc
+
+SRCREV = "e73f3c1d3d83699b723251f7e6a981021ce75475"
+# Lookout for PV bump too when SRCREV is changed
+PV = "1.21.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://busybox.net/busybox.git \
+           file://get_header_tar.patch \
+           file://busybox-appletlib-dependency.patch \
+           file://run-parts.in.usr-bin.patch \
+           file://watch.in.usr-bin.patch \
+           file://busybox-udhcpc-no_deconfig.patch \
+           file://find-touchscreen.sh \
+           file://busybox-cron \
+           file://busybox-httpd \
+           file://busybox-udhcpd \
+           file://default.script \
+           file://simple.script \
+           file://hwclock.sh \
+           file://mount.busybox \
+           file://syslog \
+           file://syslog-startup.conf \
+           file://syslog.conf \
+           file://busybox-syslog.default \
+           file://mdev \
+           file://mdev.conf \
+           file://umount.busybox \
+           file://defconfig \
+           file://stat-usr-bin.patch \
+           file://busybox-syslog.service.in \
+           file://busybox-klogd.service.in \
+           file://testsuite-du-du-k-works-fix-false-positive.patch \
+           file://fail_on_no_media.patch \
+           file://busybox-sulogin-empty-root-password.patch \
+           file://run-ptest \
+           file://inetd.conf \
+           file://inetd \
+           file://login-utilities.cfg \
+           file://busybox-list-suid-and-non-suid-app-configs.patch \
+           file://busybox-sed-fix-sed-clusternewline-testcase.patch \
+"
+
+EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
+
+do_install_ptest () {
+        cp -r ${B}/testsuite ${D}${PTEST_PATH}/
+        cp ${B}/.config      ${D}${PTEST_PATH}/
+        ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+}
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.9.5


