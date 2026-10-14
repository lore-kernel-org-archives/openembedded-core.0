Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98970CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:20:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6854.1791955227157519327
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 22:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RIlRYnqb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mu7x2bxs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a138dace65-1074b837-286f-40d9-8648-e6d69b4475f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791955226;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6ljCwJzrKlyFg4DQOgElO4RvFQbXK9cR8uiIZfnf6hw=;
	b=RIlRYnqbhOwl0xsZBAl6cxetF05tpQx9E9s7wDqfLe9t2gzfnT6c8Qvd77tvLth7
	fkoEucD4iDC98yCh/yIIJD+viOOhRUAMuVfMJMky6xBvj6TxXHplR/xyGpbMd788s86
	EaV0XfNcbWNEasBQOhTp+lRbrOSuhezV4+Aer1hM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791955226;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6ljCwJzrKlyFg4DQOgElO4RvFQbXK9cR8uiIZfnf6hw=;
	b=mu7x2bxswHRSjW2giofvbllYnyARZtFVKzgGIEPk8ubfgyGLN49+pYMG/uJlSmyM
	FEhjb1owGB7r2lrVMVQrh5vniyJ+JHEM6u0Nd43IDMHwfufbsrG69TWn5UCB4hN+Eoi
	n22VxYmECjyprlw0T8QBo8eoRrieV3TbQXy+7L4U=
Content-Type: multipart/mixed; boundary="===============0194958221104416703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.2.5 SUCCEEDED
Message-ID: <010101a138dace65-1074b837-286f-40d9-8648-e6d69b4475f2-000000@us-west-2.amazonses.com>
Date: Wed, 14 Oct 2026 05:20:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.14-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247743

--===============0194958221104416703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.2.4-1.2.5.patch
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
From 96c492433c4c05495646d1a3ea42ba8102c8de96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 14 Oct 2026 05:08:47 +0000
Subject: [PATCH] createrepo-c: upgrade 1.2.4 -> 1.2.5

Release 1.2.5
Cover description, summary & other fields with UTF-8 replacement
Decode invalid UTF-8 in Python changelog fields
Avoid Python tuple corruption on invalid UTF-8
---
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../{createrepo-c_1.2.4.bb => createrepo-c_1.2.5.bb}          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.4.bb => createrepo-c_1.2.5.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index e2f90644c2..3ace4dd896 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 71df5a5471081cf2338f9f046cdc51d064534297 Mon Sep 17 00:00:00 2001
+From 333a5394f1f13bca50fc7bbd2eeb6d6381bce06f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -13,7 +13,7 @@ Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 05ac89f9f491f93367283974ea38b5e314f0c5b6..44e38b386abc1c8eb135721d89509c649fdc6297 100644
+index 05ac89f..44e38b3 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -48,7 +48,7 @@ IF (SKBUILD)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
index f6da852f0d..7ffb7bce66 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=1.x.x-maint;protocol=https;tag=${PV} \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "47ab8a418fb3abd58ef3760a7eace1481610c659"
+SRCREV = "6a48c5f599d30a20d15ea13b1dea82a86734d3d2"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
-- 
2.47.1


--===============0194958221104416703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="createrepo-c-changelog.txt"

Release 1.2.5
Cover description, summary & other fields with UTF-8 replacement
Decode invalid UTF-8 in Python changelog fields
Avoid Python tuple corruption on invalid UTF-8

--===============0194958221104416703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.2.4-1.2.5.patch"

