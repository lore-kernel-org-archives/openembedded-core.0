Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0773CD13C4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1990.1711994601357294872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vka5xPwv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=amtVSjn+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e9ad47d35-89436308-b001-4a55-b563-05c211ea9b31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ONBOhYTR3c+VIzHwNR1IdA7D3hYPF1tbTVSKZU/4jic=;
	b=Vka5xPwvIz0Rr8IMfYQDTiMTk084iKxt+F8zarzzrnl06GrmhQtLVahw6iYNf5Q7
	z4/bxRR5CWSY5W+C1cjgyif3epH164jCWet5U9WCltn7s04f0JCnAXnmtBbbWnVfKa0
	2KOD1W6IeyoWwQLfnQ9fDfyWzWPsG6kYJk98nVaw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ONBOhYTR3c+VIzHwNR1IdA7D3hYPF1tbTVSKZU/4jic=;
	b=amtVSjn+c4ybiLh1g8jImQx9WRWt6vqqDG6TET00n4O3l+ggWOv51wHJKoxwp25g
	vWMYXhnlG1tzr8dbrjEn7WpS5SZwCnmpGzGWaWPVa+bX2x/DzA9uad/Pz1r3JOORieq
	4k6eTX8XpleVsuKdQp0ZkE1DJB5OX/kSyBsfgpM8=
Content-Type: multipart/mixed; boundary="===============0604653092090569899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.8 SUCCEEDED
Message-ID: <0101018e9ad47d35-89436308-b001-4a55-b563-05c211ea9b31-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197707

--===============0604653092090569899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.7.1-6.8.patch
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
From 4fecb5ab03a87ba734a6702ac884d093392832fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 06:44:22 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.7.1 -> 6.8

