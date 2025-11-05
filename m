Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A546FCD342D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2368.1762384583580536215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=w76NPMHQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gBlfZi1U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019a564e9947-11bcbb79-e178-4638-bfb0-ea2d43206a05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384583;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hTrQY+TnE8aXjgaCaIRV635/0TEYB0XFAjBaGHfKPcs=;
	b=w76NPMHQMjoyqo+mpCw+90M0D8Sx7s7ABvUKu/7CYAwotpPMHKjqNGdxG9clU4kb
	i4jvEyTbx20spJMTd2Uo1WYhsSQHf1RTdOnNSdhTaoVLBhDq/YyoLeIubps/CFXA9C8
	7S1ecEeBiF6dZn3IrFeqg+TcYUKoBErl+vMVxr/g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384583;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hTrQY+TnE8aXjgaCaIRV635/0TEYB0XFAjBaGHfKPcs=;
	b=gBlfZi1UQ1Q0NWX6glku18QAnLKo/+IX2zWJuFZvrP7f3HAFVB5TYXqjlO8oEzpH
	LfM8mEos6eN4hCE1M0QFQlrdB1fIR7pkDi6EyQmSrYdnhjCCG4kQWqDjcfqAXYJR+Y3
	X4HVhqEkVStEXwWrv+xIVoNJ6OHDsUlpXRnSBLqY=
Content-Type: multipart/mixed; boundary="===============9009099125940845406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.1.6 SUCCEEDED
Message-ID: <0101019a564e9947-11bcbb79-e178-4638-bfb0-ea2d43206a05-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225826

--===============9009099125940845406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.1.3-3.1.6.patch
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
From 901c048bf62c417743e7cbc91274979549630dbc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:54:13 +0000
Subject: [PATCH] python3-cython: upgrade 3.1.3 -> 3.1.6

---
 ...lace-not-predictable-build-path-prefix-with-hardc.patch | 7 ++-----
 .../{python3-cython_3.1.3.bb => python3-cython_3.1.6.bb}   | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.3.bb => python3-cython_3.1.6.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 1fbbd8fd48..1456f4dd0e 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 1690c505f1387e1884565021991a162e2f88f2b9 Mon Sep 17 00:00:00 2001
+From d1ebc68a7fa2d995cfa75c587cd3dd016e5906f3 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.1.6.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.3.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.6.bb
index 3b2835d9c5..2c3ad6c585 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.6.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
+SRC_URI[sha256sum] = "ff4ccffcf98f30ab5723fc45a39c0548a3f6ab14f01d73930c5bfaea455ff01c"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============9009099125940845406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.6.dist-info, removed "/usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.6.dist-info
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt was removed

--===============9009099125940845406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.3.tar.gz;downloadfilename=cython-3.1.3.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.1.6.tar.gz;downloadfilename=cython-3.1.6.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 26059048 to 26067096 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23081148 to 23105664 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.1.3" to "3.1.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info -> /usr/lib/python3.13/site-packages/cython-3.1.6.dist-info, removed "/usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14897478 to 14896033 (-0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.1.3 [default] to 3.1.6 [default]
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info moved to /usr/lib/python3.13/site-packages/cython-3.1.6.dist-info
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/COPYING.txt was removed
  /usr/lib/python3.13/site-packages/cython-3.1.3.dist-info/licenses/LICENSE.txt was removed

--===============9009099125940845406==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.1.3-3.1.6.patch"

RnJvbSA5MDFjMDQ4YmY2MmM0MTc3NDNlN2NiYzkxMjc0OTc5NTQ5NjMwZGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjo1NDoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMS4zIC0+IDMuMS42CgotLS0KIC4uLmxhY2Utbm90LXBy
ZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggfCA3ICsrLS0tLS0K
IC4uLi97cHl0aG9uMy1jeXRob25fMy4xLjMuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4xLjYuYmJ9
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhvbl8z
LjEuMy5iYiA9PiBweXRob24zLWN5dGhvbl8zLjEuNi5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1u
b3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1w
cmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4IDFmYmJk
OGZkNDguLjE0NTZmNGRkMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRo
LXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRo
LXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNjkwYzUwNWYx
Mzg3ZTE4ODQ1NjUwMjE5OTFhMTYyZTJmODhmMmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBkMWViYzY4YTdmYTJkOTk1Y2ZhNzVjNTg3Y2QzZGQwMTZlNTkwNmYzIE1vbiBTZXAgMTcg
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
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMS42LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jeXRob25fMy4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMy4xLjYuYmIKaW5kZXggM2IyODM1ZDljNS4uMmMzYWQ2YzU4
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhv
bl8zLjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uXzMuMS42LmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT02MWMzZWU4OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjEwZWU3ODVlNDIzMjg5MjRiNzhmNzVhNzRmNjZhODEzY2I5NTZiNGE5YmM5MWM0
NDgxNmQwODlkNTkzNGMwODkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmY0Y2NmZmNmOThmMzBh
YjU3MjNmYzQ1YTM5YzA1NDhhM2Y2YWIxNGYwMWQ3MzkzMGM1YmZhZWE0NTVmZjAxYyIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzIGN5dGhvbgogCi0tIAoyLjQ3LjEKCg==

--===============9009099125940845406==--