RnJvbSA5NmM0OTI0MzNjNGMwNTQ5NTY0NmQxYTNlYTQyYmE4MTAyYzhkZTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTQgT2N0IDIwMjYgMDU6MDg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4yLjQgLT4gMS4yLjUKClJlbGVhc2UgMS4yLjUKQ292ZXIg
ZGVzY3JpcHRpb24sIHN1bW1hcnkgJiBvdGhlciBmaWVsZHMgd2l0aCBVVEYtOCByZXBsYWNlbWVu
dApEZWNvZGUgaW52YWxpZCBVVEYtOCBpbiBQeXRob24gY2hhbmdlbG9nIGZpZWxkcwpBdm9pZCBQ
eXRob24gdHVwbGUgY29ycnVwdGlvbiBvbiBpbnZhbGlkIFVURi04Ci0tLQogLi4uMDAwMS1Eby1u
b3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCB8IDQgKyst
LQogLi4uL3tjcmVhdGVyZXBvLWNfMS4yLjQuYmIgPT4gY3JlYXRlcmVwby1jXzEuMi41LmJifSAg
ICAgICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy97Y3Jl
YXRlcmVwby1jXzEuMi40LmJiID0+IGNyZWF0ZXJlcG8tY18xLjIuNS5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8w
MDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1E
by1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAppbmRl
eCBlMmY5MDY0NGMyLi4zYWNlNGRkODk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RB
TExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFM
TF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcxZGY1
YTU0NzEwODFjZjIzMzhmOWYwNDZjZGM1MWQwNjQ1MzQyOTcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDMzM2E1Mzk0ZjFmMTNiY2E1MGZjN2JiZDJlZWI2ZDYzODFiY2UwNmYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MzE6MDIgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRo
b24KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogTW9yaXR6IEhhYXNlIDxNb3JpdHou
SGFhc2VAYm13LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3B5dGhvbi9DTWFrZUxpc3RzLnR4dCBiL3NyYy9weXRo
b24vQ01ha2VMaXN0cy50eHQKLWluZGV4IDA1YWM4OWY5ZjQ5MWY5MzM2NzI4Mzk3NGVhMzhiNWUz
MTRmMGM1YjYuLjQ0ZTM4YjM4NmFiYzFjOGViMTM1NzIxZDg5NTA5YzY0OWZkYzYyOTcgMTAwNjQ0
CitpbmRleCAwNWFjODlmLi40NGUzOGIzIDEwMDY0NAogLS0tIGEvc3JjL3B5dGhvbi9DTWFrZUxp
c3RzLnR4dAogKysrIGIvc3JjL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAogQEAgLTQ4LDcgKzQ4LDcg
QEAgSUYgKFNLQlVJTEQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRl
cmVwby1jL2NyZWF0ZXJlcG8tY18xLjIuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVh
dGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEu
Mi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0
ZXJlcG8tY18xLjIuNS5iYgppbmRleCBmNmRhODUyZjBkLi43ZmZiN2JjZTY2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjIuNC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18x
LjIuNS5iYgpAQCAtNCwxMSArNCwxMSBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
cnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jL3dpa2kiCiBMSUNFTlNFID0gIkdQ
TC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1tYXN0ZXI7cHJv
dG9jb2w9aHR0cHM7dGFnPSR7UFZ9IFwKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0t
c29mdHdhcmUtbWFuYWdlbWVudC9jcmVhdGVyZXBvX2M7YnJhbmNoPTEueC54LW1haW50O3Byb3Rv
Y29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1zZXQt
UFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNSRVYgPSAiNDdhYjhhNDE4ZmIzYWJkNThlZjM3NjBhN2VhY2UxNDgxNjEwYzY1OSIK
K1NSQ1JFViA9ICI2YTQ4YzVmNTk5ZDMwYTIwZDE1ZWExM2IxZGVhODJhODY3MzRkM2QyIgogCiBE
RVBFTkRTID0gImV4cGF0IGN1cmwgZ2xpYi0yLjAgbGlieG1sMiBvcGVuc3NsIGJ6aXAyIHpsaWIg
ZmlsZSBzcWxpdGUzIHh6IHJwbSIKIERFUEVORFM6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmls
ZS1yZXBsYWNlbWVudC1uYXRpdmUiCi0tIAoyLjQ3LjEKCg==

--===============0194958221104416703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: directory renamed /usr/lib/python3.14/site-packages/createrepo_c-1.2.4.dist-info -> /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info, removed "/usr/lib/libcreaterepo_c.so.1.2.4", added "/usr/lib/libcreaterepo_c.so.1.2.5"
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.4 to libcreaterepo_c.so.1.2.5
  /usr/lib/libcreaterepo_c.so.1.2.4 moved to /usr/lib/libcreaterepo_c.so.1.2.5
  /usr/lib/python3.14/site-packages/createrepo_c-1.2.4.dist-info moved to /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info

--===============0194958221104416703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.2.4", added "/usr/lib/.debug/libcreaterepo_c.so.1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1610488 to 1616568 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: FILELIST: directory renamed /usr/src/debug/createrepo-c/1.2.4/src/python -> /usr/src/debug/createrepo-c/1.2.5/src/python, directory renamed /usr/src/debug/createrepo-c/1.2.4/src -> /usr/src/debug/createrepo-c/1.2.5/src
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1289597 to 1290812 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: directory renamed /usr/lib/python3.14/site-packages/createrepo_c-1.2.4.dist-info -> /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info, removed "/usr/lib/libcreaterepo_c.so.1.2.4", added "/usr/lib/libcreaterepo_c.so.1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/x86-64-v3-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https;tag=1.2.4 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=1.x.x-maint;protocol=https;tag=1.2.5 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch"
packages/x86-64-v3-poky-linux/createrepo-c: PV changed from "1.2.4" to "1.2.5"
packages/x86-64-v3-poky-linux/createrepo-c: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.4 to libcreaterepo_c.so.1.2.5
  /usr/lib/libcreaterepo_c.so.1.2.4 moved to /usr/lib/libcreaterepo_c.so.1.2.5
  /usr/lib/python3.14/site-packages/createrepo_c-1.2.4.dist-info moved to /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info

--===============0194958221104416703==--

