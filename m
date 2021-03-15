Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.326.1615826520838136003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 01F8538C12B7
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 54.1.2 SUCCEEDED
Message-ID: <MADEUP.166C91A90B7DD6B8.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149498
Content-Type: multipart/mixed; boundary="===============2270899358969514466=="

--===============2270899358969514466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *54.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-54.1.1-54.1.2.patch
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

--===============2270899358969514466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-54.1.1.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-54.1.2.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "54.1.1" to "54.1.2"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 54.1.1 [default] to 54.1.2 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3028858 to 3029297 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-54.1.2-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-54.1.2-py3.9.egg-info

--===============2270899358969514466==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-54.1.1-54.1.2.patch"

From c4c78a5b2cdcc566ff6aa64e71e6ec89ecf10d02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:28:22 +0000
Subject: [PATCH] python3-setuptools: upgrade 54.1.1 -> 54.1.2

---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_54.1.1.bb => python3-setuptools_54.1.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_54.1.1.bb => python3-setuptools_54.1.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 680edbe704..517d2c3421 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
+From 18fcb79521661f5598011f87dd0428edb08c6771 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index eeb21b5..eca1edd 100644
+index 0917804..eed4a5a 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_54.1.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_54.1.2.bb
index 74264a3814..1e205f3240 100644
--- a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_54.1.2.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "1ce82798848a978696465866bb3aaab356003c42d6143e1111fcf069ac838274"
+SRC_URI[sha256sum] = "ebd0148faf627b569c8d2a1b20f5d3b09c873f12739d71c7ee88f037d5be82ff"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.17.1


--===============2270899358969514466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-54.1.2-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-54.1.2-py3.9.egg-info

--===============2270899358969514466==--
