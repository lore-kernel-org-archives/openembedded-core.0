Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE547C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1788.1746113615824326793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ju87q3K2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cvSYe4VJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b557b-a7f5d7f8-6785-4e93-86c1-89db9b6b4f87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aTEGOeG33vld++KlfRTto7nM9LSEC5GOTSCwxQxBsgs=;
	b=ju87q3K22A1zI6NDtNCsdtcW+jmfTgNrZv9+n794Ll26qQbAQJY1bjV3sSlp0ACd
	Glb6uT+18dnkUbuvXT7BaenxA1uDaEYaSx0GjmSTzVndoEDGK8RkrTVVGYZChQHrVOc
	p1JRrh7thl4hCAsULEIA7koeTNAomAtwYXf0xYzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aTEGOeG33vld++KlfRTto7nM9LSEC5GOTSCwxQxBsgs=;
	b=cvSYe4VJuHk/meWhr7BDREIQlCpZn1b4rFyg0VwyhvML4RNY4RET/QyYCOQS42ec
	mD3uHA8O4WzTES2ruo3xDCoT8wOASwvOVvPEBcKJ7XHJWowdVUJvy2RZPn9CPqle4af
	+knkViRQrafgu7mcdZQVr1RHckds1Aov6PHWvfng=
Content-Type: multipart/mixed; boundary="===============6457770056050296170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libcgroup: upgrading to 3.2.0 SUCCEEDED
Message-ID: <010101968c7b557b-a7f5d7f8-6785-4e93-86c1-89db9b6b4f87-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215801

--===============6457770056050296170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcgroup* to *3.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcgroup-upgrade-3.1.0-3.2.0.patch
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
From 6db4c8a76c0bbc8ca04fd141dfc0a236c167f0bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 07:52:48 +0000
Subject: [PATCH] libcgroup: upgrade 3.1.0 -> 3.2.0

