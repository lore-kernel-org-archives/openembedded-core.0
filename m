Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0F2CD13C6
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1992.1711994601504125933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VMEwrGAO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gIaVwe6G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9ad47d44-adf08e68-9ee9-46eb-91d8-5625a5007009-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Ib0bvCn2xCK/Bqt0eo2lZZ1b+3/ZjecpqOGL2BxveA=;
	b=VMEwrGAOjhgoVw5yQeNjP3MdUBPZguXf2Gx6Mk6wVRsFUvynYEGxsrfBKdl92ujX
	aCN+dVxuq58Qfq4U/78of6ZUoNLDlf237k+j6syt9fgAeDzBCBf3qY5RvcCZDstpVhW
	71wfPE0DORqnzKhOCeWjZHctQQy8YKBloPxgGm7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Ib0bvCn2xCK/Bqt0eo2lZZ1b+3/ZjecpqOGL2BxveA=;
	b=gIaVwe6GNpkkbXKs2/o5ZBqUlJ0pbdG600A0inmlu7Jf01607fCXQCu4eJW5otls
	uHaFJoVUhtZ3wbm/SBeC0BEhE5oCuOBazdwU7MUpZ5iaOUmRI+KTGaBMNQyu8RAxJ9x
	J22xL57mfuH+FfNRzCJTeKkv4mS/4laaxK5qU+kg=
Content-Type: multipart/mixed; boundary="===============0685559044016732164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.21 SUCCEEDED
Message-ID: <0101018e9ad47d44-adf08e68-9ee9-46eb-91d8-5625a5007009-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197711

--===============0685559044016732164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcomps* to *0.1.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.20-0.1.21.patch
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
From 424d52b531acdb1273fec3f87bfafd8dceb2a3a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:07:32 +0000
Subject: [PATCH] libcomps: upgrade 0.1.20 -> 0.1.21

---
 ...Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 9 +++------
 .../libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb}  | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6cd052889a..e30a066516 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,7 +1,7 @@
-From 32447a79e24f8e7e9e0150eb747f34116d63ef38 Mon Sep 17 00:00:00 2001
+From b76c50e94d5f9f57fc88e92ddf89cbd7e4847d94 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH 2/2] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index f813af4..9eebb6c 100644
+index d22b84e..ad67309 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -85,7 +85,7 @@ IF (SKBUILD)
@@ -22,6 +22,3 @@ index f813af4..9eebb6c 100644
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
index 1f59c5ea1e..91170dfbed 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "854fbb9fe733b774981e1ffcf825b2d2ce0f8072"
+SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============0685559044016732164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.20-0.1.21.patch"

RnJvbSA0MjRkNTJiNTMxYWNkYjEyNzNmZWMzZjg3YmZhZmQ4ZGNlYjJhM2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzowNzozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNvbXBzOiB1cGdyYWRlIDAuMS4yMCAtPiAwLjEuMjEKCi0tLQogLi4uRG8tbm90LXNldC1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggfCA5ICsrKy0tLS0tLQogLi4u
L2xpYmNvbXBzL3tsaWJjb21wc18wLjEuMjAuYmIgPT4gbGliY29tcHNfMC4xLjIxLmJifSAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMve2xpYmNvbXBzXzAuMS4yMC5iYiA9
PiBsaWJjb21wc18wLjEuMjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzLzAwMDItRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9E
SVItYnktcnVubmluZy1weXRob24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29t
cHMvbGliY29tcHMvMDAwMi1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5n
LXB5dGhvbi5wYXRjaAppbmRleCA2Y2QwNTI4ODlhLi5lMzBhMDY2NTE2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHMvMDAwMi1Eby1ub3Qtc2V0LVBZ
VEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHMvMDAwMi1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNU
QUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gMzI0
NDdhNzllMjRmOGU3ZTllMDE1MGViNzQ3ZjM0MTE2ZDYzZWYzOCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYjc2YzUwZTk0ZDVmOWY1N2ZjODhlOTJkZGY4OWNiZDdlNDg0N2Q5NCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODoyMjowOSArMDIwMAotU3Vi
amVjdDogW1BBVENIIDIvMl0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmlu
ZyBweXRob24uCitTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBzZXQgUFlUSE9OX0lOU1RBTExfRElS
IGJ5IHJ1bm5pbmcgcHl0aG9uLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
LWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KQEAgLTEwLDcgKzEwLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWJjb21wcy9zcmMv
cHl0aG9uL3NyYy9DTWFrZUxpc3RzLnR4dCBiL2xpYmNvbXBzL3NyYy9weXRob24vc3JjL0NNYWtl
TGlzdHMudHh0Ci1pbmRleCBmODEzYWY0Li45ZWViYjZjIDEwMDY0NAoraW5kZXggZDIyYjg0ZS4u
YWQ2NzMwOSAxMDA2NDQKIC0tLSBhL2xpYmNvbXBzL3NyYy9weXRob24vc3JjL0NNYWtlTGlzdHMu
dHh0CiArKysgYi9saWJjb21wcy9zcmMvcHl0aG9uL3NyYy9DTWFrZUxpc3RzLnR4dAogQEAgLTg1
LDcgKzg1LDcgQEAgSUYgKFNLQlVJTEQpCkBAIC0yMiw2ICsyMiwzIEBAIGluZGV4IGY4MTNhZjQu
LjllZWJiNmMgMTAwNjQ0CiAgCiAgICAgIElOU1RBTEwoRklMRVMgJHtweWNvbXBzX1NSQ0RJUn0v
bGliY29tcHMvX19pbml0X18ucHkgREVTVElOQVRJT04gJHtQWVRIT05fSU5TVEFMTF9ESVJ9L2xp
YmNvbXBzKQogICAgICAjSU5TVEFMTChGSUxFUyAke3B5Y29tcHNfU1JDRElSfS90ZXN0cy9fX3Rl
c3QucHkgREVTVElOQVRJT04KLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJjb21wcy9saWJjb21wc18wLjEuMjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjIxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJjb21wcy9saWJjb21wc18wLjEuMjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJjb21wcy9saWJjb21wc18wLjEu
MjEuYmIKaW5kZXggMWY1OWM1ZWExZS4uOTExNzBkZmJlZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmNvbXBzL2xpYmNvbXBzXzAuMS4yMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjIxLmJiCkBAIC04LDcgKzgsNyBAQCBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvbGliY29t
cHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMi1Eby1ub3Qtc2V0
LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gIjg1NGZiYjlmZTczM2I3NzQ5ODFlMWZmY2Y4MjViMmQyY2UwZjgwNzIi
CitTUkNSRVYgPSAiMmU5NzNjZTIyNjk4ZGQ2NGY0NzIxODBlM2E2ODk3NTUyNjhmYjA2YiIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============0685559044016732164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcomps: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-src: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-src: PKGSIZE changed from 816687 to 816714 (+0%)
packages/core2-64-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.20 [default] to 0.1.21 [default]
packages/core2-64-poky-linux/libcomps/libcomps: PV changed from "0.1.20" to "0.1.21"
packages/core2-64-poky-linux/libcomps/libcomps: PKGV changed from 0.1.20 [default] to 0.1.21 [default]

--===============0685559044016732164==--

