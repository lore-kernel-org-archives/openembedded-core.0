Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A883C88E47
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:00:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7460.1789020029684854691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L9IFmqXv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EC9oPjob;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a089e73f7c-70bf9211-5c14-4bda-91d5-2ee5500312a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789020029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tH5TEMB2aJ1CKZ+xNuLBQM2j4sVta0Nmb9qANQPzI+g=;
	b=L9IFmqXvZKfdtd465UFiF96GxePyct/ynv6/A8yOgdgqm93aIQKM9oiwCx0bX6OR
	bb2a8bzGQ9+RYPTYetwmtMoCzsUkNWuWE6RmjodyWv/L8M3Ov0nK5xWxXaxrZwKj+60
	yo0eXP+RugJcQiHxO8IweKBtdTgksoRgIlOi8IIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789020029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tH5TEMB2aJ1CKZ+xNuLBQM2j4sVta0Nmb9qANQPzI+g=;
	b=EC9oPjobqcuYXOsfgim1POwU6rJHXKDOUbNQ26fH+UYErjO2bVKD78glz6j+udaB
	YvXtDlx4+HNQDjc298dSerEuuUDkROY6VGP6CHERuFHuTa2x/FhDjSqldwW9N4HeYcN
	fvqcBs0OgGs9jgL4OLJePHoo2CwlIXkttAQNQ/y8=
Content-Type: multipart/mixed; boundary="===============1839656782466894144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.21.1 SUCCEEDED
Message-ID: <010101a089e73f7c-70bf9211-5c14-4bda-91d5-2ee5500312a6-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2026 06:00:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245538

--===============1839656782466894144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.21.0-1.21.1.patch
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
From 5341e21681e9febc2984cce7a65027bf0e6cfbba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Sep 2026 05:32:13 +0000
Subject: [PATCH] librepo: upgrade 1.21.0 -> 1.21.1

86ed082 Release 1.21.1
bfa2bdf Fix file corruption when re-downloading a completed file with resume
04a1478 Configure packit to propose downstream releases
c45e00d dnf5 tests were moved to dnf5 repository
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.21.0.bb => librepo_1.21.1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.21.0.bb => librepo_1.21.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 6cfe970c2f..30802fd4f2 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From ba81dfc3aaeadad0e22272136740864bc95d4f6b Mon Sep 17 00:00:00 2001
+From e15c8ab0aab4eda7754e186c63b5ee0feb13f886 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.21.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.21.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.1.bb
index 72ee9a627c..9cefbfd48e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.21.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "5e5bddacad52121f970c499e13a98d936dcdc7b6"
+SRCREV = "86ed082e25bbd1901d21d75924297c7697b33307"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.47.1


--===============1839656782466894144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="librepo-changelog.txt"

Changelog for librepo: 1.21.0 -> 1.21.1

86ed082 Release 1.21.1
bfa2bdf Fix file corruption when re-downloading a completed file with resume
04a1478 Configure packit to propose downstream releases
c45e00d dnf5 tests were moved to dnf5 repository

--===============1839656782466894144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.21.0-1.21.1.patch"

RnJvbSA1MzQxZTIxNjgxZTlmZWJjMjk4NGNjZTdhNjUwMjdiZjBlNmNmYmJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgU2VwIDIwMjYgMDU6MzI6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyZXBvOiB1cGdyYWRlIDEuMjEuMCAtPiAxLjIxLjEKCjg2ZWQwODIgUmVsZWFzZSAxLjIxLjEK
YmZhMmJkZiBGaXggZmlsZSBjb3JydXB0aW9uIHdoZW4gcmUtZG93bmxvYWRpbmcgYSBjb21wbGV0
ZWQgZmlsZSB3aXRoIHJlc3VtZQowNGExNDc4IENvbmZpZ3VyZSBwYWNraXQgdG8gcHJvcG9zZSBk
b3duc3RyZWFtIHJlbGVhc2VzCmM0NWUwMGQgZG5mNSB0ZXN0cyB3ZXJlIG1vdmVkIHRvIGRuZjUg
cmVwb3NpdG9yeQotLS0KIC4uLjItRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lOU1RBTExf
RElSLWJ5LXJ1bm5pbmctcC5wYXRjaCB8IDIgKy0KIC4uLi9saWJyZXBvL3tsaWJyZXBvXzEuMjEu
MC5iYiA9PiBsaWJyZXBvXzEuMjEuMS5iYn0gICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJyZXBvL3tsaWJyZXBvXzEuMjEuMC5iYiA9PiBsaWJyZXBvXzEuMjEuMS5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJy
ZXBvLzAwMDItRG8tbm90LXRyeS10by1vYnRhaW4tUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5p
bmctcC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1E
by1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNo
CmluZGV4IDZjZmU5NzBjMmYuLjMwODAyZmQ0ZjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05f
SU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFM
TF9ESVItYnktcnVubmluZy1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYTgxZGZjM2Fh
ZWFkYWQwZTIyMjcyMTM2NzQwODY0YmM5NWQ0ZjZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBlMTVjOGFiMGFhYjRlZGE3NzU0ZTE4NmM2M2I1ZWUwZmViMTNmODg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjA1OjM2ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIERvIG5vdCB0cnkgdG8gb2J0YWluIFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5uaW5n
IHB5dGhvbi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJl
cG9fMS4yMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIx
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYnJlcG8vbGlicmVwb18xLjIxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4xLmJiCmluZGV4IDcyZWU5YTYyN2MuLjljZWZiZmQ0
OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4y
MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJyZXBvL2xpYnJlcG9fMS4yMS4x
LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3
YXJlLW1hbmFnZW1lbnQvbGlicmVwby5naXQ7YnJhbmNoPW1hc3RlcjtwcgogICAgICAgICAgICBm
aWxlOi8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVu
bmluZy1wLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiNWU1YmRkYWNhZDUyMTIx
Zjk3MGM0OTllMTNhOThkOTM2ZGNkYzdiNiIKK1NSQ1JFViA9ICI4NmVkMDgyZTI1YmJkMTkwMWQy
MWQ3NTkyNDI5N2M3Njk3YjMzMzA3IgogCiBERVBFTkRTID0gImN1cmwgZ2xpYi0yLjAgb3BlbnNz
bCBhdHRyIGdwZ21lIGxpYnhtbDIiCiAKLS0gCjIuNDcuMQoK

