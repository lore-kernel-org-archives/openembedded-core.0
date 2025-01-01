Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888EBE7719B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11337.1735723943229020255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cKOw8tWz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SROqUg6E;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101942135a08e-b4df4a05-a6f1-4d1c-a869-658f984c3806-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aRl3pCpDE1zmGUiPx/yve+N8tlFGeikIQGQKWnRsgTI=;
	b=cKOw8tWzyzxG5BUTH76KLCZ5UuDUFDdAmh2kkzfwzoixoGmimgdAEZtnCNPgwZUe
	rcGZNcmI77cVtrMVSODQLw7mv29ciNEnopsVaFW70vhz/HBqsJRhCPRKBHBDhHESuK8
	L0D0EaDotnKIIRNJEVRCasx7AYyAo3JwwmPbd5Y0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aRl3pCpDE1zmGUiPx/yve+N8tlFGeikIQGQKWnRsgTI=;
	b=SROqUg6EqOlJD56LTUsqf9JFp1sE3cJjqlZXnIKAN/17aGWYPhDdsKdgbZhrx+mL
	auSAlJ1P7i4n1MWvMkxEk6ZCb6GQY7oioEtO4YwycTAqLpuqtmhxpCiVbcYDCvdR+nq
	vaArj2VO7957EijZjzvRThKtQGxJYD1E5u5uEzfY=
Content-Type: multipart/mixed; boundary="===============2639474310196772009=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blktool: upgrading to 4-8 SUCCEEDED
Message-ID: <010101942135a08e-b4df4a05-a6f1-4d1c-a869-658f984c3806-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209233

--===============2639474310196772009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blktool* to *4-8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-blktool-upgrade-4-7.1-4-8.patch
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
From 4fce33c92476246e61b5d13c4c171b5b44bb6d3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:57:40 +0000
Subject: [PATCH] blktool: upgrade 4-7.1 -> 4-8

---
 .../blktool/0001-fix-typos-in-manpage.patch      |  8 ++------
 .../blktool/blktool/0002-fix-string-error.patch  |  8 ++------
 ...ument-for-BLKROSET-it-must-be-const-int.patch |  8 ++------
 .../blktool/0004-fix-ftbfs-glibc-2.28.patch      | 16 +++++++++++++---
 .../blktool/{blktool_4-7.1.bb => blktool_4-8.bb} |  1 +
 5 files changed, 20 insertions(+), 21 deletions(-)
 rename meta/recipes-extended/blktool/{blktool_4-7.1.bb => blktool_4-8.bb} (94%)

diff --git a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
index 25a2fabe15..4bd2aeb535 100644
--- a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
+++ b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
@@ -1,14 +1,13 @@
-From 9cb1667f9d3a9bcfc3b83466cd8d3b79f0554ff0 Mon Sep 17 00:00:00 2001
+From ad64135ef4df5d1ad8b0d43b57c7655088a53dbe Mon Sep 17 00:00:00 2001
 From: Azat Khuzhin <a3at.mail@gmail.com>
 Date: Wed, 8 Jul 2015 01:37:09 +0300
-Subject: [PATCH 1/3] fix typos in manpage
+Subject: [PATCH] fix typos in manpage
 
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  blktool.8 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -35,6 +34,3 @@ index a1f5c96..45b7724 100644
  
  .TP
  .B multiple-count
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
index 401e41e3ed..418d91dcaa 100644
--- a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
+++ b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
@@ -1,14 +1,13 @@
-From ddb1071da2c78d8155aab62e9f0d46f69500200f Mon Sep 17 00:00:00 2001
+From 93f773ce627bfa36c4f6b0584c494ace07cebbd1 Mon Sep 17 00:00:00 2001
 From: Azat Khuzhin <a3at.mail@gmail.com>
 Date: Wed, 8 Jul 2015 01:42:24 +0300
