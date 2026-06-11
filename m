Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48991CD98F4
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50613.1781195504555509130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XEQDInLn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1BVIL+xr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eb78678a8-621bb244-4d93-42d0-8b28-28c697aea05e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xioqzpMMwhw+1+EAKo+18mTUbbjGl7oJQLunDTRZhis=;
	b=XEQDInLn0V+rVzN8tJsGna4Wqwqyp6+D1Eo2L0An6K869bV5Ckcra0X4mfRsLTd+
	GxqWjFJLtgI+vVRQhyRcS1qL9Z1yanaXnwMe5fgCIfJpoKTZvdu64UI07cfNrWUJJ7u
	iB1UkSGIUStQHw1RmzJMgbz8LQ2pSW+qygXypI70=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195503;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xioqzpMMwhw+1+EAKo+18mTUbbjGl7oJQLunDTRZhis=;
	b=1BVIL+xrEsl3jVjl97F7MiHyLmD0qmbchUFuHTUrwx5IuFMKQp89OAdrk6wyzV5n
	YZoU3fTDcipKCWb28Z/nEsaZhpwsWPhzWMX08Fkd3y+Nwt8KwlcP8ovQWExAHqJEWFc
	6j1luhVqGoCbXZh+nKb546ffOyI3+FRxqgZunS9o=
Content-Type: multipart/mixed; boundary="===============3729940120066423663=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.5 SUCCEEDED
Message-ID: <0101019eb78678a8-621bb244-4d93-42d0-8b28-28c697aea05e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238489

--===============3729940120066423663==
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
From b0c290f93e329716b39482749af14cf4fd0f9261 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:21:10 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.4 -> 3.2.5

---
 ...Replace-not-predictable-build-path-prefix-with-hardc.patch | 4 ++--
 .../{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb}      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.4.bb => python3-cython_3.2.5.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index d232f58e02..fad7f28a60 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 77c73d8c317224f66af66521f8cfe7a8e5491136 Mon Sep 17 00:00:00 2001
+From 949e3c185719c37b3a3e4c11664db16533f51dc8 Mon Sep 17 00:00:00 2001
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


--===============3729940120066423663==
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
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.4/Cython -> /usr/src/debug/python3-cython/3.2.5/Cython, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Tempita -> /usr/src/debug/python3-cython/3.2.5/Cython/Tempita, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Plex -> /usr/src/debug/python3-cython/3.2.5/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Compiler -> /usr/src/debug/python3-cython/3.2.5/Cython/Compiler, directory renamed /usr/src/debug/python3-cython/3.2.4/Cython/Runtime -> /usr/src/debug/python3-cython/3.2.5/Cython/Runtime
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23716417 to 23735594 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.4" to "3.2.5"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.4 [default] to 3.2.5 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15314718 to 15319946 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.4" to "3.2.5"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info

--===============3729940120066423663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.4.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info

--===============3729940120066423663==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.4-3.2.5.patch"

RnJvbSBiMGMyOTBmOTNlMzI5NzE2YjM5NDgyNzQ5YWYxNGNmNGZkMGY5MjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MjE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuNCAtPiAzLjIuNQoKLS0tCiAuLi5SZXBsYWNlLW5v
dC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoIHwgNCArKy0t
CiAuLi4ve3B5dGhvbjMtY3l0aG9uXzMuMi40LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMi41LmJi
fSAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRo
b25fMy4yLjQuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4yLjUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxh
Y2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1u
b3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaAppbmRleCBk
MjMyZjU4ZTAyLi5mYWQ3ZjI4YTYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQt
cGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQt
cGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzdjNzNk
OGMzMTcyMjRmNjZhZjY2NTIxZjhjZmU3YThlNTQ5MTEzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTQ5ZTNjMTg1NzE5YzM3YjNhM2U0YzExNjY0ZGIxNjUzM2Y1MWRjOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KIERhdGU6IFdlZCwgMTcgU2VwIDIwMjUgMDE6NDI6MDggLTA3MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gUmVwbGFjZSBub3QgcHJlZGljdGFibGUgYnVpbGQgcGF0aCBwcmVmaXggd2l0aCBoYXJk
Y29kZQpAQCAtNTMsNyArNTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkg
Yi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQotaW5kZXggYzFkODc4My4uZjI0YjJkOSAx
MDA2NDQKK2luZGV4IDMwZTY3YWEuLmFkZTZhN2YgMTAwNjQ0CiAtLS0gYS9DeXRob24vQ29tcGls
ZXIvTW9kdWxlTm9kZS5weQogKysrIGIvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkKIEBA
IC04NzcsNyArODc3LDkgQEAgY2xhc3MgTW9kdWxlTm9kZShOb2Rlcy5Ob2RlLCBOb2Rlcy5CbG9j
a05vZGUpOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWN5dGhvbl8zLjIuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
eXRob25fMy4yLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuNS5iYgppbmRleCAz
ZTg4OTg1N2UxLi4zNzMzODc1NzZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjUuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04g
PSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4NjFmYTg2YzdlNjJiYzlm
NjljIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQyMjZlY2QzMTNiMjMzZGEyN2RjMmViMzYw
MWI0ZjIyMmI4MjA5YzNhNzIxNmQ4NzMzYjAzMWRhMWRjNjRlNiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzZGQ0MmU0Y2YzNmFkMTVmMjY1YmRmZWMyMzM3Y2MwMGM2ODhjOGViNmQzNzRmZmQxM2Ji
MTk0MzdjMjdiYmExIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgY3l0aG9uCiAKLS0gCjIu
NDcuMQoK

--===============3729940120066423663==--

