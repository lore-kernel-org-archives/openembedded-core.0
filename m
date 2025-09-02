Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04DBCAC586
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.89794.1756850186663987349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BDun4BTR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BR/IXHZM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101990c6e6b8d-e60a1770-2318-459f-b2fc-1ae354751fa4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850187;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RcM/4fdALvo24KnrN8FES5WxP/z1ghGTnwzcLFpGOOg=;
	b=BDun4BTR0ZXsie9rLAZizpv+2pJ7r/DY6VCpO521ia9mNAxtk9c6EjnH2UQnWOHO
	vxO7rmEkrRSqzcZbNyGyhO71fgcKK37S9of21ntQmuHb8g1vFyUX9FFiYbdsJtB1hmE
	zresYyUC7rfTDRKYPb4K36zOopKsvhQRChGdGtlM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850187;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RcM/4fdALvo24KnrN8FES5WxP/z1ghGTnwzcLFpGOOg=;
	b=BR/IXHZMBBN8xeYccxJBId7ye3JorkE1xBO0jxtHG22RY3boyeu3e0r7Vn7I0PMX
	Gqr+24hjTAdJ5hFascFru3qSzj4GBqlwvLg/Q7HmdNWuWR9x1Zlxjl5yj2yzmrpX+/P
	Ddz3kT/CMf1nj796i77JNUnjV+2XMX+B6yFIz7Xo=
Content-Type: multipart/mixed; boundary="===============0091030484547657014=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.9.0 SUCCEEDED
Message-ID: <010101990c6e6b8d-e60a1770-2318-459f-b2fc-1ae354751fa4-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222771

--===============0091030484547657014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.8.2-1.9.0.patch
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
From 568d9208d01a488ea84555239d199e5b3e5bd846 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 17:35:51 +0000
Subject: [PATCH] meson: upgrade 1.8.2 -> 1.9.0

---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 6 +++---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch     | 2 +-
 .../meson/{meson_1.8.2.bb => meson_1.9.0.bb}              | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.8.2.bb => meson_1.9.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 98ca08c2ca..402d5dfbce 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c01e5e29953e0302988f2d60adc50ebfa0e5d670 Mon Sep 17 00:00:00 2001
+From b2766cad36d706ab2234cc54c9429e367ad93c23 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 43fad0c..27be871 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2a9cf16..6b2bd6b 100644
+index 489ef50..1567efa 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -436,10 +436,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -438,10 +438,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index f654447013..eced2aada1 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 6c3734f533ee7ad493188c8fc17bb1c65b65f0bd Mon Sep 17 00:00:00 2001
+From bb7da650141759e6de448bf8cc09804bbf60db00 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index ab040b5..a34b271 100644
+index b028d9f..3d7cd9b 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -412,9 +412,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -418,9 +418,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +25,7 @@ index ab040b5..a34b271 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -423,8 +420,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -429,8 +426,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ed35498c30..b02ffc2b57 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From e123195e5990c3071385defd96dfab1211e98c08 Mon Sep 17 00:00:00 2001
+From 5140bf7b284c25e3685b03609e206a31c2781149 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-devtools/meson/meson_1.9.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.8.2.bb
rename to meta/recipes-devtools/meson/meson_1.9.0.bb
index bfeaab0a79..6f5a623dc7 100644
--- a/meta/recipes-devtools/meson/meson_1.8.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.9.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af"
+SRC_URI[sha256sum] = "cd27277649b5ed50d19875031de516e270b22e890d9db65ed9af57d18ebc498d"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============0091030484547657014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.8.2/meson-1.8.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.9.0/meson-1.9.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/x86-64-v3-poky-linux/meson: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-dbg: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-dbg: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-dev: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-dev: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-doc: PKGSIZE changed from 13186 to 13188 (+0%)
packages/x86-64-v3-poky-linux/meson/meson-locale: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-locale: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-src: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-src: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson-staticdev: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson: PV changed from "1.8.2" to "1.9.0"
packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info -> /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc"
packages/x86-64-v3-poky-linux/meson/meson: PKGV changed from 1.8.2 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/meson/meson: PKGSIZE changed from 8748389 to 8902302 (+2%)
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was added
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was added

--===============0091030484547657014==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.8.2-1.9.0.patch"

