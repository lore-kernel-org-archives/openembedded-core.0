Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55F0D172BC
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29190.1769951567290234621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pZVc6hUI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z3cOKfyE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c1955a8a5-2ce5d46a-08e9-4705-9982-6bef4a40725c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PsotgqL9TUosTkvnsnkQ1bML+tEnRG3bvzDUJla8dm8=;
	b=pZVc6hUIZ5OQW88raWpmaojUxwDGDfTbiKDoM4NUuTenLvtxtVfTMjCHofvvFbum
	62r+EeOeRKHeND0kqsQ74yQjjNuqDPH9OUhzkmHahMKJhTdctZDkGLv0G7FBlT3WVv+
	z4i3+kqV4wPDYMtlcCOkNjaXe29NEgPSVCMWZxQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PsotgqL9TUosTkvnsnkQ1bML+tEnRG3bvzDUJla8dm8=;
	b=Z3cOKfyEC6hurSAuv5ePF/0N8cfwzRM8cNCUKtvbDTxuOEODXmWpZkUYMScsAmrU
	ulHoKgMKD3tuYAUDJ4kN2LTPT7RlkvDo2YjhggvQ+FBoJkdpHRfdm287TNcYUfTV4yX
	D2XmcsLIUMY5qoRwrh8JaYFGIGxQzdGnyZ8d5nkU=
Content-Type: multipart/mixed; boundary="===============0426722561727567986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.0 SUCCEEDED
Message-ID: <0101019c1955a8a5-2ce5d46a-08e9-4705-9982-6bef4a40725c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230284

--===============0426722561727567986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-25.3-26.0.patch
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
From 6c8a26928f6b62d6808baa11a6470221e2864ae4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:51:25 +0000
Subject: [PATCH] python3-pip: upgrade 25.3 -> 26.0

---
 .../python3-pip/no_shebang_mangling.patch     |  2 +-
 ...ython3-pip_25.3.bb => python3-pip_26.0.bb} | 25 +++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.3.bb => python3-pip_26.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index c71b46bca4..2cceebacac 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 48fa8ab5e68b0e349d988ea45bb6a8e2f9bf8fd3 Mon Sep 17 00:00:00 2001
+From fc049f7a6709642aab03e350a276577a23f4dd32 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_25.3.bb b/meta/recipes-devtools/python/python3-pip_26.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-pip_25.3.bb
rename to meta/recipes-devtools/python/python3-pip_26.0.bb
index bbc70e3eae..45f00b8897 100644
--- a/meta/recipes-devtools/python/python3-pip_25.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/pip/_vendor/idna/LICENSE.md
+# +++ src/pip/_vendor/idna/LICENSE.md
+# @@ -1,6 +1,6 @@
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2013-2024, Kim Davies and contributors.
+# +Copyright (c) 2013-2025, Kim Davies and contributors.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
@@ -7,7 +28,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
                     file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
                     file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-                    file://src/pip/_vendor/idna/LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
@@ -26,7 +47,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343"
+SRC_URI[sha256sum] = "3ce220a0a17915972fbf1ab451baae1521c4539e778b28127efa79b974aff0fa"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.47.1


--===============0426722561727567986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.
 14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging, di
 rectory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/
 lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/
 _vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi, removed "/usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/models/pylock.py", added "/usr/lib/python3.14/site-packages/pip/_internal/req/pep723.py /usr/lib/python3.14/site-packages/pip/_internal/utils/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/req/__pycache__/pep723.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/utils/pylock.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/models/release_control.py /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/release_control.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-25.3.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.0.dist-info
  /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/release_control.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/models/release_control.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/req/pep723.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/req/__pycache__/pep723.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/utils/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/utils/pylock.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/pylock.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_internal/models/pylock.py was removed

