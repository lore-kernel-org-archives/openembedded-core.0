Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE67CA1012
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5669.1693650552490806249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fmkZ9UWY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hsr0i1Al;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a55708728-46d4b2c7-840a-4275-afb3-1aade5cdcc1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6EIZW3OHI/rLqUaqTjT82qmweLZ34ksbAoprFDuw+Eo=;
	b=fmkZ9UWYfSOy4+wu8azgtXK5LiIKXYcFo3XlAIChlv76zDY25ruAWCml6l6T03TL
	ahTocWk49Ih10UkuRH55LjhuduhF+gk+XCHM2K9uOkEPFx5aBBswNcMtIEkcyMTQ6sT
	CAqxvuJ186IphahpyloEGGkngciO1ILe5DtjO82o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6EIZW3OHI/rLqUaqTjT82qmweLZ34ksbAoprFDuw+Eo=;
	b=Hsr0i1AlOR4IqVsE5D7C0EP1MbEF6o3EoNJ8YL7Ni+aOuVtqfMAZL3C/YhblVHaD
	ob9Q6l14/KNsMsoj4VxI9FXu+hmFNL8xnr6iOxvm0lwPvQafwgjv80Vn28bDdVKu1zc
	AwAuKD9B0yvthUQFGIyZsnJeqREK1DMRFbdo6++M=
Content-Type: multipart/mixed; boundary="===============4159350697936204493=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101018a55708728-46d4b2c7-840a-4275-afb3-1aade5cdcc1d-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187060

--===============4159350697936204493==
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
From b54ee37ca9ba0bf64f3227b9e30a3c3f46dd9452 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 13:34:01 +0000
Subject: [PATCH] meson: upgrade 1.1.1 -> 1.2.1

---
 .../0001-Make-CPU-family-warnings-fatal.patch | 32 +++++++++----------
 .../meson/{meson_1.1.1.bb => meson_1.2.1.bb}  |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.1.1.bb => meson_1.2.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 848dccfbe7..2474f6e74a 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
+From 84322316c74dba244a2924d0787cfa61989bbbde Mon Sep 17 00:00:00 2001
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


--===============4159350697936204493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.1.1/meson-1.1.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.2.1/meson-1.2.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5354 to 5357 (+0%)
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "1.1.1" to "1.2.1"
packages/core2-32-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info -> /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info, added "/usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/cfg.py /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/ca
 rgo/version.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/linkers/__pycache__/base.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7977814 to 8349303 (+5%)
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

--===============4159350697936204493==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.1.1-1.2.1.patch"

