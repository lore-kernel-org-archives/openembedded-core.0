Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62880C04FDF
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.102702.1697399114062527266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IjcHY1kH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mTKQ0bg3;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b34df0670-a2f6768f-ca0d-4405-8d49-53937b592c71-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nICs4QWJiijr5ASqDjZwLHvYI2NJXiIL/6YifuDA1GI=;
	b=IjcHY1kHO0RDb/J0qgTlRLSlJQl5rgzD59ZnUrC2qP5sdEOTW0xE7zARKnUbFa6i
	k/SXvpsx9UfJNfDsF+5Awt8mxcCOmJh7a01Yg3MUVLWxGkccNmoHbD4AQN0aSYpBksj
	ePBbRnauu6zXreZyaXx+4j1L8xYazo64j6FMDdPM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nICs4QWJiijr5ASqDjZwLHvYI2NJXiIL/6YifuDA1GI=;
	b=mTKQ0bg3PjDkRJQykHC1I6d3eIO4T2/LvXkWfaTKo3wW0vxySvx251DRZ3iPDQkK
	4RPPAdJS1vBcC9FNWDrGlAQgPII8uuDk5WDh7SksV31dAEITOXR+LqCVvZfEdcz7xko
	NMIRI3mYbdjFo3dVNVcS3jXbNQwaUadSLxFjc8RI=
Content-Type: multipart/mixed; boundary="===============3484397380256970896=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.5.2 SUCCEEDED
Message-ID: <0101018b34df0670-a2f6768f-ca0d-4405-8d49-53937b592c71-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189172

--===============3484397380256970896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.5.1-6.5.2.patch
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
From ece8f0086b32f8e5fd97af5bb12aaa559e2d392a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 08:43:49 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.5.1 -> 6.5.2

---
 .../btrfs-tools/{btrfs-tools_6.5.1.bb => btrfs-tools_6.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.5.1.bb => btrfs-tools_6.5.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
index 527e13d08e..2d3f70118d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.2.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "92d04d4780886a9850716e5529f1dace97779931"
+SRCREV = "546edf535ddecae480a51306e4d08f5dbd4e3ea7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============3484397380256970896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.2-py3.11.egg-info

--===============3484397380256970896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 21275480 to 21465352 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208126 to 208146 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/mkfs -> /usr/src/debug/btrfs-tools/6.5.2-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/convert -> /usr/src/debug/btrfs-tools/6.5.2-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.5.2-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/image -> /usr/src/debug/btrfs-tools/6.5.2-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/include -> /usr/src/debug/btrfs-tools/6.5.2-r0/include, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/check -> /usr/src/debug/btrfs-tools/6.5.2-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0 -> /usr/src/debug/btrfs-tools/6.5.2-r0, directory renamed /usr/src/debug/btrfs-tools/6.5.1
 -r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.5.2-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/crypto -> /usr/src/debug/btrfs-tools/6.5.2-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/libbtrfs -> /usr/src/debug/btrfs-tools/6.5.2-r0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/cmds -> /usr/src/debug/btrfs-tools/6.5.2-r0/cmds, directory renamed /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.5.2-r0/kernel-shared/uapi, removed "/usr/src/debug/btrfs-tools/6.5.1-r0/common/help.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/array.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/units.h /usr/src/debug/btrf
 s-tools/6.5.1-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/help.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/array.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/units.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/sort-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/extent-cache.c /usr/src/debug
 /btrfs-tools/6.5.1-r0/tune/tune.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/messages.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/tune/main.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/messages.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.5.1-r0/tune/seeding.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-stream.h /usr
 /src/debug/btrfs-tools/6.5.1-r0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.5.1-r0/tune/change-csum.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/sort-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-utils.h", added "/usr/src/debug/btrfs-tools/6.5.2-r0/common/help.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/tune/change-uuid.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/array.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/units.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/parse-ut
 ils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/help.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/array.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/units.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/sort-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.5.2-r0/
 common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.5.2-r0/tune/tune.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/messages.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/tune/main.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/messages.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/fsfeatures.c /usr/src/debug/btr
 fs-tools/6.5.2-r0/tune/seeding.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.5.2-r0/tune/quota.c /usr/src/debug/btrfs-tools/6.5.2-r0/tune/change-metadata-uuid.c /usr/src/debug/btrfs-tools/6.5.2-r0/tune/change-csum.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.5.2-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/sort-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.5.2-r0/tune/convert-bgt.c /usr/src/debug/btrfs-tools/6.5.2-r0/common/send-utils.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4043787 to 4097214 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 7065780 to 7110836 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.5.1" to "6.5.2"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.5.1 [default] to 6.5.2 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.5.1-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.2-py3.11.egg-info

--===============3484397380256970896==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.5.1-6.5.2.patch"

RnJvbSBlY2U4ZjAwODZiMzJmOGU1ZmQ5N2FmNWJiMTJhYWE1NTllMmQzOTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDg6NDM6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjUuMSAtPiA2LjUuMgoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzYuNS4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuNS4yLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuNS4xLmJiID0+IGJ0
cmZzLXRvb2xzXzYuNS4yLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi41LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjUuMi5iYgppbmRleCA1MjdlMTNkMDhlLi4yZDNmNzAxMThkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi41LjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
NS4yLmJiCkBAIC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2Rh
dmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhv
bi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjkyZDA0ZDQ3ODA4
ODZhOTg1MDcxNmU1NTI5ZjFkYWNlOTc3Nzk5MzEiCitTUkNSRVYgPSAiNTQ2ZWRmNTM1ZGRlY2Fl
NDgwYTUxMzA2ZTRkMDhmNWRiZDRlM2VhNyIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIgXAotLSAKMi4zOS4yCgo=

--===============3484397380256970896==--

