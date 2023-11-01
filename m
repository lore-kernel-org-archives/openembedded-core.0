Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26246C05021
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8484.1698848703888072599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KMGBf3+k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HBL0EETt;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b460e7e-25cb6dcd-c07b-4de4-8b71-86e0c561b914-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ycrtVmBu5K6K4cP/348kGIC58fUC4AzJYM4iXdAioF8=;
	b=KMGBf3+kjqltASUE5A7yhOEVz2SpaZC4D1NuAHCkDINyAqXSvVSoMF7mfaYKGitG
	GCCrO0t4KB3MykhcJEK214pXb5bEhCt5uFigpQCWMtq22Nt98z1twS7Wi+fAcxFgB39
	jjZWBvvR1kosMoxb1zrlvzMbYfbgOOWVj3UBPevU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ycrtVmBu5K6K4cP/348kGIC58fUC4AzJYM4iXdAioF8=;
	b=HBL0EETtvMdjSWvoa7GkKbiyr8jQuhG6J45fN3f9Xr5ORX9AAJRddl+xBpvREGRC
	L6RDe6nnsbPnvmQm5Kkq93QGu0bih0jaodnVWf+Mrngqzf3I1OKB95y/Nxj5NPrzNMB
	twgOodM2uA90tWha5Tf1nbE0F7bp8BYNdNdS9UDo=
Content-Type: multipart/mixed; boundary="===============2172033633561638060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.14 SUCCEEDED
Message-ID: <0101018b8b460e7e-25cb6dcd-c07b-4de4-8b71-86e0c561b914-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190024

--===============2172033633561638060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.13-5.14.patch
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
From 565a89075cd9f56cef2d04d4c48da7a9f17fa781 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 14:01:08 +0000
Subject: [PATCH] debianutils: upgrade 5.13 -> 5.14