---
 ...1-Add-a-possibility-to-specify-where-python-modules-ar.patch | 2 +-
 .../btrfs-tools/{btrfs-tools_6.7.1.bb => btrfs-tools_6.8.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.7.1.bb => btrfs-tools_6.8.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 4b1797b65f..b492770120 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
+From 94cd2fac90e47321235cff9b7ada2e24cd1c1ba7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
index 8132c2cc72..15cc7ac244 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "60abf7a90776c2405f616182ef6129474bbcb109"
+SRCREV = "3793e987d2b4e878410da16f33d963043d137d48"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.42.0


--===============0604653092090569899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.2.0", added "/usr/lib/libbtrfsutil.so.1.3.0"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.2.0 to libbtrfsutil.so.1.3.0
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.2.0 to libbtrfsutil.so.1.3.0
  /usr/lib/libbtrfsutil.so.1.2.0 moved to /usr/lib/libbtrfsutil.so.1.3.0
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/top_level.txt was removed

--===============0604653092090569899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.7.1-6.8.patch"

RnJvbSA0ZmVjYjVhYjAzYTg3YmE3MzRhNjcwMmFjODg0ZDA5MzM5MjgzMmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNjo0NDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuNy4xIC0+IDYuOAoKLS0tCiAuLi4xLUFkZC1hLXBvc3NpYmls
aXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggfCAyICstCiAuLi4v
YnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuNy4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuOC5iYn0g
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xz
XzYuNy4xLmJiID0+IGJ0cmZzLXRvb2xzXzYuOC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3Nz
aWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2li
aWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAppbmRleCA0YjE3
OTdiNjVmLi5iNDkyNzcwMTIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRy
ZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdo
ZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9i
dHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnkt
d2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4MGY2
ZWRjMjY5ZmEzZWY4ZDRkNGI5Y2QxYWFkYTIzMjgxMzFjMTkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDk0Y2QyZmFjOTBlNDczMjEyMzVjZmY5YjdhZGEyZTI0Y2QxYzFiYTcgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjMgTWF5IDIwMTggMjE6MjA6MzUgKzAzMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQWRkIGEgcG9zc2liaWxpdHkgdG8gc3BlY2lmeSB3aGVyZSBweXRob24gbW9k
dWxlcyBhcmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29sc182LjguYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuNy4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi44LmJiCmlu
ZGV4IDgxMzJjMmNjNzIuLjE1Y2M3YWMyNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi44LmJiCkBAIC0xOCw3ICsxOCw3IEBA
IERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQva2RhdmUvYnRyZnMtcHJvZ3MuZ2l0O2JyYW5j
aD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1w
b3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAg
ICAgICAgICAgIgotU1JDUkVWID0gIjYwYWJmN2E5MDc3NmMyNDA1ZjYxNjE4MmVmNjEyOTQ3NGJi
Y2IxMDkiCitTUkNSRVYgPSAiMzc5M2U5ODdkMmI0ZTg3ODQxMGRhMTZmMzNkOTYzMDQzZDEzN2Q0
OCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIgXAotLSAKMi40
Mi4wCgo=

--===============0604653092090569899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25060264 to 25049912 (-0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: FILELIST: removed "/usr/lib/.debug/libbtrfsutil.so.1.2.0", added "/usr/lib/.debug/libbtrfsutil.so.1.3.0"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208146 to 218986 (+5%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4155369 to 4179121 (+1%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.7.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/6.8/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/6.7.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.8/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.7.1/cmds -> /usr/src/debug/btrfs-tools/6.8/cmds, directory renamed /usr/src/debug/btrfs-tools/6.7.1/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/6.8/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.7.1/check -> /usr/src/debug/btrfs-tools/6.8/check, directory renamed /usr/src/debug/btrfs-tools/6.7.1 -> /usr/src/debug/btrfs-tools/6.8, directory renamed /usr/src/debug/btrfs-tools/6.7.1/include -> /usr/src/debug/btrfs-tools/6.8/include, directory renamed /usr/src/debug/btrfs-tools/6.7.1/convert -> /usr/src/debug/btrfs-tools/6.8/convert, directory renamed /usr/src/debug/btrfs-tools/6.7.1/libbtrfs -> /usr/src/debug/btrfs-
 tools/6.8/libbtrfs, directory renamed /usr/src/debug/btrfs-tools/6.7.1/mkfs -> /usr/src/debug/btrfs-tools/6.8/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.7.1/tune -> /usr/src/debug/btrfs-tools/6.8/tune, directory renamed /usr/src/debug/btrfs-tools/6.7.1/image -> /usr/src/debug/btrfs-tools/6.8/image, directory renamed /usr/src/debug/btrfs-tools/6.7.1/kernel-lib -> /usr/src/debug/btrfs-tools/6.8/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/6.7.1/crypto -> /usr/src/debug/btrfs-tools/6.8/crypto, directory renamed /usr/src/debug/btrfs-tools/6.7.1/kernel-shared -> /usr/src/debug/btrfs-tools/6.8/kernel-shared, removed "/usr/src/debug/btrfs-tools/6.7.1/common/messages.h /usr/src/debug/btrfs-tools/6.7.1/common/array.h /usr/src/debug/btrfs-tools/6.7.1/common/task-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/array.c /usr/src/debug/btrfs-tools/6.7.1/common/messages.c /usr/src/debug/btrfs-tools/6.7.1/common/task-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/fsfeatures.h
  /usr/src/debug/btrfs-tools/6.7.1/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/string-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/path-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/string-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.7.1/common/path-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/send-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/extent-cache.c /usr/src/debug/btrfs-tools/6.7.1/common/sort-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/clear-cache.h /usr/src/debug/btrfs-tools/6.7.1/common/sysfs-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/extent-cache.h /usr/src/debug/btrfs-tools/6.7.1/common/send-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/sort-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/device-scan.c /usr/src/debug/btrfs-tools/6.7.1/common/clear-cache.c /usr/src/debug/btrfs-tools/6.7.1/common/sysfs-utils.c /usr/src/debug/
 btrfs-tools/6.7.1/common/parse-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/help.h /usr/src/debug/btrfs-tools/6.7.1/common/utils.h /usr/src/debug/btrfs-tools/6.7.1/common/help.c /usr/src/debug/btrfs-tools/6.7.1/common/parse-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/utils.c /usr/src/debug/btrfs-tools/6.7.1/common/device-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/device-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/string-table.c /usr/src/debug/btrfs-tools/6.7.1/common/format-output.c /usr/src/debug/btrfs-tools/6.7.1/common/string-table.h /usr/src/debug/btrfs-tools/6.7.1/common/format-output.h /usr/src/debug/btrfs-tools/6.7.1/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/units.c /usr/src/debug/btrfs-tools/6.7.1/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/units.h /usr/src/debug/btrfs-tools/6.7.1/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/device-scan.h /usr/src/d
 ebug/btrfs-tools/6.7.1/common/send-stream.h /usr/src/debug/btrfs-tools/6.7.1/common/open-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.7.1/common/send-stream.c /usr/src/debug/btrfs-tools/6.7.1/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.7.1/common/open-utils.h", added "/usr/src/debug/btrfs-tools/6.8/common/sort-utils.h /usr/src/debug/btrfs-tools/6.8/common/task-utils.h /usr/src/debug/btrfs-tools/6.8/common/string-utils.h /usr/src/debug/btrfs-tools/6.8/common/sort-utils.c /usr/src/debug/btrfs-tools/6.8/common/string-utils.c /usr/src/debug/btrfs-tools/6.8/common/task-utils.c /usr/src/debug/btrfs-tools/6.8/common/array.c /usr/src/debug/btrfs-tools/6.8/common/device-scan.c /usr/src/debug/btrfs-tools/6.8/common/sysfs-utils.c /usr/src/debug/btrfs-tools/6.8/common/extent-cache.h /usr/src/debug/btrfs-tools/6.8/common/path-utils.h /usr/src/debug/btrfs-tools/6.8/common/extent-cache.c /usr/src/debug/btrfs-tools/6.8/common/sysfs-utils.h /usr/
 src/debug/btrfs-tools/6.8/common/array.h /usr/src/debug/btrfs-tools/6.8/common/device-scan.h /usr/src/debug/btrfs-tools/6.8/common/path-utils.c /usr/src/debug/btrfs-tools/6.8/common/open-utils.c /usr/src/debug/btrfs-tools/6.8/common/parse-utils.c /usr/src/debug/btrfs-tools/6.8/common/filesystem-utils.h /usr/src/debug/btrfs-tools/6.8/common/open-utils.h /usr/src/debug/btrfs-tools/6.8/common/filesystem-utils.c /usr/src/debug/btrfs-tools/6.8/common/parse-utils.h /usr/src/debug/btrfs-tools/6.8/common/units.h /usr/src/debug/btrfs-tools/6.8/common/string-table.c /usr/src/debug/btrfs-tools/6.8/common/send-stream.h /usr/src/debug/btrfs-tools/6.8/common/fsfeatures.h /usr/src/debug/btrfs-tools/6.8/common/string-table.h /usr/src/debug/btrfs-tools/6.8/common/units.c /usr/src/debug/btrfs-tools/6.8/common/fsfeatures.c /usr/src/debug/btrfs-tools/6.8/common/send-stream.c /usr/src/debug/btrfs-tools/6.8/common/rbtree-utils.c /usr/src/debug/btrfs-tools/6.8/common/send-utils.c /usr/src/debug/btrfs-tool
 s/6.8/common/rbtree-utils.h /usr/src/debug/btrfs-tools/6.8/common/send-utils.h /usr/src/debug/btrfs-tools/6.8/common/device-utils.c /usr/src/debug/btrfs-tools/6.8/common/messages.h /usr/src/debug/btrfs-tools/6.8/common/format-output.c /usr/src/debug/btrfs-tools/6.8/common/help.c /usr/src/debug/btrfs-tools/6.8/common/format-output.h /usr/src/debug/btrfs-tools/6.8/common/help.h /usr/src/debug/btrfs-tools/6.8/common/messages.c /usr/src/debug/btrfs-tools/6.8/common/device-utils.h /usr/src/debug/btrfs-tools/6.8/common/utils.c /usr/src/debug/btrfs-tools/6.8/common/cpu-utils.h /usr/src/debug/btrfs-tools/6.8/common/clear-cache.h /usr/src/debug/btrfs-tools/6.8/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/6.8/common/utils.h /usr/src/debug/btrfs-tools/6.8/common/clear-cache.c /usr/src/debug/btrfs-tools/6.8/common/cpu-utils.c /usr/src/debug/btrfs-tools/6.8/common/extent-tree-utils.h /usr/src/debug/btrfs-tools/6.8/common/tree-search.h"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5800276 to 5824850 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info -> /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info, removed "/usr/lib/libbtrfsutil.so.1.2.0", added "/usr/lib/libbtrfsutil.so.1.3.0"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.7.1 [default] to 6.8 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.7.1" to "6.8"
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.7.1 [default] to 6.8 [default]
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/libbtrfsutil.so.1 changed symlink target from libbtrfsutil.so.1.2.0 to libbtrfsutil.so.1.3.0
  /usr/lib/libbtrfsutil.so changed symlink target from libbtrfsutil.so.1.2.0 to libbtrfsutil.so.1.3.0
  /usr/lib/libbtrfsutil.so.1.2.0 moved to /usr/lib/libbtrfsutil.so.1.3.0
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.7.1-py3.12.egg-info/top_level.txt was removed

--===============0604653092090569899==--

