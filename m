Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B89CCD13D7
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44633.1711994600755626104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ckv3C2yr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TcXSC9zW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad47d98-63441250-c0aa-4f36-acd7-9a100f07652b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Z2PaLvgfTls2jGIk9+2cOzjJz9UKjkyBj7Mci/RDjI=;
	b=Ckv3C2yrXzXPdjle16lnMVOADDaJhI3I2FNwquS3acfd7NpDG3tyubR4JT7nZCcV
	Yf4mL5pDksH1auqmYwi2fUG6FBwSbU7pkmHZKW47AdplQ+RMMsAl7oeSgYe9O9iJieW
	4ptkY47XVuooo8skk/+PFaC7QHzf/Rx72JWlxCI0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Z2PaLvgfTls2jGIk9+2cOzjJz9UKjkyBj7Mci/RDjI=;
	b=TcXSC9zWaXkFn0+JV1zqcFYhhimENBChxo8P3DiE82AB2qR+P5xR94PB4HHWxHXD
	HHfYM9wpneGju+rRlz+F1SMiX3dwjQyVsufmqeqY2W0l0G3mimRwD2HNR7eIHvftd2e
	+fqQ29qh6UELWsvUrmEal402jhkd5bLGKTAus/Uw=
Content-Type: multipart/mixed; boundary="===============5405000237947867843=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.4.0 SUCCEEDED
Message-ID: <0101018e9ad47d98-63441250-c0aa-4f36-acd7-9a100f07652b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197697

--===============5405000237947867843==
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
From 80d17236d251e77218df492e1283ed5eeca90f66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:19:28 +0000
Subject: [PATCH] meson: upgrade 1.3.1 -> 1.4.0

---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch   | 11 +++++------
 ...odule-do-not-manipulate-the-environment-when.patch |  9 ++++-----
 .../0002-Support-building-allarch-recipes-again.patch |  7 +++----
 .../meson/{meson_1.3.1.bb => meson_1.4.0.bb}          |  2 +-
 4 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.3.1.bb => meson_1.4.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8ea7c35950..b4500ff254 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,21 +1,20 @@
-From b77cbe67df5fa0998946503f207c256ee740bb5f Mon Sep 17 00:00:00 2001
+From 0f6b167556486fd64f1d8b8907e44df1299a41a4 Mon Sep 17 00:00:00 2001
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
index 2e0a4b1bbe..538b6d6f19 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From e85683698aa3556bf14fc6d35f2c067f16af520b Mon Sep 17 00:00:00 2001
+From b95b0cf4f147d2e379b25985960dbb2f89b1f14c Mon Sep 17 00:00:00 2001
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
index a8396f30bb..0aa2b236f4 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6fb8db54929b40e1fd7ac949ef44f0d37df0bae9 Mon Sep 17 00:00:00 2001
+From 499f43ef83d253fc1cc2d84bfdd6e8155e4cd2bd Mon Sep 17 00:00:00 2001
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
index 9cc0cc31ab..d95014db54 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
+SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.42.0


--===============5405000237947867843==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.3.1-1.4.0.patch"

