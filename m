Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55654C2BB9A
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1269.1715794337342247011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fyV9YyHa;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iShzzSrt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f7d4fe2fc-bc0c3ace-7f50-4769-8835-f2ef8bf3b395-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QwjmhqqzfDwHiUSJxwWCFAHTG7mMndmQ0jGEedsvwI0=;
	b=fyV9YyHaoxQxax5No/KvQUNUIv52da5F+9l4SdY3vktNBosWAx3tJ1EZu+X1+Mvv
	ZsxNfKud64tJYu/2OHLj4QyMsRDIqM5WiNklTQpznG51cGdYbFvZd5yFwW3Dxsrrft7
	hTGwvtcjPUYjBhiEJuEoKLFi9U7ue6ig5WpzzpSI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QwjmhqqzfDwHiUSJxwWCFAHTG7mMndmQ0jGEedsvwI0=;
	b=iShzzSrtdz3uaJMm42QD3PjdW54nZAbwk7NLwqvGMjRW8AmMq8fmkIrds9Ln6CMa
	9ZBkjODMBJV+jesPR9kSa+N6cvmMOES/lOtZIsakvsDqwNqQPIgLua0WpZKtFgScz0j
	i9z9NhE41KDFPKcpYAVzMBtu4egg9f484DOH9jlw=
Content-Type: multipart/mixed; boundary="===============3032623952734985582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.283.0 SUCCEEDED
Message-ID: <0101018f7d4fe2fc-bc0c3ace-7f50-4769-8835-f2ef8bf3b395-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199355

--===============3032623952734985582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.283.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.280.0-1.3.283.0.patch
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
From a1935dd9aec780b95a8e2814d1153b79a7abf441 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 13:07:30 +0000
Subject: [PATCH] glslang: upgrade 1.3.280.0 -> 1.3.283.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.3.280.0.bb => glslang_1.3.283.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.280.0.bb => glslang_1.3.283.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index e6bb6ec8e3..32d8b28418 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From fc33f1cf032a15c07044ef932bc991c346d62d62 Mon Sep 17 00:00:00 2001
+From 4cd5561aaadc0577976e07a9c8db0929c4ff88b4 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
index 637082c719..55ecf15f8d 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "ee2f5d09eaf8f4e8d0d598bd2172fce290d4ca60"
+SRCREV = "e8dd0b6903b34f1879520b444634c75ea2deedf5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.44.0


--===============3032623952734985582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.280.0-1.3.283.0.patch"

RnJvbSBhMTkzNWRkOWFlYzc4MGI5NWE4ZTI4MTRkMTE1M2I3OWE3YWJmNDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTM6MDc6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yODAuMCAtPiAxLjMuMjgzLjAKCi0tLQogLi4uL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgICAgIHwgMiAr
LQogLi4uL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI4MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI4My4w
LmJifSAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdf
MS4zLjI4MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI4My4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNs
YW5nLXBrZy1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNs
YW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCmluZGV4IGU2YmI2ZWM4
ZTMuLjMyZDhiMjg0MTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmct
cGtnLWNvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmMzM2YxY2YwMzJhMTVjMDcw
NDRlZjkzMmJjOTkxYzM0NmQ2MmQ2MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGNk
NTU2MWFhYWRjMDU3Nzk3NmUwN2E5YzhkYjA5MjljNGZmODhiNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0
ZTogU3VuLCA3IEZlYiAyMDIxIDAxOjMwOjM5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVy
YXRlIGdsc2xhbmcgcGtnLWNvbmZpZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xz
bGFuZy9nbHNsYW5nXzEuMy4yODMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yODAuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgzLjAuYmIK
aW5kZXggNjM3MDgyYzcxOS4uNTVlY2YxNWY4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjgzLjAuYmIKQEAgLTgsNyArOCw3IEBAIEhPTUVQ
QUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZlcmVu
Y2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAmIE1J
VCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRhNDVm
ZTgwN2RjMyIKIAotU1JDUkVWID0gImVlMmY1ZDA5ZWFmOGY0ZThkMGQ1OThiZDIxNzJmY2UyOTBk
NGNhNjAiCitTUkNSRVYgPSAiZThkZDBiNjkwM2IzNGYxODc5NTIwYjQ0NDYzNGM3NWVhMmRlZWRm
NSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nZW5l
cmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjQ0LjAK
Cg==

--===============3032623952734985582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.14.1.0 /usr/lib/.debug/libglslang.so.14.1.0 /usr/lib/.debug/libSPVRemapper.so.14.1.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.1.0", added "/usr/lib/.debug/libglslang-default-resource-limits.so.14.2.0 /usr/lib/.debug/libglslang.so.14.2.0 /usr/lib/.debug/libSPVRemapper.so.14.2.0 /usr/lib/.debug/libSPIRV.so.14.2.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 83650792 to 83787232 (+0%)
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 276064 to 276778 (+0%)
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4931318 to 4947955 (+0%)
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.14.1.0 /usr/lib/libSPIRV.so.14.1.0 /usr/lib/libSPVRemapper.so.14.1.0 /usr/lib/libglslang-default-resource-limits.so.14.1.0", added "/usr/lib/libglslang-default-resource-limits.so.14.2.0 /usr/lib/libglslang.so.14.2.0 /usr/lib/libSPIRV.so.14.2.0 /usr/lib/libSPVRemapper.so.14.2.0"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/glslang: PV changed from "1.3.280.0" to "1.3.283.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.1.0 to libglslang-default-resource-limits.so.14.2.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.1.0 to libglslang.so.14.2.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.1.0 to libSPIRV.so.14.2.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.1.0 to libSPVRemapper.so.14.2.0
  /usr/lib/libglslang-default-resource-limits.so.14.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.2.0
  /usr/lib/libglslang.so.14.1.0 moved to /usr/lib/libglslang.so.14.2.0
  /usr/lib/libSPIRV.so.14.1.0 moved to /usr/lib/libSPIRV.so.14.2.0
  /usr/lib/libSPVRemapper.so.14.1.0 moved to /usr/lib/libSPVRemapper.so.14.2.0

--===============3032623952734985582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.14.1.0 /usr/lib/libSPVRemapper.so.14.1.0 /usr/lib/libSPIRV.so.14.1.0 /usr/lib/libglslang.so.14.1.0", added "/usr/lib/libglslang.so.14.2.0 /usr/lib/libSPIRV.so.14.2.0 /usr/lib/libSPVRemapper.so.14.2.0 /usr/lib/libglslang-default-resource-limits.so.14.2.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.14 changed symlink target from libglslang-default-resource-limits.so.14.1.0 to libglslang-default-resource-limits.so.14.2.0
  /usr/lib/libglslang.so.14 changed symlink target from libglslang.so.14.1.0 to libglslang.so.14.2.0
  /usr/lib/libSPIRV.so.14 changed symlink target from libSPIRV.so.14.1.0 to libSPIRV.so.14.2.0
  /usr/lib/libSPVRemapper.so.14 changed symlink target from libSPVRemapper.so.14.1.0 to libSPVRemapper.so.14.2.0
  /usr/lib/libglslang-default-resource-limits.so.14.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.14.2.0
  /usr/lib/libglslang.so.14.1.0 moved to /usr/lib/libglslang.so.14.2.0
  /usr/lib/libSPIRV.so.14.1.0 moved to /usr/lib/libSPIRV.so.14.2.0
  /usr/lib/libSPVRemapper.so.14.1.0 moved to /usr/lib/libSPVRemapper.so.14.2.0

--===============3032623952734985582==--

