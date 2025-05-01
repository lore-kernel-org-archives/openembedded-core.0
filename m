Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC976C3ABC9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1790.1746113616210310166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZQ7E1iRg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JzRwFzb+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b5d21-53da4c03-563e-4fca-9681-8a7870326abf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+c+zpQEXBY/DfvEYL/iAjfqQWEDyrRUT/H2Kopd2Mn4=;
	b=ZQ7E1iRgUstxdPDDODqgEuuDwmhpdtHFcyym3XTCVXIii3XqrOFun8yaIhvLHLCU
	+2DGWmf41X1/gvZawsuJNu3LHqmCaBMPg7mJ+loynB1ITmUGS4VKQcV2D1hmz/1Udfm
	qjhs1DNUYrfQLRoDaZ+HebyLbzE+ZzURUYQWUDjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+c+zpQEXBY/DfvEYL/iAjfqQWEDyrRUT/H2Kopd2Mn4=;
	b=JzRwFzb+DWVC+BnlJwO9iyou480sl/qexwfO25NUsPAc9qsdu6w2WPlr5hhJoTl0
	daRICxCQ+u0vQq1/qZQ4pM87yBHAZgZpHV2hIrOeZZZ+cirxbJo17RcAWU7nF3grDP4
	qzJltInKwrO4HQ3HoaKArtLriXjusnWDnytg7s80=
Content-Type: multipart/mixed; boundary="===============7026670042350849339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.8.0 SUCCEEDED
Message-ID: <010101968c7b5d21-53da4c03-563e-4fca-9681-8a7870326abf-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215809

--===============7026670042350849339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *meson* to *1.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.7.2-1.8.0.patch
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
From be402beb80a819ea8776a02d9d4a181cf32115b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:37:08 +0000
Subject: [PATCH] meson: upgrade 1.7.2 -> 1.8.0

---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch  | 10 +++++-----
 ...dule-do-not-manipulate-the-environment-when.patch | 12 ++++++------
 ...0002-Support-building-allarch-recipes-again.patch |  6 +++---
 .../meson/{meson_1.7.2.bb => meson_1.8.0.bb}         |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.7.2.bb => meson_1.8.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ca2bcef1ee..3b173800e8 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 8ba2c1f596206d45e8f14d4f4d2439023a3de9e7 Mon Sep 17 00:00:00 2001
+From 3d4e90fd583f4f3133eb3d3d4658d72132514e3a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 6726d4e..844b611 100644
+index 43fad0c..27be871 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -278,8 +278,8 @@ class MachineInfo(HoldableObject):
+@@ -287,8 +287,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,10 +26,10 @@ index 6726d4e..844b611 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 386316e..b4a0d88 100644
+index f322cda..53a0ac0 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -419,10 +419,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -429,10 +429,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 84a9c18c51..88b87ae82a 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From f264b7fd2c86edfd5db77da264e8bf05f5e2bfeb Mon Sep 17 00:00:00 2001
+From b533fc186327ea7f3ac70ceda3edc10431e7ba25 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 326e605..f5eb50f 100644
+index 3dab31c..b9307fc 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -403,9 +403,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -410,9 +410,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -24,7 +24,7 @@ index 326e605..f5eb50f 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -414,8 +411,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -421,8 +418,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
@@ -32,5 +32,5 @@ index 326e605..f5eb50f 100644
 -                    set_env('PKG_CONFIG_PATH', old_pkg_path)
 +                    pass
  
