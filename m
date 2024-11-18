Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3940D49207
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4800.1731964615583476483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RglgOJya;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wUajNEGw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101934122b73e-65492ec6-b508-49b0-a1fc-09e60fe1bd7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z3PTt+67KJX9E2goCch9GlCJide/3rZoNNNE5i7Rtf0=;
	b=RglgOJyaJlZD7LzxkOkHYkTUQ7Afw5C6TbyxCUGj7kmsroRf6C58MdHxFULngS1h
	MkUI+uXlsStJIn7rB5WIcboBIZzqgeCBhC3ySG0ouuxmFp7vl6CnxEXlap092UWHv5g
	vfXbQO5mKnt3QEUjDflkJlXfTHHJ6M8uRiHYkS8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z3PTt+67KJX9E2goCch9GlCJide/3rZoNNNE5i7Rtf0=;
	b=wUajNEGwQX/aampiSmo1v5EVNzciShvrQrJdKeUKTyWTPSTXhLBDZKMKd7t3XRp3
	sFLocN6zBJrCHhs31dMObt+mL/YnvJFogSlc8HCKDFBMQS820IQGWPtTAP+iU0lbH1g
	4iKuGG3dTywcHyYxkH8c/EyWciImvOzaMxkcwZlc=
Content-Type: multipart/mixed; boundary="===============0206144782396854424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.67 SUCCEEDED
Message-ID: <010101934122b73e-65492ec6-b508-49b0-a1fc-09e60fe1bd7b-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207261

--===============0206144782396854424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffstat* to *1.67* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.66-1.67.patch
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
From 48965a72a6d0eb72ab07965ecce1904cb1504802 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 09:04:56 +0000
Subject: [PATCH] diffstat: upgrade 1.66 -> 1.67

