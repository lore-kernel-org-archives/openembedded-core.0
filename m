Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC825D1A426
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53299.1728588979640380312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iCJxxDRM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s07BZ9Zt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277eebb3f-9ec5022d-2f2c-4cd3-b9c8-055581687ee6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hO/1nja8zXQWMMJR4jqEyL0fT4l+5O3OltJfaHDW460=;
	b=iCJxxDRMbTSV2f53hr3El164YnUMkogNe3SzPn81ji7oyNgU/gZQk2KTXWoDJOQ3
	W3LOEKbVk4KKXi+V1F+OLvZJVHEguDW5CYXK2lcNtFWm+E0wxLDHK8eiB6CcSS++h0k
	+/6t887xfRKFU1PRgQBT/fDjiqWgSmJOTlYUOCqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hO/1nja8zXQWMMJR4jqEyL0fT4l+5O3OltJfaHDW460=;
	b=s07BZ9Ztwirfq6zWCnzT4zlg5pA9h3GCvKUnWFQiLA+yMvBjmrvICMWSDroEwqdy
	ZnF3Whl/NwKPWKLfzc+VbZltdCC1euT0TJmf6H0P9fnYedQs2gFKRqWE9vrj33yLjBm
	4CI8Gwq6zv2IPmLpYmw9XgEv1cEElrHQ2WRzmwm8=
Content-Type: multipart/mixed; boundary="===============4476457148093020699=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.45 SUCCEEDED
Message-ID: <0101019277eebb3f-9ec5022d-2f2c-4cd3-b9c8-055581687ee6-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205581

--===============4476457148093020699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtools* to *4.0.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.44-4.0.45.patch
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
From 811588e6385fbf13f48236311c4e07c1e8209e66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 01:44:14 +0000
Subject: [PATCH] mtools: upgrade 4.0.44 -> 4.0.45

---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch          | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch               | 2 +-
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch       | 2 +-
 .../mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb}               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 20a6d1b8b3..ad5d1e31fc 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From c72d075cb0c3a65ef17621c7ed1ffac35ca3b68e Mon Sep 17 00:00:00 2001
+From c9f7a906234bbbc7eaa1c939dd116d21c7603e64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1bed4e7614..5b8ac3e298 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 0953b744b0257e26c170fb6d6b4c0f6210e4ae43 Mon Sep 17 00:00:00 2001
+From c9cdef6d710b8ec2cb02efa10ca6d40a53394e8c Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 3771f94c59..e90660628a 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From 184b76e9742ff89f90a066edb0f46b4a150351cf Mon Sep 17 00:00:00 2001
+From ad66c7813295a44accab7d51279c219f979b6bfe Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.44.bb b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.44.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.45.bb
index d8dd671be2..34040d7a0d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.44.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
+SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.44.1


--===============4476457148093020699==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.44-4.0.45.patch"

