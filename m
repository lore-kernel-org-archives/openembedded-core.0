Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FD8C54EEE
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20321.1708018343587360683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NiDbJiI7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bxnPKcqr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39f94-8976fcad-381c-464b-9cce-02142264d7b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h7XPc482NEgpcHCxxnA33v1XW1HccGYk0SysMz6Ld+Q=;
	b=NiDbJiI72logGt2WAvsF5lu6s26Td7K2s+OUzfoE7a25x10TN9UjcNBBFVWoQXST
	5eyv8dXjaa5RZQJk8ELgviBzNET+5anLvmHx+db3R895M3Lz7sZUvQRz45gZtWt3It/
	s7Onlj5PFtZSEcp06AFplrFo3SxRoBnl7tpmmAAU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h7XPc482NEgpcHCxxnA33v1XW1HccGYk0SysMz6Ld+Q=;
	b=bxnPKcqr2kwGCaZr0X/+QC/Nf5MhDztJlt/I3xpXc42iEwoU9kbLBS1JxDOkxuoB
	tpw7/vD4VvBovOAbktr1l5qLgkNlVeMpQIus8DPXEgFAFKxF0IeCQGYBUcXhvj/1HBT
	IbE+cNzfXdGuBePu5Sc2A+45venuojl8N0AgTQNE=
Content-Type: multipart/mixed; boundary="===============7432921624553433922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.0.4 SUCCEEDED
Message-ID: <0101018dadd39f94-8976fcad-381c-464b-9cce-02142264d7b4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195566

--===============7432921624553433922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *1.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.0.3-1.0.4.patch
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
From 53d26df5db679bef4a59e97196c95365c12a2de1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:51:44 +0000
Subject: [PATCH] createrepo-c: upgrade 1.0.3 -> 1.0.4

---
 ...01-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 6 ++----
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch         | 4 ++--
 .../{createrepo-c_1.0.3.bb => createrepo-c_1.0.4.bb}        | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.3.bb => createrepo-c_1.0.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index b63fe53944..fc74208a7e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
+From 5c55a3e3411a6ba53c8d631f5db73e4e51995669 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -6,6 +6,7 @@ Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
 ---
  src/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -23,6 +24,3 @@ index a31b14d..01fd8ca 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index b7e5710b39..6fe881df61 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
+From a25b76d58bed0aeb7c38d7701edf720178c153ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/xml_file.c b/src/xml_file.c
-index d2400b8..871109c 100644
+index 44b38f9..de5176b 100644
 --- a/src/xml_file.c
 +++ b/src/xml_file.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
