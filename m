Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AA3C54735
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.131443.1723748335571500591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=I5QH4QXT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b5NABDDC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019157683b85-b0618cec-3c98-4755-b4f1-9db4aaf66b7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pSzv/h7oUOmLNocOArR/2arlZoarnzwlySVbFuqfMtQ=;
	b=I5QH4QXTCsrRbwSYDhqowtA7FRoWb1/6yGULeKDVxPiFI0muCcmOwbFjiSGE7yQp
	1atdAUg1epnXCXicY76Cp9dEbVeUv9TVgmU3FyvS9w0J60c1XkR0oh1q0DmEDPBj8f3
	gKqSWx6tYDIBhk6jt/0qdk6K4kDql1YE7easljs0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pSzv/h7oUOmLNocOArR/2arlZoarnzwlySVbFuqfMtQ=;
	b=b5NABDDCy5mtYC2wykckx1dw7pjtALX3etCo6jQJlTANh+9nTowsA8nP5aGJRxld
	yaLQ0c/LBDzwKmgQn9+HupKN+s0VrBDyIQDind5rz0w1MQrsJPn0jRWg4g+z6DGMEnT
	54hLEaelhKAhCElqc5+u+xei7okGERxneA3iZKBE=
Content-Type: multipart/mixed; boundary="===============4893106931196205589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 72.2.0 SUCCEEDED
Message-ID: <0101019157683b85-b0618cec-3c98-4755-b4f1-9db4aaf66b7c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203429

--===============4893106931196205589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *72.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-72.1.0-72.2.0.patch
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
From cf8c416a7cdf5916cd85e6a42fdc812fa1b3037f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 12:14:42 +0000
Subject: [PATCH] python3-setuptools: upgrade 72.1.0 -> 72.2.0

---
 ...stutils-sysconfig.py-make-it-possible-to-substite.patch | 7 ++-----
 ...1-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_72.1.0.bb => python3-setuptools_72.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 68dca43e21..0a564aa1aa 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
+From 7354a694d70aff51f870929ea5aa949a10c6207e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 7ebe67687..8039021a8 100644
+index 7ebe676..8039021 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -121,6 +121,8 @@ def get_python_inc(plat_specific=False, prefix=None):
@@ -56,6 +56,3 @@ index 7ebe67687..8039021a8 100644
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
          if standard_lib:
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e227c2889c..b1e0a34425 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 80fe63816eb3bfd1f5b6d354e1f2442805cff4e0 Mon Sep 17 00:00:00 2001
+From f65d1b3cede0d9a8547785960a9a47e3e3b950b5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -14,7 +14,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 858fb20..62bd853 100644
+index 36114d4..3249ddf 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -672,6 +672,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
index 945d443aff..63ea999960 100644
--- a/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
+SRC_URI[sha256sum] = "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c13d3bcef91ac2ef9"
 
 DEPENDS += "python3"
 
-- 
2.44.0


--===============4893106931196205589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.2.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.2.0.dist-info

--===============4893106931196205589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-72.1.0.tar.gz;downloadfilename=setuptools-72.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-72.2.0.tar.gz;downloadfilename=setuptools-72.2.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-64-poky-linux/python3-setuptools: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 72.1.0 [default] to 72.2.0 [default]
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PV changed from "72.1.0" to "72.2.0"
packages/core2-64-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 10946861 to 10938626 (-0%)
Changes to packages/core2-64-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.2.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.12/site-packages/setuptools-72.1.0.dist-info moved to /usr/lib/python3.12/site-packages/setuptools-72.2.0.dist-info

--===============4893106931196205589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-72.1.0-72.2.0.patch"

