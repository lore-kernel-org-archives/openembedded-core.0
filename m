Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA9AD5C0CB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17385.1765872131800834005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tnTotJou;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rgh2Tqld;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262e5b9e-3a602092-f151-49ad-b907-59150cf3887c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x8JEm799eRvHpxLrU2lS5B12TTEvCh5LEzkJnHu/08Y=;
	b=tnTotJounNg3sVFwPHrhmqWujtRnRgdwGz+m7HXIiSwyte0YOQl9U4pqyv6AU8g5
	MSjxoB1A6FeTKDkbIiHxuzkvAlwsIa7aKpRLGiYoswbk4xw/ymWpjZRGs5ho6U0t81a
	HELsJf2LGgPVH6eznLw2ePlh2zz5HPNVS2UESROo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x8JEm799eRvHpxLrU2lS5B12TTEvCh5LEzkJnHu/08Y=;
	b=rgh2Tqld0iQ0JQL/qasnkXN1wmuuBtS9hosrzH9KLBQrdg0NPno4VVKs9485RL9N
	0AkVu7g5YML5g+hrXpNvoHcxw1x7v08VO+uNOIfz0Np1nyV9Mv6CkIhnzhGXvxuUkgi
	fghdN78QHF6IZLX8ZL03bn6+FLz8nhD1yBpuONBw=
Content-Type: multipart/mixed; boundary="===============2129981614836400230=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.41.3,2.41.3
 SUCCEEDED
Message-ID: <0101019b262e5b9e-3a602092-f151-49ad-b907-59150cf3887c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227767

--===============2129981614836400230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.41.3,2.41.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-util-linux-upgrade-2.41.2-2.41.3-.patch
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
From b871c57f0dac02fadc4d0261af739c578241e01c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 19:58:06 +0000
Subject: [PATCH] util-linux-libuuid,util-linux: upgrade 2.41.2 ->
 2.41.3,2.41.2 -> 2.41.3

---
 ...inux-libuuid_2.41.2.bb => util-linux-libuuid_2.41.3.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                | 2 +-
 ...d-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch | 7 ++-----
 ...ts-ts-kill-decode-avoid-using-shell-built-in-kill.patch | 7 ++-----
 ...kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch | 7 ++-----
 .../util-linux/util-linux/avoid_parallel_tests.patch       | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch          | 4 ++--
 .../util-linux/display_testname_for_subtest.patch          | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch        | 2 +-
 .../{util-linux_2.41.2.bb => util-linux_2.41.3.bb}         | 0
 10 files changed, 13 insertions(+), 22 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.2.bb => util-linux-libuuid_2.41.3.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.41.2.bb => util-linux_2.41.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index c29011ad61..7280d48787 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            "
 
-SRC_URI[sha256sum] = "6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e"
+SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
index e3f9112192..ff596ff9d6 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From 855dbea3e6b3c7ed9ba11eff38f888cc4b7678c8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 May 2025 15:24:16 +0800
 Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
@@ -19,7 +19,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
-index cd94da799..76138a7a6 100755
+index cd94da7..76138a7 100755
 --- a/tests/ts/lsfd/mkfds-foreign-sockets
 +++ b/tests/ts/lsfd/mkfds-foreign-sockets
 @@ -30,6 +30,8 @@ ts_skip_nonroot
@@ -31,6 +31,3 @@ index cd94da799..76138a7a6 100755
  declare -A tcase
  tcase[NAME]="state=connected"
  tcase[SOCK.NETNS]=
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
index dece0e94b7..72daf7f8e4 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From 514ff160e37c0cca5eee79892a6b65516a92de34 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 15 May 2025 16:44:33 +0800
 Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25ff6..57149899e 100755
+index 03bc25f..5714989 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -18,6 +18,11 @@ TS_DESC="decode functions"
@@ -31,6 +31,3 @@ index 03bc25ff6..57149899e 100755
  ts_skip_qemu_user
  
  ts_check_test_command "$TS_CMD_KILL"
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
index f4e2f9e745..ecd8d18213 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From 75c10a9edefc1597f708043e5561c2ff87305bf0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jun 2025 16:27:19 +0800
 Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
