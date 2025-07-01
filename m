Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ED7C83F07
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1433.1751386810735249284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=unfkteeu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=r1Au/XFt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010197c6c9e730-de71d4c7-b92e-40be-81a7-c336448eafd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p309ePlCqY7wzzWXbJHB/GEFUDB9LZgRhq6i+2TJpi8=;
	b=unfkteeuJau6PoRh6Cam8HYkBYXUQEPl0dUj3PqlF9+7kury2iv6HuzSEjXpcGUn
	hEK+m+YuA6tTm/KqEBi+8I58i3PWHD5AgwNHr1fnElKO6ltG1e2SBwgb2jlDonnx6up
	pTiDZVtwzcJMM2UZa2wHZTCTIxonqhpVUFKQUSAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p309ePlCqY7wzzWXbJHB/GEFUDB9LZgRhq6i+2TJpi8=;
	b=r1Au/XFtao0nCgeZzfyWJklci0IzeyJHvLaxDElLhZdedFrpO5bWsJRQzxbhNkz5
	mrBNISsSNKBka3HW8LMBp1ZA5VNVI2wjqp3lhZPXaxyL4jf9yukIhQHY435zdRjBaXm
	KNBQ7AC8iYTJH7hG1XcEHLw9QAoUvY4W6IJJiynw=
Content-Type: multipart/mixed; boundary="===============4259689875835366041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.15 SUCCEEDED
Message-ID: <01010197c6c9e730-de71d4c7-b92e-40be-81a7-c336448eafd2-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219620

--===============4259689875835366041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *6.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.14-6.15.patch
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
From aca3f7f8e271b11e81bc910bce0d055df172a916 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:10:00 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.14 -> 6.15

---
 ...Add-a-possibility-to-specify-where-python-modules-ar.patch | 4 ++--
 .../btrfs-tools/{btrfs-tools_6.14.bb => btrfs-tools_6.15.bb}  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.14.bb => btrfs-tools_6.15.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 2cd66d2722..018c199322 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 030ec81c0dac1e067faf49924d5631bb22ccc90d Mon Sep 17 00:00:00 2001
+From 712ef638946a21d57de00d3e64c9cdfc90419645 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 7e36aa42..edff7d5b 100644
+index 523b8349..e0dd59de 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -996,7 +996,7 @@ endif
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
index 982d4830b5..88a6d11354 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.14.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.15.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "5ad147c9ec00e657393c85b195c9bcc0f4c35a54"
+SRCREV = "3da67f1c78bcbd7556f04d89e31aa4621face50b"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============4259689875835366041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.14-6.15.patch"

RnJvbSBhY2EzZjdmOGUyNzFiMTFlODFiYzkxMGJjZTBkMDU1ZGYxNzJhOTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODoxMDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMTQgLT4gNi4xNQoKLS0tCiAuLi5BZGQtYS1wb3NzaWJpbGl0
eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNCArKy0tCiAuLi4v
YnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMTQuYmIgPT4gYnRyZnMtdG9vbHNfNi4xNS5iYn0g
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182
LjE0LmJiID0+IGJ0cmZzLXRvb2xzXzYuMTUuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggMmNkNjZk
MjcyMi4uMDE4YzE5OTMyMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZz
LXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVy
ZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdo
ZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzBlYzgx
YzBkYWMxZTA2N2ZhZjQ5OTI0ZDU2MzFiYjIyY2NjOTBkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA3MTJlZjYzODk0NmEyMWQ1N2RlMDBkM2U2NGM5Y2RmYzkwNDE5NjQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1vZHVs
ZXMgYXJlCkBAIC0xMSw3ICsxMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5k
ZXggN2UzNmFhNDIuLmVkZmY3ZDViIDEwMDY0NAoraW5kZXggNTIzYjgzNDkuLmUwZGQ1OWRlIDEw
MDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCiBAQCAtOTk2LDcgKzk5Niw3IEBA
IGVuZGlmCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRy
ZnMtdG9vbHNfNi4xNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJm
cy10b29sc182LjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjE0LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNS5iYgppbmRl
eCA5ODJkNDgzMGI1Li44OGE2ZDExMzU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xNS5iYgpAQCAtMTgsNyArMTgsNyBAQCBE
RVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9r
ZGF2ZS9idHJmcy1wcm9ncy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwczt0YWc9diR7
UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lm
eS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9
ICI1YWQxNDdjOWVjMDBlNjU3MzkzYzg1YjE5NWM5YmNjMGY0YzM1YTU0IgorU1JDUkVWID0gIjNk
YTY3ZjFjNzhiY2JkNzU1NmYwNGQ4OWUzMWFhNDYyMWZhY2U1MGIiCiAKIFBBQ0tBR0VDT05GSUcg
Pz89ICIgXAogICAgIHByb2dyYW1zIFwKLS0gCjIuNDcuMQoK

--===============4259689875835366041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.14-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.15-py3.13.egg-info

