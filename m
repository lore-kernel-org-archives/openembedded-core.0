Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48510C2BBEA
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.938.1657900667833978007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UZLDWExJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182029492a7-39b81357-9767-4f40-a2c4-52f241d11057-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L2XEpQOyw8nGnOcCx93KsKLHBKAXzXm8+STkFk2PcjI=;
	b=UZLDWExJjclnkZHjgKGiF0KIVssWG4JZ0f7SN7tZsy3aWXv2wIf5ZjlBM7LQWRov
	5d9xEqzcfOzH2371B3D/QxxVe4vusqqmpQUnrcbLI4Hkuzz7K9HUZWX3jCBp8BBcobN
	PpKj18aUWrP/jTZzxzf1Mhy90kBlhTYhbO5wtBYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L2XEpQOyw8nGnOcCx93KsKLHBKAXzXm8+STkFk2PcjI=;
	b=Li4Krg4RGxXA1gl779CFOTqCDG+66LLq9pPOj+IQY1YO+neiNVNR2DFQsg4cT4F3
	xxi1ux91TjpHxjhOBP4O4xbZfcEG3nshSqzeZUT2s05kg4143Sf2k7/ejj9KADjrPHI
	zzFSJMeJZhq4uFPnZvQ6VC7IHUc82klK+ptXbKyE=
Content-Type: multipart/mixed; boundary="===============5047905151214878061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 63.2.0 SUCCEEDED
Message-ID: 
 <01010182029492a7-39b81357-9767-4f40-a2c4-52f241d11057-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168078

--===============5047905151214878061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *63.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-62.6.0-63.2.0.patch
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
--===============5047905151214878061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-62.6.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-63.2.0.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "62.6.0" to "63.2.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 62.6.0 [default] to 63.2.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py", added "/usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-310.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4866050 to 4858785 (-0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "62.6.0" to "63.2.0"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__ was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/_compat.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/__init__.cpython-310.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py was removed

--===============5047905151214878061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-62.6.0-63.2.0.patch"

From f37cddc9a1cf02b9116c70b9332423e79ab6f6ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 08:33:06 +0000
Subject: [PATCH] python3-setuptools: upgrade 62.6.0 -> 63.2.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_62.6.0.bb => python3-setuptools_63.2.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.6.0.bb => python3-setuptools_63.2.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index b9574070ab..9c5ff6ad9f 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From b64f3066ead6b317fb62c031c173ec6eadd44db9 Mon Sep 17 00:00:00 2001
+From 3a5ae454c0738510daf5df68b7968cab66cceb7f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
index be6707ce88..15c171b846 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741"
+SRC_URI[sha256sum] = "c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.31.1


--===============5047905151214878061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/_compat.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py", added "/usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/__pycache__/_framework_compat.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__ was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/_compat.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__pycache__/__init__.cpython-310.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.10/site-packages/setuptools-62.6.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools-63.2.0.dist-info
  /usr/lib/python3.10/site-packages/setuptools/_distutils/command/_framework_compat.py was added
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/_compat.py was removed
  /usr/lib/python3.10/site-packages/setuptools/_vendor/nspektr/__init__.py was removed

--===============5047905151214878061==--

