Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1051ED58B36
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28962.1773582108948342332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ynqZagkl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cq7DY37d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb6add-eb3e82c9-dbe5-441e-8d10-17716f9fd62c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g1GMYVB+N7L8ND1EFOeQ3T0kvc1crge3lIvCtJgd7v4=;
	b=ynqZagkl5HAFD0MonswaS6wJGVNW3B86TjHXgm4hcS7sK++H297tpH1s9Ew9P4+B
	y9jLbpMBAfQGNhAR+Tj84BI0mxCEb1tJWOItg8J1BpfFp5F2s76S6SnEs6p/6r5eAx9
	aC77YmFxQs6De5zxnSnwI86+RXHVej3HMbD4E954=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g1GMYVB+N7L8ND1EFOeQ3T0kvc1crge3lIvCtJgd7v4=;
	b=cq7DY37d0jShUGhdIfQcXmOv1ZfTSjhmA63jKEWYCBAPZNuLMGBG2r4oBUbpKOgd
	KRmlCuEGQs9kR+YMtSY3PAqYl7ODs7rcLHB4kixI3SYkD0XqJ7xXHpqJ250Cl9g6MVY
	DBlzG4/08TqcUuHl4dEERettUT0W35QAyhNPIBCk=
Content-Type: multipart/mixed; boundary="===============5857163562778746458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 82.0.1 SUCCEEDED
Message-ID: <0101019cf1bb6add-eb3e82c9-dbe5-441e-8d10-17716f9fd62c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233148

--===============5857163562778746458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *82.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-82.0.0-82.0.1.patch
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
From 80c9bd60de57f78acdb7ff61d883c7520d2a8802 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:28:26 +0000
Subject: [PATCH] python3-setuptools: upgrade 82.0.0 -> 82.0.1

---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...ython3-setuptools_82.0.0.bb => python3-setuptools_82.0.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_82.0.0.bb => python3-setuptools_82.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 0fc5e3f134..297974571e 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From cb37237fd60689ccf999689ff60acabe8e1ec1de Mon Sep 17 00:00:00 2001
+From c7530ace5e2cd2c281d0bdc1cfa1b7c9873ee769 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
index a6b48bf145..a3943a29c3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
+SRC_URI[sha256sum] = "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
-- 
2.47.1


--===============5857163562778746458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-82.0.0-82.0.1.patch"

RnJvbSA4MGM5YmQ2MGRlNTdmNzhhY2RiN2ZmNjFkODgzYzc1MjBkMmE4ODAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6Mjg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgODIuMC4wIC0+IDgyLjAuMQoKLS0tCiAuLi4xLV9k
aXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gg
fCAyICstCiAuLi55dGhvbjMtc2V0dXB0b29sc184Mi4wLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRv
b2xzXzgyLjAuMS5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfODIuMC4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184Mi4wLjEuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxl
LXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxl
LXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IDBmYzVlM2YxMzQuLjI5Nzk3NDU3MWUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEt
X2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8w
MDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNiMzcyMzdmZDYwNjg5Y2NmOTk5Njg5ZmY2MGFj
YWJlOGUxZWMxZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM3NTMwYWNlNWUyY2Qy
YzI4MWQwYmRjMWNmYTFiN2M5ODczZWU3NjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxMSBN
YXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxzL3N5c2Nv
bmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184Mi4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMS5iYgppbmRleCBhNmI0
OGJmMTQ1Li5hMzk0M2EyOWMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29sc184Mi4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODIuMC4xLmJiCkBAIC0xMSw3ICsxMSw3IEBA
IENWRV9QUk9EVUNUID0gInB5dGhvbjMtc2V0dXB0b29scyBweXRob246c2V0dXB0b29scyIKIFNS
Q19VUkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZp
Zy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjJlMGEyZDY5NDc0YzZhZTRmZWIwMTk1MWNiNjlkNTE1ZWQyMzcyOGNmOTZkMDU1
MTNkMzZlNDJiNjJiMzdjYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZDg3MjY4MmM1ZDAxY2Zk
ZTA3ZGE3YmNjYzdiNjU0NjlkM2RjYTIwMzMxODUxNWFkYTFkZTVlZGEzNWVmYmY5IgogCiBkb19p
bnN0YWxsOmFwcGVuZCgpIHsKIAkjIHNldHVwdG9vbHMgc2hpcHMgV2luZG93cyBsYXVuY2hlciBl
eGVjdXRhYmxlcyAoY2xpKi5leGUsIGd1aSouZXhlKS4KLS0gCjIuNDcuMQoK

--===============5857163562778746458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-82.0.0.tar.gz;downloadfilename=setuptools-82.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-82.0.1.tar.gz;downloadfilename=setuptools-82.0.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml", added "/usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "82.0.0" to "82.0.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 82.0.0 [default] to 82.0.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 7244409 to 7281940 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml was added
  /usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml was added
  /usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml was removed

--===============5857163562778746458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml", added "/usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml was added
  /usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/launcher manifest.xml was added
  /usr/lib/python3.14/site-packages/setuptools/command/launcher manifest.xml was removed

--===============5857163562778746458==--

