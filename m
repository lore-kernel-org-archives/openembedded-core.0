Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3E2C30654
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.173805.1692224344374195908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JzTfZuI0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KH/zXp2f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e4dd6-7b39dfb1-c572-4694-acc9-c17aa0d07414-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EJKAPA84UIKh+BHVUBMKZR2+92/tWQZA5fm3SIU295s=;
	b=JzTfZuI0Gl9lHYq39WgkSZTlKLfzhaoI6LCP9/UyCfQUeMfCJYVN16TCOri9I1G/
	8PJbumtHvJcUaoKqi9kuvpoVzYedtMypNKgsbwV2jZTd5o9qbFvm7diccpYTEsjzqjx
	vX0clsMLr+Jpsug2TiTnLwe96V1TjlSUyceAd1UA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EJKAPA84UIKh+BHVUBMKZR2+92/tWQZA5fm3SIU295s=;
	b=KH/zXp2f5VqI9mAbDhLkGvcoeMPmsXXNO5Yz9FFmS4yVzElwvoEEsmYWvcisCxMv
	xcIFMYbGIN9pgKaIxu3AxhPh5eBuRljAjPZjYm4bKeciipfkUz4evL6kDr5fwdxAOnC
	ip0phE0LS/0QEylyxgChuJK8OZ6bgEwJUAhfDQv0=
Content-Type: multipart/mixed; boundary="===============4676877040073219737=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101018a006e4dd6-7b39dfb1-c572-4694-acc9-c17aa0d07414-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186176

--===============4676877040073219737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.1.1-1.2.1.patch
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
From 7766074671604211df9f8f912c39c0de64198230 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 03:48:03 +0000
Subject: [PATCH] meson: upgrade 1.1.1 -> 1.2.1

---
 .../0001-Make-CPU-family-warnings-fatal.patch | 32 +++++++++----------
 .../meson/{meson_1.1.1.bb => meson_1.2.1.bb}  |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.1.1.bb => meson_1.2.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 848dccfbe7..0f9ab20ab7 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
+From 8a6bae62934926c5ad791c46f7590f34e95fb618 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -7,15 +7,15 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- mesonbuild/envconfig.py   | 2 +-
- mesonbuild/environment.py | 4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
+ mesonbuild/envconfig.py   | 4 ++--
+ mesonbuild/environment.py | 6 ++----
+ 2 files changed, 4 insertions(+), 6 deletions(-)
 