@@ -28,7 +28,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 57149899e..524b4e5e2 100755
+index 5714989..524b4e5 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -53,14 +53,19 @@ ACK=
@@ -53,6 +53,3 @@ index 57149899e..524b4e5e2 100755
  		else
  		    cat
  		fi
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index fe92afbc53..19c113febf 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 1f55d079887f0ef7857819e9c8a1def8180c69d4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43a23a5..4a84531 100644
+index f664d12..8d9efaa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index ebb32a6845..31d00f7983 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From d521ca39a781873882b52ee52f46294596f41848 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5d9102..43a23a5 100644
+index d32b11d..f664d12 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index fa4ae02bc3..1c9e0ce4f2 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From 05b495cbe9ffa7b45d9a383610aa95e31f2ab1e3 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..1763c47da0 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From 4c0e374ba6c64d07da8acba5476cf8638c54820d Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.2.bb b/meta/recipes-core/util-linux/util-linux_2.41.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.3.bb
-- 
2.47.1


--===============2129981614836400230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/bits /usr/share/bash-completion/completions/lsfd /usr/share/bash-completion/completions/blkpr"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was removed

--===============2129981614836400230==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.41.2-2.41.3-.patch"

RnJvbSBiODcxYzU3ZjBkYWMwMmZhZGM0ZDAyNjFhZjczOWM1NzgyNDFlMDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMTk6NTg6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQsdXRpbC1saW51eDogdXBncmFkZSAyLjQxLjIgLT4KIDIuNDEuMywy
LjQxLjIgLT4gMi40MS4zCgotLS0KIC4uLmludXgtbGlidXVpZF8yLjQxLjIuYmIgPT4gdXRpbC1s
aW51eC1saWJ1dWlkXzIuNDEuMy5iYn0gfCAwCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXguaW5jICAgICAgICAgICAgICAgIHwgMiArLQogLi4uZC1ta2Zkcy1mb3JlaWdu
LXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19kaS5wYXRjaCB8IDcgKystLS0tLQogLi4u
dHMtdHMta2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaCB8
IDcgKystLS0tLQogLi4ua2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQt
b2YtaGFyZC5wYXRjaCB8IDcgKystLS0tLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICB8IDQgKystLQogLi4uL3V0aWwtbGludXgvdXRp
bC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCAgICAgICAgICB8IDQgKystLQogLi4uL3V0
aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaCAgICAgICAgICB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCAg
ICAgICAgfCAyICstCiAuLi4ve3V0aWwtbGludXhfMi40MS4yLmJiID0+IHV0aWwtbGludXhfMi40
MS4zLmJifSAgICAgICAgIHwgMAogMTAgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRp
bC1saW51eC1saWJ1dWlkXzIuNDEuMi5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40MS4zLmJi
fSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4
XzIuNDEuMi5iYiA9PiB1dGlsLWxpbnV4XzIuNDEuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MS4yLmJi
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MS4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQxLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuMy5iYgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggYzI5MDExYWQ2MS4u
NzI4MGQ0ODc4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jCkBAIC0yMSw2ICsyMSw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51
eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFk
LW9mLWhhcmQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2
MDYyYTFkODliNTcxYTYxOTMyZTZmYzAyMTFmMzYwNjBjNDE4MzU2OGI4MWVlODY2Y2YzNjNiY2U5
ZjY1ODNlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzMzBkODczZjBmY2ViNTU2MGI4OWE3ZGMx
NGU0ZjMyODhiYmQ4ODBlOTY5MDNlZDliNTBlYzJiNTc5OWU1OGIiCiAKIENWRV9QUk9EVUNUID0g
InV0aWwtbGludXgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2lu
Zy1zb2NrX2RpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LzAwMDEtbHNmZC1ta2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19k
aS5wYXRjaAppbmRleCBlM2Y5MTEyMTkyLi5mZjU5NmZmOWQ2IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24t
c29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2Nr
ZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tfZGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGIzYTFkOTJhOTA3OGZhZGEzMWIyY2Y2NGI4MDJlZGQ2MTYwMjY3NjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDg1NWRiZWEzZTZiM2M3ZWQ5YmExMWVmZjM4Zjg4OGNjNGI3Njc4Yzgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBNb24sIDI2IE1heSAyMDI1IDE1OjI0OjE2ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGxzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzOiBza2lwIHdoZW4gbGFja2luZyBzb2Nr
X2RpYWcKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAt
LWdpdCBhL3Rlc3RzL3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzIGIvdGVzdHMvdHMvbHNm
ZC9ta2Zkcy1mb3JlaWduLXNvY2tldHMKLWluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1
NQoraW5kZXggY2Q5NGRhNy4uNzYxMzhhNyAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2xzZmQvbWtm
ZHMtZm9yZWlnbi1zb2NrZXRzCiArKysgYi90ZXN0cy90cy9sc2ZkL21rZmRzLWZvcmVpZ24tc29j
a2V0cwogQEAgLTMwLDYgKzMwLDggQEAgdHNfc2tpcF9ub25yb290CkBAIC0zMSw2ICszMSwzIEBA
IGluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1NQogIGRlY2xhcmUgLUEgdGNhc2UKICB0
Y2FzZVtOQU1FXT0ic3RhdGU9Y29ubmVjdGVkIgogIHRjYXNlW1NPQ0suTkVUTlNdPQotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4t
a2lsbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LXRlc3RzLXRzLWtpbGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWluLWtpbGwucGF0
Y2gKaW5kZXggZGVjZTBlOTRiNy4uNzJkYWY3ZjhlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNvZGUtYXZv
aWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11
c2luZy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMmVl
Y2NmMzY1NDJkNTA2YjY2MDY0MWEwN2E0NGYzOTc2NzcyODk3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA1MTRmZjE2MGUzN2MwY2NhNWVlZTc5ODkyYTZiNjU1MTZhOTJkZTM0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
PgogRGF0ZTogVGh1LCAxNSBNYXkgMjAyNSAxNjo0NDozMyArMDgwMAogU3ViamVjdDogW1BBVENI
XSB0ZXN0cy90cy9raWxsL2RlY29kZTogYXZvaWQgdXNpbmcgc2hlbGwgYnVpbHQtaW4ga2lsbCBj
b21tYW5kCkBAIC0xNiw3ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS90ZXN0cy90cy9raWxsL2RlY29kZSBiL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCi1pbmRl
eCAwM2JjMjVmZjYuLjU3MTQ5ODk5ZSAxMDA3NTUKK2luZGV4IDAzYmMyNWYuLjU3MTQ5ODkgMTAw
NzU1CiAtLS0gYS90ZXN0cy90cy9raWxsL2RlY29kZQogKysrIGIvdGVzdHMvdHMva2lsbC9kZWNv
ZGUKIEBAIC0xOCw2ICsxOCwxMSBAQCBUU19ERVNDPSJkZWNvZGUgZnVuY3Rpb25zIgpAQCAtMzEs
NiArMzEsMyBAQCBpbmRleCAwM2JjMjVmZjYuLjU3MTQ5ODk5ZSAxMDA3NTUKICB0c19za2lwX3Fl
bXVfdXNlcgogIAogIHRzX2NoZWNrX3Rlc3RfY29tbWFuZCAiJFRTX0NNRF9LSUxMIgotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2Yt
aGFyZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9mLWhhcmQucGF0
Y2gKaW5kZXggZjRlMmY5ZTc0NS4uZWNkOGQxODIxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlO
LWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10cy1raWxsLWRlY29kZS11c2UtUlRNSU4tZnJv
bS1raWxsLUwtaW5zdGVhZC1vZi1oYXJkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNWQ1
ZTg4NzMwMjlkMTcwZmNhYjM4YTZmYmQ1ZDVhMzU1NTc0YjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3NWMxMGE5ZWRlZmMxNTk3ZjcwODA0M2U1NTYxYzJmZjg3MzA1YmYwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
PgogRGF0ZTogV2VkLCA0IEp1biAyMDI1IDE2OjI3OjE5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHRzL2tpbGwvZGVjb2RlOiB1c2UgUlRNSU4gZnJvbSAna2lsbCAtTCcgaW5zdGVhZCBvZgpAQCAt
MjgsNyArMjgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL3Rlc3RzL3RzL2tpbGwvZGVjb2RlIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUK
LWluZGV4IDU3MTQ5ODk5ZS4uNTI0YjRlNWUyIDEwMDc1NQoraW5kZXggNTcxNDk4OS4uNTI0YjRl
NSAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCiArKysgYi90ZXN0cy90cy9raWxs
L2RlY29kZQogQEAgLTUzLDE0ICs1MywxOSBAQCBBQ0s9CkBAIC01Myw2ICs1MywzIEBAIGluZGV4
IDU3MTQ5ODk5ZS4uNTI0YjRlNWUyIDEwMDc1NQogIAkJZWxzZQogIAkJICAgIGNhdAogIAkJZmkK
LS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBm
ZTkyYWZiYzUzLi4xOWMxMTNmZWJmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MzAzMDM4OGU4MzE2NDJkMzZjYjdiOWQ0YjYzNzU1
ZTk2OTY3MTRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxZjU1ZDA3OTg4N2YwZWY3
ODU3ODE5ZTljOGExZGVmODE4MGM2OWQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
VHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAy
MDIxIDE0OjAwOjMxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFkZCBwdGVz
dApAQCAtMTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDNhMjNhNS4uNGE4NDUzMSAxMDA2
NDQKK2luZGV4IGY2NjRkMTIuLjhkOWVmYWEgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsr
KyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JPX0RJUihb
bTRdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCmluZGV4IGViYjMyYTY4NDUuLjMxZDAw
Zjc5ODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDM3ODk5OGJmODJlM2I2ZmY0NjU2OTA3N2IyOWY5NWU3MmI3MzQ2ODEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQ1MjFjYTM5YTc4MTg3Mzg4MmI1MmVlNTJmNDYyOTQ1OTZmNDE4
NDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxwYkBwYmNs
Lm5ldD4KIERhdGU6IE1vbiwgMjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gdXRpbC1saW51eDogRW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0ZWQKQEAg
LTE0LDcgKzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0
aW9uXQogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYTVkOTEwMi4u
NDNhMjNhNSAxMDA2NDQKK2luZGV4IGQzMmIxMWQuLmY2NjRkMTIgMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAgQUNfU1VC
U1QoW3J1bnN0YXRlZGlyXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1
YnRlc3QucGF0Y2gKaW5kZXggZmE0YWUwMmJjMy4uMWM5ZTBjZTRmMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9y
X3N1YnRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDcyOGMyYWJkODg5ZDIyNTUzNTAwOGMzZTdhMWVlZjRiOGEwYWVlYTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDA1YjQ5NWNiZTlmZmE3YjQ1ZDlhMzgzNjEwYWE5NWUzMWYyYWIx
ZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZs
b3JlYUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBEaXNwbGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKaW5kZXggYWQy
MzAwMWNmYS4uMTc2M2M0N2RhMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMThiZjZh
ZGVkOWIyYTc1MTg1YWU0YjIzYTQxY2QyZTQzMjJjNWUzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNGMwZTM3NGJhNmM2NGQwN2RhOGFjYmE1NDc2Y2Y4NjM4YzU0ODIwZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEu
Y29tPgogRGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIERlZmluZSBURVNUUyB2YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eF8yLjQxLjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLjIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLjMuYmIK
LS0gCjIuNDcuMQoK

