Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782A7EED62F
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29666.1694804393320073538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Um79adLy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ga9Fu5OG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36ba3a-7ba492a2-a894-4659-8617-cc415033eb51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V84YuSHBZqOAWV5Zq3iB1SiYnphFs8s8NLrjanuL7uk=;
	b=Um79adLyrMOEXJJfcDwXvbrbn2HSDeKTIyB/Ur3CDmVPj+QovPr0elwMAxs0twqR
	Ac6WjH3EnFSyN2T9/RRgPVeB96CKBrk410ZVj4SrFU+fUaluv+wx4//gfhxhqXKzu3g
	EhyvbX1G3Gs7gziH2gol+tu1iUULk0R9xsVQPPwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V84YuSHBZqOAWV5Zq3iB1SiYnphFs8s8NLrjanuL7uk=;
	b=Ga9Fu5OGmsf0bORm7FqIVfNbVA2Yr72KGbNKDC96E2Q3N1FCGsFAMKAW3O4PGNcM
	nqvuF51Qedd25XGJlQuEVoDFJxL7zLt+zQqCdqhDa5z/30sqSkFEJOzx3JbsuRtsV7I
	cbTKff5W1UqipLKIWhSenLkTjuybhsQmN+0VTZF0=
Content-Type: multipart/mixed; boundary="===============6887469359510513685=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.5.1 SUCCEEDED
Message-ID: <0101018a9a36ba3a-7ba492a2-a894-4659-8617-cc415033eb51-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187686

--===============6887469359510513685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.3.3-6.5.1.patch
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
From a1674cdb7c03398030b094181fbcdd4123bd42b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 08:09:40 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.3.3 -> 6.5.1

---
 .../btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.3.3.bb => btrfs-tools_6.5.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
index e7a64e8363..527e13d08e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "bb0ca35245858f17a6ced97aade1dd8d70f9c9d7"
+SRCREV = "92d04d4780886a9850716e5529f1dace97779931"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.39.2


--===============6887469359510513685==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.3.3-6.5.1.patch"

RnJvbSBhMTY3NGNkYjdjMDMzOTgwMzBiMDk0MTgxZmJjZGQ0MTIzYmQ0MmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDg6MDk6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjMuMyAtPiA2LjUuMQoKLS0tCiAuLi4vYnRyZnMtdG9vbHMv
e2J0cmZzLXRvb2xzXzYuMy4zLmJiID0+IGJ0cmZzLXRvb2xzXzYuNS4xLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMy4zLmJiID0+IGJ0
cmZzLXRvb2xzXzYuNS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjMuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9v
bHNfNi4zLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjUuMS5iYgppbmRleCBlN2E2NGU4MzYzLi41MjdlMTNkMDhlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4zLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYu
NS4xLmJiCkBAIC0xOCw3ICsxOCw3IEBAIERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2Rh
dmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhv
bi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImJiMGNhMzUyNDU4
NThmMTdhNmNlZDk3YWFkZTFkZDhkNzBmOWM5ZDciCitTUkNSRVYgPSAiOTJkMDRkNDc4MDg4NmE5
ODUwNzE2ZTU1MjlmMWRhY2U5Nzc3OTkzMSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tB
R0VDT05GSUcgPz89ICIgXAotLSAKMi4zOS4yCgo=

--===============6887469359510513685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 21145972 to 21275480 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 207554 to 208126 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4002612 to 4043787 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.5.1-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/crypto -> /usr/src/debug/btrfs-tools/6.5.1-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/libbtrfs -> /usr/src/debug/btrfs-tools/6.5.1-r0/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/kernel-shared -> /usr/src/debug/btrfs-tools/6.5.1-r0/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/include -> /usr/src/debug/btrfs-tools/6.5.1-r0/include, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/mkfs -> /usr/src/debug/btrfs-tools/6.5.1-r0/mkfs, direct
 ory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/tune -> /usr/src/debug/btrfs-tools/6.5.1-r0/tune, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/check -> /usr/src/debug/btrfs-tools/6.5.1-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0 -> /usr/src/debug/btrfs-tools/6.5.1-r0, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.5.1-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.3.3-r0/convert -> /usr/src/debug/btrfs-tools/6.5.1-r0/convert, removed "/usr/src/debug/btrfs-tools/6.3.3-r0/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/help.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/balance.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/receive.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/inspect.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/reflink.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/replace.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/filesystem-usage.h /usr/src/debug/btrfs-
 tools/6.3.3-r0/cmds/restore.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/subvolume-list.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/help.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/send.c /usr/src/debug/btrfs-tools/6.3.3-r0/image/main.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/props.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/device-scan.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/quota.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6
 .3.3-r0/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/receive-dump.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/units.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/qgroup.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/rescue.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/units.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/device.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/rescue.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/scrub.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/messages.h /
 usr/src/debug/btrfs-tools/6.3.3-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/property.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/task-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/messages.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.3.3-r0/image/sanitize.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/image/metadump.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/insp
 ect-tree-stats.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/extent-cache.h /usr/src/debug/btrfs-tools/6.3.3-r0/image/sanitize.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/commands.h /usr/src/debug/btrfs-tools/6.3.3-r0/cmds/filesystem.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.3.3-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.3.3-r0/common/string-utils.h", added "/usr/src/debug/btrfs-tools/6.5.1-r0/cmds/balance.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/restore.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/replace.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/reflink.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/receive.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/rescue.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/dev
 ice.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/rescue.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/messages.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/property.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/messages.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/commands.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/subvolume-list.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/filesystem-usage.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/send.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/receive-dump.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/extent-cache.c /usr/src/debug/btrfs-tools/6.5.1-r0/
 common/extent-cache.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/image/image-restore.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/inspect.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/props.h /usr/src/debug/btrfs-tools/6.5.1-r0/image/image-create.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/quota.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/qgroup.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/open-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/path-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/sort-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/
 task-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/open-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/path-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/sort-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/task-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.5.1-r0/image/metadump.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-stream.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-table.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/send-stream.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-table.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/string-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/help.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/help.c /usr/src/debug/btrfs-tools/6.5.1-r0/image/main.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.5.1-r0
 /common/device-scan.c /usr/src/debug/btrfs-tools/6.5.1-r0/image/common.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/format-output.c /usr/src/debug/btrfs-tools/6.5.1-r0/image/common.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/device-scan.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/format-output.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/array.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/units.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/array.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/units.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/subvolume.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/scrub.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/parse-utils.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/sysfs-utils.c
  /usr/src/debug/btrfs-tools/6.5.1-r0/image/sanitize.c /usr/src/debug/btrfs-tools/6.5.1-r0/common/parse-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/inspect-tree-stats.c /usr/src/debug/btrfs-tools/6.5.1-r0/image/sanitize.h /usr/src/debug/btrfs-tools/6.5.1-r0/cmds/filesystem.c"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 7028916 to 7065780 (+1%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.3.3" to "6.5.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.3.3 [default] to 6.5.1 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.1-py3.11.egg-info

--===============6887469359510513685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.3.3-py3.11.egg-info moved to /usr/lib/python3.11/site-packages/btrfsutil-6.5.1-py3.11.egg-info

--===============6887469359510513685==--

