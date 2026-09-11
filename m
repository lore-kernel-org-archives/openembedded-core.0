Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659BDC88E42
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33923.1789109658099383662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fFK5YQN5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Vd3WLGSC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a08f3ede0c-7bb57ee9-86f3-4eb8-8855-b5e10e8719d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9KUZ4+pWabOWq6dhNjFdDClFBpHuTBSjcoeQAaRMLRE=;
	b=fFK5YQN5cedIgD9Ehgx7XElsJDbNB/9ZtV8D/EOWKKLM1bWrYpfhKDvVV3liSHkG
	TUMtj6g4pbLrYXyrq7Eq7QEvVA0h/XOQfZrv9CBYHHMj554qT8jNuNySJabna/1tmlG
	K/IgZJIOFcOFC4qjV0NEheCN+5mLJwPj+uPf0m68=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9KUZ4+pWabOWq6dhNjFdDClFBpHuTBSjcoeQAaRMLRE=;
	b=Vd3WLGSCj9eaDwYOLlI8wJyKLFSpkB0BpFbig54GToGRZqJKUNINxiCySX2cITjI
	EfFQ+Eoh7FEiNw5w3Hh0zi9XM4TnQ6V8gqud4pU0uAyKQfXsRCIBdb7RZ3huTDbk/IG
	RwS9a675y1Qqk+0xoLMddNXAb+ScQsjqOD7L4UEE=
Content-Type: multipart/mixed; boundary="===============7421859077018539915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sai Sireesha T <saisireesha.t@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Sai Sireesha T <saisireesha.t@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd,systemd-tools-native,systemd-boot,systemd-boot-native:
 upgrading to 261.3,261.3,261.3,261.3 FAILED
