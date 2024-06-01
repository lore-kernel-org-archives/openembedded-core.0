Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352F0C3065A
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42224.1717263219257218023
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XlA63dlL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2D3BV0VN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018fd4dd3842-7509e4ae-45d9-4cba-9ae0-6084ef891431-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=doxmCHEta+Jh81vVtkpVxi6ClBNqwxJbQFfSQO5CJtk=;
	b=XlA63dlLkAqcnOUfiafD+cKOPx0YW+GgVTQQcL79e2iSKa4vDayyFG9jdf8g/4Pt
	uQCFGzdUq9B2m2K42oeRPdZuGxQZB3yBd6xy0ZQITu8w8UKJVTMNwop5gw1Njnt9WPG
	uhDJXuDu1hrobxrVfhX0JHQcoGXCH7CRbYBSWpzI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=doxmCHEta+Jh81vVtkpVxi6ClBNqwxJbQFfSQO5CJtk=;
	b=2D3BV0VNccyz3pV2D4/7LQ5so9GHfObC/yEXVDgtvZkXUfn4jY/GnONb0Oell4sT
	yRpIQZlJKaL3ymYCfEyInWzFT8ZkdmVfrQj85NX5qCAEZ+pwjpPZEN2uvYLEqQwFA46
	yN42gnS0yoAAgRzs1NGgT9vKx+UaNMFT+pjGSkfk=
Content-Type: multipart/mixed; boundary="===============4798030477094069923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland: upgrading to 1.23.0 SUCCEEDED
Message-ID: <0101018fd4dd3842-7509e4ae-45d9-4cba-9ae0-6084ef891431-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200163

--===============4798030477094069923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland* to *1.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-upgrade-1.22.0-1.23.0.patch
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
From e424903aa1cd85ca12d209da67e973649a0e07cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 14:08:18 +0000
Subject: [PATCH] wayland: upgrade 1.22.0 -> 1.23.0