-             candidates.append(functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation))
-             # We only need to check both, if a python install has a LIBPC. It might point to the wrong location,
+             # Otherwise this doesn't fulfill the interface requirements
+             wrap_in_pythons_pc_dir.log_tried = PythonPkgConfigDependency.log_tried  # type: ignore[attr-defined]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index d3120e84e8..9e6a0bd786 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From bcdd72ed1956e0a1b1b725e552fa391c549c2099 Mon Sep 17 00:00:00 2001
+From b87e337b0a7c8fdce2d05b6424f84e7a0f1335ed Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,10 +12,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 9703315..74f2477 100644
+index 27be871..994ac77 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -28,6 +28,7 @@ from pathlib import Path
+@@ -31,6 +31,7 @@ if T.TYPE_CHECKING:
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.7.2.bb b/meta/recipes-devtools/meson/meson_1.8.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.7.2.bb
rename to meta/recipes-devtools/meson/meson_1.8.0.bb
index 45a74612ce..6e3886e0a5 100644
--- a/meta/recipes-devtools/meson/meson_1.7.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "4d40d63aa748a9c139cc41ab9bffe43edd113c5639d78bde81544ca955aea890"
+SRC_URI[sha256sum] = "0a9b23311271519bd03dca12d7d8b0eab582c3a2c5da433d465b6e519dc88e2f"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.47.1


--===============7026670042350849339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.7.2/meson-1.7.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch" to "https://github.com/mesonbuild/meson/releases//download/1.8.0/meson-1.8.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch"
packages/core2-64-poky-linux/meson: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-dbg: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-dbg: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-dev: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-dev: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-doc: PKGSIZE changed from 12772 to 13187 (+3%)
packages/core2-64-poky-linux/meson/meson-doc: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-doc: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-locale: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-locale: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-src: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-src: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson-staticdev: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson-staticdev: PV changed from "1.7.2" to "1.8.0"
packages/core2-64-poky-linux/meson/meson: PKGSIZE changed from 8551645 to 8735852 (+2%)
packages/core2-64-poky-linux/meson/meson: PKGV changed from 1.7.2 [default] to 1.8.0 [default]
packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info -> /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info, added "/usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py"
packages/core2-64-poky-linux/meson/meson: PV changed from "1.7.2" to "1.8.0"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py was added
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py was added

