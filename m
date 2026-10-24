Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1853.1792822996152264140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nDf/ZxVI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Pe193SJ4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a16c93e83a-459ef42e-1efa-448a-a836-b1a9a523b2b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822995;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j5Mj7H9z3EENzsVlNEFLQtAEGUV03OmuhhY+9hfV2jg=;
	b=nDf/ZxVIIEyxvUNqm2CUM7etussx3ZPxf3YSqjgFGcCqfUf2a8Kqi6lZ37O0tVeP
	EeheLA8YC2i3OygxfFNdtWXXkDOpRhUgT6iU4aHFRTTNvnp1tyVh9OeGnNRcJzQtwOQ
	7ywQBBHKX0FdXCibcGs4OUdVuH3gD+qZMS+vtKVQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822995;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j5Mj7H9z3EENzsVlNEFLQtAEGUV03OmuhhY+9hfV2jg=;
	b=Pe193SJ4HwKYKr2LiYxtDaO+EjMWzDDiPwsd0SE6tm0sCHFaduCul6e7diyf2q5C
	OluoMDz1kqByOcBjVbB7u0rSxDG0XCWidF4wFyV8Yr4AkSLvkGu64kSLeCHGsH0GQlw
	grrWn9GVGabCy751uQkXsiMVEtP/cnLnr+rDigWA=
Content-Type: multipart/mixed; boundary="===============3656972813835418859=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 7.3 SUCCEEDED
Message-ID: <010101a16c93e83a-459ef42e-1efa-448a-a836-b1a9a523b2b8-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248573

--===============3656972813835418859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-7.1-7.3.patch
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
From 5cd6d8bfd4c13b7c2813fe6bd1c9c8d6fdedefd6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:13:34 +0000
Subject: [PATCH] btrfs-tools: upgrade 7.1 -> 7.3

btrfs-progs-7.3 (2026-10-23)
----------------------------

