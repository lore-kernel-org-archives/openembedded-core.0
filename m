Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A950C54E92
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1300.1721071146269733676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ckyoqGpB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aLOL/XSR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d5930a-6900e983-9927-4027-98e8-62cb41339fa9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rUCSjO+DTAThliyzidhLxHEuYkmgMkib1/SeRk7EEsk=;
	b=ckyoqGpBitx6qCA8zuTt0E11QTJMrX/lwcMWirjUqgPyqfjfisOo7NMT3BfGZuHs
	vh1mI7lr1HUElVrs2n6M58vGT4w/wbf/DBbVNvRRhB+wRdMuvH77mNT6xOjv5+bB6ls
	1Afyjrd0gtIa2Fix4PBK6tnCrv/XX9pIS/8XZXbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rUCSjO+DTAThliyzidhLxHEuYkmgMkib1/SeRk7EEsk=;
	b=aLOL/XSRPj7JSQdiSfN4h/NE9kjniCGySZJbPNaUOpwZLQvqlokh3mdysigP13WA
	Wl50bS/VkJTKY9Yi3+yRVVUAsy7KOqT2gvPr+3/xH22T4ob4CrF5xegBvbqLiHrPojf
	EkHiSUJ86S6jtfjqv6OfbMIPBxw8Ax4na+DxljqY=
Content-Type: multipart/mixed; boundary="===============5411053728908742293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.5.0 SUCCEEDED
Message-ID: <01010190b7d5930a-6900e983-9927-4027-98e8-62cb41339fa9-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201959

--===============5411053728908742293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.4.0-1.5.0.patch
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
From 455e5d46caca0f0dbd36ba0dcd2fda18cfbf2337 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 10:04:25 +0000
Subject: [PATCH] meson: upgrade 1.4.0 -> 1.5.0

---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch    | 10 +++++-----
 ...module-do-not-manipulate-the-environment-when.patch |  8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch  |  4 ++--
 .../meson/{meson_1.4.0.bb => meson_1.5.0.bb}           |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.4.0.bb => meson_1.5.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 94129b2f25..b319eddf64 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
+From f6076436e5de9a768488c34ca301bf52eee947af Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 0e9cd23..b44e60c 100644
+index 86bad9b..9703315 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -276,8 +276,8 @@ class MachineInfo(HoldableObject):
+@@ -277,8 +277,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,10 +26,10 @@ index 0e9cd23..b44e60c 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index af69f64..248d6dd 100644
+index be40dbc..630eb4d 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -384,10 +384,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 9f3f516a5c..e6db6121ab 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
+From 786cdef7339ad865d29f92594ee7d18589b22fd2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index b9b17f8..a305afb 100644
+index 883a29a..52bfbf3 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -399,9 +399,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -24,7 +24,7 @@ index b9b17f8..a305afb 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -392,8 +389,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -410,8 +407,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index fa5ea57d5b..bceb149bbf 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
+From 249df6f74a8609663a79506374b9c632848e41f2 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b44e60c..c70e8cb 100644
+index 9703315..74f2477 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -28,6 +28,7 @@ from pathlib import Path
diff --git a/meta/recipes-devtools/meson/meson_1.4.0.bb b/meta/recipes-devtools/meson/meson_1.5.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.4.0.bb
rename to meta/recipes-devtools/meson/meson_1.5.0.bb
index a0c2ee633a..fb20f6895e 100644
--- a/meta/recipes-devtools/meson/meson_1.4.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.5.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
+SRC_URI[sha256sum] = "45d7b8653c1e5139df35b33be2dd5b2d040c5b2c6129f9a7c890d507e33312b8"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.44.0


--===============5411053728908742293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 12764 (+138%)
packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info -> /usr/lib/python3.12/site-packages/meson-1.5.0.dist-info, removed "/usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py", added "/usr/lib/python3.12/site-packages/mesonbuild/options.py /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py /usr/lib/python3.12/site-packages/mesonbuild/co
 mpilers/mixins/apple.py /usr/lib/python3.12/site-packages/mesonbuild/mformat.py"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.5.0.dist-info
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/mformat.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/options.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py was removed