--===============7026670042350849339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/meson/meson: FILELIST: directory renamed /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info -> /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/meson (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py was added
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.0-gdb.py was removed
Changes to packages/x86_64-linux/meson-native (sysroot):
  /usr/lib/python3.13/site-packages/meson-1.7.2.dist-info moved to /usr/lib/python3.13/site-packages/meson-1.8.0.dist-info
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/depaccumulate.py was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/depaccumulate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/__pycache__/rustdoc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/mesonbuild/scripts/rustdoc.py was added

--===============7026670042350849339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.7.2-1.8.0.patch"

RnJvbSBiZTQwMmJlYjgwYTgxOWVhODc3NmEwMmQ5ZDRhMTgxY2YzMjExNWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODozNzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuNy4yIC0+IDEuOC4wCgotLS0KIC4uLi9tZXNvbi8wMDAxLU1ha2UtQ1BV
LWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRjaCAgfCAxMCArKysrKy0tLS0tCiAuLi5kdWxlLWRv
LW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVudC13aGVuLnBhdGNoIHwgMTIgKysrKysrLS0t
LS0tCiAuLi4wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNo
IHwgIDYgKysrLS0tCiAuLi4vbWVzb24ve21lc29uXzEuNy4yLmJiID0+IG1lc29uXzEuOC4wLmJi
fSAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL3ttZXNvbl8x
LjcuMi5iYiA9PiBtZXNvbl8xLjguMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQVS1mYW1pbHktd2FybmluZ3MtZmF0
YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMS1NYWtlLUNQ
VS1mYW1pbHktd2FybmluZ3MtZmF0YWwucGF0Y2gKaW5kZXggY2EyYmNlZjFlZS4uM2IxNzM4MDBl
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uLzAwMDEtTWFr
ZS1DUFUtZmFtaWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tZXNvbi9tZXNvbi8wMDAxLU1ha2UtQ1BVLWZhbWlseS13YXJuaW5ncy1mYXRhbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGJhMmMxZjU5NjIwNmQ0NWU4ZjE0ZDRmNGQyNDM5MDIz
YTNkZTllNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2Q0ZTkwZmQ1ODNmNGYzMTMz
ZWIzZDNkNDY1OGQ3MjEzMjUxNGUzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMgSnVsIDIwMTgg
MTM6NTk6MDkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBDUFUgZmFtaWx5IHdhcm5pbmdz
IGZhdGFsCkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGludGVsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5IGIv
bWVzb25idWlsZC9lbnZjb25maWcucHkKLWluZGV4IDY3MjZkNGUuLjg0NGI2MTEgMTAwNjQ0Citp
bmRleCA0M2ZhZDBjLi4yN2JlODcxIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZjb25maWcu
cHkKICsrKyBiL21lc29uYnVpbGQvZW52Y29uZmlnLnB5Ci1AQCAtMjc4LDggKzI3OCw4IEBAIGNs
YXNzIE1hY2hpbmVJbmZvKEhvbGRhYmxlT2JqZWN0KToKK0BAIC0yODcsOCArMjg3LDggQEAgY2xh
c3MgTWFjaGluZUluZm8oSG9sZGFibGVPYmplY3QpOgogICAgICAgICAgICAgICAgICAnYnV0IGlz
IG1pc3Npbmcge30uJy5mb3JtYXQobWluaW11bV9saXRlcmFsIC0gc2V0KGxpdGVyYWwpKSkKICAK
ICAgICAgICAgIGNwdV9mYW1pbHkgPSBsaXRlcmFsWydjcHVfZmFtaWx5J10KQEAgLTI2LDEwICsy
NiwxMCBAQCBpbmRleCA2NzI2ZDRlLi44NDRiNjExIDEwMDY0NAogICAgICAgICAgZW5kaWFuID0g
bGl0ZXJhbFsnZW5kaWFuJ10KICAgICAgICAgIGlmIGVuZGlhbiBub3QgaW4gKCdsaXR0bGUnLCAn
YmlnJyk6CiBkaWZmIC0tZ2l0IGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weSBiL21lc29uYnVp
bGQvZW52aXJvbm1lbnQucHkKLWluZGV4IDM4NjMxNmUuLmI0YTBkODggMTAwNjQ0CitpbmRleCBm
MzIyY2RhLi41M2EwYWMwIDEwMDY0NAogLS0tIGEvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQog
KysrIGIvbWVzb25idWlsZC9lbnZpcm9ubWVudC5weQotQEAgLTQxOSwxMCArNDE5LDggQEAgZGVm
IGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGlsZXJzRGljdCkgLT4gc3RyOgorQEAg
LTQyOSwxMCArNDI5LDggQEAgZGVmIGRldGVjdF9jcHVfZmFtaWx5KGNvbXBpbGVyczogQ29tcGls
ZXJzRGljdCkgLT4gc3RyOgogICAgICAgICAgaWYgY29tcGlsZXJzIGFuZCBub3QgYW55X2NvbXBp
bGVyX2hhc19kZWZpbmUoY29tcGlsZXJzLCAnX19taXBzNjQnKToKICAgICAgICAgICAgICB0cmlh
bCA9ICdtaXBzJwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21l
c29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUtZW52aXJvbm1lbnQt
d2hlbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAxLXB5dGhv
bi1tb2R1bGUtZG8tbm90LW1hbmlwdWxhdGUtdGhlLWVudmlyb25tZW50LXdoZW4ucGF0Y2gKaW5k
ZXggODRhOWMxOGM1MS4uODhiODdhZTgyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21lc29uL21lc29uLzAwMDEtcHl0aG9uLW1vZHVsZS1kby1ub3QtbWFuaXB1bGF0ZS10aGUt
ZW52aXJvbm1lbnQtd2hlbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb24vMDAwMS1weXRob24tbW9kdWxlLWRvLW5vdC1tYW5pcHVsYXRlLXRoZS1lbnZpcm9ubWVu
dC13aGVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMjY0YjdmZDJjODZlZGZkNWRiNzdk
YTI2NGU4YmYwNWY1ZTJiZmViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNTMzZmMx
ODYzMjdlYTdmM2FjNzBjZWRhM2VkYzEwNDMxZTdiYTI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBNb24sIDE5IE5vdiAyMDE4IDE0OjI0OjI2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5dGhv
biBtb2R1bGU6IGRvIG5vdCBtYW5pcHVsYXRlIHRoZSBlbnZpcm9ubWVudCB3aGVuIGNhbGxpbmcK
QEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRo
b24ucHkgYi9tZXNvbmJ1aWxkL2RlcGVuZGVuY2llcy9weXRob24ucHkKLWluZGV4IDMyNmU2MDUu
LmY1ZWI1MGYgMTAwNjQ0CitpbmRleCAzZGFiMzFjLi5iOTMwN2ZjIDEwMDY0NAogLS0tIGEvbWVz
b25idWlsZC9kZXBlbmRlbmNpZXMvcHl0aG9uLnB5CiArKysgYi9tZXNvbmJ1aWxkL2RlcGVuZGVu
Y2llcy9weXRob24ucHkKLUBAIC00MDMsOSArNDAzLDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVu
djogJ0Vudmlyb25tZW50JywgZm9yX21hY2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKK0BAIC00MTAs
OSArNDEwLDYgQEAgZGVmIHB5dGhvbl9mYWN0b3J5KGVudjogJ0Vudmlyb25tZW50JywgZm9yX21h
Y2hpbmU6ICdNYWNoaW5lQ2hvaWNlJywKICAgICAgICAgICAgICAgICAgICAgIGVtcHR5Lm5hbWUg
PSAncHl0aG9uJwogICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVtcHR5CiAgCkBAIC0yNCw3
ICsyNCw3IEBAIGluZGV4IDMyNmU2MDUuLmY1ZWI1MGYgMTAwNjQ0CiAgICAgICAgICAgICAgICAg
IHRyeToKICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQeXRob25Qa2dDb25maWdEZXBlbmRl
bmN5KG5hbWUsIGVudiwga3dhcmdzLCBpbnN0YWxsYXRpb24sIFRydWUpCiAgICAgICAgICAgICAg
ICAgIGZpbmFsbHk6Ci1AQCAtNDE0LDggKzQxMSw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6
ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNoaW5lOiAnTWFjaGluZUNob2ljZScsCitAQCAtNDIxLDgg
KzQxOCw3IEBAIGRlZiBweXRob25fZmFjdG9yeShlbnY6ICdFbnZpcm9ubWVudCcsIGZvcl9tYWNo
aW5lOiAnTWFjaGluZUNob2ljZScsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9zLmVu
dmlyb25bbmFtZV0gPSB2YWx1ZQogICAgICAgICAgICAgICAgICAgICAgICAgIGVsaWYgbmFtZSBp
biBvcy5lbnZpcm9uOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZWwgb3MuZW52aXJv
bltuYW1lXQpAQCAtMzIsNSArMzIsNSBAQCBpbmRleCAzMjZlNjA1Li5mNWViNTBmIDEwMDY0NAog
LSAgICAgICAgICAgICAgICAgICAgc2V0X2VudignUEtHX0NPTkZJR19QQVRIJywgb2xkX3BrZ19w
YXRoKQogKyAgICAgICAgICAgICAgICAgICAgcGFzcwogIAotICAgICAgICAgICAgIGNhbmRpZGF0
ZXMuYXBwZW5kKGZ1bmN0b29scy5wYXJ0aWFsKHdyYXBfaW5fcHl0aG9uc19wY19kaXIsIHBrZ19u
YW1lLCBlbnYsIGt3YXJncywgaW5zdGFsbGF0aW9uKSkKLSAgICAgICAgICAgICAjIFdlIG9ubHkg
bmVlZCB0byBjaGVjayBib3RoLCBpZiBhIHB5dGhvbiBpbnN0YWxsIGhhcyBhIExJQlBDLiBJdCBt
aWdodCBwb2ludCB0byB0aGUgd3JvbmcgbG9jYXRpb24sCisgICAgICAgICAgICAgIyBPdGhlcndp
c2UgdGhpcyBkb2Vzbid0IGZ1bGZpbGwgdGhlIGludGVyZmFjZSByZXF1aXJlbWVudHMKKyAgICAg
ICAgICAgICB3cmFwX2luX3B5dGhvbnNfcGNfZGlyLmxvZ190cmllZCA9IFB5dGhvblBrZ0NvbmZp
Z0RlcGVuZGVuY3kubG9nX3RyaWVkICAjIHR5cGU6IGlnbm9yZVthdHRyLWRlZmluZWRdCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb24vMDAwMi1TdXBwb3J0LWJ1
aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWlu
LnBhdGNoCmluZGV4IGQzMTIwZTg0ZTguLjllNmEwYmQ3ODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1y
ZWNpcGVzLWFnYWluLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNv
bi8wMDAyLVN1cHBvcnQtYnVpbGRpbmctYWxsYXJjaC1yZWNpcGVzLWFnYWluLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBiY2RkNzJlZDE5NTZlMGExYjFiNzI1ZTU1MmZhMzkxYzU0OWMyMDk5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiODdlMzM3YjBhN2M4ZmRjZTJkMDViNjQy
NGY4NGU3YTBmMTMzNWVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwa2pAYXhpcy5jb20+CiBEYXRlOiBUaHUsIDI2IEp1bCAyMDE4IDE2OjMyOjQ5
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgYnVpbGRpbmcgYWxsYXJjaCByZWNpcGVz
IGFnYWluCkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0
ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weSBiL21lc29u
YnVpbGQvZW52Y29uZmlnLnB5Ci1pbmRleCA5NzAzMzE1Li43NGYyNDc3IDEwMDY0NAoraW5kZXgg
MjdiZTg3MS4uOTk0YWM3NyAxMDA2NDQKIC0tLSBhL21lc29uYnVpbGQvZW52Y29uZmlnLnB5CiAr
KysgYi9tZXNvbmJ1aWxkL2VudmNvbmZpZy5weQotQEAgLTI4LDYgKzI4LDcgQEAgZnJvbSBwYXRo
bGliIGltcG9ydCBQYXRoCitAQCAtMzEsNiArMzEsNyBAQCBpZiBULlRZUEVfQ0hFQ0tJTkc6CiAg
CiAgCiAga25vd25fY3B1X2ZhbWlsaWVzID0gKApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21lc29uL21lc29uXzEuNy4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29u
L21lc29uXzEuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uXzEuOC4wLmJiCmluZGV4IDQ1YTc0NjEyY2UuLjZlMzg4NmUw
YTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8xLjcuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS44LjAuYmIKQEAgLTE1
LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0v
bWVzb24tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS1DUFUtZmFt
aWx5LXdhcm5pbmdzLWZhdGFsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItU3VwcG9y
dC1idWlsZGluZy1hbGxhcmNoLXJlY2lwZXMtYWdhaW4ucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGQ0MGQ2M2FhNzQ4YTljMTM5Y2M0MWFiOWJmZmU0M2VkZDEx
M2M1NjM5ZDc4YmRlODE1NDRjYTk1NWFlYTg5MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwYTli
MjMzMTEyNzE1MTliZDAzZGNhMTJkN2Q4YjBlYWI1ODJjM2EyYzVkYTQzM2Q0NjViNmU1MTlkYzg4
ZTJmIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAog
aW5oZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIGdpdGh1Yi1yZWxlYXNlcwotLSAK
Mi40Ny4xCgo=

--===============7026670042350849339==--