--===============1839656782466894144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.0 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.21.1 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 963272 to 963640 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.21.0/librepo -> /usr/src/debug/librepo/1.21.1/librepo, directory renamed /usr/src/debug/librepo/1.21.0/librepo/python -> /usr/src/debug/librepo/1.21.1/librepo/python
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGSIZE changed from 748899 to 749319 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.21.0" to "1.21.1"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.21.0 [default] to 1.21.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.21.0" to "1.21.1"

--===============1839656782466894144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-b65abe004105ab344e983b73f54282698d50a9a5"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:b65abe004105ab344e983b73f54282698d50a9a5"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 630 Local 453 Mirrors 0 Missed 177 Current 196 (71% match, 78% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 247 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 260 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 294 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 309 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 310 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 333 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Started
NOTE: recipe librepo-1.21.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 357 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 365 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.22.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 373 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2026c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 383 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 384 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 386 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe qemu-native-11.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 405 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 410 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 412 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 426 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 455 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 461 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-2.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 470 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 473 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-native-1.61-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gpgme-2.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 488 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 503 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 511 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 539 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 546 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 549 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-native-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 557 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 561 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 567 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 582 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 587 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 591 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 593 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 597 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 603 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 612 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 619 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 624 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 625 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 629 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 632 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 633 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 634 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 643 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-native-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 650 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 655 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 664 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 667 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 670 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 675 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 676 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 678 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 679 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-native-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 685 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 689 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 693 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 696 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 697 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 698 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 707 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 711 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 713 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 714 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 715 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 718 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 727 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 739 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 747 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 753 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 754 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-native-0.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 759 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 762 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 763 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 773 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 788 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running task 496 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 498 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: Running task 518 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 685 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 727 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: Running task 730 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_fetch)
NOTE: Running task 733 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_fetch)
NOTE: Running task 735 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_fetch)
NOTE: Running task 737 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: Running task 739 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 777 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 785 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: Running setscene task 801 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running task 798 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_fetch: Started
NOTE: Running setscene task 805 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe expat-2.8.4-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 806 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_unpack)
NOTE: Running task 800 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: Running task 801 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_unpack)
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 803 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 804 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 805 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: Running task 806 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe python3-build-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 808 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe expat-2.8.4-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe openssl-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 811 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 815 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe python3-build-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 816 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: Running task 823 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 824 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running setscene task 808 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 810 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 826 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: Running task 825 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: Running task 827 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 833 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: Running task 834 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 837 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 845 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 849 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: Running task 936 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_patch)
NOTE: Running task 948 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_generate_toolchain_file)
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 950 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: Running task 954 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 815 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 817 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 968 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.48-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe expat-2.8.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 972 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_fetch)
NOTE: Running task 976 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libpcre2-10.48-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 979 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 982 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 983 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 989 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: Running task 993 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 994 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 995 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 999 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1000 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: Running task 1013 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: Running task 1020 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Started
NOTE: Running task 1024 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1078 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1079 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1083 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1084 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1086 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1087 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1094 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1095 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1096 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1098 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1099 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure)
NOTE: Running task 1100 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1101 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe openssl-4.0.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1102 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: Running task 1103 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1104 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe openssl-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 1105 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_patch)
NOTE: Running task 1106 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1109 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1116 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1117 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe expat-2.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1118 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure_ptest_base)
NOTE: Running task 1119 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: Running task 1120 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: Running task 1121 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1122 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libcap-ng-0.9.5-r0: task do_fetch: Started
NOTE: Running task 1123 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe expat-2.8.4-r0: task do_configure: Started
NOTE: recipe openssl-4.0.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1125 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_configure)
NOTE: Running task 1126 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe libffi-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1128 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe libcap-ng-0.9.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1129 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_configure_ptest_base)
NOTE: Running task 1130 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: Running task 1132 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_configure)
NOTE: Running task 1134 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_fetch)
NOTE: Running task 1138 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 1139 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: Running task 1140 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libffi-3.8.0-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.3-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: Running task 1150 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe util-linux-2.42.3-r0: task do_fetch: Succeeded
NOTE: Running task 1151 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1152 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_patch: Succeeded
NOTE: Running task 1155 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1157 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: Running task 1158 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1159 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1161 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1162 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1164 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1165 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_configure: Started
NOTE: Running task 1167 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1168 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1169 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: Running task 1170 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: Running task 1171 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe xz-5.8.3-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1173 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1174 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install)
NOTE: recipe expat-2.8.4-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Started
NOTE: recipe expat-2.8.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1175 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_compile: Started
NOTE: recipe zlib-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1179 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_configure)
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_configure: Succeeded
NOTE: Running task 1181 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1183 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1184 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1185 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1186 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_install)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1187 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe expat-2.8.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: recipe expat-2.8.4-r0: task do_install: Succeeded
NOTE: Running task 1188 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.5-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1189 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_patch: Started
NOTE: Running task 1190 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_compile_ptest_base)
NOTE: recipe libcap-ng-0.9.5-r0: task do_patch: Succeeded
NOTE: Running task 1191 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1192 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install)
NOTE: recipe util-linux-2.42.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1193 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.42.3-r0: task do_unpack: Succeeded
NOTE: Running task 1194 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1195 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe util-linux-2.42.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1196 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1201 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.3-r0: task do_patch: Succeeded
NOTE: Running task 1208 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1209 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: Running task 1212 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1213 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_fetch)
NOTE: recipe curl-8.22.0-r0: task do_fetch: Started
NOTE: recipe curl-8.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1226 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1227 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1228 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1231 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: Running task 1232 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe openssl-4.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-4.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: Running task 1233 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: Running task 1234 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe openssl-4.0.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1235 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1236 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: Running task 1237 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_compile)
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: Running task 1238 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.8.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1239 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: Running task 1240 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1241 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1243 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1244 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_patch)
NOTE: recipe curl-8.22.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1245 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure)
NOTE: recipe curl-8.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.48-r0: task do_configure: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: Running task 1249 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1250 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1251 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: recipe libffi-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Started
NOTE: recipe libffi-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1256 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1257 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: Running task 1273 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1276 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: Running task 1278 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1282 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: Running task 1284 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1285 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: Running task 1287 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1289 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1294 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 1299 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1300 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: Running task 1301 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1303 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1304 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1305 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1306 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe libcap-ng-0.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1307 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1308 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: recipe xz-5.8.3-r0: task do_configure: Succeeded
NOTE: Running task 1309 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_configure_ptest_base)
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1310 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_unpack)
NOTE: recipe xz-5.8.3-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_unpack: Succeeded
NOTE: Running task 1312 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: Running task 1313 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1315 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe libgcrypt-1.12.3-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1316 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1320 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1321 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 1324 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_fetch)
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Succeeded
NOTE: Running task 1328 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe libassuan-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1329 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1338 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1342 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1343 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe xz-5.8.3-r0: task do_compile: Succeeded
NOTE: Running task 1345 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Succeeded
NOTE: Running task 1346 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 77c7f3af07da7b7ed609ece010afc1540bc7f37683c611ba9674491c8daa683c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 825 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1350 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1356 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1359 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1366 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1367 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1368 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe xz-5.8.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1369 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install)
NOTE: recipe xz-5.8.3-r0: task do_install: Started
NOTE: recipe libpcre2-10.48-r0: task do_configure: Succeeded
NOTE: Running task 1370 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Started
NOTE: Running task 1371 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1372 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1373 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_compile: Started
NOTE: Running task 1374 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1375 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1376 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1377 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1378 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe libcap-ng-0.9.5-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: Running task 1379 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_compile)
NOTE: recipe libcap-ng-0.9.5-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1381 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to 7d12208688aad21979f8476a3e160afe4b8b5e8029428f3bb009f712f99c09a6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx became valid
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libgcrypt-1.12.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 805 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running task 1382 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: Running task 1383 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1384 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.3-r0: task do_configure: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1385 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1387 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure)
NOTE: Running task 1388 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1389 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1393 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1394 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1395 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 1396 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1397 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe xz-5.8.3-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1398 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_install_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: Running task 1399 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_install)
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1400 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile_ptest_base)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_configure: Succeeded
NOTE: Running task 1401 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_compile)
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1405 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.5-r0: task do_install: Succeeded
NOTE: Running task 1414 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe xz-5.8.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: Running task 1417 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 1418 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_install)
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1419 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_install: Started
NOTE: Running task 1422 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Started
NOTE: recipe elfutils-0.196-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1427 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1429 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1430 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_install: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 1434 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1435 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1439 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1442 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1447 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1448 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe elfutils-0.196-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1449 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile_ptest_base)
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1453 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_fetch)
NOTE: Running task 1454 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install)
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Running task 1455 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: recipe gpgme-2.1.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.48-r0: task do_install: Started
NOTE: recipe libffi-3.8.0-r0: task do_package: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: Running task 1456 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package unihash changed to 31395561cfc072612e3cda135799da1ee23451bb4151feb0969480a0c66f8c9a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_package: Started
NOTE: Running setscene task 819 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_unpack: Succeeded
NOTE: Running task 1457 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_patch)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1463 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: recipe libpcre2-10.48-r0: task do_install: Succeeded
NOTE: Running task 1464 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_patch: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1465 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_unpack)
NOTE: recipe gpgme-2.1.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1479 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_package)
NOTE: recipe elfutils-0.196-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.3-r0: task do_package: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-2.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_patch: Started
NOTE: Running task 1484 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: recipe gpgme-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 2d0b87e26e092df9c14e45e8537513027fb40de69a26ce2b0fa555e813a3a2d7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_package unihash changed to 9c7084afe4aa7b69b885684b58d04438590179ed5854d3d3339485980a83fb23
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_spdx became valid
NOTE: Running setscene task 804 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running task 1491 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure_ptest_base)
NOTE: recipe libassuan-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1492 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1493 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libassuan-3.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Started
NOTE: Running task 1494 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1496 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1498 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1501 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.8.4-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1505 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1507 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1510 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe libassuan-3.0.2-r0: task do_compile: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: Running task 1512 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_compile_ptest_base)
NOTE: Running task 1514 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package unihash changed to a5cf7f7dac0ff0b57d329bdb68a411e4a09d91c6c3fb1d5a1a3092f812c7e59d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx became valid
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe libassuan-3.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 819 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx_setscene)
NOTE: Running task 1515 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running noexec task 1517 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running task 1518 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libunistring-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_compile)
NOTE: recipe expat-2.8.4-r0: task do_package: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_package unihash changed to bcdc6fa915147fbb412b893f4a082d81c2c08dc5690218ac37f8816a331ef826
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_spdx became valid
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Started
NOTE: Running setscene task 817 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_install: Succeeded
NOTE: Running noexec task 1520 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1521 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to c311023956875444a9e0fff36240e4b5bf7734a80e7d8b2558f1adc84c4bbd7d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx became valid
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.3-r0: task do_configure: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 818 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: Running task 1522 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: Running task 1523 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_configure_ptest_base)
NOTE: Running task 1524 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_recipe_qa)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_configure_ptest_base: Started
NOTE: recipe librepo-1.21.1-r0: task do_recipe_qa: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running task 1525 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_compile)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1527 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_compile: Started
NOTE: recipe librepo-1.21.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1528 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_fetch)
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_fetch: Started
NOTE: Running task 1535 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe libassuan-3.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_package: Succeeded
NOTE: Running task 1536 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe librepo-1.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1537 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_package unihash changed to c545e4219b43744c29c4b7316b6da6a56365fe7b80a49e8871b8027759b19a89
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata became valid
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: Running setscene task 811 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: Running task 1538 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running task 1540 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1542 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1544 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: Running task 1552 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe librepo-1.21.1-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: Running task 1555 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1556 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1558 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_populate_sysroot)
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_patch)
NOTE: recipe librepo-1.21.1-r0: task do_patch: Started
NOTE: recipe librepo-1.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1560 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package)
NOTE: recipe attr-2.6.0-r0: task do_package: Started
NOTE: recipe gpgme-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1562 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe gpgme-2.1.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1567 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install)
NOTE: recipe libxml2-2.15.4-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_install: Succeeded
NOTE: Running task 1570 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_package)
NOTE: Running task 1571 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.48-r0: task do_package: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package unihash changed to 9a685e9be086d7ac0f7788a73d81e36b29879b5f0a9c8cde25227d33b06ac4e0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata became valid
NOTE: Running setscene task 824 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: Running task 1572 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1577 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package unihash changed to 1cb3f98045ec7c30fefab10875a5ca3032e18a155ed23abf2f5eafd6be7a53da
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx became valid
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: Running setscene task 816 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running task 1580 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_install)
NOTE: Running task 1581 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_install: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1584 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_package)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1595 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1597 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure)
NOTE: Running task 1599 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure)
NOTE: recipe sed-4.10-r0: task do_configure: Started
NOTE: recipe coreutils-9.11-r0: task do_configure: Started
NOTE: recipe libpcre2-10.48-r0: task do_package: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_package unihash changed to 8459012402be669df1b97f0c61475f0a3cca49f2a229d4e1b0045e24274d5372
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.9.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_package unihash changed to b1d9ca4f111b9c452b4fe85f50eb757861a07d3fc08b2d742648902d8bc6b24c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata became valid
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 816 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 818 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx_setscene)
NOTE: Running task 1600 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile_ptest_base)
NOTE: Running task 1601 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libcap-ng/0.9.5/temp/log.do_packagedata_setscene.2559798
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 1602 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb:do_packagedata)
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Started
NOTE: Running task 1603 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_package)
NOTE: recipe libcap-ng-0.9.5-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_package: Started
NOTE: Running task 1608 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1609 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1620 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 1621 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 25d8584877ca522df9097949a938f32d19f01270d57ef8b499c96a09c06655cf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.12.3-r0: task do_compile: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.4-r0: task do_package: Started
NOTE: recipe openssl-4.0.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1622 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_compile_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_install: Started
NOTE: Running task 1623 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_compile_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-4.0.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.12.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1624 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe openssl-4.0.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1626 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_install)
NOTE: Running task 1628 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1629 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1636 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx)
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe librepo-1.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_install: Started
NOTE: recipe openssl-4.0.2-r0: task do_install: Started
NOTE: recipe libpam-1.7.2-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package unihash changed to 3e910aa8a109545de5d068216088a1e81644c266c7cde9bfddf610ad508cf2b1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata became valid
NOTE: Running setscene task 813 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe librepo-1.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1640 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: Running task 1641 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_install: Succeeded
NOTE: Running task 1642 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install_ptest_base)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_install: Succeeded
NOTE: Running task 1645 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_install_ptest_base)
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1646 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgcrypt-1.12.3-r0: task do_install_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1648 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1651 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_patch)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.2-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_generate_toolchain_file)
NOTE: recipe shadow-4.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: Running task 1671 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe librepo-1.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe librepo-1.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1675 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: Running task 1678 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package)
NOTE: recipe libassuan-3.0.2-r0: task do_package: Succeeded
NOTE: Running task 1679 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata)
NOTE: recipe acl-2.4.0-r0: task do_package: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1696 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1697 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1698 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1699 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe shadow-4.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1700 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1701 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gpgme-2.1.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1702 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1704 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1706 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe shadow-4.20.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gpgme-2.1.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_package: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1708 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe openssl-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 1709 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1710 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe openssl-4.0.2-r0: task do_install_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: Running task 1711 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe acl-2.4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package unihash changed to 435c1f614988c90fc15c940466ff6eb3fe1c1fa35642995c89cbe1e511d72f9f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata became valid
NOTE: recipe gpgme-2.1.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1712 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-2.1.2-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1716 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: Running task 1723 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_recipe_spdx)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx)
NOTE: recipe libcap-2.78-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: Running task 1738 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package unihash changed to 7b81a2c0d6aeccd9fc6090f1d691fa6ed2db4aef92e312ed6e7d39ea46b0d8ff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata became valid
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running task 1745 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_create_recipe_spdx)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1753 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package)
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: recipe gpgme-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1756 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package)
NOTE: Running task 1757 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_package)
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1758 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_populate_sysroot)
NOTE: recipe nettle-4.0-r0: task do_package: Started
NOTE: recipe gpgme-2.1.2-r0: task do_package: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package)
NOTE: recipe gpgme-2.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package unihash changed to 4448fd7105c5dd46811de711dcbdf6d136850ef35574abf6af502f1b4e87dd3a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gpgme-2.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1760 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package)
NOTE: Running task 1769 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_package: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_package: Started
NOTE: recipe gpgme-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 1770 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_packagedata)
NOTE: recipe gpgme-2.1.2-r0: task do_packagedata: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe gpgme-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1777 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: Running noexec task 1780 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_fetch)
NOTE: Running task 1781 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_package: Started
NOTE: recipe lzlib-1.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package unihash changed to bef302fa92906fa00be9d7d444284fd816d1bad2c8f8668e0c54fa409b59f77c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1783 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1784 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: Running task 1785 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package unihash changed to 0ad84717095171de4db19a5b4cfda8b6f2d65fa2a498eeef9c0355d35f629b3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1787 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.12.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_package unihash changed to cd7c6ca1782545ddb9d74a88be12049ac77f8eefbdd683e343a0e83ad0b94eda
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.12.3-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to d2b7906692de8573928d9cce8f2fbeb505d093e3ef804c5c16e5a93db13792bc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1789 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package unihash changed to 0fc08705b58f5309b017e64454a151955ef96ee4aa8503c6c2e2b030f589a01a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata became valid
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1791 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_package: Succeeded
NOTE: Running task 1798 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package unihash changed to 25c261c8f6dab965f28ab42f6e26394a8162acc2b50526d08b9b9026b9cac3a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata became valid
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: Running task 1800 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1805 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: Running task 1810 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1813 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to 6844f486a67e6e9db2e55ca62441140c0be46063a00076667847d8de6de519d2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1814 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1815 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_configure)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: Running task 1817 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 17d20b66bc4b3677e29411c8f6514f450dc782c967828a77dc44e9776e98176f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1820 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 190c3de87954fc55ad1791077d3f26ce0ae1167c36ec3519367e4c9e47e80597
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1826 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_configure: Succeeded
NOTE: Running task 1827 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1835 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_create_spdx)
NOTE: recipe shadow-4.20.2-r0: task do_compile: Started
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1836 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_package: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1838 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.1.2.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_package unihash changed to b175163bbcc86383db0401ecbce780e92af2abaa3e2a474bec67e8bb5f5ab12c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe gpgme-2.1.2-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Running task 1851 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_create_recipe_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe librepo-1.21.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gpgme-2.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_compile: Succeeded
NOTE: Running task 1854 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_install)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_install: Succeeded
NOTE: Running task 1856 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to 0a6cd6f15ea9b2a4a4522a6b002059e71a96985ba720363305500bc832e5a5b8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1857 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 2ee109ec6aa479bfedd362ce60a2d43558943274ed2428eedb2291c08bfb467c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_install)
NOTE: recipe libxml2-2.15.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package unihash changed to 5abc21ce3f63da67b58f1728be88d76768fc18cb0ef6bb76c67543650738e86e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata became valid
NOTE: Running setscene task 823 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_install: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_package unihash changed to ca0be9630b9bcd6fb9bb9bc29fd725f288210e9939b930dc79a1f40ae034c683
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx became valid
NOTE: recipe ncurses-6.6-r0: task do_install: Succeeded
NOTE: Running setscene task 815 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: Running task 1864 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1865 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1866 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package)
NOTE: Running task 1867 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1868 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1871 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe util-linux-2.42.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_configure)
NOTE: recipe util-linux-2.42.3-r0: task do_configure: Started
NOTE: recipe shadow-4.20.2-r0: task do_install: Succeeded
NOTE: Running task 1874 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1875 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_package)
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.20.2-r0: task do_package: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1876 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_configure)
NOTE: recipe sed-4.10-r0: task do_configure: Succeeded
NOTE: Running task 1877 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure_ptest_base)
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Started
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_compile)
NOTE: Running task 1879 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile)
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Started
NOTE: recipe sed-4.10-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_install)
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_install: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_compile)
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Started
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_install)
NOTE: Running task 1883 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 1884 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_package: Started
NOTE: recipe sed-4.10-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_compile_ptest_base)
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1888 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install)
NOTE: recipe sed-4.10-r0: task do_install: Started
NOTE: recipe shadow-4.20.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_package unihash changed to 675a19436183553820e40b4465c310dbc2ed20491cfd379eff35f920b8a2b3fa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Running task 1890 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to daa8264eba113706f540497879df18498314fa762e5204aebb0bcfc98313525a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1892 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Started
NOTE: recipe libmpc-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package unihash changed to dfffb72384f87e99e226aaec79b8a25484abd30f7905e84edaaf46d6e4e7e68d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_install: Succeeded
NOTE: Running task 1894 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_install_ptest_base)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1896 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package)
NOTE: recipe sed-4.10-r0: task do_package: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package unihash changed to aacee670d4556545d5cf488008675f737a8f8bf6fc037cc99d84b35a03e19561
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libedit-20260512-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_compile)
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1899 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1901 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1902 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: Running task 1903 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_configure)
NOTE: recipe libarchive-3.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure)
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_configure)
NOTE: recipe file-5.48-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1908 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_install)
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_install: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_package: Succeeded
NOTE: Running task 1910 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package unihash changed to 09dd2a9008b1ff03aa32c99c8a9500d07734b3d5b4f30bed4c8d953977bbab06
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata became valid
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 818 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1911 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1913 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package)
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Started
NOTE: recipe python3-3.14.7-r0: task do_configure: Started
NOTE: recipe sed-4.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_package unihash changed to e87e51e4ab6fa1eb140a96725af57a2d396f327f900f3665635b0f6c67d57ba7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1916 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_compile)
NOTE: recipe gcc-16.2.0-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 61b8a0bcf1e7bcf17f2c53c64276252e0efb722d13cd766537adc8f3c68c415c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 814 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package unihash changed to ced01871fbefda6b0f7987a7fe757e3ad99d3f77d08729ac12ca4c840b1816c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx became valid
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1921 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1922 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe file-5.48-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_compile)
NOTE: recipe file-5.48-r0: task do_compile: Started
NOTE: recipe openssl-4.0.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_package unihash changed to d225a9151c416d984adf714600ed2ae05878fffea7484c42b1ea68bf13e7ed69
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata became valid
NOTE: recipe coreutils-9.11-r0: task do_configure: Succeeded
NOTE: Running setscene task 814 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: Running task 1924 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure_ptest_base)
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1925 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile)
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_compile: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe file-5.48-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1930 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe file-5.48-r0: task do_install: Succeeded
NOTE: Running task 1932 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package)
NOTE: recipe file-5.48-r0: task do_package: Started
NOTE: recipe libunistring-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_install)
NOTE: recipe libunistring-1.4.2-r0: task do_install: Started
NOTE: recipe util-linux-2.42.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1934 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.42.3-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.42.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1935 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_compile)
NOTE: recipe util-linux-2.42.3-r0: task do_compile: Started
NOTE: recipe libunistring-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 1937 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1938 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package)
NOTE: recipe libunistring-1.4.2-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: Running task 1940 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe file-5.48-r0: task do_package: Succeeded
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package unihash changed to 3c33ed355d06b85ac1845de551b0f7ba4bbba10318f435e59bb01e0a35a56461
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1942 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe coreutils-9.11-r0: task do_compile: Succeeded
NOTE: Running task 1943 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1944 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install)
NOTE: recipe coreutils-9.11-r0: task do_install: Started
NOTE: recipe libunistring-1.4.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_package unihash changed to becc7489d8ce313420fd33b51a42040f1d6c8258af1575f288b014e0df027ea9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx became valid
NOTE: Running setscene task 814 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.11-r0: task do_install: Succeeded
NOTE: Running task 1947 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1948 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1949 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile)
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.3-r0: task do_compile: Succeeded
NOTE: Running task 1950 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.42.3-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to 13e57528dd05fb6444602f608a3968328481070fed1f2cff555034970edc2542
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1951 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_install)
NOTE: recipe util-linux-2.42.3-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.9-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_compile_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1954 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package)
NOTE: recipe coreutils-9.11-r0: task do_package: Started
NOTE: recipe util-linux-2.42.3-r0: task do_install: Succeeded
NOTE: Running task 1955 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.42.3-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.42.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1957 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_package)
NOTE: recipe util-linux-2.42.3-r0: task do_package: Started
NOTE: recipe libarchive-3.8.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1958 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install)
NOTE: recipe python3-3.14.7-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1959 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1960 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile)
NOTE: recipe python3-3.14.7-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.9-r0: task do_install: Succeeded
NOTE: Running task 1961 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.8.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1963 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package)
NOTE: recipe libarchive-3.8.9-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1964 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1965 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: Running task 1967 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1968 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1969 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1970 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_configure)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1971 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_package unihash changed to a57171d8f77d425c104c5d05c19d44243283bb474d42187c6e23c02422d40624
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to b1f520e7eaad80cc180a9dd34a6a17cc6a40e8e88afb2057d01b3ce9cd7b60a8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Started
NOTE: Running setscene task 815 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package unihash changed to f0d4efb960152a5c9f98a2db2a3b5384a7e3f4d0266d53cc17c19dc927bce701
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Succeeded
NOTE: Running task 1976 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_install)
NOTE: recipe libpsl-0.23.3-r0: task do_install: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_install: Succeeded
NOTE: Running task 1979 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1980 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package)
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Started
NOTE: recipe curl-8.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1981 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure)
NOTE: recipe curl-8.22.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package unihash changed to fbd7467dbf585602f4f257cde94f73d3422572d64dd864f0d9880b303b0bccc0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx became valid
NOTE: Running setscene task 817 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.7-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_compile_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1985 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install)
NOTE: recipe util-linux-2.42.3-r0: task do_package: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_package unihash changed to f8e57a1ec6be4570633418f5716caeb23d336e12485d946983e3312fc45c347a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_spdx became valid
NOTE: Running setscene task 821 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.22.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1988 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1989 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile)
NOTE: recipe curl-8.22.0-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_compile: Succeeded
NOTE: Running task 1990 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1991 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install)
NOTE: recipe curl-8.22.0-r0: task do_install: Started
NOTE: recipe python3-3.14.7-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_install_ptest_base)
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1994 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1995 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.7-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1996 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1997 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1998 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile)
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Started
NOTE: recipe curl-8.22.0-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2001 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package)
NOTE: recipe curl-8.22.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2003 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe curl-8.22.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_package unihash changed to 1f159b34fcfc366c081393632a7525ec3b90e344e1ab34bc82d5d18ebedb5393
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_create_spdx became valid
NOTE: Running setscene task 817 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2005 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2008 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Started
NOTE: recipe python3-3.14.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package unihash changed to 8aa50fe43b8d49e0e4aa207fb3b4571f43c1091b1b237757f1c2e301c5d42ffd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx became valid
NOTE: Running setscene task 821 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2010 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to 3fc6aff2c877487ee7c84bad2dce97ee2ac83c7e0a8d8a6595dc23b6c7f6b238
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata became valid
NOTE: Running setscene task 823 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2013 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2016 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2017 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.13-r0: task do_install: Succeeded
NOTE: Running task 2018 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2020 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2021 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2022 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2024 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 2025 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2026 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_package)
NOTE: Running task 2028 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Started
NOTE: recipe librepo-1.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2029 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_configure)
NOTE: recipe librepo-1.21.1-r0: task do_configure: Started
NOTE: recipe librepo-1.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2030 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_compile)
NOTE: recipe librepo-1.21.1-r0: task do_compile: Started
NOTE: recipe librepo-1.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_install)
NOTE: recipe librepo-1.21.1-r0: task do_install: Started
NOTE: recipe librepo-1.21.1-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_populate_sysroot)
NOTE: recipe librepo-1.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package unihash changed to a8c1f69e6aca512e1374c5298e21f20aa29db070b7290757087ee0fe4e417846
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata became valid
NOTE: Running setscene task 817 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_package unihash changed to b02e22a56ae1b31fe7cc4063c38a5afb62fe3f4bf4675a18118ed0fff44d0417
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2034 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2036 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_package)
NOTE: Running task 2037 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx)
NOTE: recipe librepo-1.21.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.21.1-r0: task do_package: Succeeded
NOTE: Running task 2038 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_packagedata)
NOTE: recipe librepo-1.21.1-r0: task do_packagedata: Started
NOTE: recipe librepo-1.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2039 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_package_write_ipk)
NOTE: Running task 2040 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_create_spdx)
NOTE: Running task 2041 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_package_write_deb)
NOTE: Running task 2042 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_package_write_rpm)
NOTE: Running task 2043 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_package_qa)
NOTE: recipe librepo-1.21.1-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.21.1-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.21.1-r0: task do_package_write_deb: Started
NOTE: recipe librepo-1.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_package_qa: Started
NOTE: Running task 2044 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Started
NOTE: recipe librepo-1.21.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2045 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_create_package_spdx)
NOTE: recipe librepo-1.21.1-r0: task do_create_package_spdx: Started
NOTE: recipe librepo-1.21.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe librepo-1.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2048 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package)
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Started
NOTE: recipe librepo-1.21.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2049 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure)
NOTE: recipe elfutils-0.196-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package unihash changed to b95800d11f75a15527d489c29630a211004b96293a94a6e802789f9d97767e96
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata became valid
NOTE: Running setscene task 819 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.196-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2052 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile)
NOTE: recipe elfutils-0.196-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_compile: Succeeded
NOTE: Running task 2053 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2054 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install)
NOTE: recipe elfutils-0.196-r0: task do_install: Started
NOTE: recipe elfutils-0.196-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.196-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2057 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2058 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2059 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_compile: Started
NOTE: recipe elfutils-0.196-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_package unihash changed to 36bf7e0e039b750b0d006a45660cc844f4e56848bc41ec14618d8cde21e448a8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata became valid
NOTE: Running setscene task 821 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2062 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_install)
NOTE: recipe gcc-16.2.0-r0: task do_install: Started
NOTE: recipe gcc-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 2063 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package)
NOTE: recipe gcc-16.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2064 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_install: Succeeded
NOTE: Running task 2065 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package unihash changed to 1ab80b7824715de8cd3074f5f4b4e002b5e7188a3dfae7628444656528b42d25
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package unihash changed to 1c98fc5ed5e6eb38e1e8d18480551d53d924ff809a4476ef12795bead2f1bae2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata became valid
NOTE: Running setscene task 826 of 826 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2068 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk)
NOTE: Running task 2069 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb)
NOTE: Running task 2070 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm)
NOTE: Running task 2071 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa)
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk unihash changed to 2e35e50b6d9834d81e00d32d40a0dbba2a6baabb9e44c37392563db87f1c3ca0
NOTE: recipe python3-3.14.7-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa unihash changed to d7d66b7745f42aad44cda0709af988ac1ea680f3481f6d2f5fe8537c25c9eebc
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm unihash changed to da432659ca6f4ee8a049f52d8c5f6691d8f8b82deb82398ebf7cc3863099409b
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb unihash changed to 007f5433b560df24ee58fd192e9440c05be220ec94d929ed0bae866d41cc7c86
NOTE: Running noexec task 2072 of 2072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2072 tasks of which 1447 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-src went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dbg went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-staticdev went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-dev went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-doc went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-locale went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bin went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng-bash-completion went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-ng went backwards which would break package feeds (from 0:0.9.6-r0 to 0:0.9.5-r0) [version-going-backwards]
ERROR: libcap-ng-0.9.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1839656782466894144==--