--===============4259689875835366041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 26952912 to 27068208 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4229319 to 4256376 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.14/image -> /usr/src/debug/btrfs-tools/6.15/image, directory renamed /usr/src/debug/btrfs-tools/6.14/mkfs -> /usr/src/debug/btrfs-tools/6.15/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.14/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.15/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.14/convert -> /usr/src/debug/btrfs-tools/6.15/convert, directory renamed /usr/src/debug/btrfs-tools/6.14/kernel-lib -> /usr/src/debug/btrfs-tools/6.15/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.14/include -> /usr/src/debug/btrfs-tools/6.15/include, directory renamed /usr/src/debug/btrfs-tools/6.14/libbtrfs -> /usr/src/debug/btrfs-tools/6.15/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.14/check -> /usr/src/debug/btrfs-tools/6.15/check, directory renamed /usr/src/debug/btrfs-tools/6.14/crypto -> /usr/src/debug/btrfs-tools/6.15/crypto
 , directory renamed /usr/src/debug/btrfs-tools/6.14/tune -> /usr/src/debug/btrfs-tools/6.15/tune, directory renamed /usr/src/debug/btrfs-tools/6.14/common -> /usr/src/debug/btrfs-tools/6.15/common, directory renamed /usr/src/debug/btrfs-tools/6.14/kernel-shared -> /usr/src/debug/btrfs-tools/6.15/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/6.14/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.15/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.14 -> /usr/src/debug/btrfs-tools/6.15, removed "/usr/src/debug/btrfs-tools/6.14/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.14/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.14/cmds/inspect-tree-stats.c /usr/src/debug/btrfs-tools/6.14/cmds/quota.c /usr/src/debug/btrfs-tools/6.14/cmds/balance.c /usr/src/debug/btrfs-tools/6.14/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.14/cmds/replace.c /usr/src/debug/btrfs-tools/6.14/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.14/cmds/reflink.c /usr
 /src/debug/btrfs-tools/6.14/cmds/filesystem.c /usr/src/debug/btrfs-tools/6.14/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.14/cmds/inspect.c /usr/src/debug/btrfs-tools/6.14/cmds/device.c /usr/src/debug/btrfs-tools/6.14/cmds/filesystem-usage.h /usr/src/debug/btrfs-tools/6.14/cmds/property.c /usr/src/debug/btrfs-tools/6.14/cmds/receive-dump.c /usr/src/debug/btrfs-tools/6.14/cmds/subvolume.h /usr/src/debug/btrfs-tools/6.14/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.14/cmds/scrub.c /usr/src/debug/btrfs-tools/6.14/cmds/receive.c /usr/src/debug/btrfs-tools/6.14/cmds/send.c /usr/src/debug/btrfs-tools/6.14/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6.14/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.14/cmds/props.h /usr/src/debug/btrfs-tools/6.14/cmds/subvolume-list.c /usr/src/debug/btrfs-tools/6.14/cmds/qgroup.h /usr/src/debug/btrfs-tools/6.14/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.14/cmds/restore.c /usr/src/debug/btrfs-tools/6.14/cmds/commands.h /usr/src/debug/b
 trfs-tools/6.14/cmds/rescue.c /usr/src/debug/btrfs-tools/6.14/cmds/rescue.h", added "/usr/src/debug/btrfs-tools/6.15/cmds/rescue-fix-data-checksum.c /usr/src/debug/btrfs-tools/6.15/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.15/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.15/cmds/inspect-tree-stats.c /usr/src/debug/btrfs-tools/6.15/cmds/quota.c /usr/src/debug/btrfs-tools/6.15/cmds/balance.c /usr/src/debug/btrfs-tools/6.15/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.15/cmds/replace.c /usr/src/debug/btrfs-tools/6.15/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.15/cmds/reflink.c /usr/src/debug/btrfs-tools/6.15/cmds/filesystem.c /usr/src/debug/btrfs-tools/6.15/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.15/cmds/inspect.c /usr/src/debug/btrfs-tools/6.15/cmds/device.c /usr/src/debug/btrfs-tools/6.15/cmds/filesystem-usage.h /usr/src/debug/btrfs-tools/6.15/cmds/property.c /usr/src/debug/btrfs-tools/6.15/cmds/receive-dump.c /usr/src/debug/bt
 rfs-tools/6.15/cmds/subvolume.h /usr/src/debug/btrfs-tools/6.15/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.15/cmds/scrub.c /usr/src/debug/btrfs-tools/6.15/cmds/receive.c /usr/src/debug/btrfs-tools/6.15/cmds/send.c /usr/src/debug/btrfs-tools/6.15/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6.15/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.15/cmds/props.h /usr/src/debug/btrfs-tools/6.15/cmds/subvolume-list.c /usr/src/debug/btrfs-tools/6.15/cmds/qgroup.h /usr/src/debug/btrfs-tools/6.15/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.15/cmds/restore.c /usr/src/debug/btrfs-tools/6.15/cmds/commands.h /usr/src/debug/btrfs-tools/6.15/cmds/rescue.c /usr/src/debug/btrfs-tools/6.15/cmds/rescue.h"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5860847 to 5877247 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.14" to "6.15"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.14 [default] to 6.15 [default]
packages/core2-64-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.14 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v6.15 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.14" to "6.15"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.13/site-packages/btrfsutil-6.14-py3.13.egg-info moved to /usr/lib/python3.13/site-packages/btrfsutil-6.15-py3.13.egg-info

--===============4259689875835366041==--