---
 ...akefile-install-systemd.h-by-default.patch | 37 -------------------
 ...{libcgroup_3.1.0.bb => libcgroup_3.2.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
 rename meta/recipes-core/libcgroup/{libcgroup_3.1.0.bb => libcgroup_3.2.0.bb} (84%)

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch b/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
deleted file mode 100644
index 4b743f9b33..0000000000
--- a/meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 592dcdcf243576bd2517d3da9bc18990de08e37e Mon Sep 17 00:00:00 2001
-From: Kamalesh Babulal <kamalesh.babulal@oracle.com>
-Date: Mon, 27 Nov 2023 20:07:33 +0530
-Subject: [PATCH 1/1] include/Makefile: install systemd.h by default
-
-Install systemd.h header file by default, as we have stub and defined
-versions of the systemd functions for both non-systemd and systemd
-enabled configurations.  This will help packagers to ship package
-without systemd support (--enable-systemd=no).
-
-Signed-off-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
-Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
-
-Upstream-Status: Backport [https://github.com/libcgroup/libcgroup/commit/592dcdcf243576bd2517d3da9bc18990de08e37e]
-
-Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
----
- include/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 23cebaac..4cb05529 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -2,8 +2,4 @@
- nobase_include_HEADERS = libcgroup.h libcgroup/error.h libcgroup/init.h \
- 			 libcgroup/groups.h libcgroup/tasks.h \
- 			 libcgroup/iterators.h libcgroup/config.h \
--			 libcgroup/log.h libcgroup/tools.h
--
--if WITH_SYSTEMD
--nobase_include_HEADERS += libcgroup/systemd.h
--endif
-+			 libcgroup/log.h libcgroup/tools.h libcgroup/systemd.h
--- 
-2.39.2
-
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
similarity index 84%
rename from meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
rename to meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
index a1d27c7e7f..28562a5b37 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.1.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.2.0.bb
@@ -12,12 +12,10 @@ inherit autotools pkgconfig github-releases
 DEPENDS = "bison-native flex-native"
 DEPENDS:append:libc-musl = " fts"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-include-Makefile-install-systemd.h-by-default.patch \
-"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
-SRC_URI[sha256sum] = "976ec4b1e03c0498308cfd28f1b256b40858f636abc8d1f9db24f0a7ea9e1258"
+SRC_URI[sha256sum] = "9a0fc2d6c377215c3e0d849f9189ecd91fd075f1da0a24b73f56c8892e86bdfe"
 
 PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
 PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes,--enable-pam=no,libpam"
-- 
2.47.1


--===============6457770056050296170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcgroup-upgrade-3.1.0-3.2.0.patch"

RnJvbSA2ZGI0YzhhNzZjMGJiYzhjYTA0ZmQxNDFkZmMwYTIzNmMxNjdmMGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNzo1Mjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNncm91cDogdXBncmFkZSAzLjEuMCAtPiAzLjIuMAoKLS0tCiAuLi5ha2VmaWxlLWluc3RhbGwt
c3lzdGVtZC5oLWJ5LWRlZmF1bHQucGF0Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi57
bGliY2dyb3VwXzMuMS4wLmJiID0+IGxpYmNncm91cF8zLjIuMC5iYn0gfCAgNiArLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9saWJjZ3JvdXAvbGliY2dyb3VwLzAwMDEtaW5jbHVk
ZS1NYWtlZmlsZS1pbnN0YWxsLXN5c3RlbWQuaC1ieS1kZWZhdWx0LnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvcmUvbGliY2dyb3VwL3tsaWJjZ3JvdXBfMy4xLjAuYmIgPT4gbGliY2dyb3Vw
XzMuMi4wLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYmNncm91
cC9saWJjZ3JvdXAvMDAwMS1pbmNsdWRlLU1ha2VmaWxlLWluc3RhbGwtc3lzdGVtZC5oLWJ5LWRl
ZmF1bHQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9saWJjZ3JvdXAvbGliY2dyb3VwLzAwMDEt
aW5jbHVkZS1NYWtlZmlsZS1pbnN0YWxsLXN5c3RlbWQuaC1ieS1kZWZhdWx0LnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0Yjc0M2Y5YjMzLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2xpYmNncm91cC9saWJjZ3JvdXAvMDAwMS1pbmNsdWRlLU1ha2VmaWxl
LWluc3RhbGwtc3lzdGVtZC5oLWJ5LWRlZmF1bHQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwz
NyArMCwwIEBACi1Gcm9tIDU5MmRjZGNmMjQzNTc2YmQyNTE3ZDNkYTliYzE4OTkwZGUwOGUzN2Ug
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLYW1hbGVzaCBCYWJ1bGFsIDxrYW1hbGVz
aC5iYWJ1bGFsQG9yYWNsZS5jb20+Ci1EYXRlOiBNb24sIDI3IE5vdiAyMDIzIDIwOjA3OjMzICsw
NTMwCi1TdWJqZWN0OiBbUEFUQ0ggMS8xXSBpbmNsdWRlL01ha2VmaWxlOiBpbnN0YWxsIHN5c3Rl
bWQuaCBieSBkZWZhdWx0Ci0KLUluc3RhbGwgc3lzdGVtZC5oIGhlYWRlciBmaWxlIGJ5IGRlZmF1
bHQsIGFzIHdlIGhhdmUgc3R1YiBhbmQgZGVmaW5lZAotdmVyc2lvbnMgb2YgdGhlIHN5c3RlbWQg
ZnVuY3Rpb25zIGZvciBib3RoIG5vbi1zeXN0ZW1kIGFuZCBzeXN0ZW1kCi1lbmFibGVkIGNvbmZp
Z3VyYXRpb25zLiAgVGhpcyB3aWxsIGhlbHAgcGFja2FnZXJzIHRvIHNoaXAgcGFja2FnZQotd2l0
aG91dCBzeXN0ZW1kIHN1cHBvcnQgKC0tZW5hYmxlLXN5c3RlbWQ9bm8pLgotCi1TaWduZWQtb2Zm
LWJ5OiBLYW1hbGVzaCBCYWJ1bGFsIDxrYW1hbGVzaC5iYWJ1bGFsQG9yYWNsZS5jb20+Ci1TaWdu
ZWQtb2ZmLWJ5OiBUb20gSHJvbWF0a2EgPHRvbS5ocm9tYXRrYUBvcmFjbGUuY29tPgotCi1VcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vbGliY2dyb3VwL2xpYmNn
cm91cC9jb21taXQvNTkyZGNkY2YyNDM1NzZiZDI1MTdkM2RhOWJjMTg5OTBkZTA4ZTM3ZV0KLQot
U2lnbmVkLW9mZi1ieTogQWRyaWFhbiBTY2htaWR0IDxhZHJpYWFuLnNjaG1pZHRAc2llbWVucy5j
b20+Ci0tLS0KLSBpbmNsdWRlL01ha2VmaWxlLmFtIHwgNiArLS0tLS0KLSAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9pbmNsdWRl
L01ha2VmaWxlLmFtIGIvaW5jbHVkZS9NYWtlZmlsZS5hbQotaW5kZXggMjNjZWJhYWMuLjRjYjA1
NTI5IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9NYWtlZmlsZS5hbQotKysrIGIvaW5jbHVkZS9NYWtl
ZmlsZS5hbQotQEAgLTIsOCArMiw0IEBACi0gbm9iYXNlX2luY2x1ZGVfSEVBREVSUyA9IGxpYmNn
cm91cC5oIGxpYmNncm91cC9lcnJvci5oIGxpYmNncm91cC9pbml0LmggXAotIAkJCSBsaWJjZ3Jv
dXAvZ3JvdXBzLmggbGliY2dyb3VwL3Rhc2tzLmggXAotIAkJCSBsaWJjZ3JvdXAvaXRlcmF0b3Jz
LmggbGliY2dyb3VwL2NvbmZpZy5oIFwKLS0JCQkgbGliY2dyb3VwL2xvZy5oIGxpYmNncm91cC90
b29scy5oCi0tCi0taWYgV0lUSF9TWVNURU1ECi0tbm9iYXNlX2luY2x1ZGVfSEVBREVSUyArPSBs
aWJjZ3JvdXAvc3lzdGVtZC5oCi0tZW5kaWYKLSsJCQkgbGliY2dyb3VwL2xvZy5oIGxpYmNncm91
cC90b29scy5oIGxpYmNncm91cC9zeXN0ZW1kLmgKLS0tIAotMi4zOS4yCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2xpYmNncm91cC9saWJjZ3JvdXBfMy4xLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJjZ3JvdXAvbGliY2dyb3VwXzMuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2xpYmNncm91cC9saWJjZ3JvdXBfMy4x
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2xpYmNncm91cC9saWJjZ3JvdXBfMy4y
LjAuYmIKaW5kZXggYTFkMjdjN2U3Zi4uMjg1NjJhNWIzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvbGliY2dyb3VwL2xpYmNncm91cF8zLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9saWJjZ3JvdXAvbGliY2dyb3VwXzMuMi4wLmJiCkBAIC0xMiwxMiArMTIsMTAgQEAgaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogREVQRU5EUyA9ICJiaXNv
bi1uYXRpdmUgZmxleC1uYXRpdmUiCiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGZ0cyIK
IAotU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRh
ci5neiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtTWFrZWZpbGUtaW5zdGFsbC1z
eXN0ZW1kLmgtYnktZGVmYXVsdC5wYXRjaCBcCi0iCitTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9saWJjZ3JvdXAvbGliY2dyb3VwL3RhZ3MiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5NzZlYzRiMWUwM2MwNDk4MzA4Y2ZkMjhmMWIyNTZiNDA4NThmNjM2YWJj
OGQxZjlkYjI0ZjBhN2VhOWUxMjU4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhMGZjMmQ2YzM3
NzIxNWMzZTBkODQ5ZjkxODllY2Q5MWZkMDc1ZjFkYTBhMjRiNzNmNTZjODg5MmU4NmJkZmUiCiAK
IFBBQ0tBR0VDT05GSUcgPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAn
cGFtIHN5c3RlbWQnLCBkKX0iCiBQQUNLQUdFQ09ORklHW3BhbV0gPSAiLS1lbmFibGUtcGFtLW1v
ZHVsZS1kaXI9JHtiYXNlX2xpYmRpcn0vc2VjdXJpdHkgLS1lbmFibGUtcGFtPXllcywtLWVuYWJs
ZS1wYW09bm8sbGlicGFtIgotLSAKMi40Ny4xCgo=

--===============6457770056050296170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libcgroup/cgroups-pam-plugin: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/cgroups-pam-plugin: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup: SRC_URI changed from "https://github.com/libcgroup/libcgroup/releases//download/v3.1.0/libcgroup-3.1.0.tar.gz file://0001-include-Makefile-install-systemd.h-by-default.patch" to "https://github.com/libcgroup/libcgroup/releases//download/v3.2.0/libcgroup-3.2.0.tar.gz"
packages/core2-64-poky-linux/libcgroup: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-dbg: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-dbg: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-dbg: FILELIST: removed "/usr/lib/.debug/libcgroup.so.3.1.0", added "/usr/lib/.debug/libcgroup.so.3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-dbg: PKGSIZE changed from 1056280 to 1125184 (+7%)
packages/core2-64-poky-linux/libcgroup/libcgroup-dev: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-dev: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-dev: PKGSIZE changed from 66492 to 67230 (+1%)
packages/core2-64-poky-linux/libcgroup/libcgroup-doc: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-doc: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-doc: PKGSIZE changed from 51739 to 54772 (+6%)
packages/core2-64-poky-linux/libcgroup/libcgroup-locale: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-locale: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-src: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-src: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup-staticdev: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup-staticdev: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup: PV changed from "3.1.0" to "3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup: PKGV changed from 3.1.0 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/libcgroup/libcgroup: FILELIST: removed "/usr/lib/libcgroup.so.3.1.0", added "/usr/lib/libcgroup.so.3.2.0"
packages/core2-64-poky-linux/libcgroup/libcgroup: PKGSIZE changed from 484258 to 492450 (+2%)
Changes to packages/core2-64-poky-linux/libcgroup (sysroot):
  /usr/lib/libcgroup.so.3 changed symlink target from libcgroup.so.3.1.0 to libcgroup.so.3.2.0
  /usr/lib/libcgroup.so changed symlink target from libcgroup.so.3.1.0 to libcgroup.so.3.2.0
  /usr/lib/libcgroup.so.3.1.0 moved to /usr/lib/libcgroup.so.3.2.0

--===============6457770056050296170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libcgroup/libcgroup: FILELIST: removed "/usr/lib/libcgroup.so.3.1.0", added "/usr/lib/libcgroup.so.3.2.0"
Changes to packages/core2-64-poky-linux/libcgroup (sysroot):
  /usr/lib/libcgroup.so.3 changed symlink target from libcgroup.so.3.1.0 to libcgroup.so.3.2.0
  /usr/lib/libcgroup.so changed symlink target from libcgroup.so.3.1.0 to libcgroup.so.3.2.0
  /usr/lib/libcgroup.so.3.1.0 moved to /usr/lib/libcgroup.so.3.2.0

--===============6457770056050296170==--