--===============5411053728908742293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.4.0-1.5.0.patch"

RnJvbSA0NTVlNWQ0NmNhY2EwZjBkYmQzNmJhMGRjZDJmZGExOGNmYmYyMzM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTA6MDQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAxLjQuMCAtPiAxLjUuMAoKLS0tCiAuLi4vbWVzb24vMDAwMS1NYWtlLUNQ
VS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2ggICAgfCAxMCArKysrKy0tLS0tCiAuLi5tb2R1
bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2ggfCAgOCArKysr
LS0tLQogLi4uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0
Y2ggIHwgIDQgKystLQogLi4uL21lc29uL3ttZXNvbl8xLjQuMC5iYiA9PiBtZXNvbl8xLjUuMC5i
Yn0gICAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNv
bl8xLjQuMC5iYiA9PiBtZXNvbl8xLjUuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3Mt
ZmF0YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtl
LUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKaW5kZXggOTQxMjliMmYyNS4uYjMxOWVk
ZGY2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzYxYzkzZjQzYjcwYmEwNjcwZDQxZTg0MWJmZjlm
MmE3MTg2Y2MyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjYwNzY0MzZlNWRlOWE3
Njg0ODhjMzRjYTMwMWJmNTJlZWU5NDdhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMgSnVsIDIw
MTggMTM6NTk6MDkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdhcm5p
bmdzIGZhdGFsCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5
IGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLWluZGV4IDBlOWNkMjMuLmI0NGU2MGMgMTAwNjQ0
CitpbmRleCA4NmJhZDliLi45NzAzMzE1IDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZjb25m
aWcucHkKICsrKyBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1AQCAtMjc2LDggKzI3Niw4IEBA
IGNsYXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKK0BAIC0yNzcsOCArMjc3LDggQEAg
Y2xhc3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgogICAgICAgICAgICAgICAgICAnYnV0
IGlzIG1pc3Npbmcge30uJy5mb3JtYXQobWluaW11bV9saXRlcmFsIC0gc2V0KGxpdGVyYWwpKSkK
ICAKICAgICAgICAgIGNwdV9mYW1pbHkgPSBsaXRlcmFsWydjcHVfZmFtaWx5J10KQEAgLTI2LDEw
ICsyNiwxMCBAQCBpbmRleCAwZTljZDIzLi5iNDRlNjBjIDEwMDY0NAogICAgICAgICAgZW5kaWFu
ID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlhbiBub3QgaW4gKCdsaXR0bGUn
LCAnYmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weSBiL21lc29u
YnVpbGQvZW52aXJvbm1lbnQucHkKLWluZGV4IGFmNjlmNjQuLjI0OGQ2ZGQgMTAwNjQ0CitpbmRl
eCBiZTQwZGJjLi42MzBlYjRkIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5w
eQogKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotQEAgLTM3OSwxMCArMzc5LDggQEAg
ZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgor
QEAgLTM4NCwxMCArMzg0LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29t
cGlsZXJzRGljdCkgLT4gc3RyOgogICAgICAgICAgaWYgY29tcGlsZXJzIGFuZCBub3QgYW55X2Nv
bXBpbGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX19taXBzNjQnKToKICAgICAgICAgICAgICB0
cmlhbCA9ICdtaXBzJwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29u
L21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1l
bnQtd2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5
dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gK
aW5kZXggOWYzZjUxNmE1Yy4uZTZkYjYxMjFhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10
aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9u
bWVudC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNGMwNjAyYTU2ZDM1MTdhYjY2
Yjk4YTdkYmI2OWRlZmU3N2QyOWEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ODZj
ZGVmNzMzOWFkODY1ZDI5ZjkyNTk0ZWU3ZDE4NTg5YjIyZmQyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbiBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZpcm9ubWVudCB3aGVuIGNhbGxp
bmcKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9w
eXRob24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKLWluZGV4IGI5YjE3
ZjguLmEzMDVhZmIgMTAwNjQ0CitpbmRleCA4ODNhMjlhLi41MmJmYmYzIDEwMDY0NAogLS0tIGEv
bWVzb25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiArKysgYi9tZXNvbmJ1aWxkL2RlcGVu
ZGVuY2llcy9weXRob24ucHkKLUBAIC0zODEsOSArMzgxLDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5
KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKK0BAIC0z
OTksOSArMzk5LDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9y
X21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAgICAgICAgICAgIGVtcHR5Lm5h
bWUgPSAncHl0aG9uJwogICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVtcHR5CiAgCkBAIC0y
NCw3ICsyNCw3IEBAIGluZGV4IGI5YjE3ZjguLmEzMDVhZmIgMTAwNjQ0CiAgICAgICAgICAgICAg
ICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQeXRob25Qa2dDb25maWdEZXBl
bmRlbmN5KG5hbWUsIGVudiwga3dhcmdzLCBpbnN0YWxsYXRpb24sIFRydWUpCiAgICAgICAgICAg
ICAgICAgIGZpbmFsbHk6Ci1AQCAtMzkyLDggKzM4OSw3IEBAIGRlZiBweXRob25fZmFjdG9yeShl
bnY6ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNob2ljZScsCitAQCAtNDEw
LDggKzQwNyw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6ICdFbnZpcm9ubWVudCcsIGZvcl9t
YWNoaW5lOiAnTWFjaGluZUNob2ljZScsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9z
LmVudmlyb25bbmFtZV0gPSB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICAgIGVsaWYgbmFt
ZSBpbiBvcy5lbnZpcm9uOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZWwgb3MuZW52
aXJvbltuYW1lXQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29u
LzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFy
Y2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCBmYTVlYTU3ZDViLi5iY2ViMTQ5YmJmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1
aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2Y2OWJmYWJiODdkMzExZDc0MDllYTY2
OTlmN2RlZThlOWIzYTk1YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjQ5ZGY2Zjc0
YTg2MDk2NjNhNzk1MDYzNzRiOWM2MzI4NDhlNDFmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29tPgogRGF0ZTogVGh1LCAyNiBK
dWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENIXSBTdXBwb3J0IGJ1aWxkaW5n
IGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpAQCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52Y29u
ZmlnLnB5IGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLWluZGV4IGI0NGU2MGMuLmM3MGU4Y2Ig
MTAwNjQ0CitpbmRleCA5NzAzMzE1Li43NGYyNDc3IDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9l
bnZjb25maWcucHkKICsrKyBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiBAQCAtMjgsNiArMjgs
NyBAQCBmcm9tIHBhdGhsaWIgaW1wb3J0IFBhdGgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNv
bi9tZXNvbl8xLjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjUuMC5iYgppbmRleCBhMGMyZWU2MzNhLi5mYjIwZjY4
OTVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS40LjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuNS4wLmJiCkBAIC0x
NSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9
L21lc29uLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZh
bWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBv
cnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmZDY2MzBjMjVjMjdmMTQ4OWE4YTAzOTJiMzExYTYwNDgx
YTNjMTYxYWE2OTliMzMwZTI1OTM1Yjc1MDEzOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDVk
N2I4NjUzYzFlNTEzOWRmMzViMzNiZTJkZDViMmQwNDBjNWIyYzYxMjlmOWE3Yzg5MGQ1MDdlMzMz
MTJiOCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAK
IGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0g
CjIuNDQuMAoK

--===============5411053728908742293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.4.0/meson-1.4.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.5.0/meson-1.5.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5356 to 12764 (+138%)
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.4.0" to "1.5.0"
packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info -> /usr/lib/python3.12/site-packages/meson-1.5.0.dist-info, removed "/usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py", added "/usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/options.py /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc /usr/lib/python3.12/site-packages/mesonbuild/mformat.py /usr/
 lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.4.0 [default] to 1.5.0 [default]
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7974951 to 8170349 (+2%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.5.0.dist-info
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/apple.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/compilers/mixins/__pycache__/apple.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/machinefile.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/mformat.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/_qt.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/_qt.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/options.py was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/machinefile.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/mformat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/__pycache__/options.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/mesonbuild/modules/__pycache__/qt.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/mesonbuild/modules/qt.py was removed

--===============5411053728908742293==--

