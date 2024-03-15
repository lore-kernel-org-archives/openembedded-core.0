Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BAAC54EC7
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1236.1710522010877365333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bRb+pWMp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TqfLtdTr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e430e8c42-a552ee46-423c-4177-83e0-fd61cfe6d5ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/FSkh8b2PVRRrLXmFXg7/ic052IUMhdRGpWxEpKCY8s=;
	b=bRb+pWMp72v695H+nABDfU4Rj4hjJ6AWOka/p/Bzzl5xuIOgq08YUru21l+va7kU
	xJVxx3VL0E0DpFO/90kQ5DKzpAbp8wvdqxesT76UxMfPemLFCH76rry/Pql6bvnfQdq
	LRh7Qo8BS2B/ZIHj1ziUG4dp6g1VFS7qcWLZGrdI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/FSkh8b2PVRRrLXmFXg7/ic052IUMhdRGpWxEpKCY8s=;
	b=TqfLtdTrmS2wV3Axloc0Dnc7nwXzJR/XmJddOl/5s47fWwPgn+qLCi++PFT08/rG
	3oWWDTpDH/Jlcg59Rna+vFZaKitNo3HirAuWjBUCxfHBRTsuCugTYWxGXOH5dj7Vdzp
	tiwjyu+WcVdAcrdMbASuauJJXqwhUwZfps4HLK+k=
Content-Type: multipart/mixed; boundary="===============5431295003084291246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.4.0 SUCCEEDED
Message-ID: <0101018e430e8c42-a552ee46-423c-4177-83e0-fd61cfe6d5ee-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197153

--===============5431295003084291246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.3.1-1.4.0.patch
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
From 38f7038b83c2bfc654033ed872f06f7b3b204b7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 07:39:24 +0000
Subject: [PATCH] meson: upgrade 1.3.1 -> 1.4.0

---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch   | 11 +++++------
 ...odule-do-not-manipulate-the-environment-when.patch |  9 ++++-----
 .../0002-Support-building-allarch-recipes-again.patch |  7 +++----
 .../meson/{meson_1.3.1.bb => meson_1.4.0.bb}          |  2 +-
 4 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.3.1.bb => meson_1.4.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8ea7c35950..9ec3ce2538 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,21 +1,20 @@
-From b77cbe67df5fa0998946503f207c256ee740bb5f Mon Sep 17 00:00:00 2001
+From e8b02d14cb7ba99ad5fa8ff70901fd31d2506503 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  mesonbuild/envconfig.py   | 4 ++--
  mesonbuild/environment.py | 6 ++----
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 07f1229..a35c356 100644
+index 0e9cd23..b44e60c 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -285,8 +285,8 @@ class MachineInfo(HoldableObject):
+@@ -276,8 +276,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -27,10 +26,10 @@ index 07f1229..a35c356 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2ba2054..d798e3b 100644
+index af69f64..248d6dd 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -359,10 +359,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 2e0a4b1bbe..13257ff97f 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From e85683698aa3556bf14fc6d35f2c067f16af520b Mon Sep 17 00:00:00 2001
+From 5b1c897d5b6e688f901043fda21502cca26bb08b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -6,16 +6,15 @@ Subject: [PATCH] python module: do not manipulate the environment when calling
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  mesonbuild/dependencies/python.py | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 9aea6bd..8c13ede 100644
+index b9b17f8..a305afb 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -380,9 +380,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +24,7 @@ index 9aea6bd..8c13ede 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -391,8 +388,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -392,8 +389,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index a8396f30bb..c82aa66651 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6fb8db54929b40e1fd7ac949ef44f0d37df0bae9 Mon Sep 17 00:00:00 2001
+From 2f2cd2781dd3af6daf6e98b4476aa5f659f721f0 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -7,16 +7,15 @@ This registers "allarch" as a known CPU family.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
 ---
  mesonbuild/envconfig.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index a35c356..436355f 100644
+index b44e60c..c70e8cb 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -38,6 +38,7 @@ from pathlib import Path
+@@ -28,6 +28,7 @@ from pathlib import Path
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.4.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.3.1.bb
rename to meta/recipes-devtools/meson/meson_1.4.0.bb
index 3a4bb14f09..8011fdbc15 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
+SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.42.0


--===============5431295003084291246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.3.1/meson-1.3.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.4.0/meson-1.4.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5359 to 5356 (-0%)
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7993826 to 7973921 (-0%)
packages/core2-64-poky-linux/meson/meson: PV changed from "1.3.1" to "1.4.0"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info

--===============5431295003084291246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info

--===============5431295003084291246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.3.1-1.4.0.patch"