btrfs-progs-7.2 (skipped)
-------------------------
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../btrfs-tools/{btrfs-tools_7.1.bb => btrfs-tools_7.3.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.1.bb => btrfs-tools_7.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 7272c27c6c..b3b8584f5f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From 0ebc4629faf538a756bb12eb2dd8dfc5afa30af6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index 78c23ad3..e912474a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -994,7 +994,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
index 1bc75a7de7..647b1bfa1f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
@@ -17,7 +17,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "4ab0e80be9e3bb1db2e6038e6d4316d35fb7ba8b"
+SRCREV = "afdc3a65e33f4d42f768ad50dca20c32e5ee1496"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============3656972813835418859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27918848 to 28015408 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4345531 to 4363468 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/7.1/convert -> /usr/src/debug/btrfs-tools/7.3/convert, directory renamed /usr/src/debug/btrfs-tools/7.1 -> /usr/src/debug/btrfs-tools/7.3, directory renamed /usr/src/debug/btrfs-tools/7.1/mkfs -> /usr/src/debug/btrfs-tools/7.3/mkfs, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/7.3/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/7.1/tune -> /usr/src/debug/btrfs-tools/7.3/tune, directory renamed /usr/src/debug/btrfs-tools/7.1/crypto -> /usr/src/debug/btrfs-tools/7.3/crypto, directory renamed /usr/src/debug/btrfs-tools/7.1/check -> /usr/src/debug/btrfs-tools/7.3/check, directory renamed /usr/src/debug/btrfs-tools/7.1/libbtrfs -> /usr/src/debug/btrfs-tools/7.3/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/7.1/image -> /usr/src/debug/btrfs-tools/7.3/image, directory renamed /usr/src/debug/btrfs-tool
 s/7.1/cmds -> /usr/src/debug/btrfs-tools/7.3/cmds, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-lib -> /usr/src/debug/btrfs-tools/7.3/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-shared -> /usr/src/debug/btrfs-tools/7.3/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/7.1/include -> /usr/src/debug/btrfs-tools/7.3/include, directory renamed /usr/src/debug/btrfs-tools/7.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/7.3/libbtrfsutil, removed "/usr/src/debug/btrfs-tools/7.1/common/cpu-utils.c /usr/src/debug/btrfs-tools/7.1/common/root-tree-utils.c /usr/src/debug/btrfs-tools/7.1/common/help.h /usr/src/debug/btrfs-tools/7.1/common/device-utils.h /usr/src/debug/btrfs-tools/7.1/common/device-scan.c /usr/src/debug/btrfs-tools/7.1/common/format-output.h /usr/src/debug/btrfs-tools/7.1/common/help.c /usr/src/debug/btrfs-tools/7.1/common/inject-error.c /usr/src/debug/btrfs-tools/7.1/common/cpu-utils.h /usr/src/debug/btrfs-tools/7.1/common/device-scan.h
  /usr/src/debug/btrfs-tools/7.1/common/device-utils.c /usr/src/debug/btrfs-tools/7.1/common/format-output.c /usr/src/debug/btrfs-tools/7.1/common/root-tree-utils.h /usr/src/debug/btrfs-tools/7.1/common/array.h /usr/src/debug/btrfs-tools/7.1/common/open-utils.h /usr/src/debug/btrfs-tools/7.1/common/array.c /usr/src/debug/btrfs-tools/7.1/common/compat.c /usr/src/debug/btrfs-tools/7.1/common/open-utils.c /usr/src/debug/btrfs-tools/7.1/common/string-table.h /usr/src/debug/btrfs-tools/7.1/common/path-utils.h /usr/src/debug/btrfs-tools/7.1/common/rbtree-utils.c /usr/src/debug/btrfs-tools/7.1/common/tree-search.h /usr/src/debug/btrfs-tools/7.1/common/rbtree-utils.h /usr/src/debug/btrfs-tools/7.1/common/string-table.c /usr/src/debug/btrfs-tools/7.1/common/send-utils.h /usr/src/debug/btrfs-tools/7.1/common/filesystem-utils.c /usr/src/debug/btrfs-tools/7.1/common/clear-cache.c /usr/src/debug/btrfs-tools/7.1/common/send-utils.c /usr/src/debug/btrfs-tools/7.1/common/clear-cache.h /usr/src/debug
 /btrfs-tools/7.1/common/filesystem-utils.h /usr/src/debug/btrfs-tools/7.1/common/send-stream.h /usr/src/debug/btrfs-tools/7.1/common/send-stream.c /usr/src/debug/btrfs-tools/7.1/common/fsfeatures.c /usr/src/debug/btrfs-tools/7.1/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/7.1/common/utils.h /usr/src/debug/btrfs-tools/7.1/common/extent-cache.c /usr/src/debug/btrfs-tools/7.1/common/messages.h /usr/src/debug/btrfs-tools/7.1/common/sysfs-utils.c /usr/src/debug/btrfs-tools/7.1/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/7.1/common/units.c /usr/src/debug/btrfs-tools/7.1/common/fsfeatures.h /usr/src/debug/btrfs-tools/7.1/common/units.h /usr/src/debug/btrfs-tools/7.1/common/extent-cache.h /usr/src/debug/btrfs-tools/7.1/common/messages.c /usr/src/debug/btrfs-tools/7.1/common/sysfs-utils.h /usr/src/debug/btrfs-tools/7.1/common/utils.c /usr/src/debug/btrfs-tools/7.1/common/parse-utils.c /usr/src/debug/btrfs-tools/7.1/common/string-utils.h /usr/src/debug/btrfs-tools/7.1/comm
 on/parse-utils.h /usr/src/debug/btrfs-tools/7.1/common/string-utils.c /usr/src/debug/btrfs-tools/7.1/common/path-utils.c /usr/src/debug/btrfs-tools/7.1/common/task-utils.h /usr/src/debug/btrfs-tools/7.1/common/sort-utils.h /usr/src/debug/btrfs-tools/7.1/common/task-utils.c /usr/src/debug/btrfs-tools/7.1/common/sort-utils.c", added "/usr/src/debug/btrfs-tools/7.3/common/cpu-utils.c /usr/src/debug/btrfs-tools/7.3/common/root-tree-utils.c /usr/src/debug/btrfs-tools/7.3/common/help.h /usr/src/debug/btrfs-tools/7.3/common/device-utils.h /usr/src/debug/btrfs-tools/7.3/common/device-scan.c /usr/src/debug/btrfs-tools/7.3/common/format-output.h /usr/src/debug/btrfs-tools/7.3/common/help.c /usr/src/debug/btrfs-tools/7.3/common/inject-error.c /usr/src/debug/btrfs-tools/7.3/common/cpu-utils.h /usr/src/debug/btrfs-tools/7.3/common/device-scan.h /usr/src/debug/btrfs-tools/7.3/common/device-utils.c /usr/src/debug/btrfs-tools/7.3/common/format-output.c /usr/src/debug/btrfs-tools/7.3/common/root-tre
 e-utils.h /usr/src/debug/btrfs-tools/7.3/common/array.h /usr/src/debug/btrfs-tools/7.3/common/open-utils.h /usr/src/debug/btrfs-tools/7.3/common/array.c /usr/src/debug/btrfs-tools/7.3/common/compat.c /usr/src/debug/btrfs-tools/7.3/common/open-utils.c /usr/src/debug/btrfs-tools/7.3/common/string-table.h /usr/src/debug/btrfs-tools/7.3/common/path-utils.h /usr/src/debug/btrfs-tools/7.3/common/rbtree-utils.c /usr/src/debug/btrfs-tools/7.3/common/tree-search.h /usr/src/debug/btrfs-tools/7.3/common/rbtree-utils.h /usr/src/debug/btrfs-tools/7.3/common/string-table.c /usr/src/debug/btrfs-tools/7.3/common/send-utils.h /usr/src/debug/btrfs-tools/7.3/common/filesystem-utils.c /usr/src/debug/btrfs-tools/7.3/common/clear-cache.c /usr/src/debug/btrfs-tools/7.3/common/send-utils.c /usr/src/debug/btrfs-tools/7.3/common/clear-cache.h /usr/src/debug/btrfs-tools/7.3/common/filesystem-utils.h /usr/src/debug/btrfs-tools/7.3/common/send-stream.h /usr/src/debug/btrfs-tools/7.3/common/reproducible.c /usr/s
 rc/debug/btrfs-tools/7.3/common/send-stream.c /usr/src/debug/btrfs-tools/7.3/common/reproducible.h /usr/src/debug/btrfs-tools/7.3/common/fsfeatures.c /usr/src/debug/btrfs-tools/7.3/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/7.3/common/utils.h /usr/src/debug/btrfs-tools/7.3/common/extent-cache.c /usr/src/debug/btrfs-tools/7.3/common/messages.h /usr/src/debug/btrfs-tools/7.3/common/sysfs-utils.c /usr/src/debug/btrfs-tools/7.3/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/7.3/common/units.c /usr/src/debug/btrfs-tools/7.3/common/fsfeatures.h /usr/src/debug/btrfs-tools/7.3/common/units.h /usr/src/debug/btrfs-tools/7.3/common/extent-cache.h /usr/src/debug/btrfs-tools/7.3/common/messages.c /usr/src/debug/btrfs-tools/7.3/common/sysfs-utils.h /usr/src/debug/btrfs-tools/7.3/common/utils.c /usr/src/debug/btrfs-tools/7.3/common/parse-utils.c /usr/src/debug/btrfs-tools/7.3/common/string-utils.h /usr/src/debug/btrfs-tools/7.3/common/parse-utils.h /usr/src/debug/btrfs-tools/7.3/
 common/string-utils.c /usr/src/debug/btrfs-tools/7.3/common/path-utils.c /usr/src/debug/btrfs-tools/7.3/common/task-utils.h /usr/src/debug/btrfs-tools/7.3/common/sort-utils.h /usr/src/debug/btrfs-tools/7.3/common/task-utils.c /usr/src/debug/btrfs-tools/7.3/common/sort-utils.c"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6111464 to 6148328 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.3-py3.14.egg-info
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.3 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 7.1 [default] to 7.3 [default]
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info moved to /usr/lib/python3.14/site-packages/btrfsutil-7.3-py3.14.egg-info

--===============3656972813835418859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="btrfs-tools-changelog.txt"

btrfs-progs-7.3 (2026-10-23)
----------------------------

btrfs-progs-7.2 (skipped)
-------------------------

--===============3656972813835418859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info -> /usr/lib/python3.14/site-packages/btrfsutil-7.3-py3.14.egg-info
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.14/site-packages/btrfsutil-7.1-py3.14.egg-info moved to /usr/lib/python3.14/site-packages/btrfsutil-7.3-py3.14.egg-info

--===============3656972813835418859==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-7.1-7.3.patch"

RnJvbSA1Y2Q2ZDhiZmQ0YzEzYjdjMjgxM2ZlNmJkMWM5YzhkNmZkZWRlZmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6MTM6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA3LjEgLT4gNy4zCgpidHJmcy1wcm9ncy03LjMgKDIwMjYtMTAt
MjMpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCmJ0cmZzLXByb2dzLTcuMiAoc2tpcHBl
ZCkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLS0KIC4uLmQtYS1wb3NzaWJpbGl0eS10by1z
cGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNiArKystLS0KIC4uLi9idHJm
cy10b29scy97YnRyZnMtdG9vbHNfNy4xLmJiID0+IGJ0cmZzLXRvb2xzXzcuMy5iYn0gIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc183LjEuYmIg
PT4gYnRyZnMtdG9vbHNfNy4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRv
LXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1z
cGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDcyNzJjMjdjNmMuLmIz
Yjg1ODRmNWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xz
L2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRo
b24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2VkY2VlNTcwNzg3Njli
Nzc1MjI3NWUwZTVmMzVhZWZiZmVmYzllYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MGViYzQ2MjlmYWY1MzhhNzU2YmIxMmViMmRkOGRmYzVhZmEzMGFmNiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVjdDogW1BBVENI
XSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVzIGFyZQpA
QCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggOTZj
MTE4MzAuLjNmMjU4NWNiIDEwMDY0NAoraW5kZXggNzhjMjNhZDMuLmU5MTI0NzRhIDEwMDY0NAog
LS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTk3LDcgKzk5Nyw3IEBAIGVuZGlm
CitAQCAtOTk0LDcgKzk5NCw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklORElOR1MpLDEp
CiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNkIGxpYmJ0cmZz
dXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10
b29scy9idHJmcy10b29sc183LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9v
bHMvYnRyZnMtdG9vbHNfNy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjMuYmIK
aW5kZXggMWJjNzVhN2RlNy4uNjQ3YjFiZmExZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNy4zLmJiCkBAIC0xNyw3ICsxNyw3IEBA
IERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12
JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVj
aWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVW
ID0gIjRhYjBlODBiZTllM2JiMWRiMmU2MDM4ZTZkNDMxNmQzNWZiN2JhOGIiCitTUkNSRVYgPSAi
YWZkYzNhNjVlMzNmNGQ0MmY3NjhhZDUwZGNhMjBjMzJlNWVlMTQ5NiIKIAogUEFDS0FHRUNPTkZJ
RyA/Pz0gIiBcCiAgICAgcHJvZ3JhbXMgXAotLSAKMi40Ny4xCgo=

--===============3656972813835418859==--