-Index: meson-0.60.2/mesonbuild/envconfig.py
-===================================================================
---- meson-0.60.2.orig/mesonbuild/envconfig.py
-+++ meson-0.60.2/mesonbuild/envconfig.py
-@@ -266,8 +266,8 @@ class MachineInfo(HoldableObject):
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index 7e0c567..a180065 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -284,8 +284,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,13 +26,13 @@ Index: meson-0.60.2/mesonbuild/envconfig.py
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-Index: meson-0.60.2/mesonbuild/environment.py
-===================================================================
---- meson-0.60.2.orig/mesonbuild/environment.py
-+++ meson-0.60.2/mesonbuild/environment.py
-@@ -354,10 +354,8 @@ def detect_cpu_family(compilers: Compile
-         if any_compiler_has_define(compilers, '__64BIT__'):
-             trial = 'ppc64'
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index e212c7a..9d2bff3 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -345,10 +345,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+         if compilers and not any_compiler_has_define(compilers, '__mips64'):
+             trial = 'mips'
  
 -    if trial not in known_cpu_families:
 -        mlog.warning(f'Unknown CPU family {trial!r}, please report this at '
diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-devtools/meson/meson_1.2.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.1.1.bb
rename to meta/recipes-devtools/meson/meson_1.2.1.bb
index 500e13775f..75f4c99a14 100644
--- a/meta/recipes-devtools/meson/meson_1.1.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.2.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c"
+SRC_URI[sha256sum] = "b1db3a153087549497ee52b1c938d2134e0338214fe14f7efd16fecd57b639f5"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.39.2


--===============4676877040073219737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.1.1/meson-1.1.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.2.1/meson-1.2.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-32-poky-linux/meson: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5354 to 5357 (+0%)
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info -> /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info, added "/usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/cfg.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/linkers/__pycache__/base.cpython-311.pyc /usr/lib/p
 ython3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/version.py /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7977816 to 8349305 (+5%)
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info
  /usr/lib/python3.11/site-packages/mesonbuild/cargo was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/cfg.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__ was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/version.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/linkers/__pycache__/base.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py was added

--===============4676877040073219737==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.1.1-1.2.1.patch"

RnJvbSA3NzY2MDc0NjcxNjA0MjExZGY5ZjhmOTEyYzM5YzBkZTY0MTk4MjMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDM6NDg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjEuMSAtPiAxLjIuMQoKLS0tCiAuLi4vMDAwMS1NYWtlLUNQVS1mYW1p
bHktd2FybmluZ3MtZmF0YWwucGF0Y2ggfCAzMiArKysrKysrKystLS0tLS0tLS0tCiAuLi4vbWVz
b24ve21lc29uXzEuMS4xLmJiID0+IG1lc29uXzEuMi4xLmJifSAgfCAgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29uXzEuMS4xLmJiID0+IG1lc29uXzEuMi4xLmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAx
LU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRj
aAppbmRleCA4NDhkY2NmYmU3Li4wZjlhYjIwYWI3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1D
UFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YzRl
ZWYxZDkyZTllNDJmZGJjODg4MzY1Y2FiM2M5NWZiMzNjNjA1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA4YTZiYWU2MjkzNDkyNmM1YWQ3OTFjNDZmNzU5MGYzNGU5NWZiNjE4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVs
LmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAxOCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BB
VENIXSBNYWtlIENQVSBmYW1pbHkgd2FybmluZ3MgZmF0YWwKQEAgLTcsMTUgKzcsMTUgQEAgVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAKIC0tLQotIG1lc29uYnVpbGQv
ZW52Y29uZmlnLnB5ICAgfCAyICstCi0gbWVzb25idWlsZC9lbnZpcm9ubWVudC5weSB8IDQgKy0t
LQotIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQorIG1l
c29uYnVpbGQvZW52Y29uZmlnLnB5ICAgfCA0ICsrLS0KKyBtZXNvbmJ1aWxkL2Vudmlyb25tZW50
LnB5IHwgNiArKy0tLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKIAotSW5kZXg6IG1lc29uLTAuNjAuMi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQot
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotLS0tIG1lc29uLTAuNjAuMi5vcmlnL21lc29uYnVpbGQvZW52Y29uZmlnLnB5
Ci0rKysgbWVzb24tMC42MC4yL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1AQCAtMjY2LDggKzI2
Niw4IEBAIGNsYXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKK2RpZmYgLS1naXQgYS9t
ZXNvbmJ1aWxkL2VudmNvbmZpZy5weSBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CitpbmRleCA3
ZTBjNTY3Li5hMTgwMDY1IDEwMDY0NAorLS0tIGEvbWVzb25idWlsZC9lbnZjb25maWcucHkKKysr
KyBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CitAQCAtMjg0LDggKzI4NCw4IEBAIGNsYXNzIE1h
Y2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKICAgICAgICAgICAgICAgICAgJ2J1dCBpcyBtaXNz
aW5nIHt9LicuZm9ybWF0KG1pbmltdW1fbGl0ZXJhbCAtIHNldChsaXRlcmFsKSkpCiAgCiAgICAg
ICAgICBjcHVfZmFtaWx5ID0gbGl0ZXJhbFsnY3B1X2ZhbWlseSddCkBAIC0yNiwxMyArMjYsMTMg
QEAgSW5kZXg6IG1lc29uLTAuNjAuMi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQogIAogICAgICAg
ICAgZW5kaWFuID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlhbiBub3QgaW4g
KCdsaXR0bGUnLCAnYmlnJyk6Ci1JbmRleDogbWVzb24tMC42MC4yL21lc29uYnVpbGQvZW52aXJv
bm1lbnQucHkKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KLS0tLSBtZXNvbi0wLjYwLjIub3JpZy9tZXNvbmJ1aWxkL2Vu
dmlyb25tZW50LnB5Ci0rKysgbWVzb24tMC42MC4yL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkK
LUBAIC0zNTQsMTAgKzM1NCw4IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6IENv
bXBpbGUKLSAgICAgICAgIGlmIGFueV9jb21waWxlcl9oYXNfZGVmaW5lKGNvbXBpbGVycywgJ19f
NjRCSVRfXycpOgotICAgICAgICAgICAgIHRyaWFsID0gJ3BwYzY0JworZGlmZiAtLWdpdCBhL21l
c29uYnVpbGQvZW52aXJvbm1lbnQucHkgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5CitpbmRl
eCBlMjEyYzdhLi45ZDJiZmYzIDEwMDY0NAorLS0tIGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5w
eQorKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQorQEAgLTM0NSwxMCArMzQ1LDggQEAg
ZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgor
ICAgICAgICAgaWYgY29tcGlsZXJzIGFuZCBub3QgYW55X2NvbXBpbGVyX2hhc19kZWZpbmUoY29t
cGlsZXJzLCAnX19taXBzNjQnKToKKyAgICAgICAgICAgICB0cmlhbCA9ICdtaXBzJwogIAogLSAg
ICBpZiB0cmlhbCBub3QgaW4ga25vd25fY3B1X2ZhbWlsaWVzOgogLSAgICAgICAgbWxvZy53YXJu
aW5nKGYnVW5rbm93biBDUFUgZmFtaWx5IHt0cmlhbCFyfSwgcGxlYXNlIHJlcG9ydCB0aGlzIGF0
ICcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjEuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjIuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25f
MS4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjIu
MS5iYgppbmRleCA1MDBlMTM3NzVmLi43NWY0Yzk5YTE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uXzEuMi4xLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtH
SVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21lc29uLSR7UFZ9LnRhci5neiBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVz
LWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwNGI1
NDFmOTdjYTQzOWZiODJmYWI3ZDBkNDgwOTg4YmU0YmQ0ZTYyNTYzYTVjYTM1ZmFkYjU0MDA3Mjdi
MWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjFkYjNhMTUzMDg3NTQ5NDk3ZWU1MmIxYzkzOGQy
MTM0ZTAzMzgyMTRmZTE0ZjdlZmQxNmZlY2Q1N2I2MzlmNSIKIAogaW5oZXJpdCBweXRob25fc2V0
dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjM5LjIKCg==

--===============4676877040073219737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info -> /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info, added "/usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/cfg.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py /usr/lib/python3.11/site-packages/mesonbuild/linkers
 /__pycache__/base.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/version.py"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info
  /usr/lib/python3.11/site-packages/mesonbuild/cargo was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/cfg.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__ was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/cargo/version.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py was added
  /usr/lib/python3.11/site-packages/mesonbuild/linkers/__pycache__/base.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py was added

--===============4676877040073219737==--