RnJvbSA1NjhkOTIwOGQwMWE0ODhlYTg0NTU1MjM5ZDE5OWU1YjNlNWJkODQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNzozNTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuOC4yIC0+IDEuOS4wCgotLS0KIC4uLi9tZXNvbi9tZXNvbi8wMDAxLU1h
a2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCB8IDYgKysrLS0tCiAuLi5vbi1tb2R1
bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2ggfCA4ICsrKyst
LS0tCiAuLi4vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRj
aCAgICAgfCAyICstCiAuLi4vbWVzb24ve21lc29uXzEuOC4yLmJiID0+IG1lc29uXzEuOS4wLmJi
fSAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24ve21lc29u
XzEuOC4yLmJiID0+IG1lc29uXzEuOS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1m
YXRhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2Ut
Q1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaAppbmRleCA5OGNhMDhjMmNhLi40MDJkNWRm
YmNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1N
YWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMDFlNWUyOTk1M2UwMzAyOTg4ZjJkNjBhZGM1MGVi
ZmEwZTVkNjcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMjc2NmNhZDM2ZDcwNmFi
MjIzNGNjNTRjOTQyOWUzNjdhZDkzYzIzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMyBKdWwgMjAx
OCAxMzo1OTowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIENQVSBmYW1pbHkgd2Fybmlu
Z3MgZmF0YWwKQEAgLTI2LDEwICsyNiwxMCBAQCBpbmRleCA0M2ZhZDBjLi4yN2JlODcxIDEwMDY0
NAogICAgICAgICAgZW5kaWFuID0gbGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlh
biBub3QgaW4gKCdsaXR0bGUnLCAnYmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZp
cm9ubWVudC5weSBiL21lc29uYnVpbGQvZW52aXJvbm1lbnQucHkKLWluZGV4IDJhOWNmMTYuLjZi
MmJkNmIgMTAwNjQ0CitpbmRleCA0ODllZjUwLi4xNTY3ZWZhIDEwMDY0NAogLS0tIGEvbWVzb25i
dWlsZC9lbnZpcm9ubWVudC5weQogKysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotQEAg
LTQzNiwxMCArNDM2LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGls
ZXJzRGljdCkgLT4gc3RyOgorQEAgLTQzOCwxMCArNDM4LDggQEAgZGVmIGRldGVjdF9jcHVfZmFt
aWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgogICAgICAgICAgaWYgY29tcGls
ZXJzIGFuZCBub3QgYW55X2NvbXBpbGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX19taXBzNjQn
KToKICAgICAgICAgICAgICB0cmlhbCA9ICdtaXBzJwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1
bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi9tZXNvbi8wMDAxLXB5dGhvbi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmly
b25tZW50LXdoZW4ucGF0Y2gKaW5kZXggZjY1NDQ0NzAxMy4uZWNlZDJhYWRhMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1k
by1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5p
cHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2
YzM3MzRmNTMzZWU3YWQ0OTMxODhjOGZjMTdiYjFjNjViNjVmMGJkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBiYjdkYTY1MDE0MTc1OWU2ZGU0NDhiZjhjYzA5ODA0YmJmNjBkYjAwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHB5dGhvbiBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZp
cm9ubWVudCB3aGVuIGNhbGxpbmcKQEAgLTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1
aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRo
b24ucHkKLWluZGV4IGFiMDQwYjUuLmEzNGIyNzEgMTAwNjQ0CitpbmRleCBiMDI4ZDlmLi4zZDdj
ZDliIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiArKysg
Yi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKLUBAIC00MTIsOSArNDEyLDYgQEAg
ZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNo
aW5lQ2hvaWNlJywKK0BAIC00MTgsOSArNDE4LDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjog
J0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAg
ICAgICAgICAgIGVtcHR5Lm5hbWUgPSAncHl0aG9uJwogICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIGVtcHR5CiAgCkBAIC0yNSw3ICsyNSw3IEBAIGluZGV4IGFiMDQwYjUuLmEzNGIyNzEgMTAw
NjQ0CiAgICAgICAgICAgICAgICAgIHRyeToKICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQ
eXRob25Qa2dDb25maWdEZXBlbmRlbmN5KG5hbWUsIGVudiwga3dhcmdzLCBpbnN0YWxsYXRpb24s
IFRydWUpCiAgICAgICAgICAgICAgICAgIGZpbmFsbHk6Ci1AQCAtNDIzLDggKzQyMCw3IEBAIGRl
ZiBweXRob25fZmFjdG9yeShlbnY6ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGlu
ZUNob2ljZScsCitAQCAtNDI5LDggKzQyNiw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6ICdF
bnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNob2ljZScsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG9zLmVudmlyb25bbmFtZV0gPSB2YWx1ZQogICAgICAgICAgICAgICAg
ICAgICAgICAgIGVsaWYgbmFtZSBpbiBvcy5lbnZpcm9uOgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZWwgb3MuZW52aXJvbltuYW1lXQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uLzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMt
YWdhaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBw
b3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAppbmRleCBlZDM1NDk4YzMw
Li5iMDJmZmMyYjU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1aWxkaW5n
LWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTEyMzE5
NWU1OTkwYzMwNzEzODVkZWZkOTZkZmFiMTIxMWU5OGMwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNTE0MGJmN2IyODRjMjVlMzY4NWIwMzYwOWUyMDZhMzFjMjc4MTE0OSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGtqQGF4aXMuY29t
PgogRGF0ZTogVGh1LCAyNiBKdWwgMjAxOCAxNjozMjo0OSArMDIwMAogU3ViamVjdDogW1BBVENI
XSBTdXBwb3J0IGJ1aWxkaW5nIGFsbGFyY2ggcmVjaXBlcyBhZ2FpbgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjguMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuOS4wLmJiCmluZGV4IGJmZWFhYjBh
NzkuLjZmNWE2MjNkYzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9t
ZXNvbl8xLjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS45
LjAuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93
bmxvYWQvJHtQVn0vbWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
TWFrZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDItU3VwcG9ydC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzEwNTgxNmQ4MTU4Yzc2YjcyYWRjYjlm
ZjYwMjk3NzE5MDk2ZGE3ZDA3ZjZiMWYwMDBmZDhjMDEzY2QzODdhZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJjZDI3Mjc3NjQ5YjVlZDUwZDE5ODc1MDMxZGU1MTZlMjcwYjIyZTg5MGQ5ZGI2NWVk
OWFmNTdkMThlYmM0OThkIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwu
XGQrKSspJCIKIAogaW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1y
ZWxlYXNlcwotLSAKMi40Ny4xCgo=

--===============0091030484547657014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info -> /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info, added "/usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was added
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.4-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.4-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.8.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.9.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/raw.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/__pycache__/toml.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/raw.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/cargo/toml.py was added

--===============0091030484547657014==--

