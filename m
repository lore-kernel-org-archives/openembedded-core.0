Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FBDC53200
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 05:53:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34891.1784958788272512404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 22:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WG5hRvbc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xwUiEyD2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f97d5a94d-a9153c3a-5808-4944-9722-2c4d357cfbc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784958790;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XUa8ZLltVYSYyAWDH0kMKh3r0NTn9VU1ryLPrmODF9w=;
	b=WG5hRvbcQyN1wemuwb3iazZFJs0k99I+9/rq2cqbzv5uxyAiz+HPPQ8/yqrgS/zw
	0qW3X8jp4i1JAgIbFVHWmMIu4UZ4z0A6zuW3DQaJg6JrfhTfLkCLDzzv5hX4nIhvyW+
	1tueYS2O2wFWF7tEGv60FVsrr90tXiD+OxNQV2Vg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784958790;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XUa8ZLltVYSYyAWDH0kMKh3r0NTn9VU1ryLPrmODF9w=;
	b=xwUiEyD23MVCkYEIED91KIg39ReiiC5l6SbFsM2t9rEvvOInfELNGAOuR/gUxqji
	DVwXRQuNbsbyoqyExe65Dy8qN9ldmZPHFLpc5cxkey++fPU0J+OZTybopq5puTUxLpa
	Mo5td9WJHcTkJs2BEphgcr3d643hBcI9Q1DtNjLs=
Content-Type: multipart/mixed; boundary="===============4702406492836896853=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.9 SUCCEEDED
Message-ID: <0101019f97d5a94d-a9153c3a-5808-4944-9722-2c4d357cfbc6-000000@us-west-2.amazonses.com>
Date: Sat, 25 Jul 2026 05:53:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 05:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241960

--===============4702406492836896853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.2.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.8-3.2.9.patch
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
From 42a6d3c1c90382e088215a53057cd7376810a7ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 25 Jul 2026 05:36:53 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.8 -> 3.2.9

Source: CHANGES.rst

3.2.9 (2026-07-23)
==================

Bugs fixed
----------

* Indexing into freshly created lists with an out-of-bounds index could crash.
  (Github issue :issue:`7793`)

* Function arguments with default values could end up uninitialised in closures, leading to crashes.
  Patch by Anthony Donlon.  (Github issue :issue:`7782`)

* ``bytearray.append(None)`` could crash. The optimised code was also lacking concurrency guards.
  (Github issue :issue:`7796`)

* Some rare corner cases when concatenating text strings were resolved.
  (Github issue :issue:`7799`)

* Assignments of builtin string types to typedefs of `object` could erroneously be rejected.
  (Github issue :issue:`7789`)

* Subscripting ``type`` failed with a ``TypeError``.
  (Github issue :issue:`5563`)

* Manually disabling ``CYTHON_VECTORCALL`` in CPython could lead to invalid C code.
  Patch by Florent Gallaire.  (Github issue :issue:`7807`)

* Some internal Limited API version checks for Py3.12 were corrected.
  (Github issue :issue:`7845`)