RnJvbSA4MGQxNzIzNmQyNTFlNzcyMThkZjQ5MmUxMjgzZWQ1ZWVjYTkwZjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzoxOToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMy4xIC0+IDEuNC4wCgotLS0KIC4uLi9tZXNvbi8wMDAxLU1ha2UtQ1BV
LWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgIHwgMTEgKysrKystLS0tLS0KIC4uLm9kdWxl
LWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoIHwgIDkgKysrKy0t
LS0tCiAuLi4vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRj
aCB8ICA3ICsrKy0tLS0KIC4uLi9tZXNvbi97bWVzb25fMS4zLjEuYmIgPT4gbWVzb25fMS40LjAu
YmJ9ICAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNv
bl8xLjMuMS5iYiA9PiBtZXNvbl8xLjQuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3Mt
ZmF0YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtl
LUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKaW5kZXggOGVhN2MzNTk1MC4uYjQ1MDBm
ZjI1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5w
YXRjaApAQCAtMSwyMSArMSwyMCBAQAotRnJvbSBiNzdjYmU2N2RmNWZhMDk5ODk0NjUwM2YyMDdj
MjU2ZWU3NDBiYjVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZjZiMTY3NTU2NDg2
ZmQ2NGYxZDhiODkwN2U0NGRmMTI5OWE0MWE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwg
MjAxOCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2Fy
bmluZ3MgZmF0YWwKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVjaWZp
Y10KIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+Ci0K
IC0tLQogIG1lc29uYnVpbGQvZW52Y29uZmlnLnB5ICAgfCA0ICsrLS0KICBtZXNvbmJ1aWxkL2Vu
dmlyb25tZW50LnB5IHwgNiArKy0tLS0KICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5
IGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLWluZGV4IDA3ZjEyMjkuLmEzNWMzNTYgMTAwNjQ0
CitpbmRleCAwZTljZDIzLi5iNDRlNjBjIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZjb25m
aWcucHkKICsrKyBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1AQCAtMjg1LDggKzI4NSw4IEBA
IGNsYXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKK0BAIC0yNzYsOCArMjc2LDggQEAg
Y2xhc3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgogICAgICAgICAgICAgICAgICAnYnV0
IGlzIG1pc3Npbmcge30uJy5mb3JtYXQobWluaW11bV9saXRlcmFsIC0gc2V0KGxpdGVyYWwpKSkK
ICAKICAgICAgICAgIGNwdV9mYW1pbHkgPSBsaXRlcmFsWydjcHVfZmFtaWx5J10KQEAgLTI3LDEw
ICsyNiwxMCBAQCBpbmRleCAwN2YxMjI5Li5hMzVjMzU2IDEwMDY0NAogICAgICAgICAgZW5kaWFu
ID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlhbiBub3QgaW4gKCdsaXR0bGUn
LCAnYmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weSBiL21lc29u
YnVpbGQvZW52aXJvbm1lbnQucHkKLWluZGV4IDJiYTIwNTQuLmQ3OThlM2IgMTAwNjQ0CitpbmRl
eCBhZjY5ZjY0Li4yNDhkNmRkIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5w
eQogKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotQEAgLTM1OSwxMCArMzU5LDggQEAg
ZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgor
QEAgLTM3OSwxMCArMzc5LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29t
cGlsZXJzRGljdCkgLT4gc3RyOgogICAgICAgICAgaWYgY29tcGlsZXJzIGFuZCBub3QgYW55X2Nv
bXBpbGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX19taXBzNjQnKToKICAgICAgICAgICAgICB0
cmlhbCA9ICdtaXBzJwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29u
L21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1l
bnQtd2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5
dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gK
aW5kZXggMmUwYTRiMWJiZS4uNTM4YjZkNmYxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10
aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVz
b24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9u
bWVudC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlODU2ODM2OThhYTM1NTZiZjE0
ZmM2ZDM1ZjJjMDY3ZjE2YWY1MjBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiOTVi
MGNmNGYxNDdkMmUzNzliMjU5ODU5NjBkYmIyZjg5YjFmMTRjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbiBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZpcm9ubWVudCB3aGVuIGNhbGxp
bmcKQEAgLTYsMTYgKzYsMTUgQEAgU3ViamVjdDogW1BBVENIXSBweXRob24gbW9kdWxlOiBkbyBu
b3QgbWFuaXB1bGF0ZSB0aGUgZW52aXJvbm1lbnQgd2hlbiBjYWxsaW5nCiAKIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBtZXNvbmJ1
aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkgfCA2ICstLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQv
ZGVwZW5kZW5jaWVzL3B5dGhvbi5weSBiL21lc29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5dGhvbi5w
eQotaW5kZXggOWFlYTZiZC4uOGMxM2VkZSAxMDA2NDQKK2luZGV4IGI5YjE3ZjguLmEzMDVhZmIg
MTAwNjQ0CiAtLS0gYS9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKICsrKyBiL21l
c29uYnVpbGQvZGVwZW5kZW5jaWVzL3B5dGhvbi5weQotQEAgLTM4MCw5ICszODAsNiBAQCBkZWYg
cHl0aG9uX2ZhY3RvcnkoZW52OiAnRW52aXJvbm1lbnQnLCBmb3JfbWFjaGluZTogJ01hY2hpbmVD
aG9pY2UnLAorQEAgLTM4MSw5ICszODEsNiBAQCBkZWYgcHl0aG9uX2ZhY3RvcnkoZW52OiAnRW52
aXJvbm1lbnQnLCBmb3JfbWFjaGluZTogJ01hY2hpbmVDaG9pY2UnLAogICAgICAgICAgICAgICAg
ICAgICAgZW1wdHkubmFtZSA9ICdweXRob24nCiAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
ZW1wdHkKICAKQEAgLTI1LDcgKzI0LDcgQEAgaW5kZXggOWFlYTZiZC4uOGMxM2VkZSAxMDA2NDQK
ICAgICAgICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFB5dGhv
blBrZ0NvbmZpZ0RlcGVuZGVuY3kobmFtZSwgZW52LCBrd2FyZ3MsIGluc3RhbGxhdGlvbiwgVHJ1
ZSkKICAgICAgICAgICAgICAgICAgZmluYWxseToKLUBAIC0zOTEsOCArMzg4LDcgQEAgZGVmIHB5
dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hv
aWNlJywKK0BAIC0zOTIsOCArMzg5LDcgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmly
b25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb3MuZW52aXJvbltuYW1lXSA9IHZhbHVlCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgZWxpZiBuYW1lIGluIG9zLmVudmlyb246CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlbCBvcy5lbnZpcm9uW25hbWVdCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fp
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQt
YnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCmluZGV4IGE4Mzk2ZjMwYmIuLjBh
YTJiMjM2ZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8w
MDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxs
YXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZmI4ZGI1NDky
OWI0MGUxZmQ3YWM5NDllZjQ0ZjBkMzdkZjBiYWU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA0OTlmNDNlZjgzZDI1M2ZjMWNjMmQ4NGJmZGQ2ZTgxNTVlNGNkMmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBE
YXRlOiBUaHUsIDI2IEp1bCAyMDE4IDE2OjMyOjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1
cHBvcnQgYnVpbGRpbmcgYWxsYXJjaCByZWNpcGVzIGFnYWluCkBAIC03LDE2ICs3LDE1IEBAIFRo
aXMgcmVnaXN0ZXJzICJhbGxhcmNoIiBhcyBhIGtub3duIENQVSBmYW1pbHkuCiAKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4KLQogLS0tCiAgbWVz
b25idWlsZC9lbnZjb25maWcucHkgfCAxICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5IGIvbWVzb25idWlsZC9l
bnZjb25maWcucHkKLWluZGV4IGEzNWMzNTYuLjQzNjM1NWYgMTAwNjQ0CitpbmRleCBiNDRlNjBj
Li5jNzBlOGNiIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZjb25maWcucHkKICsrKyBiL21l
c29uYnVpbGQvZW52Y29uZmlnLnB5Ci1AQCAtMzgsNiArMzgsNyBAQCBmcm9tIHBhdGhsaWIgaW1w
b3J0IFBhdGgKK0BAIC0yOCw2ICsyOCw3IEBAIGZyb20gcGF0aGxpYiBpbXBvcnQgUGF0aAogIAog
IAogIGtub3duX2NwdV9mYW1pbGllcyA9ICgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbl8xLjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8xLjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbl8xLjQuMC5iYgppbmRleCA5Y2MwY2MzMWFiLi5kOTUwMTRkYjU0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4zLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuNC4wLmJiCkBAIC0xNSw3
ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L21l
c29uLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtQ1BVLWZhbWls
eS13YXJuaW5ncy1mYXRhbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLVN1cHBvcnQt
YnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjYwMjA1NjhiZGVkZTE2NDNkNGZiNDFlMjgyMTViZTM4ZWZmNWQ1
MmRhMjhhYzdkMTI1NDU3YzU5ZTAwMzJhZDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGZkNjYz
MGMyNWMyN2YxNDg5YThhMDM5MmIzMTFhNjA0ODFhM2MxNjFhYTY5OWIzMzBlMjU5MzViNzUwMTM4
ZCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKLS0gCjIu
NDIuMAoK

--===============5405000237947867843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info

--===============5405000237947867843==
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
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 5359 to 5356 (-0%)
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.3.1" to "1.4.0"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 7993826 to 7973921 (-0%)
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.3.1 [default] to 1.4.0 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.3.1" to "1.4.0"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.12/site-packages/meson-1.3.1.dist-info moved to /usr/lib/python3.12/site-packages/meson-1.4.0.dist-info

--===============5405000237947867843==--