RnJvbSAzOGY3MDM4YjgzYzJiZmM2NTQwMzNlZDg3MmYwNmY3YjNiMjA0YjdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDc6Mzk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjMuMSAtPiAxLjQuMAoKLS0tCiAuLi4vbWVzb24vMDAwMS1NYWtlLUNQ
VS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICB8IDExICsrKysrLS0tLS0tCiAuLi5vZHVs
ZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaCB8ICA5ICsrKyst
LS0tLQogLi4uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0
Y2ggfCAgNyArKystLS0tCiAuLi4vbWVzb24ve21lc29uXzEuMy4xLmJiID0+IG1lc29uXzEuNC4w
LmJifSAgICAgICAgICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi97bWVz
b25fMS4zLjEuYmIgPT4gbWVzb25fMS40LjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdz
LWZhdGFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFr
ZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCmluZGV4IDhlYTdjMzU5NTAuLjllYzNj
ZTI1MzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAx
LU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwu
cGF0Y2gKQEAgLTEsMjEgKzEsMjAgQEAKLUZyb20gYjc3Y2JlNjdkZjVmYTA5OTg5NDY1MDNmMjA3
YzI1NmVlNzQwYmI1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZThiMDJkMTRjYjdi
YTk5YWQ1ZmE4ZmY3MDkwMWZkMzFkMjUwNjUwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMgSnVs
IDIwMTggMTM6NTk6MDkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdh
cm5pbmdzIGZhdGFsCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3BlY2lm
aWNdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgot
CiAtLS0KICBtZXNvbmJ1aWxkL2VudmNvbmZpZy5weSAgIHwgNCArKy0tCiAgbWVzb25idWlsZC9l
bnZpcm9ubWVudC5weSB8IDYgKystLS0tCiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5w
eSBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCAwN2YxMjI5Li5hMzVjMzU2IDEwMDY0
NAoraW5kZXggMGU5Y2QyMy4uYjQ0ZTYwYyAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52Y29u
ZmlnLnB5CiArKysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotQEAgLTI4NSw4ICsyODUsOCBA
QCBjbGFzcyBNYWNoaW5lSW5mbyhIb2xkYWJsZU9iamVjdCk6CitAQCAtMjc2LDggKzI3Niw4IEBA
IGNsYXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKICAgICAgICAgICAgICAgICAgJ2J1
dCBpcyBtaXNzaW5nIHt9LicuZm9ybWF0KG1pbmltdW1fbGl0ZXJhbCAtIHNldChsaXRlcmFsKSkp
CiAgCiAgICAgICAgICBjcHVfZmFtaWx5ID0gbGl0ZXJhbFsnY3B1X2ZhbWlseSddCkBAIC0yNywx
MCArMjYsMTAgQEAgaW5kZXggMDdmMTIyOS4uYTM1YzM1NiAxMDA2NDQKICAgICAgICAgIGVuZGlh
biA9IGxpdGVyYWxbJ2VuZGlhbiddCiAgICAgICAgICBpZiBlbmRpYW4gbm90IGluICgnbGl0dGxl
JywgJ2JpZycpOgogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkgYi9tZXNv
bmJ1aWxkL2Vudmlyb25tZW50LnB5Ci1pbmRleCAyYmEyMDU0Li5kNzk4ZTNiIDEwMDY0NAoraW5k
ZXggYWY2OWY2NC4uMjQ4ZDZkZCAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52aXJvbm1lbnQu
cHkKICsrKyBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKLUBAIC0zNTksMTAgKzM1OSw4IEBA
IGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6IENvbXBpbGVyc0RpY3QpIC0+IHN0cjoK
K0BAIC0zNzksMTAgKzM3OSw4IEBAIGRlZiBkZXRlY3RfY3B1X2ZhbWlseShjb21waWxlcnM6IENv
bXBpbGVyc0RpY3QpIC0+IHN0cjoKICAgICAgICAgIGlmIGNvbXBpbGVycyBhbmQgbm90IGFueV9j
b21waWxlcl9oYXNfZGVmaW5lKGNvbXBpbGVycywgJ19fbWlwczY0Jyk6CiAgICAgICAgICAgICAg
dHJpYWwgPSAnbWlwcycKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25t
ZW50LXdoZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1w
eXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNo
CmluZGV4IDJlMGE0YjFiYmUuLjEzMjU3ZmY5N2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUt
dGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21l
c29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJv
bm1lbnQtd2hlbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTg1NjgzNjk4YWEzNTU2YmYx
NGZjNmQzNWYyYzA2N2YxNmFmNTIwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWIx
Yzg5N2Q1YjZlNjg4ZjkwMTA0M2ZkYTIxNTAyY2NhMjZiYjA4YiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogTW9uLCAxOSBOb3YgMjAxOCAxNDoyNDoyNiArMDEwMAogU3ViamVjdDogW1BBVENIXSBw
eXRob24gbW9kdWxlOiBkbyBub3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgd2hlbiBjYWxs
aW5nCkBAIC02LDE2ICs2LDE1IEBAIFN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uIG1vZHVsZTogZG8g
bm90IG1hbmlwdWxhdGUgdGhlIGVudmlyb25tZW50IHdoZW4gY2FsbGluZwogCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgbWVzb25i
dWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5IHwgNiArLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxk
L2RlcGVuZGVuY2llcy9weXRob24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24u
cHkKLWluZGV4IDlhZWE2YmQuLjhjMTNlZGUgMTAwNjQ0CitpbmRleCBiOWIxN2Y4Li5hMzA1YWZi
IDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiArKysgYi9t
ZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKLUBAIC0zODAsOSArMzgwLDYgQEAgZGVm
IHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5l
Q2hvaWNlJywKK0BAIC0zODEsOSArMzgxLDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vu
dmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAgICAg
ICAgICAgIGVtcHR5Lm5hbWUgPSAncHl0aG9uJwogICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGVtcHR5CiAgCkBAIC0yNSw3ICsyNCw3IEBAIGluZGV4IDlhZWE2YmQuLjhjMTNlZGUgMTAwNjQ0
CiAgICAgICAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQeXRo
b25Qa2dDb25maWdEZXBlbmRlbmN5KG5hbWUsIGVudiwga3dhcmdzLCBpbnN0YWxsYXRpb24sIFRy
dWUpCiAgICAgICAgICAgICAgICAgIGZpbmFsbHk6Ci1AQCAtMzkxLDggKzM4OCw3IEBAIGRlZiBw
eXRob25fZmFjdG9yeShlbnY6ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNo
b2ljZScsCitAQCAtMzkyLDggKzM4OSw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6ICdFbnZp
cm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNob2ljZScsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9zLmVudmlyb25bbmFtZV0gPSB2YWx1ZQogICAgICAgICAgICAgICAgICAg
ICAgICAgIGVsaWYgbmFtZSBpbiBvcy5lbnZpcm9uOgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZWwgb3MuZW52aXJvbltuYW1lXQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdh
aW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0
LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCBhODM5NmYzMGJiLi5j
ODJhYTY2NjUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24v
MDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFs
bGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmZiOGRiNTQ5
MjliNDBlMWZkN2FjOTQ5ZWY0NGYwZDM3ZGYwYmFlOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmYyY2QyNzgxZGQzYWY2ZGFmNmU5OGI0NDc2YWE1ZjY1OWY3MjFmMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29tPgog
RGF0ZTogVGh1LCAyNiBKdWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBT
dXBwb3J0IGJ1aWxkaW5nIGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpAQCAtNywxNiArNywxNSBAQCBU
aGlzIHJlZ2lzdGVycyAiYWxsYXJjaCIgYXMgYSBrbm93biBDUFUgZmFtaWx5LgogCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogUGV0
ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+Ci0KIC0tLQogIG1l
c29uYnVpbGQvZW52Y29uZmlnLnB5IHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weSBiL21lc29uYnVpbGQv
ZW52Y29uZmlnLnB5Ci1pbmRleCBhMzVjMzU2Li40MzYzNTVmIDEwMDY0NAoraW5kZXggYjQ0ZTYw
Yy4uYzcwZThjYiAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiArKysgYi9t
ZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotQEAgLTM4LDYgKzM4LDcgQEAgZnJvbSBwYXRobGliIGlt
cG9ydCBQYXRoCitAQCAtMjgsNiArMjgsNyBAQCBmcm9tIHBhdGhsaWIgaW1wb3J0IFBhdGgKICAK
ICAKICBrbm93bl9jcHVfZmFtaWxpZXMgPSAoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbWVzb24vbWVzb25fMS4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb25fMS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjAuYmIKaW5kZXggM2E0YmIxNGYwOS4uODAxMWZkYmMx
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMy4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYgpAQCAtMTUs
NyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9t
ZXNvbi0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlLUNQVS1mYW1p
bHktd2FybmluZ3MtZmF0YWwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0
LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI2MDIwNTY4YmRlZGUxNjQzZDRmYjQxZTI4MjE1YmUzOGVmZjVk
NTJkYTI4YWM3ZDEyNTQ1N2M1OWUwMDMyYWQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmZDY2
MzBjMjVjMjdmMTQ4OWE4YTAzOTJiMzExYTYwNDgxYTNjMTYxYWE2OTliMzMwZTI1OTM1Yjc1MDEz
OGQiCiAKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFz
ZXMKIAotLSAKMi40Mi4wCgo=

--===============5431295003084291246==--

