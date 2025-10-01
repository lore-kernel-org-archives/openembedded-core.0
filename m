Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D87CCD184
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18078.1759325539201890818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zaWasuS/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mnfFWtzk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff948e6-7b9c7156-e569-4507-8873-2b928b727929-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZUO8bSeptz7ID3taqiUhljVzHUlQfkqj9V2t2t8P80A=;
	b=zaWasuS/QuCHky4D7jvvzHPjW7MeALbhDacQEexyWjcNX76e2Y4FT77UT4nNLbl/
	a90nBfwdcO/jJQEXNMJm+m30u2PPWsOk6Kkgfp/hC7oBn0u5Gv0ikI7ay6LfcfeldqJ
	CersJ8NTpj2cQkmB/r/iGDGi2MPUwf5uLsTg5nek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZUO8bSeptz7ID3taqiUhljVzHUlQfkqj9V2t2t8P80A=;
	b=mnfFWtzkOq2jVDpnZlGjn9AOeF5/Olb0bJv9BVbBA1TX7kPwL18xHRcK5Cal2Np7
	gXhC6pd2SeBHvLZgeXnpCxiw+v3nLd4cKg2G+LiPU/jhE90xVE7tYWjqgnRKcEb16mO
	Gn9h9dd1+y0ki32Fa59fxBTamLLDJ5LkuqmPBoOA=
Content-Type: multipart/mixed; boundary="===============8026271693998604205=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.1.4 SUCCEEDED
Message-ID: <010101999ff948e6-7b9c7156-e569-4507-8873-2b928b727929-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224235

--===============8026271693998604205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.3-3.1.4.patch
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
From 388efce5e790ab5645ff235e9c3a7579aa8a4595 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:54:26 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.3 -> 3.1.4

---
 ...lace-not-predictable-build-path-prefix-with-hardc.patch | 7 ++-----
 .../{python3-cython_3.1.3.bb => python3-cython_3.1.4.bb}   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.3.bb => python3-cython_3.1.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 1fbbd8fd48..326a3842fa 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 1690c505f1387e1884565021991a162e2f88f2b9 Mon Sep 17 00:00:00 2001
+From d7a9e5728861130da6999564f2ea1722034bb893 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,7 +53,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 6672cb986..b1123515e 100644
+index 4075e93..984108b 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
@@ -67,6 +67,3 @@ index 6672cb986..b1123515e 100644
              code.putln("END: Cython Metadata */")
              code.putln("")
  
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.1.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.3.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.4.bb
index 3b2835d9c5..3338ac82b2 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.4.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
+SRC_URI[sha256sum] = "9aefefe831331e2d66ab31799814eae4d0f8a2d246cbaaaa14d1be29ef777683"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============8026271693998604205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.3.tar.gz;downloadfilename=cython-3.1.3.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.4.tar.gz;downloadfilename=cython-3.1.4.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26059048 to 26053824 (-0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23081148 to 23084254 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.3" to "3.1.4"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.3 [default] to 3.1.4 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14897478 to 14903955 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.1.3" to "3.1.4"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.4.dist-info

--===============8026271693998604205==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.3-3.1.4.patch"

RnJvbSAzODhlZmNlNWU3OTBhYjU2NDVmZjIzNWU5YzNhNzU3OWFhOGE0NTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODo1NDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMS4zIC0+IDMuMS40CgotLS0KIC4uLmxhY2Utbm90LXBy
ZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggfCA3ICsrLS0tLS0K
IC4uLi97cHl0aG9uMy1jeXRob25fMy4xLjMuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4xLjQuYmJ9
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhvbl8z
LjEuMy5iYiA9PiBweXRob24zLWN5dGhvbl8zLjEuNC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1u
b3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1w
cmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4IDFmYmJk
OGZkNDguLjMyNmEzODQyZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRo
LXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRo
LXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNjkwYzUwNWYx
Mzg3ZTE4ODQ1NjUwMjE5OTFhMTYyZTJmODhmMmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBkN2E5ZTU3Mjg4NjExMzBkYTY5OTk1NjRmMmVhMTcyMjAzNGJiODkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogV2VkLCAxNyBTZXAgMjAyNSAwMTo0MjowOCAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBSZXBsYWNlIG5vdCBwcmVkaWN0YWJsZSBidWlsZCBwYXRoIHByZWZpeCB3aXRoIGhhcmRjb2Rl
CkBAIC01Myw3ICs1Myw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFA
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weSBiL0N5
dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5Ci1pbmRleCA2NjcyY2I5ODYuLmIxMTIzNTE1ZSAx
MDA2NDQKK2luZGV4IDQwNzVlOTMuLjk4NDEwOGIgMTAwNjQ0CiAtLS0gYS9DeXRob24vQ29tcGls
ZXIvTW9kdWxlTm9kZS5weQogKysrIGIvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkKIEBA
IC03NzksNyArNzc5LDkgQEAgY2xhc3MgTW9kdWxlTm9kZShOb2Rlcy5Ob2RlLCBOb2Rlcy5CbG9j
a05vZGUpOgpAQCAtNjcsNiArNjcsMyBAQCBpbmRleCA2NjcyY2I5ODYuLmIxMTIzNTE1ZSAxMDA2
NDQKICAgICAgICAgICAgICBjb2RlLnB1dGxuKCJFTkQ6IEN5dGhvbiBNZXRhZGF0YSAqLyIpCiAg
ICAgICAgICAgICAgY29kZS5wdXRsbigiIikKICAKLS0tIAotMi40OS4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4xLjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS40LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jeXRob25fMy4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMy4xLjQuYmIKaW5kZXggM2IyODM1ZDljNS4uMzMzOGFjODJi
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhv
bl8zLjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uXzMuMS40LmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT02MWMzZWU4OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjEwZWU3ODVlNDIzMjg5MjRiNzhmNzVhNzRmNjZhODEzY2I5NTZiNGE5YmM5MWM0
NDgxNmQwODlkNTkzNGMwODkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWFlZmVmZTgzMTMzMWUy
ZDY2YWIzMTc5OTgxNGVhZTRkMGY4YTJkMjQ2Y2JhYWFhMTRkMWJlMjllZjc3NzY4MyIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzIGN5dGhvbgogCi0tIAoyLjQ3LjEKCg==

--===============8026271693998604205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.4.dist-info

--===============8026271693998604205==--

