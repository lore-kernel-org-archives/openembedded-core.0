Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0786CC49EA1
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2179.1719853076105730793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rkk9tIxE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=HL9QOs13;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4af0-dc1329dd-a60b-44b2-a426-67842b87b0f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p/vnb2DDwgpgTWNgqjCXLh7rt9uEvOtYVD8aHE1UG84=;
	b=Rkk9tIxE5frUdfS46r/VQihfa/sjuym1EWLbyCLq3W9QWyB8m3wZnPs3jBSwhbnI
	SOp0tNPAt2cTy36tyd1W7z2Tvzx3QMUhQZneIeOEYy8NFTaw/vkxZTUlWVh/Ava4SEh
	18C5mQ8++CKaqgUC4FRz7Apy462tJGXfdtFw/TaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p/vnb2DDwgpgTWNgqjCXLh7rt9uEvOtYVD8aHE1UG84=;
	b=HL9QOs13jWifg53ge1lubpQGG3c4qNTs2p5mCKn7lrc7OS1CqhelzKg75UJNAOIH
	mo8sd7MQX4klEpVNKM5PKTlMtFj12E6IBQa4Lfr/sTGw4UAcQ9eliycP6b1UTEpipAz
	VYhBgK7XA+JsSVsHSMFdln2oLytIGMwlHWpZep6w=
Content-Type: multipart/mixed; boundary="===============6757506594782652931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.1.3 SUCCEEDED
Message-ID: <010101906f3b4af0-dc1329dd-a60b-44b2-a426-67842b87b0f0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201333

--===============6757506594782652931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *1.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.1.2-1.1.3.patch
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
From b9b67e01ad127b2747bb8819f2246ce0a63c6295 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 07:15:23 +0000
Subject: [PATCH] createrepo-c: upgrade 1.1.2 -> 1.1.3

---
 ...001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 5 +----
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch          | 5 ++---
 .../{createrepo-c_1.1.2.bb => createrepo-c_1.1.3.bb}         | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.2.bb => createrepo-c_1.1.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index b63fe53944..02cb1083ed 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
+From 26189961337163fb56be720f9bfd70bdec9652ac Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -23,6 +23,3 @@ index a31b14d..01fd8ca 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index b7e5710b39..084c220a73 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
+From 1147d34269380f1f320c69a4af6dc9128f1de4ed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
@@ -11,13 +11,12 @@ on 'rasprintf'; ISO C99 and later do not support implicit function declarations
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/xml_file.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/xml_file.c b/src/xml_file.c
-index d2400b8..871109c 100644
+index 44b38f9..de5176b 100644
 --- a/src/xml_file.c
 +++ b/src/xml_file.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
index 85b2901d50..2e08449812 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "0ce71adda8a33ede9e9d21b7c18cc58d5a495849"
+SRCREV = "e93766dfc30f39b16d41f2d0eb130c92c16993ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============6757506594782652931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.1.2", added "/usr/lib/.debug/libcreaterepo_c.so.1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.2", added "/usr/lib/libcreaterepo_c.so.1.1.3"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.1.2" to "1.1.3"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.2 to libcreaterepo_c.so.1.1.3
  /usr/lib/libcreaterepo_c.so.1.1.2 moved to /usr/lib/libcreaterepo_c.so.1.1.3

--===============6757506594782652931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.2", added "/usr/lib/libcreaterepo_c.so.1.1.3"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.2 to libcreaterepo_c.so.1.1.3
  /usr/lib/libcreaterepo_c.so.1.1.2 moved to /usr/lib/libcreaterepo_c.so.1.1.3

--===============6757506594782652931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.1.2-1.1.3.patch"