--===============2129981614836400230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/update-rc.d/update-rc.d-dev: FILES: removed "/lib/lib*.so /lib/*.o /lib/*.la"
packages/all-poky-linux/update-rc.d/update-rc.d-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/update-rc.d/update-rc.d: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)
packages/x86-64-v3-poky-linux/util-linux-libuuid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.3.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTM
 IN-from-kill-L-instead-of-hard.patch"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: FILELIST: directory renamed /usr/src/debug/util-linux-libuuid/2.41.2/lib -> /usr/src/debug/util-linux-libuuid/2.41.3/lib, directory renamed /usr/src/debug/util-linux-libuuid/2.41.2/include -> /usr/src/debug/util-linux-libuuid/2.41.3/include, directory renamed /usr/src/debug/util-linux-libuuid/2.41.2/libuuid/src -> /usr/src/debug/util-linux-libuuid/2.41.3/libuuid/src
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.3.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-
 kill-L-instead-of-hard.patch"
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 112707 to 115587 (+3%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/bits /usr/share/bash-completion/completions/lsfd /usr/share/bash-completion/completions/blkpr"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 30130032 to 30131688 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 750139 to 750727 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6574013 to 6574041 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 6192918 to 6194124 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: FILELIST: directory renamed /usr/src/debug/util-linux/2.41.2/tests/helpers -> /usr/src/debug/util-linux/2.41.3/tests/helpers, directory renamed /usr/src/debug/util-linux/2.41.2/sys-utils -> /usr/src/debug/util-linux/2.41.3/sys-utils, directory renamed /usr/src/debug/util-linux/2.41.2/libmount/src -> /usr/src/debug/util-linux/2.41.3/libmount/src, directory renamed /usr/src/debug/util-linux/2.41.2/libmount/samples -> /usr/src/debug/util-linux/2.41.3/libmount/samples, directory renamed /usr/src/debug/util-linux/2.41.2/libblkid/src/superblocks -> /usr/src/debug/util-linux/2.41.3/libblkid/src/superblocks, directory renamed /usr/src/debug/util-linux/2.41.2/include -> /usr/src/debug/util-linux/2.41.3/include, directory renamed /usr/src/debug/util-linux/2.41.2/lsfd-cmd -> /usr/src/debug/util-linux/2.41.3/lsfd-cmd, directory renamed /usr/src/debug/util-linux/2.41.2/libsmartcols/src -> /usr/src/debug/util-linux/2.41.3/libsmartcols/src, d
 irectory renamed /usr/src/debug/util-linux/2.41.2/pam_lastlog2/src -> /usr/src/debug/util-linux/2.41.3/pam_lastlog2/src, directory renamed /usr/src/debug/util-linux/2.41.2/misc-utils -> /usr/src/debug/util-linux/2.41.3/misc-utils, directory renamed /usr/src/debug/util-linux/2.41.2/libfdisk/samples -> /usr/src/debug/util-linux/2.41.3/libfdisk/samples, directory renamed /usr/src/debug/util-linux/2.41.2/Documentation -> /usr/src/debug/util-linux/2.41.3/Documentation, directory renamed /usr/src/debug/util-linux/2.41.2/login-utils -> /usr/src/debug/util-linux/2.41.3/login-utils, directory renamed /usr/src/debug/util-linux/2.41.2/term-utils -> /usr/src/debug/util-linux/2.41.3/term-utils, directory renamed /usr/src/debug/util-linux/2.41.2/text-utils -> /usr/src/debug/util-linux/2.41.3/text-utils, directory renamed /usr/src/debug/util-linux/2.41.2/disk-utils -> /usr/src/debug/util-linux/2.41.3/disk-utils, directory renamed /usr/src/debug/util-linux/2.41.2/libblkid/src/topology -> /usr/src/d
 ebug/util-linux/2.41.3/libblkid/src/topology, directory renamed /usr/src/debug/util-linux/2.41.2/libfdisk/src -> /usr/src/debug/util-linux/2.41.3/libfdisk/src, directory renamed /usr/src/debug/util-linux/2.41.2/libblkid/src -> /usr/src/debug/util-linux/2.41.3/libblkid/src, directory renamed /usr/src/debug/util-linux/2.41.2/lib -> /usr/src/debug/util-linux/2.41.3/lib, directory renamed /usr/src/debug/util-linux/2.41.2/libuuid/src -> /usr/src/debug/util-linux/2.41.3/libuuid/src, directory renamed /usr/src/debug/util-linux/2.41.2/libsmartcols/samples -> /usr/src/debug/util-linux/2.41.3/libsmartcols/samples, directory renamed /usr/src/debug/util-linux/2.41.2/libblkid/src/partitions -> /usr/src/debug/util-linux/2.41.3/libblkid/src/partitions, directory renamed /usr/src/debug/util-linux/2.41.2/liblastlog2/src -> /usr/src/debug/util-linux/2.41.3/liblastlog2/src, directory renamed /usr/src/debug/util-linux/2.41.2/libblkid/samples -> /usr/src/debug/util-linux/2.41.3/libblkid/samples, directo
 ry renamed /usr/src/debug/util-linux/2.41.2/schedutils -> /usr/src/debug/util-linux/2.41.3/schedutils
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux: PV changed from "2.41.2" to "2.41.3"
packages/x86-64-v3-poky-linux/util-linux/util-linux: PKGV changed from 2.41.2 [default] to 2.41.3 [default]
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.1-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.1/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py was removed

--===============2129981614836400230==--

