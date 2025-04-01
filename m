Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CBFC369C0
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18067.1743511391044015761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YqtQKKLL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=inINexVa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f1609493-5557b1c4-24d4-45da-b85c-359b2bd46c20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EfG4RByvUdWjZnCZiPgrg7ySwDF9ZpPyb7KL5wsYYME=;
	b=YqtQKKLLWz/92wOpKwW8BsWA6A9zTvOH9bnAJ+JkzmjhkePLiUWfYIYfr1t8A9tv
	2IBM4eiBQahodIc3KUY1Z1lWhqeQXCGuhK9Nvg+nOcDuJTnbZ1RWBfXau4wmz2Q2lJu
	IfgkzlA10ERC9H1/HnwrZKXjOOIHbaAWKvmCOmnQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EfG4RByvUdWjZnCZiPgrg7ySwDF9ZpPyb7KL5wsYYME=;
	b=inINexVa3sBFHmNgulKhDGicVzxHgFw3KyP0Q8KOWc5SMmjq1CCkMYzrb1zh7WNH
	UtP7dlDyL69TrDzFoiy5Zi0BEgfAjC25NcWPLgEP4jHBy2Q1vwGNXk5vTcyCZXS3Rhr
	0/5wUWdkvQwu5CzGbdGlD0ON2PUNiX7BV5Gklx0s=
Content-Type: multipart/mixed; boundary="===============7386264799962965471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 20.1.1 SUCCEEDED
Message-ID: <01010195f1609493-5557b1c4-24d4-45da-b85c-359b2bd46c20-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214046

--===============7386264799962965471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *20.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-20.1.0-20.1.1.patch
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
From 081507acb32eef3b5ee8964825a4b32cccc64bf8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:39:52 +0000
Subject: [PATCH] llvm: upgrade 20.1.0 -> 20.1.1

---
 ...AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 2 +-
 .../llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 2 +-
 meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb} | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index ae2c3baa8c..f71c5d4bd4 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 9824c2ab5e7d37a5a18a409a512511f5f5cd408d Mon Sep 17 00:00:00 2001
+From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index 29266013ec..f1ab005464 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 00e5ac68dad872b8490297fa6f0b67e6a3e48661 Mon Sep 17 00:00:00 2001
+From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_20.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 7ffc6ec1cb..3989d4845d 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
+SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -180,3 +180,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "20.1.1"
-- 
2.47.1


--===============7386264799962965471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config20.1.0 moved to /usr/bin/crossscripts/llvm-config20.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config20.1.0 to llvm-config20.1.1
  /usr/bin/llvm-config20.1.0 moved to /usr/bin/llvm-config20.1.1
  /usr/bin/llvm-tblgen20.1.0 moved to /usr/bin/llvm-tblgen20.1.1

--===============7386264799962965471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-20.1.0-20.1.1.patch"

RnJvbSAwODE1MDdhY2IzMmVlZjNiNWVlODk2NDgyNWE0YjMyY2NjYzY0YmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODozOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMjAuMS4wIC0+IDIwLjEuMQoKLS0tCiAuLi5Bc21NYXRjaGVyRW1pdHRlci1z
b3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoIHwgMiArLQogLi4uL2xsdm0v
bGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoICB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL3tsbHZtXzIwLjEuMC5iYiA9PiBsbHZtXzIw
LjEuMS5iYn0gfCA0ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL3tsbHZtXzIwLjEu
MC5iYiA9PiBsbHZtXzIwLjEuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8t
bGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFz
LXdlLnBhdGNoCmluZGV4IGFlMmMzYmFhOGMuLmY3MWM1ZDRiZDQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNs
YXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0
cy1ieS1uYW1lLWFzLXdlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ODI0YzJhYjVlN2Qz
N2E1YTE4YTQwOWE1MTI1MTFmNWY1Y2Q0MDhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwMDFkNTY5ODMwNzg4NDJjNWFhMmExNzg2Yjg0ZGM0MjliZDQ2YWJkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBGcmksIDI3IE5vdiAyMDIwIDEwOjExOjA4ICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEFzbU1hdGNoZXJFbWl0dGVyOiBzb3J0IENsYXNzSW5mbyBsaXN0cyBieSBuYW1lIGFzIHdl
bGwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZt
LWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5w
YXRjaAppbmRleCAyOTI2NjAxM2VjLi5mMWFiMDA1NDY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhl
LXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxs
dm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAwMGU1YWM2OGRhZDg3MmI4NDkwMjk3ZmE2ZjBiNjdlNmEzZTQ4NjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAzZWIxZWVmZWQ2ZmM2NTRkMTlhYjk3YmJjNzQ4NDU0YzIyYTI5
MDA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFydGluIEtlbGx5IDxta2VsbHlA
eGV2by5jb20+CiBEYXRlOiBGcmksIDE5IE1heSAyMDE3IDAwOjIyOjU3IC0wNzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGxsdm06IGFsbG93IGVudiBvdmVycmlkZSBvZiBleGUgYW5kIGxpYmRpciBwYXRo
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzIwLjEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fMjAuMS4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fMjAuMS4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzIwLjEuMS5iYgpp
bmRleCA3ZmZjNmVjMWNiLi4zOTg5ZDQ4NDVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtXzIwLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtXzIwLjEuMS5iYgpAQCAtMjcsNyArMjcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9yZWxlYXNlcy9kb3dubG9hZC9sbHZtb3JnLSR7UFZ9
LwogICAgICAgICAgICBmaWxlOi8vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5m
by1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCiAgICAgICAgICAgIGZp
bGU6Ly9sbHZtLWNvbmZpZyBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0
NTc5MDUxZTNjMjU1ZmI0YmI3OTVkNTQzMjRmNWE3ZjNlZjc5YmQ5MTgxZTQ0MjkzZDdlZTlhN2Y2
MmFhZDlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkNWViYmQ0MGNlMWU5ODRhNjUwODE4YTRi
YjVhZTg2ZmM3MDY0NGRlYzJlNmQ1NGU3OGI0MTc2ZGIzMzMyZTAiCiBVUFNUUkVBTV9DSEVDS19V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAibGx2bW9yZy0oP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKQEAgLTE4MCwzICsx
ODAsNSBAQCBGSUxFUzoke1BOfS1zdGF0aWNkZXYgKz0gIlwKIElOU0FORV9TS0lQOiR7UE59LWxp
Ymxsdm0gKz0gImRldi1zbyIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgor
CitQViA9ICIyMC4xLjEiCi0tIAoyLjQ3LjEKCg==

--===============7386264799962965471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.0/llvm-project-20.1.0.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.1/llvm-project-20.1.1.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 43460792 to 43460720 (-0%)
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 29470562 to 29470929 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-20.1.0.so", added "/usr/lib/libLLVM-20.1.1.so"
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 242260830 to 242265838 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "20.1.0" to "20.1.1"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 20.1.0 [default] to 20.1.1 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config20.1.0 moved to /usr/bin/crossscripts/llvm-config20.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config20.1.0 to llvm-config20.1.1
  /usr/bin/llvm-config20.1.0 moved to /usr/bin/llvm-config20.1.1
  /usr/bin/llvm-tblgen20.1.0 moved to /usr/bin/llvm-tblgen20.1.1

--===============7386264799962965471==--

