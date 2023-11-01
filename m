Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7766EC25B0E
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8481.1698848703574249006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HazrNsQw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TnMzevxH;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b4600e9-f12ba18e-b210-4396-97da-1479348d638b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O4UM/Xk7ZZnT1nmG5rxli01oRCxFF9fwTWS1E81d3Os=;
	b=HazrNsQw3R0pQmBgh33+zEFxy9S/DpuyNTS5WMkdp+DVEftPO+Ea4KiHbblL8J71
	AbdCv9jQP+Qo4EDAal28RMAGigGaNlO3dEXlKrIsqz1m9jFSO0SmkKKFdNY9N9/aOEf
	BPuQTxfAths87GwwLBeHPqwPe3wA0/TJ6jLUKcDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O4UM/Xk7ZZnT1nmG5rxli01oRCxFF9fwTWS1E81d3Os=;
	b=TnMzevxHArMU+QyV1+Uriyqk8i+kR/MGRwg+QWDZVlM/8rN7j8rN4zFPbTtlZfcI
	xZLQ0dh3q8mv5ht+VVUyHLupcZ3mPnBg6DkEVz9cxQfDoLcOxkhsXhSJC7gRx8qvLxz
	dz0x9y/jUrXeDETktIx0aY8cuiSz0Hih04hBQk5c=
Content-Type: multipart/mixed; boundary="===============1209171526799590892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.5.3 SUCCEEDED
Message-ID: <0101018b8b4600e9-f12ba18e-b210-4396-97da-1479348d638b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189936

--===============1209171526799590892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.2-6.5.3.patch
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
From 87b397318c535d80e22bf0335e28758f60644ccb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:25:54 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.2 -> 6.5.3

---
 .../btrfs-tools/{btrfs-tools_6.5.2.bb => btrfs-tools_6.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.2.bb => btrfs-tools_6.5.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
index 2d3f70118d..873d5e7a14 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "546edf535ddecae480a51306e4d08f5dbd4e3ea7"
+SRCREV = "a45c360b64660477c726e192d9e92ceb73a50f80"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============1209171526799590892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 24954768 to 24928384 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4110883 to 4123002 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.5.3-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/convert -> /usr/src/debug/btrfs-tools/6.5.3-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfs -> /usr/src/debug/btrfs-tools/6.5.3-r0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/image -> /usr/src/debug/btrfs-tools/6.5.3-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.5.3-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.5.3-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/include -> /usr/src/debug/btrfs-tools/6.5.3-r0/include, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0 -> /usr/src/debug/btrfs-tools/6.5.3-r0, directory renamed /usr/src/d
 ebug/btrfs-tools/6.5.2-r0/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.5.3-r0/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.5.3-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/mkfs -> /usr/src/debug/btrfs-tools/6.5.3-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/tune -> /usr/src/debug/btrfs-tools/6.5.3-r0/tune, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/crypto -> /usr/src/debug/btrfs-tools/6.5.3-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.5.2-r0/cmds -> /usr/src/debug/btrfs-tools/6.5.3-r0/cmds, removed "/usr/src/debug/btrfs-tools/6.5.2-r0/common/help.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/help.c /usr/src/
 debug/btrfs-tools/6.5.2-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/messages.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/qgroup-verify.c /usr/src/debug/btrfs-tools/6.5.2-r0/check/qgroup-verify.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/messages.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/array.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/units.c /usr/src/debug/btrfs-tools/6.5.2-r0/
 common/utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/array.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/units.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/mode-lowmem.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/sort-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/mode-lowmem.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/sort-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/com
 mon/task-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/mode-common.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/clear-cache.c /usr/src/debug/btrfs-tools/6.5.2-r0/check/clear-cache.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/mode-common.c /usr/src/debug/btrfs-tools/6.5.2-r0/check/main.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/check/common.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/repair.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/repair.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/check/mode-original.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.5.2-
 r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/cpu-utils.c", added "/usr/src/debug/btrfs-tools/6.5.3-r0/common/help.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/help.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/extent-tree-uti
 ls.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/messages.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/qgroup-verify.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/clear-cache.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/qgroup-verify.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/messages.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/clear-cache.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/array.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/units.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/array.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/units.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/mode-lowmem.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/open-utils.c 
 /usr/src/debug/btrfs-tools/6.5.3-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/sort-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/mode-lowmem.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/sort-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/mode-common.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/mode-common.c /usr/src/debug/btrfs-tools/6.5.3-r0/check/main.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/check/common.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/re
 pair.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/repair.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/check/mode-original.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.5.3-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.5.3-r0/common/cpu-utils.c"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5726540 to 5759308 (+1%)
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.5.2" to "6.5.3"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.5.2 [default] to 6.5.3 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.2-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info

--===============1209171526799590892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.2-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.3-py3.11.egg-info

--===============1209171526799590892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.2-6.5.3.patch"

RnJvbSA4N2IzOTczMThjNTM1ZDgwZTIyYmYwMzM1ZTI4NzU4ZjYwNjQ0Y2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjoyNTo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuNS4yIC0+IDYuNS4zCgotLS0KIC4uLi9idHJmcy10b29scy97
YnRyZnMtdG9vbHNfNi41LjIuYmIgPT4gYnRyZnMtdG9vbHNfNi41LjMuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy97YnRyZnMtdG9vbHNfNi41LjIuYmIgPT4gYnRy
ZnMtdG9vbHNfNi41LjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTgl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29s
c182LjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuNS4zLmJiCmluZGV4IDJkM2Y3MDExOGQuLjg3M2Q1ZTdhMTQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi41
LjMuYmIKQEAgLTE4LDcgKzE4LDcgQEAgREVQRU5EUyA9ICJ1dGlsLWxpbnV4IHpsaWIiCiBTUkNf
VVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rZGF2
ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNTQ2ZWRmNTM1ZGRl
Y2FlNDgwYTUxMzA2ZTRkMDhmNWRiZDRlM2VhNyIKK1NSQ1JFViA9ICJhNDVjMzYwYjY0NjYwNDc3
YzcyNmUxOTJkOWU5MmNlYjczYTUwZjgwIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiBcCi0tIAoyLjM5LjIKCg==

--===============1209171526799590892==--