---
 ...build-Fix-strndup-detection-on-MinGW.patch |  9 ++--
 ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 -------------------
 .../{wayland_1.22.0.bb => wayland_1.23.0.bb}  |  3 +-
 3 files changed, 4 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
 rename meta/recipes-graphics/wayland/{wayland_1.22.0.bb => wayland_1.23.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index bc753de113..c6ddf8a1f9 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -1,4 +1,4 @@
-From b4c64b6f07743e3fb63ce52359bc664ab7d60df0 Mon Sep 17 00:00:00 2001
+From a90bfa622f7323074c715674b368cba80bc7d196 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -20,10 +20,10 @@ Signed-off-by: Denys Dmytriyenko <denis@denix.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 3bc25c9..adde7b9 100644
+index 8e28f2a..b56ba91 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -38,11 +38,11 @@ have_funcs = [
+@@ -45,11 +45,11 @@ have_funcs = [
  	'prctl',
  	'memfd_create',
  	'mremap',
@@ -36,6 +36,3 @@ index 3bc25c9..adde7b9 100644
  config_h.set10('HAVE_XUCRED_CR_PID', cc.has_member('struct xucred', 'cr_pid', prefix : '#include <sys/ucred.h>'))
  have_broken_msg_cmsg_cloexec = false
  if host_machine.system() == 'freebsd'
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
deleted file mode 100644
index 4573bb635a..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
-From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
-Date: Sun, 6 Feb 2022 17:23:46 +0100
-Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
-
-For libs/cflags this is done automatically, but not for manually accessed
-variables. This matches what wayland-protocols does.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/272]
----
- src/meson.build | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index a8a1d2b..721e151 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -65,7 +65,7 @@ if get_option('scanner')
- 		version: meson.project_version(),
- 		variables: [
- 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
-+			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name()),
- 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
- 			'wayland_scanner=${bindir}/wayland-scanner'
- 		],
-@@ -211,7 +211,7 @@ if get_option('libraries')
- 		filebase: 'wayland-server',
- 		variables: [
- 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
-+			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
- 		]
- 	)
-
-@@ -250,7 +250,7 @@ if get_option('libraries')
- 		filebase: 'wayland-client',
- 		variables: [
- 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
--			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
-+			'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
- 		]
- 	)
-
---
-2.37.2
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.23.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/wayland_1.22.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.23.0.bb
index e7babc9ec6..8ff47ac171 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.0.bb
@@ -15,9 +15,8 @@ DEPENDS = "expat libffi wayland-native"
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
-           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
-SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
+SRC_URI[sha256sum] = "05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============4798030477094069923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/wayland: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz file://run-ptest file://0001-build-Fix-strndup-detection-on-MinGW.patch file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch" to "https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.23.0/downloads/wayland-1.23.0.tar.xz file://run-ptest file://0001-build-Fix-strndup-detection-on-MinGW.patch"
packages/core2-64-poky-linux/wayland: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
Changes to packages/core2-64-poky-linux/wayland (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.22.0 to libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.22.0 to libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.22.0 to libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.22.0 to libwayland-server.so.0.23.0
  /usr/lib/libwayland-client.so.0.22.0 moved to /usr/lib/libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0.22.0 moved to /usr/lib/libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1.22.0 moved to /usr/lib/libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0.22.0 moved to /usr/lib/libwayland-server.so.0.23.0
packages/core2-64-poky-linux/wayland/wayland-dbg: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-dbg: FILELIST: removed "/usr/lib/.debug/libwayland-cursor.so.0.22.0 /usr/lib/.debug/libwayland-egl.so.1.22.0 /usr/lib/.debug/libwayland-client.so.0.22.0 /usr/lib/.debug/libwayland-server.so.0.22.0", added "/usr/lib/.debug/libwayland-server.so.0.23.0 /usr/lib/.debug/libwayland-cursor.so.0.23.0 /usr/lib/wayland/ptest/tests/.debug/enum-validator-test /usr/lib/.debug/libwayland-client.so.0.23.0 /usr/lib/.debug/libwayland-egl.so.1.23.0 /usr/lib/wayland/ptest/tests/.debug/proxy-test"
packages/core2-64-poky-linux/wayland/wayland-dbg: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-dbg: PKGSIZE changed from 2138776 to 2280544 (+7%)
packages/core2-64-poky-linux/wayland/wayland-dev: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-dev: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-dev: PKGSIZE changed from 427808 to 457288 (+7%)
packages/core2-64-poky-linux/wayland/wayland-doc: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-doc: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-locale: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-locale: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-ptest: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-ptest: FILELIST: added "/usr/lib/wayland/ptest/tests/proxy-test /usr/lib/wayland/ptest/tests/data/empty.xml /usr/lib/wayland/ptest/tests/enum-validator-test /usr/lib/wayland/ptest/tests/data/empty-server.h /usr/lib/wayland/ptest/tests/data/empty-client.h /usr/lib/wayland/ptest/tests/data/example-enum.h /usr/lib/wayland/ptest/tests/data/README.md /usr/lib/wayland/ptest/tests/data/empty-code.c"
packages/core2-64-poky-linux/wayland/wayland-ptest: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-ptest: PKGSIZE changed from 1264726 to 1360708 (+8%)
packages/core2-64-poky-linux/wayland/wayland-src: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-src: FILELIST: directory renamed /usr/src/debug/wayland/1.22.0/src -> /usr/src/debug/wayland/1.23.0/src, directory renamed /usr/src/debug/wayland/1.22.0/egl -> /usr/src/debug/wayland/1.23.0/egl, directory renamed /usr/src/debug/wayland/1.22.0/cursor -> /usr/src/debug/wayland/1.23.0/cursor, removed "/usr/src/debug/wayland/1.22.0/tests/test-helpers.c /usr/src/debug/wayland/1.22.0/tests/compositor-introspection-test.c /usr/src/debug/wayland/1.22.0/tests/protocol-logger-test.c /usr/src/debug/wayland/1.22.0/tests/newsignal-test.c /usr/src/debug/wayland/1.22.0/tests/exec-fd-leak-checker.c /usr/src/debug/wayland/1.22.0/tests/os-wrappers-test.c /usr/src/debug/wayland/1.22.0/tests/list-test.c /usr/src/debug/wayland/1.22.0/tests/sanity-test.c /usr/src/debug/wayland/1.22.0/tests/event-loop-test.c /usr/src/debug/wayland/1.22.0/tests/map-test.c /usr/src/debug/wayland/1.22.0/tests/resources-test.c /usr/src/debug/wayland/1.22.0/tests/test-runner.h /usr/s
 rc/debug/wayland/1.22.0/tests/client-test.c /usr/src/debug/wayland/1.22.0/tests/test-compositor.c /usr/src/debug/wayland/1.22.0/tests/cpp-compile-test.cpp /usr/src/debug/wayland/1.22.0/tests/test-compositor.h /usr/src/debug/wayland/1.22.0/tests/headers-test.c /usr/src/debug/wayland/1.22.0/tests/test-runner.c /usr/src/debug/wayland/1.22.0/tests/queue-test.c /usr/src/debug/wayland/1.22.0/tests/display-test.c /usr/src/debug/wayland/1.22.0/tests/tests-protocol.c /usr/src/debug/wayland/1.22.0/tests/tests-client-protocol.h /usr/src/debug/wayland/1.22.0/tests/message-test.c /usr/src/debug/wayland/1.22.0/tests/tests-server-protocol.h /usr/src/debug/wayland/1.22.0/tests/array-test.c /usr/src/debug/wayland/1.22.0/tests/socket-test.c /usr/src/debug/wayland/1.22.0/tests/signal-test.c /usr/src/debug/wayland/1.22.0/tests/connection-test.c /usr/src/debug/wayland/1.22.0/tests/fixed-test.c /usr/src/debug/wayland/1.22.0/tests/interface-test.c", added "/usr/src/debug/wayland/1.23.0/tests/test-helpers.
 c /usr/src/debug/wayland/1.23.0/tests/compositor-introspection-test.c /usr/src/debug/wayland/1.23.0/tests/protocol-logger-test.c /usr/src/debug/wayland/1.23.0/tests/newsignal-test.c /usr/src/debug/wayland/1.23.0/tests/data/small-server-core.h /usr/src/debug/wayland/1.23.0/tests/exec-fd-leak-checker.c /usr/src/debug/wayland/1.23.0/tests/os-wrappers-test.c /usr/src/debug/wayland/1.23.0/tests/list-test.c /usr/src/debug/wayland/1.23.0/tests/sanity-test.c /usr/src/debug/wayland/1.23.0/tests/event-loop-test.c /usr/src/debug/wayland/1.23.0/tests/map-test.c /usr/src/debug/wayland/1.23.0/tests/enum-validator-test.c /usr/src/debug/wayland/1.23.0/tests/resources-test.c /usr/src/debug/wayland/1.23.0/tests/test-runner.h /usr/src/debug/wayland/1.23.0/tests/client-test.c /usr/src/debug/wayland/1.23.0/tests/test-compositor.c /usr/src/debug/wayland/1.23.0/tests/cpp-compile-test.cpp /usr/src/debug/wayland/1.23.0/tests/test-compositor.h /usr/src/debug/wayland/1.23.0/tests/headers-test.c /usr/src/debug
 /wayland/1.23.0/tests/test-runner.c /usr/src/debug/wayland/1.23.0/tests/queue-test.c /usr/src/debug/wayland/1.23.0/tests/display-test.c /usr/src/debug/wayland/1.23.0/tests/tests-protocol.c /usr/src/debug/wayland/1.23.0/tests/tests-client-protocol.h /usr/src/debug/wayland/1.23.0/tests/message-test.c /usr/src/debug/wayland/1.23.0/tests/tests-server-protocol.h /usr/src/debug/wayland/1.23.0/tests/array-test.c /usr/src/debug/wayland/1.23.0/tests/proxy-test.c /usr/src/debug/wayland/1.23.0/tests/socket-test.c /usr/src/debug/wayland/1.23.0/tests/signal-test.c /usr/src/debug/wayland/1.23.0/tests/connection-test.c /usr/src/debug/wayland/1.23.0/tests/fixed-test.c /usr/src/debug/wayland/1.23.0/tests/interface-test.c"
packages/core2-64-poky-linux/wayland/wayland-src: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-src: PKGSIZE changed from 1032719 to 1102120 (+7%)
packages/core2-64-poky-linux/wayland/wayland-staticdev: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-staticdev: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland-tools: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland-tools: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland: PV changed from "1.22.0" to "1.23.0"
packages/core2-64-poky-linux/wayland/wayland: FILELIST: removed "/usr/lib/libwayland-server.so.0.22.0 /usr/lib/libwayland-cursor.so.0.22.0 /usr/lib/libwayland-client.so.0.22.0 /usr/lib/libwayland-egl.so.1.22.0", added "/usr/lib/libwayland-cursor.so.0.23.0 /usr/lib/libwayland-server.so.0.23.0 /usr/lib/libwayland-client.so.0.23.0 /usr/lib/libwayland-egl.so.1.23.0"
packages/core2-64-poky-linux/wayland/wayland: PKGV changed from 1.22.0 [default] to 1.23.0 [default]
packages/core2-64-poky-linux/wayland/wayland: PKGSIZE changed from 356690 to 362290 (+2%)
Changes to packages/x86_64-linux/wayland-native (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.22.0 to libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.22.0 to libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.22.0 to libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.22.0 to libwayland-server.so.0.23.0
  /usr/lib/libwayland-client.so.0.22.0 moved to /usr/lib/libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0.22.0 moved to /usr/lib/libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1.22.0 moved to /usr/lib/libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0.22.0 moved to /usr/lib/libwayland-server.so.0.23.0

--===============4798030477094069923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-upgrade-1.22.0-1.23.0.patch"

RnJvbSBlNDI0OTAzYWExY2Q4NWNhMTJkMjA5ZGE2N2U5NzM2NDlhMGUwN2NjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNDowODoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQ6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjMuMAoKLS0tCiAuLi5idWlsZC1GaXgtc3RybmR1
cC1kZXRlY3Rpb24tb24tTWluR1cucGF0Y2ggfCAgOSArKy0tCiAuLi5kZXItcGtnY29uZmlnLXN5
c3Jvb3QtZm9yLXBrZ2RhdGFkaXIucGF0Y2ggfCA0NiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e3dheWxhbmRfMS4yMi4wLmJiID0+IHdheWxhbmRfMS4yMy4wLmJifSAgfCAgMyArLQogMyBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQvMDAwMi1Db25zaWRl
ci1wa2djb25maWctc3lzcm9vdC1mb3ItcGtnZGF0YWRpci5wYXRjaAogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3t3YXlsYW5kXzEuMjIuMC5iYiA9PiB3YXlsYW5kXzEuMjMu
MC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLzAwMDEtYnVpbGQtRml4LXN0cm5kdXAtZGV0ZWN0aW9uLW9uLU1pbkdXLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC8wMDAxLWJ1aWxkLUZpeC1zdHJu
ZHVwLWRldGVjdGlvbi1vbi1NaW5HVy5wYXRjaAppbmRleCBiYzc1M2RlMTEzLi5jNmRkZjhhMWY5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDEt
YnVpbGQtRml4LXN0cm5kdXAtZGV0ZWN0aW9uLW9uLU1pbkdXLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQvMDAwMS1idWlsZC1GaXgtc3RybmR1cC1kZXRl
Y3Rpb24tb24tTWluR1cucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI0YzY0YjZmMDc3NDNl
M2ZiNjNjZTUyMzU5YmM2NjRhYjdkNjBkZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGE5MGJmYTYyMmY3MzIzMDc0YzcxNTY3NGIzNjhjYmE4MGJjN2QxOTYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5jb20+CiBEYXRl
OiBUaHUsIDIwIEZlYiAyMDIwIDE1OjIwOjQ1IC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxk
OiBGaXggc3RybmR1cCBkZXRlY3Rpb24gb24gTWluR1cKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgub3JnPgogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbWVz
b24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggM2JjMjVjOS4uYWRkZTdiOSAxMDA2NDQKK2lu
ZGV4IDhlMjhmMmEuLmI1NmJhOTEgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVz
b24uYnVpbGQKLUBAIC0zOCwxMSArMzgsMTEgQEAgaGF2ZV9mdW5jcyA9IFsKK0BAIC00NSwxMSAr
NDUsMTEgQEAgaGF2ZV9mdW5jcyA9IFsKICAJJ3ByY3RsJywKICAJJ21lbWZkX2NyZWF0ZScsCiAg
CSdtcmVtYXAnLApAQCAtMzYsNiArMzYsMyBAQCBpbmRleCAzYmMyNWM5Li5hZGRlN2I5IDEwMDY0
NAogIGNvbmZpZ19oLnNldDEwKCdIQVZFX1hVQ1JFRF9DUl9QSUQnLCBjYy5oYXNfbWVtYmVyKCdz
dHJ1Y3QgeHVjcmVkJywgJ2NyX3BpZCcsIHByZWZpeCA6ICcjaW5jbHVkZSA8c3lzL3VjcmVkLmg+
JykpCiAgaGF2ZV9icm9rZW5fbXNnX2Ntc2dfY2xvZXhlYyA9IGZhbHNlCiAgaWYgaG9zdF9tYWNo
aW5lLnN5c3RlbSgpID09ICdmcmVlYnNkJwotLS0gCi0yLjcuNAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLzAwMDItQ29uc2lkZXItcGtnY29uZmln
LXN5c3Jvb3QtZm9yLXBrZ2RhdGFkaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC93YXlsYW5kLzAwMDItQ29uc2lkZXItcGtnY29uZmlnLXN5c3Jvb3QtZm9yLXBrZ2RhdGFk
aXIucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDQ1NzNiYjYzNWEuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC8wMDAyLUNv
bnNpZGVyLXBrZ2NvbmZpZy1zeXNyb290LWZvci1wa2dkYXRhZGlyLnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsNDYgKzAsMCBAQAotRnJvbSBmZjhlY2JlODg5MWQ1OTJlNjQ1OTI3NjU5MzE4NzIw
ZjllMTkwMDU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQW5kcmVhcyBDb3JkLUxh
bmR3ZWhyIDxjb3JkbGFuZHdlaHJAa2RlLm9yZz4KLURhdGU6IFN1biwgNiBGZWIgMjAyMiAxNzoy
Mzo0NiArMDEwMAotU3ViamVjdDogW1BBVENIXSBDb25zaWRlciBwa2djb25maWcgc3lzcm9vdCBm
b3IgcGtnZGF0YWRpcgotCi1Gb3IgbGlicy9jZmxhZ3MgdGhpcyBpcyBkb25lIGF1dG9tYXRpY2Fs
bHksIGJ1dCBub3QgZm9yIG1hbnVhbGx5IGFjY2Vzc2VkCi12YXJpYWJsZXMuIFRoaXMgbWF0Y2hl
cyB3aGF0IHdheWxhbmQtcHJvdG9jb2xzIGRvZXMuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0
dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLy0vbWVy
Z2VfcmVxdWVzdHMvMjcyXQotLS0tCi0gc3JjL21lc29uLmJ1aWxkIHwgNiArKystLS0KLSAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0
IGEvc3JjL21lc29uLmJ1aWxkIGIvc3JjL21lc29uLmJ1aWxkCi1pbmRleCBhOGExZDJiLi43MjFl
MTUxIDEwMDY0NAotLS0tIGEvc3JjL21lc29uLmJ1aWxkCi0rKysgYi9zcmMvbWVzb24uYnVpbGQK
LUBAIC02NSw3ICs2NSw3IEBAIGlmIGdldF9vcHRpb24oJ3NjYW5uZXInKQotIAkJdmVyc2lvbjog
bWVzb24ucHJvamVjdF92ZXJzaW9uKCksCi0gCQl2YXJpYWJsZXM6IFsKLSAJCQknZGF0YXJvb3Rk
aXI9JyArIGpvaW5fcGF0aHMoJyR7cHJlZml4fScsIGdldF9vcHRpb24oJ2RhdGFkaXInKSksCi0t
CQkJJ3BrZ2RhdGFkaXI9JyArIGpvaW5fcGF0aHMoJyR7ZGF0YXJvb3RkaXJ9JywgbWVzb24ucHJv
amVjdF9uYW1lKCkpLAotKwkJCSdwa2dkYXRhZGlyPScgKyBqb2luX3BhdGhzKCcke3BjX3N5c3Jv
b3RkaXJ9JHtkYXRhcm9vdGRpcn0nLCBtZXNvbi5wcm9qZWN0X25hbWUoKSksCi0gCQkJJ2JpbmRp
cj0nICsgam9pbl9wYXRocygnJHtwcmVmaXh9JywgZ2V0X29wdGlvbignYmluZGlyJykpLAotIAkJ
CSd3YXlsYW5kX3NjYW5uZXI9JHtiaW5kaXJ9L3dheWxhbmQtc2Nhbm5lcicKLSAJCV0sCi1AQCAt
MjExLDcgKzIxMSw3IEBAIGlmIGdldF9vcHRpb24oJ2xpYnJhcmllcycpCi0gCQlmaWxlYmFzZTog
J3dheWxhbmQtc2VydmVyJywKLSAJCXZhcmlhYmxlczogWwotIAkJCSdkYXRhcm9vdGRpcj0nICsg
am9pbl9wYXRocygnJHtwcmVmaXh9JywgZ2V0X29wdGlvbignZGF0YWRpcicpKSwKLS0JCQkncGtn
ZGF0YWRpcj0nICsgam9pbl9wYXRocygnJHtkYXRhcm9vdGRpcn0nLCBtZXNvbi5wcm9qZWN0X25h
bWUoKSkKLSsJCQkncGtnZGF0YWRpcj0nICsgam9pbl9wYXRocygnJHtwY19zeXNyb290ZGlyfSR7
ZGF0YXJvb3RkaXJ9JywgbWVzb24ucHJvamVjdF9uYW1lKCkpCi0gCQldCi0gCSkKLQotQEAgLTI1
MCw3ICsyNTAsNyBAQCBpZiBnZXRfb3B0aW9uKCdsaWJyYXJpZXMnKQotIAkJZmlsZWJhc2U6ICd3
YXlsYW5kLWNsaWVudCcsCi0gCQl2YXJpYWJsZXM6IFsKLSAJCQknZGF0YXJvb3RkaXI9JyArIGpv
aW5fcGF0aHMoJyR7cHJlZml4fScsIGdldF9vcHRpb24oJ2RhdGFkaXInKSksCi0tCQkJJ3BrZ2Rh
dGFkaXI9JyArIGpvaW5fcGF0aHMoJyR7ZGF0YXJvb3RkaXJ9JywgbWVzb24ucHJvamVjdF9uYW1l
KCkpCi0rCQkJJ3BrZ2RhdGFkaXI9JyArIGpvaW5fcGF0aHMoJyR7cGNfc3lzcm9vdGRpcn0ke2Rh
dGFyb290ZGlyfScsIG1lc29uLnByb2plY3RfbmFtZSgpKQotIAkJXQotIAkpCi0KLS0tCi0yLjM3
LjIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmRfMS4y
Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZF8xLjIzLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dh
eWxhbmQvd2F5bGFuZF8xLjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmRfMS4yMy4wLmJiCmluZGV4IGU3YmFiYzllYzYuLjhmZjQ3YWMxNzEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmRfMS4yMi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmRfMS4yMy4wLmJiCkBA
IC0xNSw5ICsxNSw4IEBAIERFUEVORFMgPSAiZXhwYXQgbGliZmZpIHdheWxhbmQtbmF0aXZlIgog
U1JDX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5k
Ly0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzLyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtRml4
LXN0cm5kdXAtZGV0ZWN0aW9uLW9uLU1pbkdXLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDItQ29uc2lkZXItcGtnY29uZmlnLXN5c3Jvb3QtZm9yLXBrZ2RhdGFkaXIucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTU0MGFmMWVhNjk4YTQ3MWMyZDhlOWQy
ODgzMzJjN2UwZmQzNjBjOGYxZDEyOTM2ZWJiN2U3Y2JjMjQyNTg0MiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwNWIzZTE1NzRkM2U2NzYyNmI1OTc0Zjg2MmYzNmI1YjQyN2M3Y2VlYjk2NWNiMzZh
NGU2YzJkMzQyZTQ1YWIyIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL3dheWxhbmQvd2F5bGFuZC8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCspIgotLSAKMi40
NC4wCgo=

--===============4798030477094069923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/wayland (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.22.0 to libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.22.0 to libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.22.0 to libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.22.0 to libwayland-server.so.0.23.0
  /usr/lib/libwayland-client.so.0.22.0 moved to /usr/lib/libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0.22.0 moved to /usr/lib/libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1.22.0 moved to /usr/lib/libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0.22.0 moved to /usr/lib/libwayland-server.so.0.23.0
packages/core2-64-poky-linux/wayland/wayland-ptest: FILELIST: added "/usr/lib/wayland/ptest/tests/data/empty-client.h /usr/lib/wayland/ptest/tests/data/empty.xml /usr/lib/wayland/ptest/tests/data/empty-code.c /usr/lib/wayland/ptest/tests/data/empty-server.h /usr/lib/wayland/ptest/tests/data/example-enum.h /usr/lib/wayland/ptest/tests/data/README.md /usr/lib/wayland/ptest/tests/enum-validator-test /usr/lib/wayland/ptest/tests/proxy-test"
packages/core2-64-poky-linux/wayland/wayland: FILELIST: removed "/usr/lib/libwayland-client.so.0.22.0 /usr/lib/libwayland-cursor.so.0.22.0 /usr/lib/libwayland-server.so.0.22.0 /usr/lib/libwayland-egl.so.1.22.0", added "/usr/lib/libwayland-cursor.so.0.23.0 /usr/lib/libwayland-egl.so.1.23.0 /usr/lib/libwayland-client.so.0.23.0 /usr/lib/libwayland-server.so.0.23.0"
Changes to packages/x86_64-linux/wayland-native (sysroot):
  /usr/lib/libwayland-client.so.0 changed symlink target from libwayland-client.so.0.22.0 to libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0 changed symlink target from libwayland-cursor.so.0.22.0 to libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1 changed symlink target from libwayland-egl.so.1.22.0 to libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0 changed symlink target from libwayland-server.so.0.22.0 to libwayland-server.so.0.23.0
  /usr/lib/libwayland-client.so.0.22.0 moved to /usr/lib/libwayland-client.so.0.23.0
  /usr/lib/libwayland-cursor.so.0.22.0 moved to /usr/lib/libwayland-cursor.so.0.23.0
  /usr/lib/libwayland-egl.so.1.22.0 moved to /usr/lib/libwayland-egl.so.1.23.0
  /usr/lib/libwayland-server.so.0.22.0 moved to /usr/lib/libwayland-server.so.0.23.0

--===============4798030477094069923==--