--===============0426722561727567986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-25.3.tar.gz;downloadfilename=pip-25.3.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.0.tar.gz;downloadfilename=pip-26.0.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 25.3 [default] to 26.0 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10916052 to 11080603 (+2%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "25.3" to "26.0"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-pa
 ckages/pip-26.0.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/msgpack, directory rename
 d /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/
 python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pyprojec
 t_hooks -> /usr/lib/python3.14/site-packages/pip-26.0.dist-info/licenses/src/pip/_vendor/pyproject_hooks, removed "/usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/models/pylock.py", added "/usr/lib/python3.14/site-packages/pip/_internal/models/release_control.py /usr/lib/python3.14/site-packages/pip/_internal/utils/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/req/pep723.py /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/release_control.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/utils/pylock.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/pip/_internal/req/__pycache__/pep723.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 25.3 [default] to 26.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-25.3.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.0.dist-info
  /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/release_control.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/models/release_control.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/req/pep723.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/req/__pycache__/pep723.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/utils/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/utils/pylock.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/models/__pycache__/pylock.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_internal/models/pylock.py was removed

--===============0426722561727567986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-25.3-26.0.patch"

RnJvbSA2YzhhMjY5MjhmNmI2MmQ2ODA4YmFhMTFhNjQ3MDIyMWUyODY0YWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODo1MToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI1LjMgLT4gMjYuMAoKLS0tCiAuLi4vcHl0aG9uMy1waXAvbm9f
c2hlYmFuZ19tYW5nbGluZy5wYXRjaCAgICAgfCAgMiArLQogLi4ueXRob24zLXBpcF8yNS4zLmJi
ID0+IHB5dGhvbjMtcGlwXzI2LjAuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQogMiBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGlwXzI1LjMuYmIgPT4gcHl0aG9uMy1w
aXBfMjYuMC5iYn0gKDc0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2gKaW5k
ZXggYzcxYjQ2YmNhNC4uMmNjZWViYWNhYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGlu
Zy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDhmYThhYjVlNjhiMGUzNDlkOTg4ZWE0NWJi
NmE4ZTJmOWJmOGZkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmMwNDlmN2E2NzA5
NjQyYWFiMDNlMzUwYTI3NjU3N2EyM2Y0ZGQzMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgog
RGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiArMDAwMAogU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjUuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc0JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI1LjMuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMC5i
YgppbmRleCBiYmM3MGUzZWFlLi40NWYwMGI4ODk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI1LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4wLmJiCkBAIC0xLDMgKzEsMjQgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBzcmMvcGlwL192ZW5kb3IvaWRuYS9MSUNFTlNFLm1kCisjICsrKyBz
cmMvcGlwL192ZW5kb3IvaWRuYS9MSUNFTlNFLm1kCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgQlNE
IDMtQ2xhdXNlIExpY2Vuc2UKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDEzLTIwMjQsIEtpbSBE
YXZpZXMgYW5kIGNvbnRyaWJ1dG9ycy4KKyMgK0NvcHlyaWdodCAoYykgMjAxMy0yMDI1LCBLaW0g
RGF2aWVzIGFuZCBjb250cmlidXRvcnMuCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisj
ICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRo
IG9yIHdpdGhvdXQKKyMgCisjCisKIFNVTU1BUlkgPSAiVGhlIFB5UEEgcmVjb21tZW5kZWQgdG9v
bCBmb3IgaW5zdGFsbGluZyBQeXRob24gcGFja2FnZXMiCiBIT01FUEFHRSA9ICJodHRwczovL3B5
cGkub3JnL3Byb2plY3QvcGlwIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCkBAIC03LDcgKzI4
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYzZWM1MmJh
Zjk1MTYzYjU5NzAwOGJiNDZkYjY4MDMwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Ny
Yy9waXAvX3ZlbmRvci9jZXJ0aWZpL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3OTI4NmIx
MjExYmQ1NzNjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9k
aXN0bGliL0xJQ0VOU0UudHh0O21kNT1mNmExMTQzMGQ1Y2Q2ZTJjZDM4MzJlZTk0ZjIyZGRmYyBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvZGlzdHJvL0xJQ0VO
U0U7bWQ1PWQyNzk0YzBkZjViOTA3ZmRhY2UyMzVhNjE5ZDgwMzE0IFwKLSAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9pZG5hL0xJQ0VOU0UubWQ7bWQ1PTIwNGMwNjEy
ZTQwYTRkZDQ2MDEyYTc4ZDAyYzgwZmIxIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Ny
Yy9waXAvX3ZlbmRvci9pZG5hL0xJQ0VOU0UubWQ7bWQ1PTE4YTQ3OTVjMTk4MzM0MTNhN2UyZjFj
YjNjZDNiMTQzIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9t
c2dwYWNrL0NPUFlJTkc7bWQ1PWNkOTUyMzE4MWQ5ZDRmYmY3ZmZjYTUyZWFhMmE1NzUxIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9wYWNrYWdpbmcvTElDRU5T
RTttZDU9ZmFhZGFlZGNhOTI1MWE5MGIyMDVjOTE2NzU3OGNlOTEgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vc3JjL3BpcC9fdmVuZG9yL3BrZ19yZXNvdXJjZXMvTElDRU5TRTttZDU9MTQx
NjQzZTExYzQ4ODk4MTUwZGFhODM4MDJkYmM2NWYgXApAQCAtMjYsNyArNDcsNyBAQCBpbmhlcml0
IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCiBTUkNfVVJJICs9ICJmaWxlOi8v
bm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhkMDUz
OGRiYmQ3YmFiYmQyMDdmMjYxZWQ5NjljNjVkZTQzOWY2YmM5ZTVkYmQzYjNiOWE3N2YyNWQ5NWYz
NDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2NlMjIwYTBhMTc5MTU5NzJmYmYxYWI0NTFiYWFl
MTUyMWM0NTM5ZTc3OGIyODEyN2VmYTc5Yjk3NGFmZjBmYSIKIAogUkRFUEVORFM6JHtQTn0gPSAi
XAogICBweXRob24zLWNvbXBpbGUgXAotLSAKMi40Ny4xCgo=

--===============0426722561727567986==--

