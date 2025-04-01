Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79464C369BE
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18069.1743511394127808419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=kFEKFtkG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j50S8ZXa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010195f160948f-4ef265d2-d818-45b1-895c-66e58779822b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dXfMi4nFyiY6Eg1ZeVDygUz6lDJ6hM/4ajFjvqO0bxk=;
	b=kFEKFtkGKKdH2A0tyzfzaI5TRngsK4/oLGHzDHjdy1+YhelXqYG9Wf2Too8au1u1
	biczyR08S8Tjrg/AQemiXINDn8NMun05rDtowZgwGExZ5ak//KtliSPymY1XdHO0ySd
	vlJXx90jxZ4OgDQwD4dDNUkTHBJWYxnvSKy+5Hkc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dXfMi4nFyiY6Eg1ZeVDygUz6lDJ6hM/4ajFjvqO0bxk=;
	b=j50S8ZXaGjeJ/HTnoEONPSfFSdIlp5dPKtd0pXhKfsgi+RElvlgM5jyYiYfU5uw0
	fshH1fS6DlBq5MmXCgAhu6qBJftIp00/jGeZFsT6IB6Y0jfY7x+inKJMvzIOrzy3Y2M
	eJoRY/594wotgtks6hX65++jt+iKslAun5qtMO5g=
Content-Type: multipart/mixed; boundary="===============6790689822389769086=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] createrepo-c: upgrading to 1.2.1 SUCCEEDED
Message-ID: <01010195f160948f-4ef265d2-d818-45b1-895c-66e58779822b-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214048

--===============6790689822389769086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.2.0-1.2.1.patch
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
From e57513dff4e7c4cc40c174eb480a354204265862 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 07:46:23 +0000
Subject: [PATCH] createrepo-c: upgrade 1.2.0 -> 1.2.1

---
 .../0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch  | 2 +-
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch             | 2 +-
 .../{createrepo-c_1.2.0.bb => createrepo-c_1.2.1.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.0.bb => createrepo-c_1.2.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 1d2e81f281..ca3f0782a8 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 5d974eddfd59291fbbf9bf9b352431d8565011d2 Mon Sep 17 00:00:00 2001
+From 20aec3f83a7ab6ebb89f40ee8c5df1af65eba32b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index e7f3d32e08..4f2f780a64 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From d1a474e4002b978a54c918d46423c35bfbadad8b Mon Sep 17 00:00:00 2001
+From aa508662cfa48f706bf68ace55ed311a9e820d3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
index 60523d5318..73f04f579f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "7085e047dc9f58a1de6ee6f3faf733826e60b963"
+SRCREV = "8c6e6f88df86d1e34ca26d3835d77a2816326414"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============6790689822389769086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.2.0", added "/usr/lib/libcreaterepo_c.so.1.2.1"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.0 to libcreaterepo_c.so.1.2.1
  /usr/lib/libcreaterepo_c.so.1.2.0 moved to /usr/lib/libcreaterepo_c.so.1.2.1

--===============6790689822389769086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.2.0", added "/usr/lib/.debug/libcreaterepo_c.so.1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.2.0" to "1.2.1"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.2.0", added "/usr/lib/libcreaterepo_c.so.1.2.1"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.2.0" to "1.2.1"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.0 to libcreaterepo_c.so.1.2.1
  /usr/lib/libcreaterepo_c.so.1.2.0 moved to /usr/lib/libcreaterepo_c.so.1.2.1

--===============6790689822389769086==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.2.0-1.2.1.patch"

RnJvbSBlNTc1MTNkZmY0ZTdjNGNjNDBjMTc0ZWI0ODBhMzU0MjA0MjY1ODYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwNzo0NjoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
ZWF0ZXJlcG8tYzogdXBncmFkZSAxLjIuMCAtPiAxLjIuMQoKLS0tCiAuLi4vMDAwMS1Eby1ub3Qt
c2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCAgfCAyICstCiAu
Li4vY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggICAgICAg
ICAgICAgfCAyICstCiAuLi4ve2NyZWF0ZXJlcG8tY18xLjIuMC5iYiA9PiBjcmVhdGVyZXBvLWNf
MS4yLjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRl
cmVwby1jL3tjcmVhdGVyZXBvLWNfMS4yLjAuYmIgPT4gY3JlYXRlcmVwby1jXzEuMi4xLmJifSAo
OTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3Jl
YXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1w
eXRob24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9u
LnBhdGNoCmluZGV4IDFkMmU4MWYyODEuLmNhM2YwNzgyYTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1Q
WVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1Eby1ub3Qtc2V0LVBZ
VEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNWQ5NzRlZGRmZDU5MjkxZmJiZjliZjliMzUyNDMxZDg1NjUwMTFkMiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjBhZWMzZjgzYTdhYjZlYmI4OWY0MGVlOGM1ZGYxYWY2NWVi
YTMyYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODozMTowMiAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBy
dW5uaW5nIHB5dGhvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJl
cG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVk
ZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKaW5kZXggZTdmM2QzMmUwOC4uNGYyZjc4MGE2NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMv
MDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmlu
Zy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMWE0NzRlNDAwMmI5NzhhNTRjOTE4ZDQ2
NDIzYzM1YmZiYWRhZDhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYTUwODY2MmNm
YTQ4ZjcwNmJmNjhhY2U1NWVkMzExYTllODIwZDNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTMgSmFuIDIw
MjMgMTM6MjE6NTEgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZSBycG0vcnBtc3RyaW5n
LmgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jXzEuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVh
dGVyZXBvLWNfMS4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4yLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi4x
LmJiCmluZGV4IDYwNTIzZDUzMTguLjczZjA0ZjU3OWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi4xLmJiCkBAIC05
LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFn
ZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVW
ID0gIjcwODVlMDQ3ZGM5ZjU4YTFkZTZlZTZmM2ZhZjczMzgyNmU2MGI5NjMiCitTUkNSRVYgPSAi
OGM2ZTZmODhkZjg2ZDFlMzRjYTI2ZDM4MzVkNzdhMjgxNjMyNjQxNCIKIAogUyA9ICIke1dPUktE
SVJ9L2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============6790689822389769086==--