RnJvbSBiOWI2N2UwMWFkMTI3YjI3NDdiYjg4MTlmMjI0NmNlMGE2M2M2Mjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNzoxNToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAxLjEuMiAtPiAxLjEuMwoKLS0tCiAuLi4wMDEtRG8tbm90LXNl
dC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggfCA1ICstLS0tCiAu
Li4vY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggICAgICAg
ICAgfCA1ICsrLS0tCiAuLi4ve2NyZWF0ZXJlcG8tY18xLjEuMi5iYiA9PiBjcmVhdGVyZXBvLWNf
MS4xLjMuYmJ9ICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVw
by1jL3tjcmVhdGVyZXBvLWNfMS4xLjIuYmIgPT4gY3JlYXRlcmVwby1jXzEuMS4zLmJifSAoOTYl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRo
b24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8t
Yy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBh
dGNoCmluZGV4IGI2M2ZlNTM5NDQuLjAyY2IxMDgzZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1Eby1ub3Qtc2V0LVBZVEhP
Tl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNmY4ZjZkMTUxYjgzMWI2MGY2ZTc4OTJhYTkyOTRhNjM2MTM1M2M3MiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMjYxODk5NjEzMzcxNjNmYjU2YmU3MjBmOWJmZDcwYmRlYzk2NTJh
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODozMTowMiArMDIw
MAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5u
aW5nIHB5dGhvbgpAQCAtMjMsNiArMjMsMyBAQCBpbmRleCBhMzFiMTRkLi4wMWZkOGNhIDEwMDY0
NAogIElOQ0xVREVfRElSRUNUT1JJRVMgKCR7UFlUSE9OX0lOQ0xVREVfUEFUSH0pCiAgCiAgTUVT
U0FHRShTVEFUVVMgIlB5dGhvbiBpbnN0YWxsIGRpciBpcyAke1BZVEhPTl9JTlNUQUxMX0RJUn0i
KQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5j
bHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKaW5kZXggYjdlNTcxMGIzOS4uMDg0YzIyMGE3MyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBv
LWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0
cmluZy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYjY2MzI2YzNmYzZlOTQyMjgyZDAx
ZGRkNTY2NTljNzhlZDc0MDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMTQ3ZDM0
MjY5MzgwZjFmMzIwYzY5YTRhZjZkYzkxMjhmMWRlNGVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTMgSmFu
IDIwMjMgMTM6MjE6NTEgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZSBycG0vcnBtc3Ry
aW5nLmgKQEAgLTExLDEzICsxMSwxMiBAQCBvbiAncmFzcHJpbnRmJzsgSVNPIEM5OSBhbmQgbGF0
ZXIgZG8gbm90IHN1cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zCiAKIFVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1h
bmFnZW1lbnQvY3JlYXRlcmVwb19jL3B1bGwvMzQwXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLQogLS0tCiAgc3JjL3htbF9maWxlLmMgfCAxICsKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3NyYy94bWxfZmlsZS5j
IGIvc3JjL3htbF9maWxlLmMKLWluZGV4IGQyNDAwYjguLjg3MTEwOWMgMTAwNjQ0CitpbmRleCA0
NGIzOGY5Li5kZTUxNzZiIDEwMDY0NAogLS0tIGEvc3JjL3htbF9maWxlLmMKICsrKyBiL3NyYy94
bWxfZmlsZS5jCiBAQCAtMTksNiArMTksNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4xLjIuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjEuMy5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2Ny
ZWF0ZXJlcG8tY18xLjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4xLjMuYmIKaW5kZXggODViMjkwMWQ1MC4uMmUwODQ0OTgx
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVy
ZXBvLWNfMS4xLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9j
cmVhdGVyZXBvLWNfMS4xLjMuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBvX2M7YnJhbmNoPW1hc3Rl
cjtwCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMGNlNzFhZGRhOGEzM2VkZTllOWQyMWI3YzE4
Y2M1OGQ1YTQ5NTg0OSIKK1NSQ1JFViA9ICJlOTM3NjZkZmMzMGYzOWIxNmQ0MWYyZDBlYjEzMGM5
MmMxNjk5M2FiIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============6757506594782652931==--