---
 ...1-Replace-not-predictable-build-path-prefix-with-hardc.patch | 2 +-
 .../python/{python3-cython_3.2.8.bb => python3-cython_3.2.9.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.8.bb => python3-cython_3.2.9.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..70816f1e9a 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From 3049f77949b9b41ed72f860c8c60fbc15e8bbeba Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.8.bb b/meta/recipes-devtools/python/python3-cython_3.2.9.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.8.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.9.bb
index e899fc411f..3457a91490 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.8.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.9.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "f4f23a56b25221a06f91817fe8f3114ab8b48a4fac73187dbb64bc2c4a87961f"
+SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============4702406492836896853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.8.tar.gz;downloadfilename=cython-3.2.8.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.9.tar.gz;downloadfilename=cython-3.2.9.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27360992 to 27446752 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.8/Cython/Compiler -> /usr/src/debug/python3-cython/3.2.9/Cython/Compiler, directory renamed /usr/src/debug/python3-cython/3.2.8/Cython/Plex -> /usr/src/debug/python3-cython/3.2.9/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.8/Cython/Runtime -> /usr/src/debug/python3-cython/3.2.9/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.8/Cython/Tempita -> /usr/src/debug/python3-cython/3.2.9/Cython/Tempita, directory renamed /usr/src/debug/python3-cython/3.2.8/Cython -> /usr/src/debug/python3-cython/3.2.9/Cython
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23843733 to 23866107 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.8 [default] to 3.2.9 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.8" to "3.2.9"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15359439 to 15365990 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info

--===============4702406492836896853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info

--===============4702406492836896853==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.8-3.2.9.patch"

RnJvbSA0MmE2ZDNjMWM5MDM4MmUwODgyMTVhNTMwNTdjZDczNzY4MTBhN2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjUgSnVsIDIwMjYgMDU6MzY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuOCAtPiAzLjIuOQoKU291cmNlOiBDSEFOR0VTLnJz
dAoKMy4yLjkgKDIwMjYtMDctMjMpCj09PT09PT09PT09PT09PT09PQoKQnVncyBmaXhlZAotLS0t
LS0tLS0tCgoqIEluZGV4aW5nIGludG8gZnJlc2hseSBjcmVhdGVkIGxpc3RzIHdpdGggYW4gb3V0
LW9mLWJvdW5kcyBpbmRleCBjb3VsZCBjcmFzaC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc5
M2ApCgoqIEZ1bmN0aW9uIGFyZ3VtZW50cyB3aXRoIGRlZmF1bHQgdmFsdWVzIGNvdWxkIGVuZCB1
cCB1bmluaXRpYWxpc2VkIGluIGNsb3N1cmVzLCBsZWFkaW5nIHRvIGNyYXNoZXMuCiAgUGF0Y2gg
YnkgQW50aG9ueSBEb25sb24uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc4MmApCgoqIGBgYnl0
ZWFycmF5LmFwcGVuZChOb25lKWBgIGNvdWxkIGNyYXNoLiBUaGUgb3B0aW1pc2VkIGNvZGUgd2Fz
IGFsc28gbGFja2luZyBjb25jdXJyZW5jeSBndWFyZHMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc3OTZgKQoKKiBTb21lIHJhcmUgY29ybmVyIGNhc2VzIHdoZW4gY29uY2F0ZW5hdGluZyB0ZXh0
IHN0cmluZ3Mgd2VyZSByZXNvbHZlZC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc5OWApCgoq
IEFzc2lnbm1lbnRzIG9mIGJ1aWx0aW4gc3RyaW5nIHR5cGVzIHRvIHR5cGVkZWZzIG9mIGBvYmpl
Y3RgIGNvdWxkIGVycm9uZW91c2x5IGJlIHJlamVjdGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3Vl
OmA3Nzg5YCkKCiogU3Vic2NyaXB0aW5nIGBgdHlwZWBgIGZhaWxlZCB3aXRoIGEgYGBUeXBlRXJy
b3JgYC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNTU2M2ApCgoqIE1hbnVhbGx5IGRpc2FibGlu
ZyBgYENZVEhPTl9WRUNUT1JDQUxMYGAgaW4gQ1B5dGhvbiBjb3VsZCBsZWFkIHRvIGludmFsaWQg
QyBjb2RlLgogIFBhdGNoIGJ5IEZsb3JlbnQgR2FsbGFpcmUuICAoR2l0aHViIGlzc3VlIDppc3N1
ZTpgNzgwN2ApCgoqIFNvbWUgaW50ZXJuYWwgTGltaXRlZCBBUEkgdmVyc2lvbiBjaGVja3MgZm9y
IFB5My4xMiB3ZXJlIGNvcnJlY3RlZC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzg0NWApCi0t
LQogLi4uMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhh
cmRjLnBhdGNoIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1jeXRob25fMy4yLjguYmIgPT4g
cHl0aG9uMy1jeXRob25fMy4yLjkuYmJ9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1jeXRob25fMy4yLjguYmIgPT4gcHl0aG9uMy1jeXRob25fMy4yLjkuYmJ9
ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdp
dGgtaGFyZGMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1o
YXJkYy5wYXRjaAppbmRleCA1NzNhNTNlZTU2Li43MDgxNmYxZTlhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3Qt
cHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3Qt
cHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gYTNiOWQ0MzAzYjZhYWY1ZWYyY2U5ZmZkMWJhNDJhOTNmOWNjNjhlMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzA0OWY3Nzk0OWI5YjQxZWQ3MmY4NjBjOGM2MGZi
YzE1ZThiYmViYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhv
bmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTcgU2VwIDIwMjUgMDE6NDI6MDgg
LTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVwbGFjZSBub3QgcHJlZGljdGFibGUgYnVpbGQgcGF0
aCBwcmVmaXggd2l0aCBoYXJkY29kZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMy4yLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuOC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8z
LjIuOS5iYgppbmRleCBlODk5ZmM0MTFmLi4zNDU3YTkxNDkwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi44LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjkuYmIKQEAgLTcsNyAr
Nyw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4
NjFmYTg2YzdlNjJiYzlmNjljIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjRmMjNhNTZiMjUy
MjFhMDZmOTE4MTdmZThmMzExNGFiOGI0OGE0ZmFjNzMxODdkYmI2NGJjMmM0YTg3OTYxZiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJkMjQ5YzkwMjJhYjEzMjg2YjE3YmQ2NmYzMDYwOWU4MDBjNWY5
NWVmZWVjYjA2MTY4OTkwYzdhNjZjZWNkZTZjIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMg
Y3l0aG9uCiAKLS0gCjIuNDcuMQoK

--===============4702406492836896853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cython-changelog.txt"

Changelog for python3-cython: 3.2.8 -> 3.2.9
Source: CHANGES.rst

3.2.9 (2026-07-23)
==================

Bugs fixed
----------

* Indexing into freshly created lists with an out-of-bounds index could crash.
  (Github issue :issue:`7793`)

* Function arguments with default values could end up uninitialised in closures, leading to crashes.
  Patch by Anthony Donlon.  (Github issue :issue:`7782`)

* ``bytearray.append(None)`` could crash. The optimised code was also lacking concurrency guards.
  (Github issue :issue:`7796`)

* Some rare corner cases when concatenating text strings were resolved.
  (Github issue :issue:`7799`)

* Assignments of builtin string types to typedefs of `object` could erroneously be rejected.
  (Github issue :issue:`7789`)

* Subscripting ``type`` failed with a ``TypeError``.
  (Github issue :issue:`5563`)

* Manually disabling ``CYTHON_VECTORCALL`` in CPython could lead to invalid C code.
  Patch by Florent Gallaire.  (Github issue :issue:`7807`)

* Some internal Limited API version checks for Py3.12 were corrected.
  (Github issue :issue:`7845`)

--===============4702406492836896853==--