RnJvbSBiNTRlZTM3Y2E5YmEwYmY2NGYzMjI3YjllMzBhM2MzZjQ2ZGQ5NDUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMzozNDowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMS4xIC0+IDEuMi4xCgotLS0KIC4uLi8wMDAxLU1ha2UtQ1BVLWZhbWls
eS13YXJuaW5ncy1mYXRhbC5wYXRjaCB8IDMyICsrKysrKysrKy0tLS0tLS0tLS0KIC4uLi9tZXNv
bi97bWVzb25fMS4xLjEuYmIgPT4gbWVzb25fMS4yLjEuYmJ9ICB8ICAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi97bWVzb25fMS4xLjEuYmIgPT4gbWVzb25fMS4yLjEuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNo
CmluZGV4IDg0OGRjY2ZiZTcuLjI0NzRmNmU3NGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQ
VS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZjNGVl
ZjFkOTJlOWU0MmZkYmM4ODgzNjVjYWIzYzk1ZmIzM2M2MDUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDg0MzIyMzE2Yzc0ZGJhMjQ0YTI5MjRkMDc4N2NmYTYxOTg5YmJiZGUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwu
Y29tPgogRGF0ZTogVHVlLCAzIEp1bCAyMDE4IDEzOjU5OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIE1ha2UgQ1BVIGZhbWlseSB3YXJuaW5ncyBmYXRhbApAQCAtNywxNSArNywxNSBAQCBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIAogLS0tCi0gbWVzb25idWlsZC9l
bnZjb25maWcucHkgICB8IDIgKy0KLSBtZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5IHwgNCArLS0t
Ci0gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisgbWVz
b25idWlsZC9lbnZjb25maWcucHkgICB8IDQgKystLQorIG1lc29uYnVpbGQvZW52aXJvbm1lbnQu
cHkgfCA2ICsrLS0tLQorIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQogCi1JbmRleDogbWVzb24tMC42MC4yL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Ci0tLS0gbWVzb24tMC42MC4yLm9yaWcvbWVzb25idWlsZC9lbnZjb25maWcucHkK
LSsrKyBtZXNvbi0wLjYwLjIvbWVzb25idWlsZC9lbnZjb25maWcucHkKLUBAIC0yNjYsOCArMjY2
LDggQEAgY2xhc3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgorZGlmZiAtLWdpdCBhL21l
c29uYnVpbGQvZW52Y29uZmlnLnB5IGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKK2luZGV4IDdl
MGM1NjcuLmExODAwNjUgMTAwNjQ0CistLS0gYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQorKysr
IGIvbWVzb25idWlsZC9lbnZjb25maWcucHkKK0BAIC0yODQsOCArMjg0LDggQEAgY2xhc3MgTWFj
aGluZUluZm8oSG9sZGFibGVPYmplY3QpOgogICAgICAgICAgICAgICAgICAnYnV0IGlzIG1pc3Np
bmcge30uJy5mb3JtYXQobWluaW11bV9saXRlcmFsIC0gc2V0KGxpdGVyYWwpKSkKICAKICAgICAg
ICAgIGNwdV9mYW1pbHkgPSBsaXRlcmFsWydjcHVfZmFtaWx5J10KQEAgLTI2LDEzICsyNiwxMyBA
QCBJbmRleDogbWVzb24tMC42MC4yL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiAgCiAgICAgICAg
ICBlbmRpYW4gPSBsaXRlcmFsWydlbmRpYW4nXQogICAgICAgICAgaWYgZW5kaWFuIG5vdCBpbiAo
J2xpdHRsZScsICdiaWcnKToKLUluZGV4OiBtZXNvbi0wLjYwLjIvbWVzb25idWlsZC9lbnZpcm9u
bWVudC5weQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIG1lc29uLTAuNjAuMi5vcmlnL21lc29uYnVpbGQvZW52
aXJvbm1lbnQucHkKLSsrKyBtZXNvbi0wLjYwLjIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQot
QEAgLTM1NCwxMCArMzU0LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29t
cGlsZQotICAgICAgICAgaWYgYW55X2NvbXBpbGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX182
NEJJVF9fJyk6Ci0gICAgICAgICAgICAgdHJpYWwgPSAncHBjNjQnCitkaWZmIC0tZ2l0IGEvbWVz
b25idWlsZC9lbnZpcm9ubWVudC5weSBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKK2luZGV4
IGUyMTJjN2EuLjlkMmJmZjMgMTAwNjQ0CistLS0gYS9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5
CisrKysgYi9tZXNvbmJ1aWxkL2Vudmlyb25tZW50LnB5CitAQCAtMzQ1LDEwICszNDUsOCBAQCBk
ZWYgZGV0ZWN0X2NwdV9mYW1pbHkoY29tcGlsZXJzOiBDb21waWxlcnNEaWN0KSAtPiBzdHI6Cisg
ICAgICAgICBpZiBjb21waWxlcnMgYW5kIG5vdCBhbnlfY29tcGlsZXJfaGFzX2RlZmluZShjb21w
aWxlcnMsICdfX21pcHM2NCcpOgorICAgICAgICAgICAgIHRyaWFsID0gJ21pcHMnCiAgCiAtICAg
IGlmIHRyaWFsIG5vdCBpbiBrbm93bl9jcHVfZmFtaWxpZXM6CiAtICAgICAgICBtbG9nLndhcm5p
bmcoZidVbmtub3duIENQVSBmYW1pbHkge3RyaWFsIXJ9LCBwbGVhc2UgcmVwb3J0IHRoaXMgYXQg
JwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMS4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMi4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8x
LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMi4x
LmJiCmluZGV4IDUwMGUxMzc3NWYuLjc1ZjRjOTlhMTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbWVzb24vbWVzb25fMS4yLjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMt
YWdhaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDA0YjU0
MWY5N2NhNDM5ZmI4MmZhYjdkMGQ0ODA5ODhiZTRiZDRlNjI1NjNhNWNhMzVmYWRiNTQwMDcyN2Ix
YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWRiM2ExNTMwODc1NDk0OTdlZTUyYjFjOTM4ZDIx
MzRlMDMzODIxNGZlMTRmN2VmZDE2ZmVjZDU3YjYzOWY1IgogCiBpbmhlcml0IHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuMzkuMgoK

--===============4159350697936204493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.11/site-packages/meson-1.1.1.dist-info -> /usr/lib/python3.11/site-packages/meson-1.2.1.dist-info, added "/usr/lib/python3.11/site-packages/mesonbuild/cargo/manifest.py /usr/lib/python3.11/site-packages/mesonbuild/linkers/__pycache__/base.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__init__.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/version.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/scripts/pycompile.py /usr/lib/python3.11/site-packages/mesonbuild/linkers/base.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/metrowerks.py /usr/lib/python3.11/site-packages/mesonbuild/compilers/mixins/__pycache__/metrowerks.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/interpreter.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/version.py /usr/lib/python3.11/site-packages/mesonbuild/carg
 o/cfg.py /usr/lib/python3.11/site-packages/mesonbuild/scripts/__pycache__/pycompile.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/builder.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/cfg.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/interpreter.py /usr/lib/python3.11/site-packages/mesonbuild/cargo/__pycache__/manifest.cpython-311.pyc /usr/lib/python3.11/site-packages/mesonbuild/cargo/builder.py"
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

--===============4159350697936204493==--