RnJvbSBjZjhjNDE2YTdjZGY1OTE2Y2Q4NWU2YTQyZmRjODEyZmExYjMwMzdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTI6MTQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNzIuMS4wIC0+IDcyLjIuMAoKLS0tCiAuLi5zdHV0
aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIHwgNyAr
Ky0tLS0tCiAuLi4xLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0
YWxsLnBhdGNoIHwgNCArKy0tCiAuLi4zLXNldHVwdG9vbHNfNzIuMS4wLmJiID0+IHB5dGhvbjMt
c2V0dXB0b29sc183Mi4yLjAuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1zZXR1cHRvb2xzXzcyLjEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfNzIu
Mi4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAppbmRleCA2OGRjYTQzZTIxLi4wYTU2NGFhMWFhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3Rp
dGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1
YnN0aXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhOWYzNDgzYjQ5MjMxNzk1OWEzNTg4
NjMwOGMzMWMwNzhlMzUwYTM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MzU0YTY5
NGQ3MGFmZjUxZjg3MDkyOWVhNWFhOTQ5YTEwYzYyMDdlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFdl
ZCwgMTEgTWF5IDIwMjIgMjE6NDE6MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gX2Rpc3R1dGls
cy9zeXNjb25maWcucHk6IG1ha2UgaXQgcG9zc2libGUgdG8gc3Vic3RpdGUgdGhlCkBAIC0yMCw3
ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9zZXR1cHRvb2xzL19kaXN0dXRpbHMvc3lzY29uZmlnLnB5IGIvc2V0
dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQotaW5kZXggN2ViZTY3Njg3Li44MDM5MDIx
YTggMTAwNjQ0CitpbmRleCA3ZWJlNjc2Li44MDM5MDIxIDEwMDY0NAogLS0tIGEvc2V0dXB0b29s
cy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5
c2NvbmZpZy5weQogQEAgLTEyMSw2ICsxMjEsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9z
cGVjaWZpYz1GYWxzZSwgcHJlZml4PU5vbmUpOgpAQCAtNTYsNiArNTYsMyBAQCBpbmRleCA3ZWJl
Njc2ODcuLjgwMzkwMjFhOCAxMDA2NDQKICAgICAgICAgIHJldHVybiBfcG9zaXhfbGliKHN0YW5k
YXJkX2xpYiwgbGlicHl0aG9uLCBlYXJseV9wcmVmaXgsIHByZWZpeCkKICAgICAgZWxpZiBvcy5u
YW1lID09ICJudCI6CiAgICAgICAgICBpZiBzdGFuZGFyZF9saWI6Ci0tLSAKLTIuMzkuMgotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaApp
bmRleCBlMjI3YzI4ODljLi5iMWUwYTM0NDI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90
LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3Qt
ZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgw
ZmU2MzgxNmViM2JmZDFmNWI2ZDM1NGUxZjI0NDI4MDVjZmY0ZTAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGY2NWQxYjNjZWRlMGQ5YTg1NDc3ODU5NjBhOWE0N2UzZTNiOTUwYjUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFzeV9pbnN0YWxs
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFA
d2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5IGIvc2V0dXB0b29scy9j
b21tYW5kL2Vhc3lfaW5zdGFsbC5weQotaW5kZXggODU4ZmIyMC4uNjJiZDg1MyAxMDA2NDQKK2lu
ZGV4IDM2MTE0ZDQuLjMyNDlkZGYgMTAwNjQ0CiAtLS0gYS9zZXR1cHRvb2xzL2NvbW1hbmQvZWFz
eV9pbnN0YWxsLnB5CiArKysgYi9zZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5CiBA
QCAtNjcyLDYgKzY3MiwxMSBAQCBjbGFzcyBlYXN5X2luc3RhbGwoQ29tbWFuZCk6CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183Mi4x
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183
Mi4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183Mi4yLjAuYmIKaW5k
ZXggOTQ1ZDQ0M2FmZi4uNjNlYTk5OTk2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNzIuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzcyLjIuMC5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmRp
dGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VSSSArPSAiIFwKICAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUt
dG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZDI0M2VmZjU2ZDA5
NWU1ODE3Zjc5NmVkZTZhZTMyOTQxMjc4ZjU0MmUwZjk0MTg2N2NjMDVhZTUyYjE2MmVjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjgwYWFjYmY2MzM3MDRlOWM4YmZhMWQ5OWZhNWRkNGRjNTk1NzNl
ZmNmOWU0MDQyYzEzZDNiY2VmOTFhYzJlZjkiCiAKIERFUEVORFMgKz0gInB5dGhvbjMiCiAKLS0g
CjIuNDQuMAoK

--===============4893106931196205589==--