-Subject: [PATCH 2/3] fix string error
+Subject: [PATCH] fix string error
 
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,6 +25,3 @@ index 1f3a9ca..2ccf56a 100644
  	if (blkdev >= 0)
  		close(blkdev);
  	exit(1);
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
index d1f1e797fe..4f11c1f98a 100644
--- a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
+++ b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
@@ -1,7 +1,7 @@
-From 68faa63aaad81f4a289e4a03173ab4cf798deb53 Mon Sep 17 00:00:00 2001
+From e91edf28a5afa98de8b420430bf80e3e741060f4 Mon Sep 17 00:00:00 2001
 From: Azat Khuzhin <a3at.mail@gmail.com>
 Date: Sat, 1 Nov 2014 22:24:32 +0300
-Subject: [PATCH 3/3] Fix 3-d argument for BLKROSET it must be 'const int *'
+Subject: [PATCH] Fix 3-d argument for BLKROSET it must be 'const int *'
 
 Most of *SET ioctls have int type for 3-d argument, except BLKROSET.
 So add bc_arg_type enum, build it into bool_comand and install arg_type
@@ -15,7 +15,6 @@ ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  blktool.c | 11 +++++++++--
  blktool.h |  7 +++++++
@@ -73,6 +72,3 @@ index fce4387..85add83 100644
  };
  
  struct class_operations {
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch b/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
index 65bca65100..8c2eae3747 100644
--- a/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
+++ b/meta/recipes-extended/blktool/blktool/0004-fix-ftbfs-glibc-2.28.patch
@@ -1,5 +1,9 @@
+From bb7bb94f87b2266a3d76b320094d023b8fe46cde Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@debian.org>
+Date: Wed, 27 Mar 2019 15:09:17 +0100
+Subject: [PATCH] blktool: update to 4-7.1
+
 Description: Fix FTBFS with glibc 2.28
-Author: Adrian Bunk <bunk@debian.org>
 Bug-Debian: https://bugs.debian.org/917055
 
 This patch is taken from
@@ -7,8 +11,14 @@ http://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.1.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---- blktool-4.orig/blktool.c
-+++ blktool-4/blktool.c
+---
+ blktool.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/blktool.c b/blktool.c
+index 221a195..3d450ab 100644
+--- a/blktool.c
++++ b/blktool.c
 @@ -18,6 +18,7 @@
  #include <unistd.h>
  #include <sys/stat.h>
diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4-8.bb
similarity index 94%
rename from meta/recipes-extended/blktool/blktool_4-7.1.bb
rename to meta/recipes-extended/blktool/blktool_4-8.bb
index bb44befb56..12080e6442 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-8.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "glib-2.0"
 
+SRC_URI[sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/${BPN}/${BPN}_4.orig.tar.gz;name=tarball \
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
-- 
2.44.1


--===============2639474310196772009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/blktool/blktool-dbg: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-dbg: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool-dbg: PKGSIZE changed from 77488 to 77472 (-0%)
packages/core2-64-poky-linux/blktool/blktool-dev: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-dev: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool-doc: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-doc: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool-locale: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-locale: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool-src: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-src: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool-staticdev: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool-staticdev: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool/blktool: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool/blktool: PV changed from "4-7.1" to "4-8"
packages/core2-64-poky-linux/blktool: PKGV changed from 4-7.1 [default] to 4-8 [default]
packages/core2-64-poky-linux/blktool: PV changed from "4-7.1" to "4-8"

--===============2639474310196772009==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-blktool-upgrade-4-7.1-4-8.patch"

RnJvbSA0ZmNlMzNjOTI0NzYyNDZlNjFiNWQxM2M0YzE3MWI1YjQ0YmI2ZDNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzo1Nzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
a3Rvb2w6IHVwZ3JhZGUgNC03LjEgLT4gNC04CgotLS0KIC4uLi9ibGt0b29sLzAwMDEtZml4LXR5
cG9zLWluLW1hbnBhZ2UucGF0Y2ggICAgICB8ICA4ICsrLS0tLS0tCiAuLi4vYmxrdG9vbC9ibGt0
b29sLzAwMDItZml4LXN0cmluZy1lcnJvci5wYXRjaCAgfCAgOCArKy0tLS0tLQogLi4udW1lbnQt
Zm9yLUJMS1JPU0VULWl0LW11c3QtYmUtY29uc3QtaW50LnBhdGNoIHwgIDggKystLS0tLS0KIC4u
Li9ibGt0b29sLzAwMDQtZml4LWZ0YmZzLWdsaWJjLTIuMjgucGF0Y2ggICAgICB8IDE2ICsrKysr
KysrKysrKystLS0KIC4uLi9ibGt0b29sL3tibGt0b29sXzQtNy4xLmJiID0+IGJsa3Rvb2xfNC04
LmJifSB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wve2Jsa3Rvb2xfNC03
LjEuYmIgPT4gYmxrdG9vbF80LTguYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbC8wMDAxLWZpeC10eXBvcy1pbi1tYW5wYWdlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbC8wMDAxLWZpeC10eXBvcy1p
bi1tYW5wYWdlLnBhdGNoCmluZGV4IDI1YTJmYWJlMTUuLjRiZDJhZWI1MzUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9ibGt0b29sL2Jsa3Rvb2wvMDAwMS1maXgtdHlwb3MtaW4t
bWFucGFnZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmxrdG9vbC9ibGt0b29s
LzAwMDEtZml4LXR5cG9zLWluLW1hbnBhZ2UucGF0Y2gKQEAgLTEsMTQgKzEsMTMgQEAKLUZyb20g
OWNiMTY2N2Y5ZDNhOWJjZmMzYjgzNDY2Y2Q4ZDNiNzlmMDU1NGZmMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYWQ2NDEzNWVmNGRmNWQxYWQ4YjBkNDNiNTdjNzY1NTA4OGE1M2RiZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEF6YXQgS2h1emhpbiA8YTNhdC5tYWlsQGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKdWwgMjAxNSAwMTozNzowOSArMDMwMAotU3ViamVjdDog
W1BBVENIIDEvM10gZml4IHR5cG9zIGluIG1hbnBhZ2UKK1N1YmplY3Q6IFtQQVRDSF0gZml4IHR5
cG9zIGluIG1hbnBhZ2UKIAogVGhpcyBwYXRjaCBpcyB0YWtlbiBmcm9tCiBmdHA6Ly9mdHAuZGVi
aWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2IvYmxrdG9vbC9ibGt0b29sXzQtNy5kZWJpYW4udGFy
Lnh6CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbdXBzdHJlYW0gaXMgZGVhZF0K
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgotCiAtLS0KICBibGt0b29sLjggfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQpAQCAtMzUsNiArMzQsMyBAQCBpbmRleCBhMWY1Yzk2Li40
NWI3NzI0IDEwMDY0NAogIAogIC5UUAogIC5CIG11bHRpcGxlLWNvdW50Ci0tLSAKLTIuMS40Ci0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ibGt0b29sL2Jsa3Rvb2wvMDAwMi1m
aXgtc3RyaW5nLWVycm9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxr
dG9vbC8wMDAyLWZpeC1zdHJpbmctZXJyb3IucGF0Y2gKaW5kZXggNDAxZTQxZTNlZC4uNDE4ZDkx
ZGNhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbC8w
MDAyLWZpeC1zdHJpbmctZXJyb3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Js
a3Rvb2wvYmxrdG9vbC8wMDAyLWZpeC1zdHJpbmctZXJyb3IucGF0Y2gKQEAgLTEsMTQgKzEsMTMg
QEAKLUZyb20gZGRiMTA3MWRhMmM3OGQ4MTU1YWFiNjJlOWYwZDQ2ZjY5NTAwMjAwZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTNmNzczY2U2MjdiZmEzNmM0ZjZiMDU4NGM0OTRhY2Uw
N2NlYmJkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEF6YXQgS2h1emhpbiA8YTNh
dC5tYWlsQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgOCBKdWwgMjAxNSAwMTo0MjoyNCArMDMwMAot
U3ViamVjdDogW1BBVENIIDIvM10gZml4IHN0cmluZyBlcnJvcgorU3ViamVjdDogW1BBVENIXSBm
aXggc3RyaW5nIGVycm9yCiAKIFRoaXMgcGF0Y2ggaXMgdGFrZW4gZnJvbQogZnRwOi8vZnRwLmRl
Ymlhbi5vcmcvZGViaWFuL3Bvb2wvbWFpbi9iL2Jsa3Rvb2wvYmxrdG9vbF80LTcuZGViaWFuLnRh
ci54egogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3Vwc3RyZWFtIGlzIGRlYWRd
CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KLQogLS0tCiAgdXRpbC5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQpAQCAtMjYsNiArMjUsMyBAQCBpbmRleCAxZjNhOWNhLi4yY2NmNTZh
IDEwMDY0NAogIAlpZiAoYmxrZGV2ID49IDApCiAgCQljbG9zZShibGtkZXYpOwogIAlleGl0KDEp
OwotLS0gCi0yLjEuNAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmxrdG9v
bC9ibGt0b29sLzAwMDMtRml4LTMtZC1hcmd1bWVudC1mb3ItQkxLUk9TRVQtaXQtbXVzdC1iZS1j
b25zdC1pbnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmxrdG9vbC9ibGt0b29sLzAw
MDMtRml4LTMtZC1hcmd1bWVudC1mb3ItQkxLUk9TRVQtaXQtbXVzdC1iZS1jb25zdC1pbnQucGF0
Y2gKaW5kZXggZDFmMWU3OTdmZS4uNGYxMWMxZjk4YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbC8wMDAzLUZpeC0zLWQtYXJndW1lbnQtZm9yLUJMS1JP
U0VULWl0LW11c3QtYmUtY29uc3QtaW50LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ibGt0b29sL2Jsa3Rvb2wvMDAwMy1GaXgtMy1kLWFyZ3VtZW50LWZvci1CTEtST1NFVC1pdC1t
dXN0LWJlLWNvbnN0LWludC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNjhmYWE2M2FhYWQ4
MWY0YTI4OWU0YTAzMTczYWI0Y2Y3OThkZWI1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZTkxZWRmMjhhNWFmYTk4ZGU4YjQyMDQzMGJmODBlM2U3NDEwNjBmNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEF6YXQgS2h1emhpbiA8YTNhdC5tYWlsQGdtYWlsLmNvbT4KIERh
dGU6IFNhdCwgMSBOb3YgMjAxNCAyMjoyNDozMiArMDMwMAotU3ViamVjdDogW1BBVENIIDMvM10g
Rml4IDMtZCBhcmd1bWVudCBmb3IgQkxLUk9TRVQgaXQgbXVzdCBiZSAnY29uc3QgaW50IConCitT
dWJqZWN0OiBbUEFUQ0hdIEZpeCAzLWQgYXJndW1lbnQgZm9yIEJMS1JPU0VUIGl0IG11c3QgYmUg
J2NvbnN0IGludCAqJwogCiBNb3N0IG9mICpTRVQgaW9jdGxzIGhhdmUgaW50IHR5cGUgZm9yIDMt
ZCBhcmd1bWVudCwgZXhjZXB0IEJMS1JPU0VULgogU28gYWRkIGJjX2FyZ190eXBlIGVudW0sIGJ1
aWxkIGl0IGludG8gYm9vbF9jb21hbmQgYW5kIGluc3RhbGwgYXJnX3R5cGUKQEAgLTE1LDcgKzE1
LDYgQEAgZnRwOi8vZnRwLmRlYmlhbi5vcmcvZGViaWFuL3Bvb2wvbWFpbi9iL2Jsa3Rvb2wvYmxr
dG9vbF80LTcuZGViaWFuLnRhci54egogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUg
W3Vwc3RyZWFtIGlzIGRlYWRdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgYmxrdG9vbC5jIHwgMTEgKysrKysrKysrLS0K
ICBibGt0b29sLmggfCAgNyArKysrKysrCkBAIC03Myw2ICs3MiwzIEBAIGluZGV4IGZjZTQzODcu
Ljg1YWRkODMgMTAwNjQ0CiAgfTsKICAKICBzdHJ1Y3QgY2xhc3Nfb3BlcmF0aW9ucyB7Ci0tLSAK
LTIuMS40Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ibGt0b29sL2Jsa3Rv
b2wvMDAwNC1maXgtZnRiZnMtZ2xpYmMtMi4yOC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ibGt0b29sL2Jsa3Rvb2wvMDAwNC1maXgtZnRiZnMtZ2xpYmMtMi4yOC5wYXRjaAppbmRleCA2
NWJjYTY1MTAwLi44YzJlYWUzNzQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YmxrdG9vbC9ibGt0b29sLzAwMDQtZml4LWZ0YmZzLWdsaWJjLTIuMjgucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbC8wMDA0LWZpeC1mdGJmcy1nbGliYy0y
LjI4LnBhdGNoCkBAIC0xLDUgKzEsOSBAQAorRnJvbSBiYjdiYjk0Zjg3YjIyNjZhM2Q3NmIzMjAw
OTRkMDIzYjhmZTQ2Y2RlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWRyaWFuIEJ1
bmsgPGJ1bmtAZGViaWFuLm9yZz4KK0RhdGU6IFdlZCwgMjcgTWFyIDIwMTkgMTU6MDk6MTcgKzAx
MDAKK1N1YmplY3Q6IFtQQVRDSF0gYmxrdG9vbDogdXBkYXRlIHRvIDQtNy4xCisKIERlc2NyaXB0
aW9uOiBGaXggRlRCRlMgd2l0aCBnbGliYyAyLjI4Ci1BdXRob3I6IEFkcmlhbiBCdW5rIDxidW5r
QGRlYmlhbi5vcmc+CiBCdWctRGViaWFuOiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy85MTcwNTUK
IAogVGhpcyBwYXRjaCBpcyB0YWtlbiBmcm9tCkBAIC03LDggKzExLDE0IEBAIGh0dHA6Ly9mdHAu
ZGViaWFuLm9yZy9kZWJpYW4vcG9vbC9tYWluL2IvYmxrdG9vbC9ibGt0b29sXzQtNy4xLmRlYmlh
bi50YXIueHoKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt1cHN0cmVhbSBpcyBk
ZWFkXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+Ci0tLS0gYmxrdG9vbC00Lm9yaWcvYmxrdG9vbC5jCi0rKysgYmxrdG9vbC00L2Jsa3Rv
b2wuYworLS0tCisgYmxrdG9vbC5jIHwgMSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCisKK2RpZmYgLS1naXQgYS9ibGt0b29sLmMgYi9ibGt0b29sLmMKK2luZGV4IDIyMWExOTUu
LjNkNDUwYWIgMTAwNjQ0CistLS0gYS9ibGt0b29sLmMKKysrKyBiL2Jsa3Rvb2wuYwogQEAgLTE4
LDYgKzE4LDcgQEAKICAjaW5jbHVkZSA8dW5pc3RkLmg+CiAgI2luY2x1ZGUgPHN5cy9zdGF0Lmg+
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmxrdG9vbC9ibGt0b29sXzQtNy4x
LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbF80LTguYmIKc2ltaWxh
cml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wv
YmxrdG9vbF80LTcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wv
YmxrdG9vbF80LTguYmIKaW5kZXggYmI0NGJlZmI1Ni4uMTIwODBlNjQ0MiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jsa3Rvb2wvYmxrdG9vbF80LTcuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYmxrdG9vbC9ibGt0b29sXzQtOC5iYgpAQCAtOSw2ICs5LDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2Fh
OWI3ZGYwNzliYWUxOWYgXAogCiBERVBFTkRTID0gImdsaWItMi4wIgogCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYjFlNmQ1OTEyNTQ2ZDJhNGI3MDRlYzY1YzJiOTY2NGFhM2I0NjYzZTdkODAwZTA2
ODAzMzMwMzM1YTJjYjc2NCIKIFNSQ19VUkkgPSAiaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcv
YXJjaGl2ZS9kZWJpYW4vMjAxNjA3MjhUMDQzNDQzWi9wb29sL21haW4vYi8ke0JQTn0vJHtCUE59
XzQub3JpZy50YXIuZ3o7bmFtZT10YXJiYWxsIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZml4
LXR5cG9zLWluLW1hbnBhZ2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1maXgtc3Ry
aW5nLWVycm9yLnBhdGNoIFwKLS0gCjIuNDQuMQoK

--===============2639474310196772009==--