index cfd406650c..f498bcb655 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "f5b5cb3d7389da979b9f05d72ab13979a8c2dccf"
+SRCREV = "4ade5ea5c4c636f045f29a2d8d8a57241fc5d24e"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============7432921624553433922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.0.3", added "/usr/lib/.debug/libcreaterepo_c.so.1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1495288 to 1495984 (+0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1282310 to 1282913 (+0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.3", added "/usr/lib/libcreaterepo_c.so.1.0.4"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.0.3" to "1.0.4"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.3 to libcreaterepo_c.so.1.0.4
  /usr/lib/libcreaterepo_c.so.1.0.3 moved to /usr/lib/libcreaterepo_c.so.1.0.4

--===============7432921624553433922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.0.3-1.0.4.patch"

RnJvbSA1M2QyNmRmNWRiNjc5YmVmNGE1OWU5NzE5NmM5NTM2NWMxMmEyZGUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6NTE6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4wLjMgLT4gMS4wLjQKCi0tLQogLi4uMDEtRG8tbm90LXNl
dC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggfCA2ICsrLS0tLQog
Li4uL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoICAgICAg
ICAgfCA0ICsrLS0KIC4uLi97Y3JlYXRlcmVwby1jXzEuMC4zLmJiID0+IGNyZWF0ZXJlcG8tY18x
LjAuNC5iYn0gICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8t
Yy97Y3JlYXRlcmVwby1jXzEuMC4zLmJiID0+IGNyZWF0ZXJlcG8tY18xLjAuNC5iYn0gKDk2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9u
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMv
MDAwMS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRj
aAppbmRleCBiNjNmZTUzOTQ0Li5mYzc0MjA4YTdlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9O
X0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRIT05f
SU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDZmOGY2ZDE1MWI4MzFiNjBmNmU3ODkyYWE5Mjk0YTYzNjEzNTNjNzIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDVjNTVhM2UzNDExYTZiYTUzYzhkNjMxZjVkYjczZTRlNTE5OTU2Njkg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MzE6MDIgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmlu
ZyBweXRob24KQEAgLTYsNiArNiw3IEBAIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRI
T05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24KIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUg
PHdhbmdteUBmdWppdHN1LmNvbT4KKwogLS0tCiAgc3JjL3B5dGhvbi9DTWFrZUxpc3RzLnR4dCB8
IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKQEAg
LTIzLDYgKzI0LDMgQEAgaW5kZXggYTMxYjE0ZC4uMDFmZDhjYSAxMDA2NDQKICBJTkNMVURFX0RJ
UkVDVE9SSUVTICgke1BZVEhPTl9JTkNMVURFX1BBVEh9KQogIAogIE1FU1NBR0UoU1RBVFVTICJQ
eXRob24gaW5zdGFsbCBkaXIgaXMgJHtQWVRIT05fSU5TVEFMTF9ESVJ9IikKLS0tIAotMi4yNS4x
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0
cmluZy5oLnBhdGNoCmluZGV4IGI3ZTU3MTBiMzkuLjZmZTg4MWRmNjEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVk
ZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZWI2NjMyNmMzZmM2ZTk0MjI4MmQwMWRkZDU2NjU5Yzc4ZWQ3
NDAwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTI1Yjc2ZDU4YmVkMGFlYjdjMzhk
NzcwMWVkZjcyMDE3OGMxNTNhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEzIEphbiAyMDIzIDEzOjIxOjUx
IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUgcnBtL3JwbXN0cmluZy5oCkBAIC0xNyw3
ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zcmMveG1sX2Zp
bGUuYyBiL3NyYy94bWxfZmlsZS5jCi1pbmRleCBkMjQwMGI4Li44NzExMDljIDEwMDY0NAoraW5k
ZXggNDRiMzhmOS4uZGU1MTc2YiAxMDA2NDQKIC0tLSBhL3NyYy94bWxfZmlsZS5jCiArKysgYi9z
cmMveG1sX2ZpbGUuYwogQEAgLTE5LDYgKzE5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC4zLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4wLjQuYmIKc2ltaWxhcml0
eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8t
Yy9jcmVhdGVyZXBvLWNfMS4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
cmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMC40LmJiCmluZGV4IGNmZDQwNjY1MGMuLmY0OThi
Y2I2NTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3Jl
YXRlcmVwby1jXzEuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBv
LWMvY3JlYXRlcmVwby1jXzEuMC40LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1t
YXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5w
YXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImY1YjVjYjNkNzM4OWRhOTc5YjlmMDVk
NzJhYjEzOTc5YThjMmRjY2YiCitTUkNSRVYgPSAiNGFkZTVlYTVjNGM2MzZmMDQ1ZjI5YTJkOGQ4
YTU3MjQxZmM1ZDI0ZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============7432921624553433922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 53 recipes from the core2-64 sysroot...done.
Removing 65 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-771df02d081235ca38c549e8f96d4320b76cb896"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:771df02d081235ca38c549e8f96d4320b76cb896"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 577 Local 555 Mirrors 0 Missed 22 Current 186 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 192 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 201 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 209 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 210 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 215 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 216 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 217 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 223 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 225 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_deb_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 227 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 228 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 231 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_create_spdx_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 232 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 234 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 237 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 238 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 239 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 241 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 242 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 245 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 246 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 250 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 251 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.11.5/temp/log.do_packagedata_setscene.176566
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 387 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 409 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 358 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_fetch)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 365 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_recipe_qa)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_recipe_qa: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 455 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_fetch: Succeeded
NOTE: Running task 423 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 458 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 429 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_fetch)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 434 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_fetch: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 443 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_unpack)
NOTE: Running task 444 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 950 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_patch)
NOTE: Running setscene task 508 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running task 977 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1008 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_patch)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe createrepo-c-1.0.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1066 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe createrepo-c-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_generate_toolchain_file)
NOTE: Running task 1069 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1070 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe createrepo-c-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 509 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 517 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-1.0.4-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 520 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_populate_lic unihash changed to ec19df74663b4cdb58fc8be594ec373003b11910bd378674403ef01f6ba71777
NOTE: Running setscene task 521 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running task 1072 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 542 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 1109 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1138 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 545 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1139 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_generate_toolchain_file)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 552 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1157 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 594 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 595 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 604 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 610 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 614 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1214 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: Running setscene task 621 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 628 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 682 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running task 1249 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1347 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 763 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1873 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1914 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: Running task 1997 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.19.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2087 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2089 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_configure)
NOTE: recipe rpm-1_4.19.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2090 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2091 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2092 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2093 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: Running task 2094 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.19.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_compile)
NOTE: recipe rpm-1_4.19.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_install)
NOTE: recipe rpm-1_4.19.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_package)
NOTE: Running task 2098 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2099 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_configure)
NOTE: recipe createrepo-c-1.0.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_compile)
NOTE: recipe createrepo-c-1.0.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_install)
NOTE: recipe createrepo-c-1.0.4-r0: task do_install: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_package: Succeeded
NOTE: Running task 2103 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 2104 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_packagedata unihash changed to ec2d9374d45ba7a1a372d42ff575c59c4f110df83547ebc54fb16504cd0f0967
NOTE: Setscene tasks completed
NOTE: Running task 2105 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_package)
NOTE: Running task 2106 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_create_spdx)
NOTE: recipe createrepo-c-1.0.4-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2107 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 2108 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_packagedata)
NOTE: recipe createrepo-c-1.0.4-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2109 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_create_spdx)
NOTE: Running task 2110 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_package_write_ipk)
NOTE: Running task 2111 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_package_write_deb)
NOTE: Running task 2112 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_package_qa)
NOTE: recipe createrepo-c-1.0.4-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_ipk: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_deb: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2114 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_create_runtime_spdx)
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe createrepo-c-1.0.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe createrepo-c-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2115 of 2115 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2115 tasks of which 2058 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.12.5-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7432921624553433922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.0.3", added "/usr/lib/libcreaterepo_c.so.1.0.4"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.0.3 to libcreaterepo_c.so.1.0.4
  /usr/lib/libcreaterepo_c.so.1.0.3 moved to /usr/lib/libcreaterepo_c.so.1.0.4

--===============7432921624553433922==--

