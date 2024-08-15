Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C2AC54731
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.131423.1723748334179181588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VL7O+rDB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=x+jIsDk/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191576837b1-a3fd69e9-2a89-4c9c-9018-d04bc535697f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+VsEnLxpAboZ9v6LTSr+Mry45yVXUGnsGHkOiDEpvqY=;
	b=VL7O+rDBz3qvwH6FdBkxjUhCz9Pksm0eocJmp6jjnBUituaKAw6JiXPi9hxWFEXq
	sdZHf/zXG08n/VFUVJdx/xxnzgKGUG9KqMRGzTRnsCFqnvKkzaNU2LEwlxf8vvfAex1
	6UJVDuNQRkGqaisf00m3/okOf5cn8hZqdQHTWCHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+VsEnLxpAboZ9v6LTSr+Mry45yVXUGnsGHkOiDEpvqY=;
	b=x+jIsDk/j7xsyIx+OVc+B0id8tyIH56Kib6mq/XwxBTULWfrHZEQwY5VYpz0KHUg
	n6iHOlIA3efgtWEEKJlQssge3uEYOtHiadWCf4+VzAm+SiGzb0cAPj49uWO8Nrf6K48
	i56DdoDUtKXWtwolLOPWAnKzAUnDAcf52ilZtp5o=
Content-Type: multipart/mixed; boundary="===============8336617068340223096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.1.4 SUCCEEDED
Message-ID: <01010191576837b1-a3fd69e9-2a89-4c9c-9018-d04bc535697f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203362

--===============8336617068340223096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.1.3-1.1.4.patch
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
From 7251d4331b9afc230583b4b6211c11184b0ca294 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 09:39:01 +0000
Subject: [PATCH] createrepo-c: upgrade 1.1.3 -> 1.1.4

---
 ...001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 5 +----
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch          | 5 ++---
 .../{createrepo-c_1.1.3.bb => createrepo-c_1.1.4.bb}         | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.3.bb => createrepo-c_1.1.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index b63fe53944..17cf6b229a 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
+From 684703cbfa16491740ec5ef9b4ee81b9fb60fe52 Mon Sep 17 00:00:00 2001
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
index b7e5710b39..87c1366463 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
+From 39462ccd52b2ef3d582d3892ac5d54dcf7617a51 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
index 2e08449812..0a37c76187 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "e93766dfc30f39b16d41f2d0eb130c92c16993ab"
+SRCREV = "a5a8990ff84b7977218976ea14c703330fb52875"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============8336617068340223096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.3", added "/usr/lib/libcreaterepo_c.so.1.1.4"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.3 to libcreaterepo_c.so.1.1.4
  /usr/lib/libcreaterepo_c.so.1.1.3 moved to /usr/lib/libcreaterepo_c.so.1.1.4

--===============8336617068340223096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.1.3", added "/usr/lib/.debug/libcreaterepo_c.so.1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1483008 to 1483112 (+0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.3", added "/usr/lib/libcreaterepo_c.so.1.1.4"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.1.3" to "1.1.4"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.1.3 [default] to 1.1.4 [default]
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.1.3" to "1.1.4"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.3 to libcreaterepo_c.so.1.1.4
  /usr/lib/libcreaterepo_c.so.1.1.3 moved to /usr/lib/libcreaterepo_c.so.1.1.4

--===============8336617068340223096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.1.3-1.1.4.patch"

RnJvbSA3MjUxZDQzMzFiOWFmYzIzMDU4M2I0YjYyMTFjMTExODRiMGNhMjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDk6Mzk6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4xLjMgLT4gMS4xLjQKCi0tLQogLi4uMDAxLURvLW5vdC1z
ZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIHwgNSArLS0tLQog
Li4uL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoICAgICAg
ICAgIHwgNSArKy0tLQogLi4uL3tjcmVhdGVyZXBvLWNfMS4xLjMuYmIgPT4gY3JlYXRlcmVwby1j
XzEuMS40LmJifSAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJl
cG8tYy97Y3JlYXRlcmVwby1jXzEuMS4zLmJiID0+IGNyZWF0ZXJlcG8tY18xLjEuNC5iYn0gKDk2
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0
ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0
aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBv
LWMvMDAwMS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5w
YXRjaAppbmRleCBiNjNmZTUzOTQ0Li4xN2NmNmIyMjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlU
SE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDZmOGY2ZDE1MWI4MzFiNjBmNmU3ODkyYWE5Mjk0YTYzNjEzNTNjNzIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDY4NDcwM2NiZmExNjQ5MTc0MGVjNWVmOWI0ZWU4MWI5ZmI2MGZl
NTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MzE6MDIgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVu
bmluZyBweXRob24KQEAgLTIzLDYgKzIzLDMgQEAgaW5kZXggYTMxYjE0ZC4uMDFmZDhjYSAxMDA2
NDQKICBJTkNMVURFX0RJUkVDVE9SSUVTICgke1BZVEhPTl9JTkNMVURFX1BBVEh9KQogIAogIE1F
U1NBR0UoU1RBVFVTICJQeXRob24gaW5zdGFsbCBkaXIgaXMgJHtQWVRIT05fSU5TVEFMTF9ESVJ9
IikKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVh
dGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWlu
Y2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoCmluZGV4IGI3ZTU3MTBiMzkuLjg3YzEzNjY0NjMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVw
by1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1z
dHJpbmcuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWI2NjMyNmMzZmM2ZTk0MjI4MmQw
MWRkZDU2NjU5Yzc4ZWQ3NDAwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzk0NjJj
Y2Q1MmIyZWYzZDU4MmQzODkyYWM1ZDU0ZGNmNzYxN2E1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEzIEph
biAyMDIzIDEzOjIxOjUxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUgcnBtL3JwbXN0
cmluZy5oCkBAIC0xMSwxMyArMTEsMTIgQEAgb24gJ3Jhc3ByaW50Zic7IElTTyBDOTkgYW5kIGxh
dGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucwogCiBVcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1t
YW5hZ2VtZW50L2NyZWF0ZXJlcG9fYy9wdWxsLzM0MF0KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0KIC0tLQogIHNyYy94bWxfZmlsZS5jIHwgMSArCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zcmMveG1sX2ZpbGUu
YyBiL3NyYy94bWxfZmlsZS5jCi1pbmRleCBkMjQwMGI4Li44NzExMDljIDEwMDY0NAoraW5kZXgg
NDRiMzhmOS4uZGU1MTc2YiAxMDA2NDQKIC0tLSBhL3NyYy94bWxfZmlsZS5jCiArKysgYi9zcmMv
eG1sX2ZpbGUuYwogQEAgLTE5LDYgKzE5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMS4zLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4xLjQuYmIKc2ltaWxhcml0eSBp
bmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9j
cmVhdGVyZXBvLWNfMS4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVh
dGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMS40LmJiCmluZGV4IDJlMDg0NDk4MTIuLjBhMzdjNzYx
ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jXzEuMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMv
Y3JlYXRlcmVwby1jXzEuMS40LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1tYXN0
ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRj
aCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImU5Mzc2NmRmYzMwZjM5YjE2ZDQxZjJkMGVi
MTMwYzkyYzE2OTkzYWIiCitTUkNSRVYgPSAiYTVhODk5MGZmODRiNzk3NzIxODk3NmVhMTRjNzAz
MzMwZmI1Mjg3NSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4wCgo=

--===============8336617068340223096==--