RnJvbSA4MTE1ODhlNjM4NWZiZjEzZjQ4MjM2MzExYzRlMDdjMWU4MjA5ZTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDE6NDQ6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQ0IC0+IDQuMC40NQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi4v
bXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoICAgICAgICAgICAg
ICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFr
ZWluZm8ucGF0Y2ggICAgICAgfCAyICstCiAuLi4vbXRvb2xzL3ttdG9vbHNfNC4wLjQ0LmJiID0+
IG10b29sc180LjAuNDUuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbXRvb2xzL3ttdG9vbHNfNC4wLjQ0LmJiID0+IG10b29sc180LjAuNDUuYmJ9ICg5MyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdf
VU5VU0VELnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdf
VU5VU0VELnBhdGNoCmluZGV4IDIwYTZkMWI4YjMuLmFkNWQxZTMxZmMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGM3MmQwNzVjYjBjM2E2NWVmMTc2MjFjN2VkMWZmYWMzNWNh
M2I2OGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM5ZjdhOTA2MjM0YmJiYzdlYWEx
YzkzOWRkMTE2ZDIxYzc2MDNlNjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxMTo1NTo0
MSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBVbmRlZmluZSBVTlVTRUQgbWFjcm9zIHdpdGggY2xh
bmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2Fi
bGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xz
L210b29scy9kaXNhYmxlLWhhcmRjb2RlZC1jb25maWdzLnBhdGNoCmluZGV4IDFiZWQ0ZTc2MTQu
LjViOGFjM2UyOTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL210b29scy9tdG9vbHMvZGlzYWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMDk1M2I3NDRiMDI1N2UyNmMxNzBmYjZkNmI0YzBmNjIxMGU0YWU0
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzljZGVmNmQ3MTBiOGVjMmNiMDJlZmEx
MGNhNmQ0MGE1MzM5NGU4YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVkIEJhcnRv
c2ggPGVkLmJhcnRvc2hAbGludXguaW50ZWwuY29tPgogRGF0ZTogVHVlLCAxMyBKdW4gMjAxNyAx
NDo1NTo1MiArMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29u
Zmlncy4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210
b29scy1tYWtlaW5mby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xz
L210b29scy1tYWtlaW5mby5wYXRjaAppbmRleCAzNzcxZjk0YzU5Li5lOTA2NjA2MjhhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWlu
Zm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xz
LW1ha2VpbmZvLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxODRiNzZlOTc0MmZmODlmOTBh
MDY2ZWRiMGY0NmI0YTE1MDM1MWNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZDY2
Yzc4MTMyOTVhNDRhY2NhYjdkNTEyNzljMjE5Zjk3OWI2YmZlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogTWFyY2luIEp1c3praWV3aWN6IDxocndAb3BlbmVkaGFuZC5jb20+CiBEYXRl
OiBGcmksIDggSnVuIDIwMDcgMDg6MzU6MTIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbXRvb2xz
OiBpbXBvcnRlZCBmcm9tIE9FCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRv
b2xzL210b29sc180LjAuNDQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29s
c180LjAuNDUuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjQ0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDUuYmIKaW5kZXggZDhkZDY3MWJlMi4uMzQwNDBk
N2EwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4w
LjQ0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC40NS5i
YgpAQCAtMjQsNyArMjQsNyBAQCBSUkVDT01NRU5EUzoke1BOfTpsaWJjLWdsaWJjID0gIlwKIAln
bGliYy1nY29udi1pYm04NjYgXAogCWdsaWJjLWdjb252LWlibTg2OSBcCiAJIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjM3ZGM0ZGYwMjI1MzNjM2Q0YjJlYzFjNzg5NzNjMjdjN2U4YjU4NTM3NGMy
ZDQ2YWI2NGM2YTNkYjMxZWRkYjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGIwMDhhOTZiZDBl
ZmUwZTU0MmZhNDM4M2Q0NjlhZjY2YmM0YTkzMzk0OTkwYjEwMzczMGE4MTYwYTY3ZDYxOCIKIAog
U1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L210b29scy9tdG9vbHMtJHtQVn0udGFyLmJ6MiBcCiAg
ICAgICAgICAgIGZpbGU6Ly9tdG9vbHMtbWFrZWluZm8ucGF0Y2ggXAotLSAKMi40NC4xCgo=

--===============4476457148093020699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.44.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.45.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/core2-64-poky-linux/mtools: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-dbg: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 819344 to 819208 (-0%)
packages/core2-64-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-dev: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-doc: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-doc: PKGSIZE changed from 244453 to 244463 (+0%)
packages/core2-64-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-locale: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-src: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-src: PKGSIZE changed from 598938 to 598960 (+0%)
packages/core2-64-poky-linux/mtools/mtools-src: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.44 [default] to 4.0.45 [default]
packages/core2-64-poky-linux/mtools/mtools: PV changed from "4.0.44" to "4.0.45"
packages/core2-64-poky-linux/mtools/mtools: PKGV changed from 4.0.44 [default] to 4.0.45 [default]

--===============4476457148093020699==--

