Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DBBCD6E68
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1567.1780328135766696445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BNwr/xBF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o6jOTQCv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d38270-7f279e9a-cdd2-43ca-8e5b-caf9ea2839a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DK1E8CSCQxSM1zIBfgxe7ZPB79aqZGcyH7Dhb4cA9l0=;
	b=BNwr/xBFyc2aWk9+2zWhqjTmeeNatGZF4+LxyT5u9tzEr+lnYBUQcobmLU80amMw
	wuuLj/gor0WsliZjZ5n7TcndpIt7iyICq80o5w/qyEpUS8oGnDEQGMXsdpFziEMaR/y
	GMGmBZNioHN2iNS2ULsrCr69SEJmC9Mip4mpPJ9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DK1E8CSCQxSM1zIBfgxe7ZPB79aqZGcyH7Dhb4cA9l0=;
	b=o6jOTQCvB7TOp4X/vK4pA1944Tww934MITVWpiYlep/ieHIbGz3UP099hAAIvRDB
	YIKjKb1vCGvxYb3JozoOn1OqCuSQZdnCHfp8Qi6e3pm3Trljqq4htP5/cql3uzRAAMx
	Pwvei4RKMpn18jDq46eGv3tgYtuk74w8UepXLaYQ=
Content-Type: multipart/mixed; boundary="===============2190460902933073924=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.5 SUCCEEDED
Message-ID: <0101019e83d38270-7f279e9a-cdd2-43ca-8e5b-caf9ea2839a5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237875

--===============2190460902933073924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.4-3.2.5.patch
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
From 87c06daf353e2eedc2529d14c0735f57ef31ba93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:19:14 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.4 -> 3.2.5

---
 ...Replace-not-predictable-build-path-prefix-with-hardc.patch | 4 ++--
 .../{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb}      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index d232f58e02..15041fe16b 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 77c73d8c317224f66af66521f8cfe7a8e5491136 Mon Sep 17 00:00:00 2001
+From 0aa4025f9cc9c18c30c795da03936e003f61a152 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,7 +53,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index c1d8783..f24b2d9 100644
+index 30e67aa..ade6a7f 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.4.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.5.bb
index 3e889857e1..373387576a 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "84226ecd313b233da27dc2eb3601b4f222b8209c3a7216d8733b031da1dc64e6"
+SRC_URI[sha256sum] = "3dd42e4cf36ad15f265bdfec2337cc00c688c8eb6d374ffd13bb19437c27bba1"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============2190460902933073924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info

--===============2190460902933073924==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.4-3.2.5.patch"

RnJvbSA4N2MwNmRhZjM1M2UyZWVkYzI1MjlkMTRjMDczNWY1N2VmMzFiYTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODoxOToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMi40IC0+IDMuMi41CgotLS0KIC4uLlJlcGxhY2Utbm90
LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggfCA0ICsrLS0K
IC4uLi97cHl0aG9uMy1jeXRob25fMy4yLjQuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4yLjUuYmJ9
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhv
bl8zLjIuNC5iYiA9PiBweXRob24zLWN5dGhvbl8zLjIuNS5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFj
ZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5v
dC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4IGQy
MzJmNThlMDIuLjE1MDQxZmUxNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1w
YXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1w
YXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3N2M3M2Q4
YzMxNzIyNGY2NmFmNjY1MjFmOGNmZTdhOGU1NDkxMTM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAwYWE0MDI1ZjljYzljMThjMzBjNzk1ZGEwMzkzNmUwMDNmNjFhMTUyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogV2VkLCAxNyBTZXAgMjAyNSAwMTo0MjowOCAtMDcwMAogU3ViamVjdDogW1BB
VENIXSBSZXBsYWNlIG5vdCBwcmVkaWN0YWJsZSBidWlsZCBwYXRoIHByZWZpeCB3aXRoIGhhcmRj
b2RlCkBAIC01Myw3ICs1Myw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weSBi
L0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5Ci1pbmRleCBjMWQ4NzgzLi5mMjRiMmQ5IDEw
MDY0NAoraW5kZXggMzBlNjdhYS4uYWRlNmE3ZiAxMDA2NDQKIC0tLSBhL0N5dGhvbi9Db21waWxl
ci9Nb2R1bGVOb2RlLnB5CiArKysgYi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQogQEAg
LTg3Nyw3ICs4NzcsOSBAQCBjbGFzcyBNb2R1bGVOb2RlKE5vZGVzLk5vZGUsIE5vZGVzLkJsb2Nr
Tm9kZSk6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3l0aG9uXzMuMi40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5
dGhvbl8zLjIuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi41LmJiCmluZGV4IDNl
ODg5ODU3ZTEuLjM3MzM4NzU3NmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMy4yLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuNS5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9
ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjFjM2VlODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2
OWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDIyNmVjZDMxM2IyMzNkYTI3ZGMyZWIzNjAx
YjRmMjIyYjgyMDljM2E3MjE2ZDg3MzNiMDMxZGExZGM2NGU2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjNkZDQyZTRjZjM2YWQxNWYyNjViZGZlYzIzMzdjYzAwYzY4OGM4ZWI2ZDM3NGZmZDEzYmIx
OTQzN2MyN2JiYTEiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBjeXRob24KIAotLSAKMi40
Ny4xCgo=

--===============2190460902933073924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.4.tar.gz;downloadfilename=cython-3.2.4.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.5.tar.gz;downloadfilename=cython-3.2.5.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27124744 to 27172376 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Compiler -> /usr/src/debug/python3-cython/3.2.5/Cython/Compiler, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython -> /usr/src/debug/python3-cython/3.2.5/Cython, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Plex -> /usr/src/debug/python3-cython/3.2.5/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Runtime -> /usr/src/debug/python3-cython/3.2.5/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Tempita -> /usr/src/debug/python3-cython/3.2.5/Cython/Tempita
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23716417 to 23735594 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15314718 to 15319946 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.4" to "3.2.5"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info

--===============2190460902933073924==--

