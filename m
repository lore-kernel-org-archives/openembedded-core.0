Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDC774D66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 14:51:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k11-v6so21670775pgo.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=pMTAIpvKZymFDOm7j9Bt457qtN6vLFI+lqNCTPIIIxA=;
	b=GLZDOZyPaexNqKu453nwEFYwIVkqATfTzwwo6ebTNzPMn2cxOx3ucot/CIjestUJaP
	pk0fKtuHqdksqndMrx7kSh68CVqp1q0u+Gxx8wpeuNTY6vkrh9WC2UPTaSEvY3CjEqZL
	O2HeGT9cNB945uHnMW4yNRRLfofIald7V2NSJyAZsy9j1i8rNg4VH1obhm/8GLGaCNQb
	cI8gUL/b6eVXBpUHmIWtonYkZFTQSkQ4wDAEw7392d53xHehQ79T9YfSVCWK5924zQSB
	dmY8AIH4YII7r2prAjD4lhVmA9mgqMf0UQi6lT+PB3KKjzYkTJTyGjoiJqEESlFzhbh7
	ZeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pMTAIpvKZymFDOm7j9Bt457qtN6vLFI+lqNCTPIIIxA=;
	b=b6754nEyPhtoHyVhRMUce472j2ZxezP0llh4Z9kpCrUbUnSuAjzZ/5T9VEyLgBUwwi
	LLvGt+oGvVA/tDBfbi4PMGqSLxEKIyRduHxuX28AyvjERbl8tSXYnop40ozHUCGuWKVK
	AJL9r32DHoe6mII0zGYyUFVyAKTbBYmASAmC9xxwqKVbCApX4nANSZNoXOYMkMFq9CNZ
	rQfrl10lts0NSjOpqsppMQojdAw1FdyLBxcJSiv8iG0vn42KK6Vjnj4ZyFpjurW8gLXT
	KfKWwffTfvRTFwYSuMJyR9tlmM5YE54LrC+QWVEWgzKCN7ydVyHgiqNVBox0hR9v/tVF
	sm9A==
X-Gm-Message-State: ALQs6tBEjPerVHG909sheB/zqZWrODDBTnJNi4Si+yizbfIckm5Am2KJ
	4q8vBoywQ4SHn58/YUTP+Tw=
X-Google-Smtp-Source: AB8JxZpammUCMCW53t5/gD9hYeQbMRaPLJPpCZMavdesfw+JC1exxQjW6tYHNuS7S+zXtcWU/2+grw==
X-Received: by 2002:a63:a06a:: with SMTP id
	u42-v6mr34921524pgn.389.1525877510996; 
	Wed, 09 May 2018 07:51:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:c9d8:f10:1267:651b])
	by smtp.gmail.com with ESMTPSA id
	t24sm56426472pfj.75.2018.05.09.07.51.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 07:51:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 07:51:48 -0700
Message-Id: <1525877508-24889-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] util-linux: update to 2.32
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
X-List-Received-Date: Wed, 09 May 2018 14:51:50 -0000

rfkill moved locations, update accordingly

refactored avoid_parallel_tests.patch

includes security fix:
CVE-2018-7738 (score: 7.2)
affects: < 2.32-rc1

see changelog for other bugfixes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.32/v2.32-ChangeLog

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc               |  5 ++---
 .../util-linux/util-linux/avoid_parallel_tests.patch      | 15 ++++++++-------
 .../util-linux/{util-linux_2.31.bb => util-linux_2.32.bb} |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.31.bb => util-linux_2.32.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 157416d..0b7db52 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -86,7 +86,7 @@ FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-rfkill = "${base_bindir}/rfkill*"
+FILES_util-linux-rfkill = "${sbindir}/rfkill*"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
@@ -157,7 +157,7 @@ do_install () {
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
         sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
-        binprogs_a="dmesg getopt kill more umount mount login rfkill su mountpoint"
+        binprogs_a="dmesg getopt kill more umount mount login su mountpoint"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
         	mkdir -p ${D}${base_sbindir}
@@ -272,7 +272,6 @@ ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
 ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-ALTERNATIVE_TARGET[rfkill] = "${base_bindir}/rfkill"
 
 ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 46d4d37..748b6ef 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -5,15 +5,16 @@ Revert run.sh script accordingly to serialize running tests
 Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
 Upstream-Status: Inappropriate 
 
-diff -ruN a/configure.ac b/configure.ac
---- a/configure.ac	2014-05-27 12:37:42.119772658 +0200
-+++ b/configure.ac	2014-05-27 12:41:46.225573272 +0200
-@@ -10,7 +10,7 @@
+Index: util-linux-2.32/configure.ac
+===================================================================
+--- util-linux-2.32.orig/configure.ac
++++ util-linux-2.32/configure.ac
+@@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
  dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
  dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
  AC_USE_SYSTEM_EXTENSIONS
--AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects serial-tests])
-
+-AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
++AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
+ 
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
  			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
diff --git a/meta/recipes-core/util-linux/util-linux_2.31.bb b/meta/recipes-core/util-linux/util-linux_2.32.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.31.bb
rename to meta/recipes-core/util-linux/util-linux_2.32.bb
index 7f7a78e..55cc98c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.31.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.31"
+MAJOR_VERSION = "2.32"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -15,8 +15,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
 "
-SRC_URI[md5sum] = "5b6821c403c3cc6e7775f74df1882a20"
-SRC_URI[sha256sum] = "f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a"
+SRC_URI[md5sum] = "e0d8a25853f88cd15ff557e5d8cb4ea7"
+SRC_URI[sha256sum] = "6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
2.7.4


