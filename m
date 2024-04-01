Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571D9CD13AE
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1989.1711994601287783114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eTtIItx1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YlHCAwqB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e9ad48069-f4f1df70-5d3e-467e-affe-15996eb173db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wG8HAd4GIjpS34RgKYqUCC/fPxh6Cvssg6pFQcH51/g=;
	b=eTtIItx1RRBmaz+WCCCVkTBKFlrgxNoHEQxnGofGzv6gEOPSVUp4XKxcpZW/hhbK
	nLmPks78DgWlYbDcUA97TtlxEgVE5q/r02ZYNSvuvBP29LJQjjWXIH1lDidlgH8wFZm
	Y10jrT1qSGsOt7kCQwBVyr9iSAJeVRozlJ5Yk5hA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wG8HAd4GIjpS34RgKYqUCC/fPxh6Cvssg6pFQcH51/g=;
	b=YlHCAwqBpugU8DsLqvANby3Flyed3keoBBVXFbJ68kDXH3StzlhU7Dg4ebvuy95F
	aD5tLzNcWiMgelnQM+skMLstkIDFw+yonJrtNE/1w68nb667T+jnH4H52sVnW3I/TbI
	qXHw0gMVgtITXVRZtR4fFo5B/G1y/TAxqqWtgPGc=
Content-Type: multipart/mixed; boundary="===============3531681660309726097=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 2.22 SUCCEEDED
Message-ID: <0101018e9ad48069-f4f1df70-5d3e-467e-affe-15996eb173db-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197733

--===============3531681660309726097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycparser* to *2.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-2.21-2.22.patch
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
From 6684138e7580d6a6b632d918ba7f13dc318ebc04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 08:56:59 +0000
Subject: [PATCH] python3-pycparser: upgrade 2.21 -> 2.22

---
 ...rser_2.21.bb => python3-pycparser_2.22.bb} | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.21.bb => python3-pycparser_2.22.bb} (21%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.21.bb b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
similarity index 21%
rename from meta/recipes-devtools/python/python3-pycparser_2.21.bb
rename to meta/recipes-devtools/python/python3-pycparser_2.22.bb
index 00deceebf9..64abe47152 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.21.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
@@ -1,9 +1,39 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  pycparser -- A C parser in Python
+#  
+# -Copyright (c) 2008-2020, Eli Bendersky
+# +Copyright (c) 2008-2022, Eli Bendersky
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without modification,
+# @@ -11,7 +11,7 @@
+#  * Redistributions in binary form must reproduce the above copyright notice, 
+#    this list of conditions and the following disclaimer in the documentation 
+#    and/or other materials provided with the distribution.
+# -* Neither the name of Eli Bendersky nor the names of its contributors may 
+# +* Neither the name of the copyright holder nor the names of its contributors may 
+#    be used to endorse or promote products derived from this software without 
+#    specific prior written permission.
+#  
+# 
+#
+
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
+SRC_URI[sha256sum] = "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
 
 inherit pypi setuptools3
 
-- 
2.42.0


--===============3531681660309726097==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-2.21-2.22.patch"

RnJvbSA2Njg0MTM4ZTc1ODBkNmE2YjYzMmQ5MThiYTdmMTNkYzMxOGViYzA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwODo1Njo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcGFyc2VyOiB1cGdyYWRlIDIuMjEgLT4gMi4yMgoKLS0tCiAuLi5yc2VyXzIuMjEu
YmIgPT4gcHl0aG9uMy1weWNwYXJzZXJfMi4yMi5iYn0gfCAzNCArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3BhcnNlcl8yLjIxLmJi
ID0+IHB5dGhvbjMtcHljcGFyc2VyXzIuMjIuYmJ9ICgyMSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3BhcnNlcl8yLjIxLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3BhcnNlcl8yLjIyLmJiCnNpbWlsYXJp
dHkgaW5kZXggMjElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWNwYXJzZXJfMi4yMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y3BhcnNlcl8yLjIyLmJiCmluZGV4IDAwZGVjZWViZjkuLjY0YWJlNDcx
NTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNw
YXJzZXJfMi4yMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHljcGFyc2VyXzIuMjIuYmIKQEAgLTEsOSArMSwzOSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBweWNwYXJzZXIg
LS0gQSBDIHBhcnNlciBpbiBQeXRob24KKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDA4LTIwMjAs
IEVsaSBCZW5kZXJza3kKKyMgK0NvcHlyaWdodCAoYykgMjAwOC0yMDIyLCBFbGkgQmVuZGVyc2t5
CisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNl
IGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9u
LAorIyBAQCAtMTEsNyArMTEsNyBAQAorIyAgKiBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5IGZv
cm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UsIAorIyAgICB0aGlz
IGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZSBk
b2N1bWVudGF0aW9uIAorIyAgICBhbmQvb3Igb3RoZXIgbWF0ZXJpYWxzIHByb3ZpZGVkIHdpdGgg
dGhlIGRpc3RyaWJ1dGlvbi4KKyMgLSogTmVpdGhlciB0aGUgbmFtZSBvZiBFbGkgQmVuZGVyc2t5
IG5vciB0aGUgbmFtZXMgb2YgaXRzIGNvbnRyaWJ1dG9ycyBtYXkgCisjICsqIE5laXRoZXIgdGhl
IG5hbWUgb2YgdGhlIGNvcHlyaWdodCBob2xkZXIgbm9yIHRoZSBuYW1lcyBvZiBpdHMgY29udHJp
YnV0b3JzIG1heSAKKyMgICAgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUgcHJvZHVjdHMg
ZGVyaXZlZCBmcm9tIHRoaXMgc29mdHdhcmUgd2l0aG91dCAKKyMgICAgc3BlY2lmaWMgcHJpb3Ig
d3JpdHRlbiBwZXJtaXNzaW9uLgorIyAgCisjIAorIworCiBTVU1NQVJZID0gIlBhcnNlciBvZiB0
aGUgQyBsYW5ndWFnZSwgd3JpdHRlbiBpbiBwdXJlIFB5dGhvbiIKIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lbGliZW4vcHljcGFyc2VyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2Ui
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yYzI4Y2RlYWJjYjg4ZjU4
NDNkOTM0MzgxYjRiNGZlYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTk3NjFjM2ZmZWU3YmE5OWM2MGRjYTA0MDhmZDMyNjJiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTY0NGZkZWMxMmY3ODcyZjg2YzU4ZmY3OTBkYTQ1NjIxOGIxMGY4NjM5NzAyNDk1MTZkNjBh
NWVhY2E3NzIwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTFjOGJlOWMwNDBmNTM5MGY1YmY0
NGE1YjA3NzUyYmQwN2Y1NmVkZjk5MjM4MWIwNWM3MDE0MzllZWMxMGY2IgogCiBpbmhlcml0IHB5
cGkgc2V0dXB0b29sczMKIAotLSAKMi40Mi4wCgo=

--===============3531681660309726097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.12/site-packages/pycparser-2.21.dist-info moved to /usr/lib/python3.12/site-packages/pycparser-2.22.dist-info

--===============3531681660309726097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycparser: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.21.tar.gz;downloadfilename=pycparser-2.21.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.22.tar.gz;downloadfilename=pycparser-2.22.tar.gz"
packages/core2-64-poky-linux/python3-pycparser: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1192208 to 1200477 (+1%)
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 2.21 [default] to 2.22 [default]
Changes to packages/core2-64-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.12/site-packages/pycparser-2.21.dist-info moved to /usr/lib/python3.12/site-packages/pycparser-2.22.dist-info

--===============3531681660309726097==--