Message-ID: <010101a08f3ede0c-7bb57ee9-86f3-4eb8-8855-b5e10e8719d2-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245609

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd,systemd-tools-native,systemd-boot,systemd-boot-native* to *261.3,261.3,261.3,261.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemd-systemd-tools-native-systemd-boot-systemd-bo.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From b223a62dd23dabc009256ca2b8d07aa6b4af183d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 11 Sep 2026 05:13:51 +0000
Subject: [PATCH] 
 systemd,systemd-tools-native,systemd-boot,systemd-boot-native: upgrade 261.2
 -> 261.3,261.2 -> 261.3,261.2 -> 261.3,261.2 -> 261.3

Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.
---
 ..._261.2.bb => systemd-boot-native_261.3.bb} |   0
 ...md-boot_261.2.bb => systemd-boot_261.3.bb} |   0
 ...261.2.bb => systemd-tools-native_261.3.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...tall-dependency-links-at-install-tim.patch |  15 +--
 .../0003-Do-not-create-var-log-README.patch   |   6 +-
 ...issing-STATX_MNT_ID-on-older-kernels.patch | 112 +++++++++---------
 ...396d2c5bc1adb6b044e7784a30b7187f6fbd.patch |  59 ---------
 .../{systemd_261.2.bb => systemd_261.3.bb}    |   4 +-
 9 files changed, 69 insertions(+), 129 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.2.bb => systemd-boot-native_261.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.2.bb => systemd-boot_261.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.2.bb => systemd-tools-native_261.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch
 rename meta/recipes-core/systemd/{systemd_261.2.bb => systemd_261.3.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.2.bb b/meta/recipes-core/systemd/systemd-boot-native_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.2.bb
rename to meta/recipes-core/systemd/systemd-boot-native_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.2.bb b/meta/recipes-core/systemd/systemd-boot_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.2.bb
rename to meta/recipes-core/systemd/systemd-boot_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.2.bb b/meta/recipes-core/systemd/systemd-tools-native_261.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_261.2.bb
rename to meta/recipes-core/systemd/systemd-tools-native_261.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 70c5ac758d..3ee898958f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-SRCREV = "4925d9f07fc697efccd98a93046ff535b8832445"
+SRCREV = "3255daee1572366b74fe92f002a3d60ecbb27103"
 SRCBRANCH = "v261-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 8061ff1000..b83803aa08 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From b1ab58d3b4a8164e5978409706d6769f5cfde404 Mon Sep 17 00:00:00 2001
+From 451af4755f0c1da552498682d910f4f4c5209639 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH 01/16] binfmt: Don't install dependency links at install time
- for the binfmt services
+Subject: [PATCH] binfmt: Don't install dependency links at install time for
+ the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
 like a traditional service.
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index 4f47a3b2bd..237870025b 100644
+index 27d8ef2f72..864caa44bb 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -154,7 +154,6 @@ units = [
+@@ -168,7 +168,6 @@ units = [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index 4f47a3b2bd..237870025b 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -263,7 +262,6 @@ units = [
+@@ -279,7 +278,6 @@ units = [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
@@ -74,6 +74,3 @@ index 318bf8efc2..6ef684861d 100644
 +
 +[Install]
 +WantedBy=sysinit.target
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
index 0128c83d9f..175ec7955b 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.patch
@@ -1,4 +1,4 @@
-From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
+From 0d4a5976056387ff3801fdb7f53e6d0760df0475 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
 Subject: [PATCH] Do not create /var/log/README
@@ -15,7 +15,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
-index cdef21fa9b..7890abcdef 100644
+index 7036c12b7c..80120b04b4 100644
 --- a/tmpfiles.d/legacy.conf.in
 +++ b/tmpfiles.d/legacy.conf.in
 @@ -13,6 +13,3 @@
@@ -25,5 +25,3 @@ index cdef21fa9b..7890abcdef 100644
 -{% if CREATE_LOG_DIRS %}
 -L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
 -{% endif %}
--- 
-2.34.1
diff --git a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
index 9d74872034..7e96550dd3 100644
--- a/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
+++ b/meta/recipes-core/systemd/systemd/Handle-missing-STATX_MNT_ID-on-older-kernels.patch
@@ -1,6 +1,6 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 4f04acacb42d410d7002cae3e2bb6c51d47331d6 Mon Sep 17 00:00:00 2001
 From: Daniel Turull <daniel.turull@ericsson.com>
-Date: Mon, 23 Jun 2026 12:00:00 +0200
+Date: Tue, 23 Jun 2026 12:00:00 +0200
 Subject: [PATCH] Handle missing STATX_MNT_ID on older kernels
 
 On hosts lacking STATX_MNT_ID (kernel < 5.8, e.g. RHEL 8), native tools
@@ -22,24 +22,55 @@ Upstream-Status: Inappropriate [oe specific]
 Assisted-by: kiro:claude-opus-4.6
 Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
 ---
- src/basic/chase.c   | 20 ++++++++++++++-
- src/basic/fd-util.c | 63 +++++++++++++++++++++++++++++++++++++++++++--
+ src/basic/chase.c   | 21 +++++++++++++++-
+ src/basic/fd-util.c | 61 +++++++++++++++++++++++++++++++++++++++++++--
  src/basic/fd-util.h |  1 +
- 3 files changed, 82 insertions(+), 2 deletions(-)
+ 3 files changed, 80 insertions(+), 3 deletions(-)
 
---- a/src/basic/fd-util.h	2026-06-25 14:01:12.009875526 +0200
-+++ b/src/basic/fd-util.h	2026-06-25 14:01:20.909060415 +0200
-@@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(
- }
- 
- int fds_inode_and_mount_same(int fd1, int fd2);
-+int fd_get_mount_id(int fd, uint64_t *ret);
+diff --git a/src/basic/chase.c b/src/basic/chase.c
+index 23a523798e..08ef95b3dd 100644
+--- a/src/basic/chase.c
++++ b/src/basic/chase.c
+@@ -40,7 +40,9 @@
+         (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCKET)
  
- int resolve_xat_fdroot(int *fd, const char **path, char **ret_buffer);
+ static int chase_statx(int fd, struct statx *ret) {
+-        return xstatx_full(fd,
++        int r;
++
++        r = xstatx_full(fd,
+                         /* path= */ NULL,
+                         /* statx_flags= */ 0,
+                         XSTATX_MNT_ID_BEST,
+@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct statx *ret) {
+                         /* optional_mask= */ 0,
+                         /* mandatory_attributes= */ 0,
+                         ret);
++        if (r == -EUNATCH) {
++                uint64_t mnt_id;
++
++                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdinfo. */
++                r = xstatx(fd, /* path= */ NULL, /* statx_flags= */ 0,
++                           STATX_TYPE|STATX_UID|STATX_INO,
++                           ret);
++                if (r < 0)
++                        return r;
++                r = fd_get_mount_id(fd, &mnt_id);
++                if (r < 0)
++                        return r;
++                ret->stx_mnt_id = mnt_id;
++                ret->stx_mask |= STATX_MNT_ID;
++        }
++
++        return r;
+ }
  
---- a/src/basic/fd-util.c	2026-06-25 14:01:12.011875567 +0200
-+++ b/src/basic/fd-util.c	2026-06-25 14:01:40.007456905 +0200
-@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const ch
+ static int chase_openat2(int root_fd, int dir_fd, const char *path, ChaseFlags chase_flags) {
+diff --git a/src/basic/fd-util.c b/src/basic/fd-util.c
+index c6e78c59b6..7f33d900e5 100644
+--- a/src/basic/fd-util.c
++++ b/src/basic/fd-util.c
+@@ -1082,6 +1082,38 @@ int path_is_root_at(int dir_fd, const char *path) {
          return fds_inode_and_mount_same(dir_fd, XAT_FDROOT);
  }
  
@@ -78,7 +109,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
  int fds_inode_and_mount_same(int fd1, int fd2) {
          struct statx sx1, sx2;
          int r;
-@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, in
+@@ -1092,7 +1124,20 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r = xstatx(fd1, /* path = */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx1);
@@ -100,7 +131,7 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
                  return r;
  
          if (fd1 == fd2) /* Shortcut things if fds are the same (only after validating the fd) */
-@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, in
+@@ -1101,7 +1146,19 @@ int fds_inode_and_mount_same(int fd1, int fd2) {
          r = xstatx(fd2, /* path = */ NULL, AT_EMPTY_PATH,
                     STATX_TYPE|STATX_INO|STATX_MNT_ID,
                     &sx2);
@@ -121,40 +152,15 @@ Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
                  return r;
  
          r = statx_mount_same(&sx1, &sx2);
---- a/src/basic/chase.c	2026-06-25 14:01:12.013875609 +0200
-+++ b/src/basic/chase.c	2026-06-25 14:01:47.117604514 +0200
-@@ -40,7 +40,9 @@
-         (CHASE_MUST_BE_DIRECTORY|CHASE_MUST_BE_REGULAR|CHASE_MUST_BE_SOCKET)
- 
- static int chase_statx(int fd, struct statx *ret) {
--        return xstatx_full(fd,
-+        int r;
-+
-+        r = xstatx_full(fd,
-                         /* path= */ NULL,
-                         /* statx_flags= */ 0,
-                         XSTATX_MNT_ID_BEST,
-@@ -48,6 +50,23 @@ static int chase_statx(int fd, struct st
-                         /* optional_mask= */ 0,
-                         /* mandatory_attributes= */ 0,
-                         ret);
-+        if (r == -EUNATCH) {
-+                uint64_t mnt_id;
-+
-+                /* Kernel lacks STATX_MNT_ID; fall back to /proc/self/fdinfo. */
-+                r = xstatx(fd, /* path= */ NULL, /* statx_flags= */ 0,
-+                           STATX_TYPE|STATX_UID|STATX_INO,
-+                           ret);
-+                if (r < 0)
-+                        return r;
-+                r = fd_get_mount_id(fd, &mnt_id);
-+                if (r < 0)
-+                        return r;
-+                ret->stx_mnt_id = mnt_id;
-+                ret->stx_mask |= STATX_MNT_ID;
-+        }
-+
-+        return r;
+diff --git a/src/basic/fd-util.h b/src/basic/fd-util.h
+index 86bddb6dac..34370c8943 100644
+--- a/src/basic/fd-util.h
++++ b/src/basic/fd-util.h
+@@ -188,6 +188,7 @@ static inline int dir_fd_is_root_or_cwd(int dir_fd) {
  }
  
- static int chase_openat2(int root_fd, int dir_fd, const char *path, ChaseFlags chase_flags) {
+ int fds_inode_and_mount_same(int fd1, int fd2);
++int fd_get_mount_id(int fd, uint64_t *ret);
+ 
+ int resolve_xat_fdroot(int *fd, const char **path, char **ret_buffer);
+ 
diff --git a/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch b/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch
deleted file mode 100644
index 8eb9f5c164..0000000000
--- a/meta/recipes-core/systemd/systemd/a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From a019396d2c5bc1adb6b044e7784a30b7187f6fbd Mon Sep 17 00:00:00 2001
-From: Luca Boccassi <luca.boccassi@gmail.com>
-Date: Wed, 2 Sep 2026 20:32:51 +0100
-Subject: [PATCH] tools: fix building manpages with lxml 6.1.3
-
-manpages build fails on Arch with new lxml:
-
-Traceback (most recent call last):
-  File "/work/src/tools/make-directive-index.py", line 169, in make_page
-    _extract_directives(directive_groups, formatting, page)
-    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-  File "/work/src/tools/make-directive-index.py", line 18, in _extract_directives
-    t = xml_parse(page)
-  File "/work/src/tools/xml_helper.py", line 25, in xml_parse
-    doc = tree.parse(page, _parser)
-  File "src/lxml/etree.pyx", line 3717, in lxml.etree.parse
-  File "src/lxml/parser.pxi", line 2045, in lxml.etree._parseDocument
-  File "src/lxml/parser.pxi", line 2071, in lxml.etree._parseDocumentFromURL
-  File "src/lxml/parser.pxi", line 1962, in lxml.etree._parseDocFromFile
-  File "src/lxml/parser.pxi", line 1231, in lxml.etree._BaseParser._parseDocFromFile
-  File "src/lxml/parser.pxi", line 647, in lxml.etree._ParserContext._handleParseResultDoc
-  File "src/lxml/parser.pxi", line 765, in lxml.etree._handleParseResult
-  File "src/lxml/parser.pxi", line 689, in lxml.etree._raiseParseError
-  File "../src/man/hostname.xml", line 5
-lxml.etree.XMLSyntaxError: Entity 'entities' not defined, line 5, column 11
-
-The above exception was the direct cause of the following exception:
-
-Traceback (most recent call last):
-  File "/work/src/tools/make-directive-index.py", line 180, in <module>
-    _xml = make_page(_template_path, _xml_files)
-  File "/work/src/tools/make-directive-index.py", line 171, in make_page
-    raise ValueError('failed to process ' + page) from e
-ValueError: failed to process ../src/man/hostname.xml
-
-Relying on XMLParser() defaults leaves the external parameter entity
-used to load custom-entities.ent unresolved. Request entity resolution explicitly.
-
-Follow-up for 1a13e31d275430ffba713c8a68ee7f22093c29e0
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/a019396d2c5bc1adb6b044e7784a30b7187f6fbd]
-
----
- tools/xml_helper.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/xml_helper.py b/tools/xml_helper.py
-index 87c24ab02a0f..e26ca92d9454 100755
---- a/tools/xml_helper.py
-+++ b/tools/xml_helper.py
-@@ -16,7 +16,7 @@ def resolve(self, url, _id, context):
-         return None
- 
- 
--_parser = tree.XMLParser()
-+_parser = tree.XMLParser(resolve_entities=True)
- # pylint: disable=no-member
- _parser.resolvers.add(CustomResolver())
- 
diff --git a/meta/recipes-core/systemd/systemd_261.2.bb b/meta/recipes-core/systemd/systemd_261.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_261.2.bb
rename to meta/recipes-core/systemd/systemd_261.3.bb
index 68b894be9a..1a256a598a 100644
--- a/meta/recipes-core/systemd/systemd_261.2.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -27,8 +27,7 @@ CONFLICT_DISTRO_FEATURES += "sysvinit"
 # so that systemctl can be used in postinst scripts
 PACKAGE_WRITE_DEPS += "systemd-tools-native"
 
-SRC_URI += " \
-           file://touchscreen.rules \
+SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://org.freedesktop.hostname1_no_polkit.conf \
            file://00-hostnamed-network-user.conf \
@@ -37,7 +36,6 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch \
            "
 
 PAM_PLUGINS = " \
-- 
2.47.1


--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-tools-native-changelog.txt"

Changelog for systemd-tools-native: 261.2 -> 261.3
Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd.git;protocol=https;branch=v261-stable;tag=v261.2" to "git://github.com/systemd/systemd.git;protocol=https;branch=v261-stable;tag=v261.3"
packages/qemux86_64-poky-linux/systemd-boot: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-src: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "261.2" to "261.3"
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot: PKGV changed from 261.2 [default] to 261.3 [default]
packages/qemux86_64-poky-linux/systemd-boot/systemd-boot: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd: SRC_URI changed from "git://github.com/systemd/systemd.git;protocol=https;branch=v261-stable;tag=v261.2 file://touchscreen.rules file://00-create-volatile.conf file://org.freedesktop.hostname1_no_polkit.conf file://00-hostnamed-network-user.conf file://init file://99-default.preset file://systemd-pager.sh file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch file://0003-Do-not-create-var-log-README.patch file://a019396d2c5bc1adb6b044e7784a30b7187f6fbd.patch" to "git://github.com/systemd/systemd.git;protocol=https;branch=v261-stable;tag=v261.3 file://touchscreen.rules file://00-create-volatile.conf file://org.freedesktop.hostname1_no_polkit.conf file://00-hostnamed-network-user.conf file://init file://99-default.preset file://systemd-pager.sh file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch file://0003-Do-not-create-var-log-README.patch"
packages/x86-64-v3-poky-linux/systemd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libnss-myhostname: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-myhostname: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libnss-mymachines: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-mymachines: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libnss-resolve: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-resolve: PKGSIZE changed from 1698784 to 1702880 (+0%)
packages/x86-64-v3-poky-linux/systemd/libnss-resolve: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PKGSIZE changed from 2075704 to 2079800 (+0%)
packages/x86-64-v3-poky-linux/systemd/libnss-systemd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PKGSIZE changed from 5279968 to 5288160 (+0%)
packages/x86-64-v3-poky-linux/systemd/libsystemd-shared: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libsystemd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libsystemd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/libudev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/libudev: PV changed from "261.2" to "261.3"
Changes to packages/x86-64-v3-poky-linux/systemd (sysroot):
  /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a14-ux3407na.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a16-ux3607oa.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-crd.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-hp-elitebook-x-g2q.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-lenovo-yoga-slim7x.json was added
  /usr/lib/systemd/boot/hwids/aa64/purwa-lenovo-ideacentre-mini-01q8x10.json was added
  /usr/lib/systemd/boot/hwids/aa64/sc7180-ecs-liva-qc710.json was added
  /usr/lib/systemd/boot/hwids/aa64/sc8280xp-radxa-dragon-q8b.json was added
  /usr/lib/systemd/boot/hwids/aa64/x126100-lenovo-ideapad-slim3.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1e80100-honor-magicbook-art-14.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1p42100-hp-elitebook-6-g1q.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1p64100-dell-latitude-5455.json was added
  /usr/lib/udev/rules.d/60-tpm2-id.rules was removed
packages/x86-64-v3-poky-linux/systemd/systemd-analyze: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-analyze: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-bash-completion: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-bash-completion: PKGSIZE changed from 142265 to 142528 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-bash-completion: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-binfmt: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-binfmt: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-container: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-container: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-crypt: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-crypt: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 105435608 to 105592976 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-dbg: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-dev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-dev: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PKGSIZE changed from 1414348 to 1414499 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-doc: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-extra-utils: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-extra-utils: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-gui: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-gui: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-initramfs: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-initramfs: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-gatewayd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-gatewayd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-remote: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-remote: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-journal-upload: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-journal-upload: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PKGSIZE changed from 83154 to 83704 (+1%)
packages/x86-64-v3-poky-linux/systemd/systemd-kernel-install: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ar: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ar: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be+latin: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be+latin: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-be: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bg: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bg: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bo: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-bo: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ca: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ca: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-cs: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-cs: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-da: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-da: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-de: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-de: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-el: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-el: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eo: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eo: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-es: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-es: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-et: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-et: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eu: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-eu: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fi: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fi: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fr: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-fr: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-gl: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-gl: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-he: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-he: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hi: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hi: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hr: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hr: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hu: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-hu: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ia: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ia: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-id: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-id: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-it: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-it: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ja: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ja: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ka: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ka: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kab: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kab: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kk: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kk: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-km: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-km: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kn: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kn: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ko: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ko: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kw: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-kw: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lo: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lo: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lt: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-lt: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nb-no: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nb-no: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nl: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-nl: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pa: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pa: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pl: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pl: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt-br: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt-br: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-pt: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ro: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ro: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ru: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ru: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-si: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-si: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sk: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sk: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sl: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sl: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr+latin: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr+latin: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sr: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sv: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-sv: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-tr: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-tr: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ug: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-ug: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-uk: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-uk: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-cn: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-cn: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-tw: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-locale-zh-tw: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-mime: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-mime: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-networkd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-networkd: PKGSIZE changed from 2508815 to 2517007 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-networkd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-rpm-macros: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-rpm-macros: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-src: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-src: FILELIST: directory renamed /usr/src/debug/systemd/261.2/src/network/generator -> /usr/src/debug/systemd/261.3/src/network/generator, directory renamed /usr/src/debug/systemd/261.2/src/udev/scsi_id -> /usr/src/debug/systemd/261.3/src/udev/scsi_id, directory renamed /usr/src/debug/systemd/261.2/src/libc -> /usr/src/debug/systemd/261.3/src/libc, directory renamed /usr/src/debug/systemd/261.2/src/udev/cdrom_id -> /usr/src/debug/systemd/261.3/src/udev/cdrom_id, directory renamed /usr/src/debug/systemd/261.2/src/run -> /usr/src/debug/systemd/261.3/src/run, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-login -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-login, directory renamed /usr/src/debug/systemd/261.2/src/journal -> /usr/src/debug/systemd/261.3/src/journal, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-netlink -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-netlink, directory renamed /usr/sr
 c/debug/systemd/261.2/src/reply-password -> /usr/src/debug/systemd/261.3/src/reply-password, directory renamed /usr/src/debug/systemd/261.2/src/mount -> /usr/src/debug/systemd/261.3/src/mount, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-event -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-event, directory renamed /usr/src/debug/systemd/261.2/src/bootctl -> /usr/src/debug/systemd/261.3/src/bootctl, directory renamed /usr/src/debug/systemd/261.2/src/tmpfiles -> /usr/src/debug/systemd/261.3/src/tmpfiles, directory renamed /usr/src/debug/systemd/261.2/src/socket-activate -> /usr/src/debug/systemd/261.3/src/socket-activate, directory renamed /usr/src/debug/systemd/261.2/src/rfkill -> /usr/src/debug/systemd/261.3/src/rfkill, directory renamed /usr/src/debug/systemd/261.2/src/nss-resolve -> /usr/src/debug/systemd/261.3/src/nss-resolve, directory renamed /usr/src/debug/systemd/261.2/src/hostname -> /usr/src/debug/systemd/261.3/src/hostname, directory renamed /usr/src
 /debug/systemd/261.2/src/getty-generator -> /usr/src/debug/systemd/261.3/src/getty-generator, directory renamed /usr/src/debug/systemd/261.2/src/environment-d-generator -> /usr/src/debug/systemd/261.3/src/environment-d-generator, directory renamed /usr/src/debug/systemd/261.2/src/timedate -> /usr/src/debug/systemd/261.3/src/timedate, directory renamed /usr/src/debug/systemd/261.2/src/timesync -> /usr/src/debug/systemd/261.3/src/timesync, directory renamed /usr/src/debug/systemd/261.2/src/vconsole -> /usr/src/debug/systemd/261.3/src/vconsole, directory renamed /usr/src/debug/systemd/261.2/src/creds -> /usr/src/debug/systemd/261.3/src/creds, directory renamed /usr/src/debug/systemd/261.2/src/user-sessions -> /usr/src/debug/systemd/261.3/src/user-sessions, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-bus -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-bus, directory renamed /usr/src/debug/systemd/261.2/src/include/uapi/linux/netfilter -> /usr/src/debug/systemd/261
 .3/src/include/uapi/linux/netfilter, directory renamed /usr/src/debug/systemd/261.2/src/login -> /usr/src/debug/systemd/261.3/src/login, directory renamed /usr/src/debug/systemd/261.2/src/system-update-generator -> /usr/src/debug/systemd/261.3/src/system-update-generator, directory renamed /usr/src/debug/systemd/261.2/src/storage -> /usr/src/debug/systemd/261.3/src/storage, directory renamed /usr/src/debug/systemd/261.2/src/udev/fido_id -> /usr/src/debug/systemd/261.3/src/udev/fido_id, directory renamed /usr/src/debug/systemd/261.2/src/busctl -> /usr/src/debug/systemd/261.3/src/busctl, directory renamed /usr/src/debug/systemd/261.2/src/fsck -> /usr/src/debug/systemd/261.3/src/fsck, directory renamed /usr/src/debug/systemd/261.2/src/sleep -> /usr/src/debug/systemd/261.3/src/sleep, directory renamed /usr/src/debug/systemd/261.2/src/growfs -> /usr/src/debug/systemd/261.3/src/growfs, directory renamed /usr/src/debug/systemd/261.2/src/userdb -> /usr/src/debug/systemd/261.3/src/userdb, di
 rectory renamed /usr/src/debug/systemd/261.2/src/udev/iocost -> /usr/src/debug/systemd/261.3/src/udev/iocost, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-journal -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-journal, directory renamed /usr/src/debug/systemd/261.2/src/stdio-bridge -> /usr/src/debug/systemd/261.3/src/stdio-bridge, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-common -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-common, directory renamed /usr/src/debug/systemd/261.2/src/include/override -> /usr/src/debug/systemd/261.3/src/include/override, directory renamed /usr/src/debug/systemd/261.2/src/ssh-generator -> /usr/src/debug/systemd/261.3/src/ssh-generator, directory renamed /usr/src/debug/systemd/261.2/src/kernel-install -> /usr/src/debug/systemd/261.3/src/kernel-install, directory renamed /usr/src/debug/systemd/261.2/src/hwdb -> /usr/src/debug/systemd/261.3/src/hwdb, directory renamed /usr/src/debug/systemd/261.2/src/libsys
 temd/sd-json -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-json, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-id128 -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-id128, directory renamed /usr/src/debug/systemd/261.2/src/sulogin-shell -> /usr/src/debug/systemd/261.3/src/sulogin-shell, directory renamed /usr/src/debug/systemd/261.2/src/journal-remote -> /usr/src/debug/systemd/261.3/src/journal-remote, directory renamed /usr/src/debug/systemd/261.2/src/locale -> /usr/src/debug/systemd/261.3/src/locale, directory renamed /usr/src/debug/systemd/261.2/src/quotacheck -> /usr/src/debug/systemd/261.3/src/quotacheck, directory renamed /usr/src/debug/systemd/261.2/src/vpick -> /usr/src/debug/systemd/261.3/src/vpick, directory renamed /usr/src/debug/systemd/261.2/src/systemd -> /usr/src/debug/systemd/261.3/src/systemd, directory renamed /usr/src/debug/systemd/261.2/src/udev -> /usr/src/debug/systemd/261.3/src/udev, directory renamed /usr/src/debug/systemd/261.2/src/u
 dev/dmi_memory_id -> /usr/src/debug/systemd/261.3/src/udev/dmi_memory_id, directory renamed /usr/src/debug/systemd/261.2/src/machine -> /usr/src/debug/systemd/261.3/src/machine, directory renamed /usr/src/debug/systemd/261.2/src/nspawn -> /usr/src/debug/systemd/261.3/src/nspawn, directory renamed /usr/src/debug/systemd/261.2/src/include/override/sys -> /usr/src/debug/systemd/261.3/src/include/override/sys, directory renamed /usr/src/debug/systemd/261.2/src/network/netdev -> /usr/src/debug/systemd/261.3/src/network/netdev, directory renamed /usr/src/debug/systemd/261.2/src/bless-boot -> /usr/src/debug/systemd/261.3/src/bless-boot, directory renamed /usr/src/debug/systemd/261.2/src/delta -> /usr/src/debug/systemd/261.3/src/delta, directory renamed /usr/src/debug/systemd/261.2/src/gpt-auto-generator -> /usr/src/debug/systemd/261.3/src/gpt-auto-generator, directory renamed /usr/src/debug/systemd/261.2/src/include/uapi/linux/sched -> /usr/src/debug/systemd/261.3/src/include/uapi/linux/sc
 hed, directory renamed /usr/src/debug/systemd/261.2/src/update-done -> /usr/src/debug/systemd/261.3/src/update-done, directory renamed /usr/src/debug/systemd/261.2/src/ptyfwd -> /usr/src/debug/systemd/261.3/src/ptyfwd, directory renamed /usr/src/debug/systemd/261.2/src/varlinkctl -> /usr/src/debug/systemd/261.3/src/varlinkctl, directory renamed /usr/src/debug/systemd/261.2/src/sysinstall -> /usr/src/debug/systemd/261.3/src/sysinstall, directory renamed /usr/src/debug/systemd/261.2/src/nss-myhostname -> /usr/src/debug/systemd/261.3/src/nss-myhostname, directory renamed /usr/src/debug/systemd/261.2/src/fundamental -> /usr/src/debug/systemd/261.3/src/fundamental, directory renamed /usr/src/debug/systemd/261.2/src/machine-id-setup -> /usr/src/debug/systemd/261.3/src/machine-id-setup, directory renamed /usr/src/debug/systemd/261.2/src/include/override/linux -> /usr/src/debug/systemd/261.3/src/include/override/linux, directory renamed /usr/src/debug/systemd/261.2/src/network/tc -> /usr/sr
 c/debug/systemd/261.3/src/network/tc, directory renamed /usr/src/debug/systemd/261.2/src/storagetm -> /usr/src/debug/systemd/261.3/src/storagetm, directory renamed /usr/src/debug/systemd/261.2/src/systemctl -> /usr/src/debug/systemd/261.3/src/systemctl, directory renamed /usr/src/debug/systemd/261.2/src/include/uapi/linux/can -> /usr/src/debug/systemd/261.3/src/include/uapi/linux/can, directory renamed /usr/src/debug/systemd/261.2/src/random-seed -> /usr/src/debug/systemd/261.3/src/random-seed, directory renamed /usr/src/debug/systemd/261.2/src/backlight -> /usr/src/debug/systemd/261.3/src/backlight, directory renamed /usr/src/debug/systemd/261.2/src/ac-power -> /usr/src/debug/systemd/261.3/src/ac-power, directory renamed /usr/src/debug/systemd/261.2/src/sysusers -> /usr/src/debug/systemd/261.3/src/sysusers, directory renamed /usr/src/debug/systemd/261.2/src/coredump -> /usr/src/debug/systemd/261.3/src/coredump, directory renamed /usr/src/debug/systemd/261.2/src/id128 -> /usr/src/de
 bug/systemd/261.3/src/id128, directory renamed /usr/src/debug/systemd/261.2/src/shutdown -> /usr/src/debug/systemd/261.3/src/shutdown, directory renamed /usr/src/debug/systemd/261.2/src/udev/ata_id -> /usr/src/debug/systemd/261.3/src/udev/ata_id, directory renamed /usr/src/debug/systemd/261.2/src/udev/net -> /usr/src/debug/systemd/261.3/src/udev/net, directory renamed /usr/src/debug/systemd/261.2/src/hibernate-resume -> /usr/src/debug/systemd/261.3/src/hibernate-resume, directory renamed /usr/src/debug/systemd/261.2/src/udev/v4l_id -> /usr/src/debug/systemd/261.3/src/udev/v4l_id, directory renamed /usr/src/debug/systemd/261.2/src/include/override/net -> /usr/src/debug/systemd/261.3/src/include/override/net, directory renamed /usr/src/debug/systemd/261.2/src/debug-generator -> /usr/src/debug/systemd/261.3/src/debug-generator, directory renamed /usr/src/debug/systemd/261.2/src/fstab-generator -> /usr/src/debug/systemd/261.3/src/fstab-generator, directory renamed /usr/src/debug/systemd
 /261.2/src/network -> /usr/src/debug/systemd/261.3/src/network, directory renamed /usr/src/debug/systemd/261.2/src/factory-reset -> /usr/src/debug/systemd/261.3/src/factory-reset, directory renamed /usr/src/debug/systemd/261.2/src/escape -> /usr/src/debug/systemd/261.3/src/escape, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-future -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-future, directory renamed /usr/src/debug/systemd/261.2/src/report -> /usr/src/debug/systemd/261.3/src/report, directory renamed /usr/src/debug/systemd/261.2/src/mstack -> /usr/src/debug/systemd/261.3/src/mstack, directory renamed /usr/src/debug/systemd/261.2/src/path -> /usr/src/debug/systemd/261.3/src/path, directory renamed /usr/src/debug/systemd/261.2/src/libudev -> /usr/src/debug/systemd/261.3/src/libudev, directory renamed /usr/src/debug/systemd/261.2/src/battery-check -> /usr/src/debug/systemd/261.3/src/battery-check, directory renamed /usr/src/debug/systemd/261.2/src/notify -> /u
 sr/src/debug/systemd/261.3/src/notify, directory renamed /usr/src/debug/systemd/261.2/src/validatefs -> /usr/src/debug/systemd/261.3/src/validatefs, directory renamed /usr/src/debug/systemd/261.2/src/analyze -> /usr/src/debug/systemd/261.3/src/analyze, directory renamed /usr/src/debug/systemd/261.2/src/binfmt -> /usr/src/debug/systemd/261.3/src/binfmt, directory renamed /usr/src/debug/systemd/261.2/src/ask-password -> /usr/src/debug/systemd/261.3/src/ask-password, directory renamed /usr/src/debug/systemd/261.2/src/detect-virt -> /usr/src/debug/systemd/261.3/src/detect-virt, directory renamed /usr/src/debug/systemd/261.2/src/cgtop -> /usr/src/debug/systemd/261.3/src/cgtop, directory renamed /usr/src/debug/systemd/261.2/src/include/uapi/linux/hdlc -> /usr/src/debug/systemd/261.3/src/include/uapi/linux/hdlc, directory renamed /usr/src/debug/systemd/261.2/src/nss-systemd -> /usr/src/debug/systemd/261.3/src/nss-systemd, directory renamed /usr/src/debug/systemd/261.2/src/run-generator -> 
 /usr/src/debug/systemd/261.3/src/run-generator, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-resolve -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-resolve, directory renamed /usr/src/debug/systemd/261.2/src/include/override/netinet -> /usr/src/debug/systemd/261.3/src/include/override/netinet, directory renamed /usr/src/debug/systemd/261.2/src/udev/mtd_probe -> /usr/src/debug/systemd/261.3/src/udev/mtd_probe, directory renamed /usr/src/debug/systemd/261.2/src/modules-load -> /usr/src/debug/systemd/261.3/src/modules-load, directory renamed /usr/src/debug/systemd/261.2/src/dissect -> /usr/src/debug/systemd/261.3/src/dissect, directory renamed /usr/src/debug/systemd/261.2/src/nss-mymachines -> /usr/src/debug/systemd/261.3/src/nss-mymachines, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-daemon -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-daemon, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-hwdb -> /usr/src/debug/systemd
 /261.3/src/libsystemd/sd-hwdb, directory renamed /usr/src/debug/systemd/261.2/src/sysctl -> /usr/src/debug/systemd/261.3/src/sysctl, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-path -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-path, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-device -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-device, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-varlink -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-varlink, directory renamed /usr/src/debug/systemd/261.2/src/core -> /usr/src/debug/systemd/261.3/src/core, directory renamed /usr/src/debug/systemd/261.2/src/cgls -> /usr/src/debug/systemd/261.3/src/cgls, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd/sd-network -> /usr/src/debug/systemd/261.3/src/libsystemd/sd-network, directory renamed /usr/src/debug/systemd/261.2/src/socket-proxy -> /usr/src/debug/systemd/261.3/src/socket-proxy, directory renamed /usr/src/debug/s
 ystemd/261.2/src/shared -> /usr/src/debug/systemd/261.3/src/shared, directory renamed /usr/src/debug/systemd/261.2/src/resolve -> /usr/src/debug/systemd/261.3/src/resolve, directory renamed /usr/src/debug/systemd/261.2/src/update-utmp -> /usr/src/debug/systemd/261.3/src/update-utmp, directory renamed /usr/src/debug/systemd/261.2/src/mute-console -> /usr/src/debug/systemd/261.3/src/mute-console, directory renamed /usr/src/debug/systemd/261.2/src/remount-fs -> /usr/src/debug/systemd/261.3/src/remount-fs, directory renamed /usr/src/debug/systemd/261.2/src/volatile-root -> /usr/src/debug/systemd/261.3/src/volatile-root, directory renamed /usr/src/debug/systemd/261.2/src/libsystemd-network -> /usr/src/debug/systemd/261.3/src/libsystemd-network, directory renamed /usr/src/debug/systemd/261.2/src/network/wait-online -> /usr/src/debug/systemd/261.3/src/network/wait-online, directory renamed /usr/src/debug/systemd/261.2/src/basic -> /usr/src/debug/systemd/261.3/src/basic, directory renamed /
 usr/src/debug/systemd/261.2/src/tty-ask-password-agent -> /usr/src/debug/systemd/261.3/src/tty-ask-password-agent, removed "/usr/src/debug/systemd/261.2/src/include/uapi/linux/nexthop.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/socket.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/vm_sockets.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/in.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_vlan.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/neighbour.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_bridge.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/nl80211.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/fs.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_addr.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_packet.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/netfilter_ipv4.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/auto_dev-ioctl.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/gen
 etlink.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/rtnetlink.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/openat2.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/mempolicy.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/btrfs_tree.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/capability.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_link.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_arp.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/netlink.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/input.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/liveupdate.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/mount.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/fib_rules.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/auto_fs.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/dm-ioctl.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/bpf.h /usr/src/debug/systemd/261.2/src/include/uapi/linux
 /btrfs.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/fou.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_tunnel.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/in6.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/wireguard.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/xattr.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/ioprio.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/net_namespace.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/loop.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/batman_adv.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/ethtool.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/stat.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/veth.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/ipv6.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/fsverity.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_addrlabel.h /usr/
 src/debug/systemd/261.2/src/include/uapi/linux/netfilter.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/pkt_sched.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/if_macsec.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/l2tp.h /usr/src/debug/systemd/261.2/src/include/uapi/linux/filter.h", added "/usr/src/debug/systemd/261.3/src/include/uapi/linux/nexthop.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/socket.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/vm_sockets.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/in.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_vlan.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/neighbour.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_bridge.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/nl80211.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/pidfd.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/fs.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_addr.h /usr/
 src/debug/systemd/261.3/src/include/uapi/linux/if_packet.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/netfilter_ipv4.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/auto_dev-ioctl.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/genetlink.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/rtnetlink.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/openat2.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/mempolicy.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/btrfs_tree.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/capability.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_link.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_arp.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/netlink.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/input.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/liveupdate.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/mount.h /usr/src/debug/systemd/261.3/src/include/uapi/
 linux/fib_rules.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/auto_fs.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/dm-ioctl.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/bpf.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/btrfs.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/fou.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_tunnel.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/in6.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/wireguard.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/xattr.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/ioprio.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/net_namespace.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/loop.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/batman_adv.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/ethtool.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/stat.h /
 usr/src/debug/systemd/261.3/src/include/uapi/linux/veth.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/ipv6.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/fsverity.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_addrlabel.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/netfilter.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/pkt_sched.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/if_macsec.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/l2tp.h /usr/src/debug/systemd/261.3/src/include/uapi/linux/filter.h"
packages/x86-64-v3-poky-linux/systemd/systemd-src: PKGSIZE changed from 30436569 to 30519050 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-src: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-staticdev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-staticdev: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-udev-rules: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-udev-rules: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PKGSIZE changed from 93602 to 93708 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-ukify: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-vconsole-setup: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-vconsole-setup: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd-zsh-completion: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd-zsh-completion: PKGSIZE changed from 134178 to 134528 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd-zsh-completion: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/systemd: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/systemd: FILELIST: added "/usr/lib/systemd/boot/hwids/aa64/glymur-lenovo-yoga-slim7x.json /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a14-ux3407na.json /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a16-ux3607oa.json /usr/lib/systemd/boot/hwids/aa64/x1e80100-honor-magicbook-art-14.json /usr/lib/systemd/boot/hwids/aa64/purwa-lenovo-ideacentre-mini-01q8x10.json /usr/lib/systemd/boot/hwids/aa64/glymur-hp-elitebook-x-g2q.json /usr/lib/systemd/boot/hwids/aa64/sc8280xp-radxa-dragon-q8b.json /usr/lib/systemd/boot/hwids/aa64/glymur-crd.json /usr/lib/systemd/boot/hwids/aa64/x1p42100-hp-elitebook-6-g1q.json /usr/lib/systemd/boot/hwids/aa64/x1p64100-dell-latitude-5455.json /usr/lib/systemd/boot/hwids/aa64/x126100-lenovo-ideapad-slim3.json /usr/lib/systemd/boot/hwids/aa64/sc7180-ecs-liva-qc710.json"
packages/x86-64-v3-poky-linux/systemd/systemd: PKGSIZE changed from 11480667 to 11511017 (+0%)
packages/x86-64-v3-poky-linux/systemd/systemd: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/udev-bash-completion: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/udev-bash-completion: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PKGSIZE changed from 9531054 to 9611374 (+1%)
packages/x86-64-v3-poky-linux/systemd/udev-hwdb: PV changed from "261.2" to "261.3"
packages/x86-64-v3-poky-linux/systemd/udev: PKGV changed from 261.2 [default] to 261.3 [default]
packages/x86-64-v3-poky-linux/systemd/udev: FILELIST: removed "/usr/lib/udev/rules.d/60-tpm2-id.rules"
packages/x86-64-v3-poky-linux/systemd/udev: PKGSIZE changed from 1093297 to 1092983 (-0%)
packages/x86-64-v3-poky-linux/systemd/udev: PV changed from "261.2" to "261.3"

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-changelog.txt"

Changelog for systemd-boot: 261.2 -> 261.3
Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

--===============7421859077018539915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-systemd-tools-native-systemd-boot-systemd-bo.patch"

RnJvbSBiMjIzYTYyZGQyM2RhYmMwMDkyNTZjYTJiOGQwN2FhNmI0YWYxODNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDU6MTM6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IHN5c3RlbWQsc3lzdGVtZC10b29scy1uYXRpdmUsc3lzdGVtZC1ib290LHN5c3RlbWQtYm9vdC1u
YXRpdmU6IHVwZ3JhZGUgMjYxLjIKIC0+IDI2MS4zLDI2MS4yIC0+IDI2MS4zLDI2MS4yIC0+IDI2
MS4zLDI2MS4yIC0+IDI2MS4zCgpTb3VyY2U6IE5FV1MKCiogVGhlIHJlc29sdmNvbmYgY29tcGF0
aWJpbGl0eSBtb2RlIG5vdyByZWplY3RzIG1hbGZvcm1lZCBzdGRpbiBpbnB1dAogICAgICAgICAg
YW5kIGxlYXZlcyB0aGUgZXhpc3RpbmcgcGVyLWxpbmsgRE5TIGNvbmZpZ3VyYXRpb24gdW5jaGFu
Z2VkLgoKU291cmNlOiBORVdTCgoqIFRoZSByZXNvbHZjb25mIGNvbXBhdGliaWxpdHkgbW9kZSBu
b3cgcmVqZWN0cyBtYWxmb3JtZWQgc3RkaW4gaW5wdXQKICAgICAgICAgIGFuZCBsZWF2ZXMgdGhl
IGV4aXN0aW5nIHBlci1saW5rIEROUyBjb25maWd1cmF0aW9uIHVuY2hhbmdlZC4KClNvdXJjZTog
TkVXUwoKKiBUaGUgcmVzb2x2Y29uZiBjb21wYXRpYmlsaXR5IG1vZGUgbm93IHJlamVjdHMgbWFs
Zm9ybWVkIHN0ZGluIGlucHV0CiAgICAgICAgICBhbmQgbGVhdmVzIHRoZSBleGlzdGluZyBwZXIt
bGluayBETlMgY29uZmlndXJhdGlvbiB1bmNoYW5nZWQuCgpTb3VyY2U6IE5FV1MKCiogVGhlIHJl
c29sdmNvbmYgY29tcGF0aWJpbGl0eSBtb2RlIG5vdyByZWplY3RzIG1hbGZvcm1lZCBzdGRpbiBp
bnB1dAogICAgICAgICAgYW5kIGxlYXZlcyB0aGUgZXhpc3RpbmcgcGVyLWxpbmsgRE5TIGNvbmZp
Z3VyYXRpb24gdW5jaGFuZ2VkLgotLS0KIC4uLl8yNjEuMi5iYiA9PiBzeXN0ZW1kLWJvb3QtbmF0
aXZlXzI2MS4zLmJifSB8ICAgMAogLi4ubWQtYm9vdF8yNjEuMi5iYiA9PiBzeXN0ZW1kLWJvb3Rf
MjYxLjMuYmJ9IHwgICAwCiAuLi4yNjEuMi5iYiA9PiBzeXN0ZW1kLXRvb2xzLW5hdGl2ZV8yNjEu
My5iYn0gfCAgIDAKIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMgICAgICAg
ICB8ICAgMiArLQogLi4udGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNo
IHwgIDE1ICstLQogLi4uLzAwMDMtRG8tbm90LWNyZWF0ZS12YXItbG9nLVJFQURNRS5wYXRjaCAg
IHwgICA2ICstCiAuLi5pc3NpbmctU1RBVFhfTU5UX0lELW9uLW9sZGVyLWtlcm5lbHMucGF0Y2gg
fCAxMTIgKysrKysrKysrLS0tLS0tLS0tCiAuLi4zOTZkMmM1YmMxYWRiNmIwNDRlNzc4NGEzMGI3
MTg3ZjZmYmQucGF0Y2ggfCAgNTkgLS0tLS0tLS0tCiAuLi4ve3N5c3RlbWRfMjYxLjIuYmIgPT4g
c3lzdGVtZF8yNjEuMy5iYn0gICAgfCAgIDQgKy0KIDkgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0
aW9ucygrKSwgMTI5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQve3N5c3RlbWQtYm9vdC1uYXRpdmVfMjYxLjIuYmIgPT4gc3lzdGVtZC1ib290LW5hdGl2ZV8y
NjEuMy5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVt
ZC1ib290XzI2MS4yLmJiID0+IHN5c3RlbWQtYm9vdF8yNjEuMy5iYn0gKDEwMCUpCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC10b29scy1uYXRpdmVfMjYxLjIuYmIg
PT4gc3lzdGVtZC10b29scy1uYXRpdmVfMjYxLjMuYmJ9ICgxMDAlKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC9hMDE5Mzk2ZDJjNWJjMWFkYjZi
MDQ0ZTc3ODRhMzBiNzE4N2Y2ZmJkLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC97c3lzdGVtZF8yNjEuMi5iYiA9PiBzeXN0ZW1kXzI2MS4zLmJifSAoOTklKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290LW5hdGl2ZV8yNjEu
Mi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290LW5hdGl2ZV8yNjEu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLWJvb3QtbmF0aXZlXzI2MS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdC1uYXRpdmVfMjYxLjMuYmIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI2MS4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjYxLjMuYmIKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290
XzI2MS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9v
dF8yNjEuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
LXRvb2xzLW5hdGl2ZV8yNjEuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC10b29scy1uYXRpdmVfMjYxLjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC10b29scy1uYXRpdmVfMjYxLjIuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC10b29scy1uYXRpdmVf
MjYxLjMuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5p
bmMgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCmluZGV4IDcwYzVhYzc1
OGQuLjNlZTg5ODk1OGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwpAQCAt
MTUsNyArMTUsNyBAQCBMSUNFTlNFOmxpYnN5c3RlbWQgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLkdQTDI7bWQ1PWMwOTc4NjM2MzUwMGE5
YWNjMjliMTQ3ZTZlNzJkMmM2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0Uu
TEdQTDIuMTttZDU9YmUwYWFmNGEzODBmNzNmN2UwMGI0MjBhMDA3MzY4ZjIiCiAKLVNSQ1JFViA9
ICI0OTI1ZDlmMDdmYzY5N2VmY2NkOThhOTMwNDZmZjUzNWI4ODMyNDQ1IgorU1JDUkVWID0gIjMy
NTVkYWVlMTU3MjM2NmI3NGZlOTJmMDAyYTNkNjBlY2JiMjcxMDMiCiBTUkNCUkFOQ0ggPSAidjI2
MS1zdGFibGUiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9O3RhZz12JHtQVn0iCiAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLWJpbmZtdC1Eb24t
dC1pbnN0YWxsLWRlcGVuZGVuY3ktbGlua3MtYXQtaW5zdGFsbC10aW0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBl
bmRlbmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNoCmluZGV4IDgwNjFmZjEwMDAuLmI4Mzgw
M2FhMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAx
LWJpbmZtdC1Eb24tdC1pbnN0YWxsLWRlcGVuZGVuY3ktbGlua3MtYXQtaW5zdGFsbC10aW0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtYmluZm10LURv
bi10LWluc3RhbGwtZGVwZW5kZW5jeS1saW5rcy1hdC1pbnN0YWxsLXRpbS5wYXRjaApAQCAtMSw4
ICsxLDggQEAKLUZyb20gYjFhYjU4ZDNiNGE4MTY0ZTU5Nzg0MDk3MDZkNjc2OWY1Y2ZkZTQwNCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDUxYWY0NzU1ZjBjMWRhNTUyNDk4NjgyZDkx
MGY0ZjRjNTIwOTYzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFp
LkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjEgRmViIDIwMTkgMTY6MjM6MjQgKzA4
MDAKLVN1YmplY3Q6IFtQQVRDSCAwMS8xNl0gYmluZm10OiBEb24ndCBpbnN0YWxsIGRlcGVuZGVu
Y3kgbGlua3MgYXQgaW5zdGFsbCB0aW1lCi0gZm9yIHRoZSBiaW5mbXQgc2VydmljZXMKK1N1Ympl
Y3Q6IFtQQVRDSF0gYmluZm10OiBEb24ndCBpbnN0YWxsIGRlcGVuZGVuY3kgbGlua3MgYXQgaW5z
dGFsbCB0aW1lIGZvcgorIHRoZSBiaW5mbXQgc2VydmljZXMKIAogdXNlIFtJbnN0YWxsXSBibG9j
a3Mgc28gdGhhdCB0aGV5IGdldCBjcmVhdGVkIHdoZW4gdGhlIHNlcnZpY2UgaXMgZW5hYmxlZAog
bGlrZSBhIHRyYWRpdGlvbmFsIHNlcnZpY2UuCkBAIC0yNSwxMCArMjUsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogU2NvdHQgTXVycmF5IDxzY290dC5tdXJyYXlAa29uc3Vsa28uY29tPgogIDMgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
dW5pdHMvbWVzb24uYnVpbGQgYi91bml0cy9tZXNvbi5idWlsZAotaW5kZXggNGY0N2EzYjJiZC4u
MjM3ODcwMDI1YiAxMDA2NDQKK2luZGV4IDI3ZDhlZjJmNzIuLjg2NGNhYTQ0YmIgMTAwNjQ0CiAt
LS0gYS91bml0cy9tZXNvbi5idWlsZAogKysrIGIvdW5pdHMvbWVzb24uYnVpbGQKLUBAIC0xNTQs
NyArMTU0LDYgQEAgdW5pdHMgPSBbCitAQCAtMTY4LDcgKzE2OCw2IEBAIHVuaXRzID0gWwogICAg
ICAgICAgewogICAgICAgICAgICAnZmlsZScgOiAncHJvYy1zeXMtZnMtYmluZm10X21pc2MuYXV0
b21vdW50JywKICAgICAgICAgICAgJ2NvbmRpdGlvbnMnIDogWydFTkFCTEVfQklORk1UJ10sCkBA
IC0zNiw3ICszNiw3IEBAIGluZGV4IDRmNDdhM2IyYmQuLjIzNzg3MDAyNWIgMTAwNjQ0CiAgICAg
ICAgICB9LAogICAgICAgICAgewogICAgICAgICAgICAnZmlsZScgOiAncHJvYy1zeXMtZnMtYmlu
Zm10X21pc2MubW91bnQnLAotQEAgLTI2Myw3ICsyNjIsNiBAQCB1bml0cyA9IFsKK0BAIC0yNzks
NyArMjc4LDYgQEAgdW5pdHMgPSBbCiAgICAgICAgICB7CiAgICAgICAgICAgICdmaWxlJyA6ICdz
eXN0ZW1kLWJpbmZtdC5zZXJ2aWNlLmluJywKICAgICAgICAgICAgJ2NvbmRpdGlvbnMnIDogWydF
TkFCTEVfQklORk1UJ10sCkBAIC03NCw2ICs3NCwzIEBAIGluZGV4IDMxOGJmOGVmYzIuLjZlZjY4
NDg2MWQgMTAwNjQ0CiArCiArW0luc3RhbGxdCiArV2FudGVkQnk9c3lzaW5pdC50YXJnZXQKLS0t
IAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC8wMDAzLURvLW5vdC1jcmVhdGUtdmFyLWxvZy1SRUFETUUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMy1Eby1ub3QtY3JlYXRlLXZhci1sb2ctUkVBRE1FLnBh
dGNoCmluZGV4IDAxMjhjODNkOWYuLjE3NWVjNzk1NWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAzLURvLW5vdC1jcmVhdGUtdmFyLWxvZy1SRUFETUUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDMtRG8tbm90
LWNyZWF0ZS12YXItbG9nLVJFQURNRS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTdmNmEy
OTY3MDc2NDJkMDU0NjNhZWMyMmVhM2RmY2U3ZDA2Yzk4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMGQ0YTU5NzYwNTYzODdmZjM4MDFmZGI3ZjUzZTZkMDc2MGRmMDQ3NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29t
PgogRGF0ZTogVHVlLCAyMSBKYW4gMjAyNSAwNTowMjowMCArMDEwMAogU3ViamVjdDogW1BBVENI
XSBEbyBub3QgY3JlYXRlIC92YXIvbG9nL1JFQURNRQpAQCAtMTUsNyArMTUsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3RtcGZpbGVz
LmQvbGVnYWN5LmNvbmYuaW4gYi90bXBmaWxlcy5kL2xlZ2FjeS5jb25mLmluCi1pbmRleCBjZGVm
MjFmYTliLi43ODkwYWJjZGVmIDEwMDY0NAoraW5kZXggNzAzNmMxMmI3Yy4uODAxMjBiMDRiNCAx
MDA2NDQKIC0tLSBhL3RtcGZpbGVzLmQvbGVnYWN5LmNvbmYuaW4KICsrKyBiL3RtcGZpbGVzLmQv
bGVnYWN5LmNvbmYuaW4KIEBAIC0xMyw2ICsxMywzIEBACkBAIC0yNSw1ICsyNSwzIEBAIGluZGV4
IGNkZWYyMWZhOWIuLjc4OTBhYmNkZWYgMTAwNjQ0CiAteyUgaWYgQ1JFQVRFX0xPR19ESVJTICV9
CiAtTCQgL3Zhci9sb2cvUkVBRE1FIC0gLSAtIC0gLi4vLi57e0RPQ19ESVJ9fS9SRUFETUUubG9n
cwogLXslIGVuZGlmICV9Ci0tLSAKLTIuMzQuMQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kL0hhbmRsZS1taXNzaW5nLVNUQVRYX01OVF9JRC1vbi1vbGRlci1r
ZXJuZWxzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL0hhbmRsZS1t
aXNzaW5nLVNUQVRYX01OVF9JRC1vbi1vbGRlci1rZXJuZWxzLnBhdGNoCmluZGV4IDlkNzQ4NzIw
MzQuLjdlOTY1NTBkZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC9IYW5kbGUtbWlzc2luZy1TVEFUWF9NTlRfSUQtb24tb2xkZXIta2VybmVscy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvSGFuZGxlLW1pc3NpbmctU1RB
VFhfTU5UX0lELW9uLW9sZGVyLWtlcm5lbHMucGF0Y2gKQEAgLTEsNiArMSw2IEBACi1Gcm9tIDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDRmMDRhY2FjYjQyZDQxMGQ3MDAyY2FlM2UyYmI2YzUxZDQ3MzMxZDYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxs
QGVyaWNzc29uLmNvbT4KLURhdGU6IE1vbiwgMjMgSnVuIDIwMjYgMTI6MDA6MDAgKzAyMDAKK0Rh
dGU6IFR1ZSwgMjMgSnVuIDIwMjYgMTI6MDA6MDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gSGFu
ZGxlIG1pc3NpbmcgU1RBVFhfTU5UX0lEIG9uIG9sZGVyIGtlcm5lbHMKIAogT24gaG9zdHMgbGFj
a2luZyBTVEFUWF9NTlRfSUQgKGtlcm5lbCA8IDUuOCwgZS5nLiBSSEVMIDgpLCBuYXRpdmUgdG9v
bHMKQEAgLTIyLDI0ICsyMiw1NSBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
IHNwZWNpZmljXQogQXNzaXN0ZWQtYnk6IGtpcm86Y2xhdWRlLW9wdXMtNC42CiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4KIC0tLQotIHNy
Yy9iYXNpYy9jaGFzZS5jICAgfCAyMCArKysrKysrKysrKysrKy0KLSBzcmMvYmFzaWMvZmQtdXRp
bC5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCisg
c3JjL2Jhc2ljL2NoYXNlLmMgICB8IDIxICsrKysrKysrKysrKysrKy0KKyBzcmMvYmFzaWMvZmQt
dXRpbC5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
CiAgc3JjL2Jhc2ljL2ZkLXV0aWwuaCB8ICAxICsKLSAzIGZpbGVzIGNoYW5nZWQsIDgyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisgMyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQogCi0tLS0gYS9zcmMvYmFzaWMvZmQtdXRpbC5oCTIwMjYtMDYt
MjUgMTQ6MDE6MTIuMDA5ODc1NTI2ICswMjAwCi0rKysgYi9zcmMvYmFzaWMvZmQtdXRpbC5oCTIw
MjYtMDYtMjUgMTQ6MDE6MjAuOTA5MDYwNDE1ICswMjAwCi1AQCAtMTg4LDYgKzE4OCw3IEBAIHN0
YXRpYyBpbmxpbmUgaW50IGRpcl9mZF9pc19yb290X29yX2N3ZCgKLSB9Ci0gCi0gaW50IGZkc19p
bm9kZV9hbmRfbW91bnRfc2FtZShpbnQgZmQxLCBpbnQgZmQyKTsKLStpbnQgZmRfZ2V0X21vdW50
X2lkKGludCBmZCwgdWludDY0X3QgKnJldCk7CitkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL2NoYXNl
LmMgYi9zcmMvYmFzaWMvY2hhc2UuYworaW5kZXggMjNhNTIzNzk4ZS4uMDhlZjk1YjNkZCAxMDA2
NDQKKy0tLSBhL3NyYy9iYXNpYy9jaGFzZS5jCisrKysgYi9zcmMvYmFzaWMvY2hhc2UuYworQEAg
LTQwLDcgKzQwLDkgQEAKKyAgICAgICAgIChDSEFTRV9NVVNUX0JFX0RJUkVDVE9SWXxDSEFTRV9N
VVNUX0JFX1JFR1VMQVJ8Q0hBU0VfTVVTVF9CRV9TT0NLRVQpCiAgCi0gaW50IHJlc29sdmVfeGF0
X2Zkcm9vdChpbnQgKmZkLCBjb25zdCBjaGFyICoqcGF0aCwgY2hhciAqKnJldF9idWZmZXIpOwor
IHN0YXRpYyBpbnQgY2hhc2Vfc3RhdHgoaW50IGZkLCBzdHJ1Y3Qgc3RhdHggKnJldCkgeworLSAg
ICAgICAgcmV0dXJuIHhzdGF0eF9mdWxsKGZkLAorKyAgICAgICAgaW50IHI7CisrCisrICAgICAg
ICByID0geHN0YXR4X2Z1bGwoZmQsCisgICAgICAgICAgICAgICAgICAgICAgICAgLyogcGF0aD0g
Ki8gTlVMTCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAvKiBzdGF0eF9mbGFncz0gKi8gMCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICBYU1RBVFhfTU5UX0lEX0JFU1QsCitAQCAtNDgsNiAr
NTAsMjMgQEAgc3RhdGljIGludCBjaGFzZV9zdGF0eChpbnQgZmQsIHN0cnVjdCBzdGF0eCAqcmV0
KSB7CisgICAgICAgICAgICAgICAgICAgICAgICAgLyogb3B0aW9uYWxfbWFzaz0gKi8gMCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBtYW5kYXRvcnlfYXR0cmlidXRlcz0gKi8gMCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQpOworKyAgICAgICAgaWYgKHIgPT0gLUVVTkFUQ0gp
IHsKKysgICAgICAgICAgICAgICAgdWludDY0X3QgbW50X2lkOworKworKyAgICAgICAgICAgICAg
ICAvKiBLZXJuZWwgbGFja3MgU1RBVFhfTU5UX0lEOyBmYWxsIGJhY2sgdG8gL3Byb2Mvc2VsZi9m
ZGluZm8uICovCisrICAgICAgICAgICAgICAgIHIgPSB4c3RhdHgoZmQsIC8qIHBhdGg9ICovIE5V
TEwsIC8qIHN0YXR4X2ZsYWdzPSAqLyAwLAorKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFNU
QVRYX1RZUEV8U1RBVFhfVUlEfFNUQVRYX0lOTywKKysgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXQpOworKyAgICAgICAgICAgICAgICBpZiAociA8IDApCisrICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHI7CisrICAgICAgICAgICAgICAgIHIgPSBmZF9nZXRfbW91bnRfaWQoZmQs
ICZtbnRfaWQpOworKyAgICAgICAgICAgICAgICBpZiAociA8IDApCisrICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHI7CisrICAgICAgICAgICAgICAgIHJldC0+c3R4X21udF9pZCA9IG1u
dF9pZDsKKysgICAgICAgICAgICAgICAgcmV0LT5zdHhfbWFzayB8PSBTVEFUWF9NTlRfSUQ7Cisr
ICAgICAgICB9CisrCisrICAgICAgICByZXR1cm4gcjsKKyB9CiAgCi0tLS0gYS9zcmMvYmFzaWMv
ZmQtdXRpbC5jCTIwMjYtMDYtMjUgMTQ6MDE6MTIuMDExODc1NTY3ICswMjAwCi0rKysgYi9zcmMv
YmFzaWMvZmQtdXRpbC5jCTIwMjYtMDYtMjUgMTQ6MDE6NDAuMDA3NDU2OTA1ICswMjAwCi1AQCAt
MTA4Miw2ICsxMDgyLDM4IEBAIGludCBwYXRoX2lzX3Jvb3RfYXQoaW50IGRpcl9mZCwgY29uc3Qg
Y2gKKyBzdGF0aWMgaW50IGNoYXNlX29wZW5hdDIoaW50IHJvb3RfZmQsIGludCBkaXJfZmQsIGNv
bnN0IGNoYXIgKnBhdGgsIENoYXNlRmxhZ3MgY2hhc2VfZmxhZ3MpIHsKK2RpZmYgLS1naXQgYS9z
cmMvYmFzaWMvZmQtdXRpbC5jIGIvc3JjL2Jhc2ljL2ZkLXV0aWwuYworaW5kZXggYzZlNzhjNTli
Ni4uN2YzM2Q5MDBlNSAxMDA2NDQKKy0tLSBhL3NyYy9iYXNpYy9mZC11dGlsLmMKKysrKyBiL3Ny
Yy9iYXNpYy9mZC11dGlsLmMKK0BAIC0xMDgyLDYgKzEwODIsMzggQEAgaW50IHBhdGhfaXNfcm9v
dF9hdChpbnQgZGlyX2ZkLCBjb25zdCBjaGFyICpwYXRoKSB7CiAgICAgICAgICByZXR1cm4gZmRz
X2lub2RlX2FuZF9tb3VudF9zYW1lKGRpcl9mZCwgWEFUX0ZEUk9PVCk7CiAgfQogIApAQCAtNzgs
NyArMTA5LDcgQEAgU2lnbmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBl
cmljc3Nvbi5jb20+CiAgaW50IGZkc19pbm9kZV9hbmRfbW91bnRfc2FtZShpbnQgZmQxLCBpbnQg
ZmQyKSB7CiAgICAgICAgICBzdHJ1Y3Qgc3RhdHggc3gxLCBzeDI7CiAgICAgICAgICBpbnQgcjsK
LUBAIC0xMDkyLDcgKzExMjQsMjAgQEAgaW50IGZkc19pbm9kZV9hbmRfbW91bnRfc2FtZShpbnQg
ZmQxLCBpbgorQEAgLTEwOTIsNyArMTEyNCwyMCBAQCBpbnQgZmRzX2lub2RlX2FuZF9tb3VudF9z
YW1lKGludCBmZDEsIGludCBmZDIpIHsKICAgICAgICAgIHIgPSB4c3RhdHgoZmQxLCAvKiBwYXRo
ID0gKi8gTlVMTCwgQVRfRU1QVFlfUEFUSCwKICAgICAgICAgICAgICAgICAgICAgU1RBVFhfVFlQ
RXxTVEFUWF9JTk98U1RBVFhfTU5UX0lELAogICAgICAgICAgICAgICAgICAgICAmc3gxKTsKQEAg
LTEwMCw3ICsxMzEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVy
dWxsQGVyaWNzc29uLmNvbT4KICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7CiAgCiAgICAgICAg
ICBpZiAoZmQxID09IGZkMikgLyogU2hvcnRjdXQgdGhpbmdzIGlmIGZkcyBhcmUgdGhlIHNhbWUg
KG9ubHkgYWZ0ZXIgdmFsaWRhdGluZyB0aGUgZmQpICovCi1AQCAtMTEwMSw3ICsxMTQ2LDE5IEBA
IGludCBmZHNfaW5vZGVfYW5kX21vdW50X3NhbWUoaW50IGZkMSwgaW4KK0BAIC0xMTAxLDcgKzEx
NDYsMTkgQEAgaW50IGZkc19pbm9kZV9hbmRfbW91bnRfc2FtZShpbnQgZmQxLCBpbnQgZmQyKSB7
CiAgICAgICAgICByID0geHN0YXR4KGZkMiwgLyogcGF0aCA9ICovIE5VTEwsIEFUX0VNUFRZX1BB
VEgsCiAgICAgICAgICAgICAgICAgICAgIFNUQVRYX1RZUEV8U1RBVFhfSU5PfFNUQVRYX01OVF9J
RCwKICAgICAgICAgICAgICAgICAgICAgJnN4Mik7CkBAIC0xMjEsNDAgKzE1MiwxNSBAQCBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4KICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHI7CiAgCiAgICAgICAgICByID0gc3RhdHhfbW91bnRfc2Ft
ZSgmc3gxLCAmc3gyKTsKLS0tLSBhL3NyYy9iYXNpYy9jaGFzZS5jCTIwMjYtMDYtMjUgMTQ6MDE6
MTIuMDEzODc1NjA5ICswMjAwCi0rKysgYi9zcmMvYmFzaWMvY2hhc2UuYwkyMDI2LTA2LTI1IDE0
OjAxOjQ3LjExNzYwNDUxNCArMDIwMAotQEAgLTQwLDcgKzQwLDkgQEAKLSAgICAgICAgIChDSEFT
RV9NVVNUX0JFX0RJUkVDVE9SWXxDSEFTRV9NVVNUX0JFX1JFR1VMQVJ8Q0hBU0VfTVVTVF9CRV9T
T0NLRVQpCi0gCi0gc3RhdGljIGludCBjaGFzZV9zdGF0eChpbnQgZmQsIHN0cnVjdCBzdGF0eCAq
cmV0KSB7Ci0tICAgICAgICByZXR1cm4geHN0YXR4X2Z1bGwoZmQsCi0rICAgICAgICBpbnQgcjsK
LSsKLSsgICAgICAgIHIgPSB4c3RhdHhfZnVsbChmZCwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiBwYXRoPSAqLyBOVUxMLAotICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHN0YXR4X2Zs
YWdzPSAqLyAwLAotICAgICAgICAgICAgICAgICAgICAgICAgIFhTVEFUWF9NTlRfSURfQkVTVCwK
LUBAIC00OCw2ICs1MCwyMyBAQCBzdGF0aWMgaW50IGNoYXNlX3N0YXR4KGludCBmZCwgc3RydWN0
IHN0Ci0gICAgICAgICAgICAgICAgICAgICAgICAgLyogb3B0aW9uYWxfbWFzaz0gKi8gMCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBtYW5kYXRvcnlfYXR0cmlidXRlcz0gKi8gMCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQpOwotKyAgICAgICAgaWYgKHIgPT0gLUVVTkFUQ0gp
IHsKLSsgICAgICAgICAgICAgICAgdWludDY0X3QgbW50X2lkOwotKwotKyAgICAgICAgICAgICAg
ICAvKiBLZXJuZWwgbGFja3MgU1RBVFhfTU5UX0lEOyBmYWxsIGJhY2sgdG8gL3Byb2Mvc2VsZi9m
ZGluZm8uICovCi0rICAgICAgICAgICAgICAgIHIgPSB4c3RhdHgoZmQsIC8qIHBhdGg9ICovIE5V
TEwsIC8qIHN0YXR4X2ZsYWdzPSAqLyAwLAotKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFNU
QVRYX1RZUEV8U1RBVFhfVUlEfFNUQVRYX0lOTywKLSsgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXQpOwotKyAgICAgICAgICAgICAgICBpZiAociA8IDApCi0rICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHI7Ci0rICAgICAgICAgICAgICAgIHIgPSBmZF9nZXRfbW91bnRfaWQoZmQs
ICZtbnRfaWQpOwotKyAgICAgICAgICAgICAgICBpZiAociA8IDApCi0rICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHI7Ci0rICAgICAgICAgICAgICAgIHJldC0+c3R4X21udF9pZCA9IG1u
dF9pZDsKLSsgICAgICAgICAgICAgICAgcmV0LT5zdHhfbWFzayB8PSBTVEFUWF9NTlRfSUQ7Ci0r
ICAgICAgICB9Ci0rCi0rICAgICAgICByZXR1cm4gcjsKK2RpZmYgLS1naXQgYS9zcmMvYmFzaWMv
ZmQtdXRpbC5oIGIvc3JjL2Jhc2ljL2ZkLXV0aWwuaAoraW5kZXggODZiZGRiNmRhYy4uMzQzNzBj
ODk0MyAxMDA2NDQKKy0tLSBhL3NyYy9iYXNpYy9mZC11dGlsLmgKKysrKyBiL3NyYy9iYXNpYy9m
ZC11dGlsLmgKK0BAIC0xODgsNiArMTg4LDcgQEAgc3RhdGljIGlubGluZSBpbnQgZGlyX2ZkX2lz
X3Jvb3Rfb3JfY3dkKGludCBkaXJfZmQpIHsKICB9CiAgCi0gc3RhdGljIGludCBjaGFzZV9vcGVu
YXQyKGludCByb290X2ZkLCBpbnQgZGlyX2ZkLCBjb25zdCBjaGFyICpwYXRoLCBDaGFzZUZsYWdz
IGNoYXNlX2ZsYWdzKSB7CisgaW50IGZkc19pbm9kZV9hbmRfbW91bnRfc2FtZShpbnQgZmQxLCBp
bnQgZmQyKTsKKytpbnQgZmRfZ2V0X21vdW50X2lkKGludCBmZCwgdWludDY0X3QgKnJldCk7Cisg
CisgaW50IHJlc29sdmVfeGF0X2Zkcm9vdChpbnQgKmZkLCBjb25zdCBjaGFyICoqcGF0aCwgY2hh
ciAqKnJldF9idWZmZXIpOworIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kL2EwMTkzOTZkMmM1YmMxYWRiNmIwNDRlNzc4NGEzMGI3MTg3ZjZmYmQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvYTAxOTM5NmQyYzViYzFhZGI2YjA0
NGU3Nzg0YTMwYjcxODdmNmZiZC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
OGViOWY1YzE2NC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvYTAxOTM5NmQyYzViYzFhZGI2YjA0NGU3Nzg0YTMwYjcxODdmNmZiZC5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDU5ICswLDAgQEAKLUZyb20gYTAxOTM5NmQyYzViYzFhZGI2YjA0NGU3
Nzg0YTMwYjcxODdmNmZiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEx1Y2EgQm9j
Y2Fzc2kgPGx1Y2EuYm9jY2Fzc2lAZ21haWwuY29tPgotRGF0ZTogV2VkLCAyIFNlcCAyMDI2IDIw
OjMyOjUxICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRvb2xzOiBmaXggYnVpbGRpbmcgbWFucGFn
ZXMgd2l0aCBseG1sIDYuMS4zCi0KLW1hbnBhZ2VzIGJ1aWxkIGZhaWxzIG9uIEFyY2ggd2l0aCBu
ZXcgbHhtbDoKLQotVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgotICBGaWxlICIv
d29yay9zcmMvdG9vbHMvbWFrZS1kaXJlY3RpdmUtaW5kZXgucHkiLCBsaW5lIDE2OSwgaW4gbWFr
ZV9wYWdlCi0gICAgX2V4dHJhY3RfZGlyZWN0aXZlcyhkaXJlY3RpdmVfZ3JvdXBzLCBmb3JtYXR0
aW5nLCBwYWdlKQotICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl4KLSAgRmlsZSAiL3dvcmsvc3JjL3Rvb2xzL21ha2UtZGlyZWN0aXZlLWlu
ZGV4LnB5IiwgbGluZSAxOCwgaW4gX2V4dHJhY3RfZGlyZWN0aXZlcwotICAgIHQgPSB4bWxfcGFy
c2UocGFnZSkKLSAgRmlsZSAiL3dvcmsvc3JjL3Rvb2xzL3htbF9oZWxwZXIucHkiLCBsaW5lIDI1
LCBpbiB4bWxfcGFyc2UKLSAgICBkb2MgPSB0cmVlLnBhcnNlKHBhZ2UsIF9wYXJzZXIpCi0gIEZp
bGUgInNyYy9seG1sL2V0cmVlLnB5eCIsIGxpbmUgMzcxNywgaW4gbHhtbC5ldHJlZS5wYXJzZQot
ICBGaWxlICJzcmMvbHhtbC9wYXJzZXIucHhpIiwgbGluZSAyMDQ1LCBpbiBseG1sLmV0cmVlLl9w
YXJzZURvY3VtZW50Ci0gIEZpbGUgInNyYy9seG1sL3BhcnNlci5weGkiLCBsaW5lIDIwNzEsIGlu
IGx4bWwuZXRyZWUuX3BhcnNlRG9jdW1lbnRGcm9tVVJMCi0gIEZpbGUgInNyYy9seG1sL3BhcnNl
ci5weGkiLCBsaW5lIDE5NjIsIGluIGx4bWwuZXRyZWUuX3BhcnNlRG9jRnJvbUZpbGUKLSAgRmls
ZSAic3JjL2x4bWwvcGFyc2VyLnB4aSIsIGxpbmUgMTIzMSwgaW4gbHhtbC5ldHJlZS5fQmFzZVBh
cnNlci5fcGFyc2VEb2NGcm9tRmlsZQotICBGaWxlICJzcmMvbHhtbC9wYXJzZXIucHhpIiwgbGlu
ZSA2NDcsIGluIGx4bWwuZXRyZWUuX1BhcnNlckNvbnRleHQuX2hhbmRsZVBhcnNlUmVzdWx0RG9j
Ci0gIEZpbGUgInNyYy9seG1sL3BhcnNlci5weGkiLCBsaW5lIDc2NSwgaW4gbHhtbC5ldHJlZS5f
aGFuZGxlUGFyc2VSZXN1bHQKLSAgRmlsZSAic3JjL2x4bWwvcGFyc2VyLnB4aSIsIGxpbmUgNjg5
LCBpbiBseG1sLmV0cmVlLl9yYWlzZVBhcnNlRXJyb3IKLSAgRmlsZSAiLi4vc3JjL21hbi9ob3N0
bmFtZS54bWwiLCBsaW5lIDUKLWx4bWwuZXRyZWUuWE1MU3ludGF4RXJyb3I6IEVudGl0eSAnZW50
aXRpZXMnIG5vdCBkZWZpbmVkLCBsaW5lIDUsIGNvbHVtbiAxMQotCi1UaGUgYWJvdmUgZXhjZXB0
aW9uIHdhcyB0aGUgZGlyZWN0IGNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgZXhjZXB0aW9uOgotCi1U
cmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Ci0gIEZpbGUgIi93b3JrL3NyYy90b29s
cy9tYWtlLWRpcmVjdGl2ZS1pbmRleC5weSIsIGxpbmUgMTgwLCBpbiA8bW9kdWxlPgotICAgIF94
bWwgPSBtYWtlX3BhZ2UoX3RlbXBsYXRlX3BhdGgsIF94bWxfZmlsZXMpCi0gIEZpbGUgIi93b3Jr
L3NyYy90b29scy9tYWtlLWRpcmVjdGl2ZS1pbmRleC5weSIsIGxpbmUgMTcxLCBpbiBtYWtlX3Bh
Z2UKLSAgICByYWlzZSBWYWx1ZUVycm9yKCdmYWlsZWQgdG8gcHJvY2VzcyAnICsgcGFnZSkgZnJv
bSBlCi1WYWx1ZUVycm9yOiBmYWlsZWQgdG8gcHJvY2VzcyAuLi9zcmMvbWFuL2hvc3RuYW1lLnht
bAotCi1SZWx5aW5nIG9uIFhNTFBhcnNlcigpIGRlZmF1bHRzIGxlYXZlcyB0aGUgZXh0ZXJuYWwg
cGFyYW1ldGVyIGVudGl0eQotdXNlZCB0byBsb2FkIGN1c3RvbS1lbnRpdGllcy5lbnQgdW5yZXNv
bHZlZC4gUmVxdWVzdCBlbnRpdHkgcmVzb2x1dGlvbiBleHBsaWNpdGx5LgotCi1Gb2xsb3ctdXAg
Zm9yIDFhMTNlMzFkMjc1NDMwZmZiYTcxM2M4YTY4ZWU3ZjIyMDkzYzI5ZTAKLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21t
aXQvYTAxOTM5NmQyYzViYzFhZGI2YjA0NGU3Nzg0YTMwYjcxODdmNmZiZF0KLQotLS0tCi0gdG9v
bHMveG1sX2hlbHBlci5weSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3Rvb2xzL3htbF9oZWxwZXIucHkgYi90b29s
cy94bWxfaGVscGVyLnB5Ci1pbmRleCA4N2MyNGFiMDJhMGYuLmUyNmNhOTJkOTQ1NCAxMDA3NTUK
LS0tLSBhL3Rvb2xzL3htbF9oZWxwZXIucHkKLSsrKyBiL3Rvb2xzL3htbF9oZWxwZXIucHkKLUBA
IC0xNiw3ICsxNiw3IEBAIGRlZiByZXNvbHZlKHNlbGYsIHVybCwgX2lkLCBjb250ZXh0KToKLSAg
ICAgICAgIHJldHVybiBOb25lCi0gCi0gCi0tX3BhcnNlciA9IHRyZWUuWE1MUGFyc2VyKCkKLStf
cGFyc2VyID0gdHJlZS5YTUxQYXJzZXIocmVzb2x2ZV9lbnRpdGllcz1UcnVlKQotICMgcHlsaW50
OiBkaXNhYmxlPW5vLW1lbWJlcgotIF9wYXJzZXIucmVzb2x2ZXJzLmFkZChDdXN0b21SZXNvbHZl
cigpKQotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI2
MS4yLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI2MS4zLmJiCnNpbWls
YXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZF8yNjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
XzI2MS4zLmJiCmluZGV4IDY4Yjg5NGJlOWEuLjFhMjU2YTU5OGEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yNjEuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWRfMjYxLjMuYmIKQEAgLTI3LDggKzI3LDcgQEAgQ09ORkxJQ1Rf
RElTVFJPX0ZFQVRVUkVTICs9ICJzeXN2aW5pdCIKICMgc28gdGhhdCBzeXN0ZW1jdGwgY2FuIGJl
IHVzZWQgaW4gcG9zdGluc3Qgc2NyaXB0cwogUEFDS0FHRV9XUklURV9ERVBTICs9ICJzeXN0ZW1k
LXRvb2xzLW5hdGl2ZSIKIAotU1JDX1VSSSArPSAiIFwKLSAgICAgICAgICAgZmlsZTovL3RvdWNo
c2NyZWVuLnJ1bGVzIFwKK1NSQ19VUkkgKz0gImZpbGU6Ly90b3VjaHNjcmVlbi5ydWxlcyBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMC1jcmVhdGUtdm9sYXRpbGUuY29uZiBcCiAgICAgICAgICAgIGZp
bGU6Ly9vcmcuZnJlZWRlc2t0b3AuaG9zdG5hbWUxX25vX3BvbGtpdC5jb25mIFwKICAgICAgICAg
ICAgZmlsZTovLzAwLWhvc3RuYW1lZC1uZXR3b3JrLXVzZXIuY29uZiBcCkBAIC0zNyw3ICszNiw2
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9zeXN0ZW1kLXBhZ2VyLnNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtYmluZm10LURvbi10LWluc3RhbGwtZGVwZW5kZW5jeS1s
aW5rcy1hdC1pbnN0YWxsLXRpbS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLURvLW5v
dC1jcmVhdGUtdmFyLWxvZy1SRUFETUUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vYTAxOTM5
NmQyYzViYzFhZGI2YjA0NGU3Nzg0YTMwYjcxODdmNmZiZC5wYXRjaCBcCiAgICAgICAgICAgICIK
IAogUEFNX1BMVUdJTlMgPSAiIFwKLS0gCjIuNDcuMQoK

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'systemd usrmerge'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'systemd usrmerge'

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-native-changelog.txt"

Changelog for systemd-boot-native: 261.2 -> 261.3
Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/systemd (sysroot):
  /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a14-ux3407na.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a16-ux3607oa.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-crd.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-hp-elitebook-x-g2q.json was added
  /usr/lib/systemd/boot/hwids/aa64/glymur-lenovo-yoga-slim7x.json was added
  /usr/lib/systemd/boot/hwids/aa64/purwa-lenovo-ideacentre-mini-01q8x10.json was added
  /usr/lib/systemd/boot/hwids/aa64/sc7180-ecs-liva-qc710.json was added
  /usr/lib/systemd/boot/hwids/aa64/sc8280xp-radxa-dragon-q8b.json was added
  /usr/lib/systemd/boot/hwids/aa64/x126100-lenovo-ideapad-slim3.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1e80100-honor-magicbook-art-14.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1p42100-hp-elitebook-6-g1q.json was added
  /usr/lib/systemd/boot/hwids/aa64/x1p64100-dell-latitude-5455.json was added
  /usr/lib/udev/rules.d/60-tpm2-id.rules was removed
packages/x86-64-v3-poky-linux/systemd/systemd: FILELIST: added "/usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a14-ux3407na.json /usr/lib/systemd/boot/hwids/aa64/glymur-asus-zenbook-a16-ux3607oa.json /usr/lib/systemd/boot/hwids/aa64/glymur-crd.json /usr/lib/systemd/boot/hwids/aa64/x1p42100-hp-elitebook-6-g1q.json /usr/lib/systemd/boot/hwids/aa64/glymur-hp-elitebook-x-g2q.json /usr/lib/systemd/boot/hwids/aa64/x1e80100-honor-magicbook-art-14.json /usr/lib/systemd/boot/hwids/aa64/x1p64100-dell-latitude-5455.json /usr/lib/systemd/boot/hwids/aa64/glymur-lenovo-yoga-slim7x.json /usr/lib/systemd/boot/hwids/aa64/purwa-lenovo-ideacentre-mini-01q8x10.json /usr/lib/systemd/boot/hwids/aa64/sc7180-ecs-liva-qc710.json /usr/lib/systemd/boot/hwids/aa64/sc8280xp-radxa-dragon-q8b.json /usr/lib/systemd/boot/hwids/aa64/x126100-lenovo-ideapad-slim3.json"
packages/x86-64-v3-poky-linux/systemd/udev: FILELIST: removed "/usr/lib/udev/rules.d/60-tpm2-id.rules"

--===============7421859077018539915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-changelog.txt"

Changelog for systemd: 261.2 -> 261.3
Source: NEWS

* The resolvconf compatibility mode now rejects malformed stdin input
          and leaves the existing per-link DNS configuration unchanged.

--===============7421859077018539915==--

