Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55922C5B552
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27777.1748786131307060688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=q6f5QhXy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EClxC4Y6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc6ae51-2131a2b6-ec51-4f38-8a75-b09fe93905bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JrV8ilvzUj4bOFmZDZYqEI5kn0rSKZgLinPf7kKfL0I=;
	b=q6f5QhXy4wmQvthHJ4i+Ov1gPsc6fe9rCErjYVFgexMwJh0RBPmhfYXxRQdqIIac
	ZsAuQOm0n1ktzBQ6UYhz1F1u5dURGv+xLluFdbvC3Q+S4sGyqWzczCpp1iPCEukLFvB
	b3oti/4A0TwK2BluARGVUWnu0cKude2rnjDz2nn8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JrV8ilvzUj4bOFmZDZYqEI5kn0rSKZgLinPf7kKfL0I=;
	b=EClxC4Y6rHBtRX8fjDcSfHM6yGo78GZX2i4/X6iKSo7NTSDUkMaL8NBKniwepo7k
	Mv/2/zCstMqZq7ooSBjjD8Pn3ywPdvtWdbhtxigCA+vNdGNl79iU2ozu/TuZLYhIsLn
	6BVaupXzp8cbsWdU3c4zIyHtMXze3j6w7M2KGkio=
Content-Type: multipart/mixed; boundary="===============7468923745313389766=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.8.1 SUCCEEDED
Message-ID: <010101972bc6ae51-2131a2b6-ec51-4f38-8a75-b09fe93905bc-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217591

--===============7468923745313389766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.8.0-1.8.1.patch
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
From 0f5769b14b5c7231015c645034a78737d127b12c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:02:01 +0000
Subject: [PATCH] meson: upgrade 1.8.0 -> 1.8.1

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 6 +++---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch     | 2 +-
 .../meson/{meson_1.8.0.bb => meson_1.8.1.bb}              | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.0.bb => meson_1.8.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index b5d0546967..ceacd3c24f 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From a503c007d3db87acf711d110c01e11c2d087f99c Mon Sep 17 00:00:00 2001
+From 4a22847fd1e1f6dd8810012b0a7eb39986423003 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 43fad0c..27be871 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index f322cda..53a0ac0 100644
+index 2a9cf16..6b2bd6b 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -429,10 +429,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 85a93c8e7a..e0d9a15ea6 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 859711f99ea9b183a1dffb9b97de09ad0fe9803b Mon Sep 17 00:00:00 2001
+From d579f329f4d2297255a46fe21143169093283cfd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 3dab31c..b9307fc 100644
+index ab040b5..a34b271 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -410,9 +410,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -412,9 +412,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +25,7 @@ index 3dab31c..b9307fc 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -421,8 +418,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -423,8 +420,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ed35498c30..e0bbb20224 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From bc957bc39fcadb6c49f82ffe3bf0bf3846ea96d3 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.8.0.bb b/meta/recipes-devtools/meson/meson_1.8.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.0.bb
rename to meta/recipes-devtools/meson/meson_1.8.1.bb
index 78e0a0ed80..af4bc9fecd 100644
--- a/meta/recipes-devtools/meson/meson_1.8.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "0a9b23311271519bd03dca12d7d8b0eab582c3a2c5da433d465b6e519dc88e2f"
+SRC_URI[sha256sum] = "b4e3b80e8fa633555abf447a95a700aba1585419467b2710d5e5bf88df0a7011"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============7468923745313389766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.8.0/meson-1.8.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.8.1/meson-1.8.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 13187 to 13185 (-0%)
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-64-poky-linux/meson/meson: PV changed from "1.8.0" to "1.8.1"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 8735852 to 8742716 (+0%)
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info

--===============7468923745313389766==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.8.0-1.8.1.patch"