---
 ...ebianutils_5.13.bb => debianutils_5.14.bb} | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_5.13.bb => debianutils_5.14.bb} (67%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.13.bb b/meta/recipes-support/debianutils/debianutils_5.14.bb
similarity index 67%
rename from meta/recipes-support/debianutils/debianutils_5.13.bb
rename to meta/recipes-support/debianutils/debianutils_5.14.bb
index 915277b42c..a2e3fe4281 100644
--- a/meta/recipes-support/debianutils/debianutils_5.13.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.14.bb
@@ -1,3 +1,29 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- debian/copyright
+# +++ debian/copyright
+# @@ -39,10 +39,10 @@
+#   redistributed under the terms of the GNU GPL, Version 2 or later,
+#   found on Debian systems in the file /usr/share/common-licenses/GPL-2.
+#  
+# -Files: which
+# +Files: which.debianutils
+#  Copyright: public-domain
+#  License: public-domain
+# - which is in the public domain.
+# + which.debianutils is in the public domain.
+#  
+#  Files: savelog
+#  Copyright:
+# 
+#
+
 SUMMARY = "Miscellaneous utilities specific to Debian"
 DESCRIPTION = "Provides a number of small utilities which are used \
 primarily by the installation scripts of Debian packages, although \
@@ -6,12 +32,12 @@ HOMEPAGE = "https://packages.debian.org/sid/debianutils"
 BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
 LICENSE = "GPL-2.0-only & SMAIL_GPL"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9"
 
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "d49a78eb264c1b2ad3d0d6de8e1fb776bda9c943"
+SRCREV = "7e63b32ea4126c70a5da958f0106add267810a94"
 
 inherit autotools update-alternatives
 
-- 
2.39.2


--===============2172033633561638060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 77696 to 78816 (+1%)
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-doc: FILELIST: removed "/usr/share/man/man1/which.1.debianutils", added "/usr/share/man/man1/which.debianutils.1"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: RDEPENDS: removed all items "update-alternatives-opkg"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30108 to 30109 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.13" to "5.14"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.13 [default] to 5.14 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/share/man/man1/which.1 which.1 /usr/share/man/man1/which.1.debianutils 30
  --
packages/core2-64-poky-linux/debianutils/debianutils-doc: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  which.1 /usr/share/man/man1/which.1.debianutils
  --

--===============2172033633561638060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.13-5.14.patch"

RnJvbSA1NjVhODkwNzVjZDlmNTZjZWYyZDA0ZDRjNDhkYTdhOWYxN2ZhNzgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxNDowMTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YmlhbnV0aWxzOiB1cGdyYWRlIDUuMTMgLT4gNS4xNAoKLS0tCiAuLi5lYmlhbnV0aWxzXzUuMTMu
YmIgPT4gZGViaWFudXRpbHNfNS4xNC5iYn0gfCAzMCArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS4xMy5iYiA9PiBkZWJp
YW51dGlsc181LjE0LmJifSAoNjclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggNjclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxz
XzUuMTQuYmIKaW5kZXggOTE1Mjc3YjQyYy4uYTJlM2ZlNDI4MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE0LmJiCkBAIC0xLDMg
KzEsMjkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4g
dXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVh
c2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUg
Y2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRh
Zy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQu
JykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBkZWJpYW4vY29weXJpZ2h0CisjICsrKyBk
ZWJpYW4vY29weXJpZ2h0CisjIEBAIC0zOSwxMCArMzksMTAgQEAKKyMgICByZWRpc3RyaWJ1dGVk
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgVmVyc2lvbiAyIG9yIGxhdGVyLAorIyAg
IGZvdW5kIG9uIERlYmlhbiBzeXN0ZW1zIGluIHRoZSBmaWxlIC91c3Ivc2hhcmUvY29tbW9uLWxp
Y2Vuc2VzL0dQTC0yLgorIyAgCisjIC1GaWxlczogd2hpY2gKKyMgK0ZpbGVzOiB3aGljaC5kZWJp
YW51dGlscworIyAgQ29weXJpZ2h0OiBwdWJsaWMtZG9tYWluCisjICBMaWNlbnNlOiBwdWJsaWMt
ZG9tYWluCisjIC0gd2hpY2ggaXMgaW4gdGhlIHB1YmxpYyBkb21haW4uCisjICsgd2hpY2guZGVi
aWFudXRpbHMgaXMgaW4gdGhlIHB1YmxpYyBkb21haW4uCisjICAKKyMgIEZpbGVzOiBzYXZlbG9n
CisjICBDb3B5cmlnaHQ6CisjIAorIworCiBTVU1NQVJZID0gIk1pc2NlbGxhbmVvdXMgdXRpbGl0
aWVzIHNwZWNpZmljIHRvIERlYmlhbiIKIERFU0NSSVBUSU9OID0gIlByb3ZpZGVzIGEgbnVtYmVy
IG9mIHNtYWxsIHV0aWxpdGllcyB3aGljaCBhcmUgdXNlZCBcCiBwcmltYXJpbHkgYnkgdGhlIGlu
c3RhbGxhdGlvbiBzY3JpcHRzIG9mIERlYmlhbiBwYWNrYWdlcywgYWx0aG91Z2ggXApAQCAtNiwx
MiArMzIsMTIgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9wYWNrYWdlcy5kZWJpYW4ub3JnL3NpZC9k
ZWJpYW51dGlscyIKIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJp
bi9wa2dyZXBvcnQuY2dpP3BrZz1kZWJpYW51dGlscztkaXN0PXVuc3RhYmxlIgogU0VDVElPTiA9
ICJiYXNlIgogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBTTUFJTF9HUEwiCi1MSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT03NDc2NWY1N2FlNWRkMmIxMGZm
YmMzOTUyOGQ5ODc1MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmln
aHQ7bWQ1PTRiNjY3ZjMwNDExZDIxYmM4ZmQ3ZGI4NWQ1MDJhOGU5IgogCiBTUkNfVVJJID0gImdp
dDovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2RlYmlhbnV0aWxzLmdpdDtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiZDQ5YTc4ZWIyNjRj
MWIyYWQzZDBkNmRlOGUxZmI3NzZiZGE5Yzk0MyIKK1NSQ1JFViA9ICI3ZTYzYjMyZWE0MTI2Yzcw
YTVkYTk1OGYwMTA2YWRkMjY3ODEwYTk0IgogCiBpbmhlcml0IGF1dG90b29scyB1cGRhdGUtYWx0
ZXJuYXRpdmVzCiAKLS0gCjIuMzkuMgoK

--===============2172033633561638060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/debianutils/debianutils-doc: RDEPENDS: removed all items "update-alternatives-opkg"
packages/core2-64-poky-linux/debianutils/debianutils-doc: FILELIST: removed "/usr/share/man/man1/which.1.debianutils", added "/usr/share/man/man1/which.debianutils.1"
packages/core2-64-poky-linux/debianutils/debianutils-doc: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/share/man/man1/which.1 which.1 /usr/share/man/man1/which.1.debianutils 30
  --
packages/core2-64-poky-linux/debianutils/debianutils-doc: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  which.1 /usr/share/man/man1/which.1.debianutils
  --

--===============2172033633561638060==--