---
 .../diffstat/avoid-check-user-break-cc.patch  |  7 +--
 .../{diffstat_1.66.bb => diffstat_1.67.bb}    | 56 ++++++++++++++++++-
 2 files changed, 57 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.66.bb => diffstat_1.67.bb} (18%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index 46f1cfabcf..fc42c8cba7 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,4 +1,4 @@
-From 708c765ffb41ecc734316f69043583312fe444bd Mon Sep 17 00:00:00 2001
+From 04fd678939ad0c21f57222c48305bfa29c8f6cf3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 15 May 2018 17:17:01 +0800
 Subject: [PATCH] diffstat: fix wrong evaluation of CC
@@ -12,16 +12,15 @@ be included in CC. And then CC will be wrongly filtered.
 So comment out CF_CC_ENV_FLAGS from function CF_PROG_CC.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  aclocal.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index d4bd283..1b653c4 100644
+index 1c653ea..8f0540d 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1522,7 +1522,7 @@ CF_GCC_VERSION
+@@ -1584,7 +1584,7 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.66.bb b/meta/recipes-devtools/diffstat/diffstat_1.67.bb
similarity index 18%
rename from meta/recipes-devtools/diffstat/diffstat_1.66.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.67.bb
index d59379fd2b..ad5c50f030 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.66.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.67.bb
@@ -1,3 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,18 +1,22 @@
+# -Copyright 1994-2023,2024 by Thomas E. Dickey
+# -All Rights Reserved.
+# +Copyright 1994-2023,2024 by Thomas E.  Dickey
+#  
+# -Permission to use, copy, modify, and distribute this software and its
+# -documentation for any purpose and without fee is hereby granted, provided
+# -that the above copyright notice appear in all copies and that both that
+# -copyright notice and this permission notice appear in supporting
+# -documentation, and that the name of the above listed copyright holder(s)
+# -not be used in advertising or publicity pertaining to distribution of the
+# -software without specific, written prior permission.
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of
+# +this software and associated documentation files (the "Software"), to deal in
+# +the Software without restriction, including without limitation the rights to
+# +use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
+# +of the Software, and to permit persons to whom the Software is furnished to do
+# +so, subject to the following conditions:
+#  
+# -THE ABOVE LISTED COPYRIGHT HOLDER(S) DISCLAIM ALL WARRANTIES WITH REGARD
+# -TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
+# -FITNESS, IN NO EVENT SHALL THE ABOVE LISTED COPYRIGHT HOLDER(S) BE LIABLE
+# -FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+# -WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+# -ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
+# -IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
+# +ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+# +WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+# +CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+# +
+# +Except as contained in this notice, the name(s) of the above copyright holders
+# +shall not be used in advertising or otherwise to promote the sale, use or other
+# +dealings in this Software without prior written authorization.
+# 
+#
+
 SUMMARY = "Tool to produce a statistics based on a diff"
 DESCRIPTION = "diffstat reads the output of diff and displays a histogram of \
 the insertions, deletions, and modifications per-file. It is useful for \
@@ -5,14 +57,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5713b4719a66a6527e6301e8f8745877"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6232ea974e4cbc4ee06b49ed53df6ece"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "f54531bbe32e8e0fa461f018b41e3af516b632080172f361f05e50367ecbb69e"
+SRC_URI[sha256sum] = "760ed0c99c6d643238d41b80e60278cf1683ffb94a283954ac7ef168c852766a"
 
 inherit autotools gettext ptest
 
-- 
2.44.1


--===============0206144782396854424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case48u.ref /usr/lib/diffstat/ptest/testing/case49k.ref /usr/lib/diffstat/ptest/testing/case49u.ref /usr/lib/diffstat/ptest/testing/case48R.ref /usr/lib/diffstat/ptest/testing/case48b.ref /usr/lib/diffstat/ptest/testing/case48k.ref /usr/lib/diffstat/ptest/testing/case49b.ref /usr/lib/diffstat/ptest/testing/case49R.ref /usr/lib/diffstat/ptest/testing/case49r2.ref /usr/lib/diffstat/ptest/testing/case48p9.ref /usr/lib/diffstat/ptest/testing/case48Rp0.ref /usr/lib/diffstat/ptest/testing/case49Rp0.ref /usr/lib/diffstat/ptest/testing/case48p1.ref /usr/lib/diffstat/ptest/testing/case48f0.ref /usr/lib/diffstat/ptest/testing/case48r1.ref /usr/lib/diffstat/ptest/testing/case48r2.ref /usr/lib/diffstat/ptest/testing/case48.pat /usr/lib/diffstat/ptest/testing/case49.pat /usr/lib/diffstat/ptest/testing/case49f0.ref /usr/lib/diffstat/ptest/testing/case49p1.ref /usr/lib/diffstat/ptest/testing/case4
 9p9.ref /usr/lib/diffstat/ptest/testing/case49r1.ref /usr/lib/diffstat/ptest/testing/case48.ref /usr/lib/diffstat/ptest/testing/case49.ref"

--===============0206144782396854424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 143480 to 144640 (+1%)
packages/core2-64-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-dev: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-doc: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGSIZE changed from 9160 to 9113 (-1%)
packages/core2-64-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-locale: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case49R.ref /usr/lib/diffstat/ptest/testing/case48u.ref /usr/lib/diffstat/ptest/testing/case48R.ref /usr/lib/diffstat/ptest/testing/case48k.ref /usr/lib/diffstat/ptest/testing/case48b.ref /usr/lib/diffstat/ptest/testing/case49u.ref /usr/lib/diffstat/ptest/testing/case49b.ref /usr/lib/diffstat/ptest/testing/case49k.ref /usr/lib/diffstat/ptest/testing/case48.pat /usr/lib/diffstat/ptest/testing/case49.pat /usr/lib/diffstat/ptest/testing/case48.ref /usr/lib/diffstat/ptest/testing/case49.ref /usr/lib/diffstat/ptest/testing/case49f0.ref /usr/lib/diffstat/ptest/testing/case49p1.ref /usr/lib/diffstat/ptest/testing/case49p9.ref /usr/lib/diffstat/ptest/testing/case49r1.ref /usr/lib/diffstat/ptest/testing/case49r2.ref /usr/lib/diffstat/ptest/testing/case48f0.ref /usr/lib/diffstat/ptest/testing/case48p1.ref /usr/lib/diffstat/ptest/testing/case48p9.ref /usr/lib/diffstat/ptest/testing/case48r1.re
 f /usr/lib/diffstat/ptest/testing/case48r2.ref /usr/lib/diffstat/ptest/testing/case48Rp0.ref /usr/lib/diffstat/ptest/testing/case49Rp0.ref"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 635329 to 638153 (+0%)
packages/core2-64-poky-linux/diffstat/diffstat-src: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-src: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat-src: PKGSIZE changed from 87941 to 88893 (+1%)
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat/diffstat: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat/diffstat: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat: PKGV changed from 1.66 [default] to 1.67 [default]
packages/core2-64-poky-linux/diffstat: PV changed from "1.66" to "1.67"
packages/core2-64-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.66.tgz file://run-ptest file://avoid-check-user-break-cc.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.67.tgz file://run-ptest file://avoid-check-user-break-cc.patch"

--===============0206144782396854424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.66-1.67.patch"

RnJvbSA0ODk2NWE3MmE2ZDBlYjcyYWIwNzk2NWVjY2UxOTA0Y2IxNTA0ODAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDk6MDQ6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmc3RhdDogdXBncmFkZSAxLjY2IC0+IDEuNjcKCi0tLQogLi4uL2RpZmZzdGF0L2F2b2lkLWNo
ZWNrLXVzZXItYnJlYWstY2MucGF0Y2ggIHwgIDcgKy0tCiAuLi4ve2RpZmZzdGF0XzEuNjYuYmIg
PT4gZGlmZnN0YXRfMS42Ny5iYn0gICAgfCA1NiArKysrKysrKysrKysrKysrKystCiAyIGZpbGVz
IGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L3tkaWZmc3RhdF8xLjY2LmJiID0+IGRpZmZzdGF0XzEu
NjcuYmJ9ICgxOCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0
L2RpZmZzdGF0L2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hlY2stdXNlci1icmVhay1jYy5wYXRj
aAppbmRleCA0NmYxY2ZhYmNmLi5mYzQyYzhjYmE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hlY2stdXNlci1icmVhay1jYy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hl
Y2stdXNlci1icmVhay1jYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzA4Yzc2NWZmYjQx
ZWNjNzM0MzE2ZjY5MDQzNTgzMzEyZmU0NDRiZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMDRmZDY3ODkzOWFkMGMyMWY1NzIyMmM0ODMwNWJmYTI5YzhmNmNmMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAxNSBNYXkgMjAxOCAxNzoxNzowMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBkaWZm
c3RhdDogZml4IHdyb25nIGV2YWx1YXRpb24gb2YgQ0MKQEAgLTEyLDE2ICsxMiwxNSBAQCBiZSBp
bmNsdWRlZCBpbiBDQy4gQW5kIHRoZW4gQ0Mgd2lsbCBiZSB3cm9uZ2x5IGZpbHRlcmVkLgogU28g
Y29tbWVudCBvdXQgQ0ZfQ0NfRU5WX0ZMQUdTIGZyb20gZnVuY3Rpb24gQ0ZfUFJPR19DQy4KIAog
U2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+Ci0KIC0tLQog
IGFjbG9jYWwubTQgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9hY2xvY2FsLm00IGIvYWNsb2NhbC5tNAotaW5kZXgg
ZDRiZDI4My4uMWI2NTNjNCAxMDA2NDQKK2luZGV4IDFjNjUzZWEuLjhmMDU0MGQgMTAwNjQ0CiAt
LS0gYS9hY2xvY2FsLm00CiArKysgYi9hY2xvY2FsLm00Ci1AQCAtMTUyMiw3ICsxNTIyLDcgQEAg
Q0ZfR0NDX1ZFUlNJT04KK0BAIC0xNTg0LDcgKzE1ODQsNyBAQCBDRl9HQ0NfVkVSU0lPTgogIENG
X0FDVkVSU0lPTl9DSEVDSygyLjUyLAogIAlbQUNfUFJPR19DQ19TVERDXSwKICAJW0NGX0FOU0lf
Q0NfUkVRRF0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlm
ZnN0YXRfMS42Ni5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8x
LjY3LmJiCnNpbWlsYXJpdHkgaW5kZXggMTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42Ny5iYgppbmRleCBkNTkzNzlmZDJiLi5hZDVjNTBm
MDMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRf
MS42Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42
Ny5iYgpAQCAtMSwzICsxLDU1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyAr
KysgQ09QWUlORworIyBAQCAtMSwxOCArMSwyMiBAQAorIyAtQ29weXJpZ2h0IDE5OTQtMjAyMywy
MDI0IGJ5IFRob21hcyBFLiBEaWNrZXkKKyMgLUFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICtDb3B5
cmlnaHQgMTk5NC0yMDIzLDIwMjQgYnkgVGhvbWFzIEUuICBEaWNrZXkKKyMgIAorIyAtUGVybWlz
c2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBh
bmQgaXRzCisjIC1kb2N1bWVudGF0aW9uIGZvciBhbnkgcHVycG9zZSBhbmQgd2l0aG91dCBmZWUg
aXMgaGVyZWJ5IGdyYW50ZWQsIHByb3ZpZGVkCisjIC10aGF0IHRoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlIGFwcGVhciBpbiBhbGwgY29waWVzIGFuZCB0aGF0IGJvdGggdGhhdAorIyAtY29weXJp
Z2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBhcHBlYXIgaW4gc3VwcG9ydGlu
ZworIyAtZG9jdW1lbnRhdGlvbiwgYW5kIHRoYXQgdGhlIG5hbWUgb2YgdGhlIGFib3ZlIGxpc3Rl
ZCBjb3B5cmlnaHQgaG9sZGVyKHMpCisjIC1ub3QgYmUgdXNlZCBpbiBhZHZlcnRpc2luZyBvciBw
dWJsaWNpdHkgcGVydGFpbmluZyB0byBkaXN0cmlidXRpb24gb2YgdGhlCisjIC1zb2Z0d2FyZSB3
aXRob3V0IHNwZWNpZmljLCB3cml0dGVuIHByaW9yIHBlcm1pc3Npb24uCisjICtQZXJtaXNzaW9u
IGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5p
bmcgYSBjb3B5IG9mCisjICt0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRp
b24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyArdGhlIFNvZnR3YXJlIHdp
dGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0
cyB0bworIyArdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBz
dWJsaWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMKKyMgK29mIHRoZSBTb2Z0d2FyZSwgYW5kIHRv
IHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbwor
IyArc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAgCisjIC1USEUg
QUJPVkUgTElTVEVEIENPUFlSSUdIVCBIT0xERVIoUykgRElTQ0xBSU0gQUxMIFdBUlJBTlRJRVMg
V0lUSCBSRUdBUkQKKyMgLVRPIFRISVMgU09GVFdBUkUsIElOQ0xVRElORyBBTEwgSU1QTElFRCBX
QVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQKKyMgLUZJVE5FU1MsIElOIE5PIEVWRU5U
IFNIQUxMIFRIRSBBQk9WRSBMSVNURUQgQ09QWVJJR0hUIEhPTERFUihTKSBCRSBMSUFCTEUKKyMg
LUZPUiBBTlkgU1BFQ0lBTCwgSU5ESVJFQ1QgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIE9SIEFO
WSBEQU1BR0VTCisjIC1XSEFUU09FVkVSIFJFU1VMVElORyBGUk9NIExPU1MgT0YgVVNFLCBEQVRB
IE9SIFBST0ZJVFMsIFdIRVRIRVIgSU4gQU4KKyMgLUFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElH
RU5DRSBPUiBPVEhFUiBUT1JUSU9VUyBBQ1RJT04sIEFSSVNJTkcgT1VUIE9GIE9SCisjIC1JTiBD
T05ORUNUSU9OIFdJVEggVEhFIFVTRSBPUiBQRVJGT1JNQU5DRSBPRiBUSElTIFNPRlRXQVJFLgor
IyArVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ug
c2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsCisjICtjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlv
bnMgb2YgdGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFT
IElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyArSU1QTElF
RCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFO
VEFCSUxJVFksCisjICtGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5G
UklOR0VNRU5ULiAgSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBQk9WRSBDT1BZUklHSFQgSE9M
REVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFks
CisjICtXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0Us
IEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOCisjICtDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorIyArCisj
ICtFeGNlcHQgYXMgY29udGFpbmVkIGluIHRoaXMgbm90aWNlLCB0aGUgbmFtZShzKSBvZiB0aGUg
YWJvdmUgY29weXJpZ2h0IGhvbGRlcnMKKyMgK3NoYWxsIG5vdCBiZSB1c2VkIGluIGFkdmVydGlz
aW5nIG9yIG90aGVyd2lzZSB0byBwcm9tb3RlIHRoZSBzYWxlLCB1c2Ugb3Igb3RoZXIKKyMgK2Rl
YWxpbmdzIGluIHRoaXMgU29mdHdhcmUgd2l0aG91dCBwcmlvciB3cml0dGVuIGF1dGhvcml6YXRp
b24uCisjIAorIworCiBTVU1NQVJZID0gIlRvb2wgdG8gcHJvZHVjZSBhIHN0YXRpc3RpY3MgYmFz
ZWQgb24gYSBkaWZmIgogREVTQ1JJUFRJT04gPSAiZGlmZnN0YXQgcmVhZHMgdGhlIG91dHB1dCBv
ZiBkaWZmIGFuZCBkaXNwbGF5cyBhIGhpc3RvZ3JhbSBvZiBcCiB0aGUgaW5zZXJ0aW9ucywgZGVs
ZXRpb25zLCBhbmQgbW9kaWZpY2F0aW9ucyBwZXItZmlsZS4gSXQgaXMgdXNlZnVsIGZvciBcCkBA
IC01LDE0ICs1NywxNCBAQCByZXZpZXdpbmcgbGFyZ2UsIGNvbXBsZXggcGF0Y2ggZmlsZXMuIgog
SE9NRVBBR0UgPSAiaHR0cDovL2ludmlzaWJsZS1pc2xhbmQubmV0L2RpZmZzdGF0LyIKIFNFQ1RJ
T04gPSAiZGV2ZWwiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTU3MTNiNDcxOWE2NmE2NTI3ZTYzMDFlOGY4NzQ1ODc3IgorTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjIzMmVhOTc0ZTRjYmM0ZWUwNmI0OWVkNTNk
ZjZlY2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2ludmlzaWJsZS1taXJyb3IubmV0L2FyY2hpdmVz
LyR7QlBOfS8ke0JQfS50Z3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAg
ICAgICAgZmlsZTovL2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTQ1MzFiYmUzMmU4ZTBmYTQ2MWYwMThiNDFl
M2FmNTE2YjYzMjA4MDE3MmYzNjFmMDVlNTAzNjdlY2JiNjllIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjc2MGVkMGM5OWM2ZDY0MzIzOGQ0MWI4MGU2MDI3OGNmMTY4M2ZmYjk0YTI4Mzk1NGFjN2Vm
MTY4Yzg1Mjc2NmEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcHRlc3QKIAotLSAKMi40
NC4xCgo=

--===============0206144782396854424==--