RnJvbSAwZjU3NjliMTRiNWM3MjMxMDE1YzY0NTAzNGE3ODczN2QxMjdiMTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTowMjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuOC4wIC0+IDEuOC4xCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAxLU1h
a2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCB8IDYgKysrLS0tCiAuLi5vbi1tb2R1
bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2ggfCA4ICsrKyst
LS0tCiAuLi4vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRj
aCAgICAgfCAyICstCiAuLi4vbWVzb24ve21lc29uXzEuOC4wLmJiID0+IG1lc29uXzEuOC4xLmJi
fSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuOC4wLmJiID0+IG1lc29uXzEuOC4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1m
YXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2Ut
Q1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCBiNWQwNTQ2OTY3Li5jZWFjZDNj
MjRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNTAzYzAwN2QzZGI4N2FjZjcxMWQxMTBjMDFlMTFj
MmQwODdmOTljIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YTIyODQ3ZmQxZTFmNmRk
ODgxMDAxMmIwYTdlYjM5OTg2NDIzMDAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAx
OCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2Fybmlu
Z3MgZmF0YWwKQEAgLTI2LDEwICsyNiwxMCBAQCBpbmRleCA0M2ZhZDBjLi4yN2JlODcxIDEwMDY0
NAogICAgICAgICAgZW5kaWFuID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlh
biBub3QgaW4gKCdsaXR0bGUnLCAnYmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZp
cm9ubWVudC5weSBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKLWluZGV4IGYzMjJjZGEuLjUz
YTBhYzAgMTAwNjQ0CitpbmRleCAyYTljZjE2Li42YjJiZDZiIDEwMDY0NAogLS0tIGEvbWVzb25i
dWlsZC9lbnZpcm9ubWVudC5weQogKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotQEAg
LTQyOSwxMCArNDI5LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGls
ZXJzRGljdCkgLT4gc3RyOgorQEAgLTQzNiwxMCArNDM2LDggQEAgZGVmIGRldGVjdF9jcHVfZmFt
aWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgogICAgICAgICAgaWYgY29tcGls
ZXJzIGFuZCBub3QgYW55X2NvbXBpbGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX19taXBzNjQn
KToKICAgICAgICAgICAgICB0cmlhbCA9ICdtaXBzJwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1
bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmly
b25tZW50LXdoZW4ucGF0Y2gKaW5kZXggODVhOTNjOGU3YS4uZTBkOWExNWVhNiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1k
by1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5p
cHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
NTk3MTFmOTllYTliMTgzYTFkZmZiOWI5N2RlMDlhZDBmZTk4MDNiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBkNTc5ZjMyOWY0ZDIyOTcyNTVhNDZmZTIxMTQzMTY5MDkzMjgzY2ZkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHB5dGhvbiBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZp
cm9ubWVudCB3aGVuIGNhbGxpbmcKQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1
aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRo
b24ucHkKLWluZGV4IDNkYWIzMWMuLmI5MzA3ZmMgMTAwNjQ0CitpbmRleCBhYjA0MGI1Li5hMzRi
MjcxIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiArKysg
Yi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKLUBAIC00MTAsOSArNDEwLDYgQEAg
ZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNo
aW5lQ2hvaWNlJywKK0BAIC00MTIsOSArNDEyLDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjog
J0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAg
ICAgICAgICAgIGVtcHR5Lm5hbWUgPSAncHl0aG9uJwogICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIGVtcHR5CiAgCkBAIC0yNSw3ICsyNSw3IEBAIGluZGV4IDNkYWIzMWMuLmI5MzA3ZmMgMTAw
NjQ0CiAgICAgICAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQ
eXRob25Qa2dDb25maWdEZXBlbmRlbmN5KG5hbWUsIGVudiwga3dhcmdzLCBpbnN0YWxsYXRpb24s
IFRydWUpCiAgICAgICAgICAgICAgICAgIGZpbmFsbHk6Ci1AQCAtNDIxLDggKzQxOCw3IEBAIGRl
ZiBweXRob25fZmFjdG9yeShlbnY6ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGlu
ZUNob2ljZScsCitAQCAtNDIzLDggKzQyMCw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6ICdF
bnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNob2ljZScsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG9zLmVudmlyb25bbmFtZV0gPSB2YWx1ZQogICAgICAgICAgICAgICAg
ICAgICAgICAgIGVsaWYgbmFtZSBpbiBvcy5lbnZpcm9uOgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZWwgb3MuZW52aXJvbltuYW1lXQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMt
YWdhaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBw
b3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCBlZDM1NDk4YzMw
Li5lMGJiYjIwMjI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5n
LWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTEyMzE5
NWU1OTkwYzMwNzEzODVkZWZkOTZkZmFiMTIxMWU5OGMwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYmM5NTdiYzM5ZmNhZGI2YzQ5ZjgyZmZlM2JmMGJmMzg0NmVhOTZkMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29t
PgogRGF0ZTogVGh1LCAyNiBKdWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENI
XSBTdXBwb3J0IGJ1aWxkaW5nIGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjguMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4xLmJiCmluZGV4IDc4ZTBhMGVk
ODAuLmFmNGJjOWZlY2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8xLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS44
LjEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93
bmxvYWQvJHtQVn0vbWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGE5YjIzMzExMjcxNTE5YmQwM2RjYTEy
ZDdkOGIwZWFiNTgyYzNhMmM1ZGE0MzNkNDY1YjZlNTE5ZGM4OGUyZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJiNGUzYjgwZThmYTYzMzU1NWFiZjQ0N2E5NWE3MDBhYmExNTg1NDE5NDY3YjI3MTBk
NWU1YmY4OGRmMGE3MDExIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwu
XGQrKSspJCIKIAogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1y
ZWxlYXNlcwotLSAKMi40Ny4xCgo=

--===============7468923745313389766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.1.dist-info

--===============7468923745313389766==--

