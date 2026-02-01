Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13332D172AA
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29196.1769951573142473470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aRClx+75;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q8jvd7eV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c1955b197-e2fba53a-1c29-45e2-a186-8ad68104a376-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=59n2lCu0BF965mxw79WtE9ezlS8Z2nYgPiq4f+0B/Co=;
	b=aRClx+75m0b0olc001kiPf6gs3GVP2HFaAzcSBpRytZ8gdGqAl8xBnoie7kEuLxP
	slReF9dtXbhqhLsz41xkPEFfPNxEey1N9ta+F1lRuul1Imn/Jvokb6qD9hFyQffTXr1
	I8GRuzmbS6PW52oKrP6+3AXj4YZfX9vH333H0OGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=59n2lCu0BF965mxw79WtE9ezlS8Z2nYgPiq4f+0B/Co=;
	b=Q8jvd7eVn1BMoH3RR+QwCApvTuu21VTkm9TiqDsnTaGUZM2wLh7JDa9U1Eikbfzo
	CZt9bFAXhQ5qX5+YXvoT7zL//a5I9B4zfgbRNo8YN4N0vFBjnnAE/+w9MUEdNaUOn2y
	q7JhAoFMfBAx1bFfDtaQ9EQebUYD4hi9hUpBYTXs=
Content-Type: multipart/mixed; boundary="===============1474229413817946455=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 80.10.2 SUCCEEDED
Message-ID: <0101019c1955b197-e2fba53a-1c29-45e2-a186-8ad68104a376-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230294

--===============1474229413817946455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *80.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-80.9.0-80.10.2.patch
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
From 1b57adf4d8b6f0dcc611c2c965a01e8eb584042c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 09:23:00 +0000
Subject: [PATCH] python3-setuptools: upgrade 80.9.0 -> 80.10.2

---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...thon3-setuptools_80.9.0.bb => python3-setuptools_80.10.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_80.9.0.bb => python3-setuptools_80.10.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 39153883b0..cfc7433f29 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From e2eab8c254f16c461de25123f6859b8a18db5cd8 Mon Sep 17 00:00:00 2001
+From d91a2908e97894b7533d4b5cec8296a78a07ce92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.10.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_80.10.2.bb
index 533d8ce3d4..9d3783159a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.10.2.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c"
+SRC_URI[sha256sum] = "8b0e9d10c784bf7d262c4e5ec5d4ec94127ce206e8738f29a437945fbc219b70"
 
 DEPENDS += "python3"
 
-- 
2.47.1


--===============1474229413817946455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 8385954 to 7369889 (-12%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__, directory renam
 ed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info, removed "/usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA 
 /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc /usr/
 lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendor
 ed/packaging/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc /usr/lib/python3.14/site-pack
 ages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist
 -info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc /usr/lib/python3.
 14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/pytho
 n3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc /usr/lib/pyt
 hon3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc /usr/lib/python3.14/s
 ite-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_util
 s.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typegu
 ard/__pycache__/_checkers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptoo
 ls/_vendor/packaging-24.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.14/site-packa
 ges/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE", added "/usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/
 _vendor/jaraco_functools-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock /usr/l
 ib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist
 -info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/
 setuptools/_vendor/importlib_metadata/_typing.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_ven
 dor/wheel-0.46.3.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/REQUESTED"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/convert.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/pack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/tags.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/unpack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed

--===============1474229413817946455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-80.9.0.tar.gz;downloadfilename=setuptools-80.9.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-80.10.2.tar.gz;downloadfilename=setuptools-80.10.2.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 492729 to 492737 (+0%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "80.9.0" to "80.10.2"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 8385954 to 7369889 (-12%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info -> /usr
 /lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ -> /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/
 __pycache__/context.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/WHEEL /usr/lib/python3.14/site-pa
 ckages/setuptools/_vendor/packaging-24.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect
 -7.3.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py /u
 sr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/
 _vendor/typeguard/_memo.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt /usr/lib/python3.14/site-package
 s/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.1
 9.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/
 jaraco.context-5.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools
 /_vendor/wheel/vendored/packaging/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_ven
 dor/wheel/vendored/__init__.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-i
 nfo/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/conte
 xt.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc /usr/lib
 /python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD", added "/usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/entry_points.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.p
 yc /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/INSTALLER
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/METADATA /usr/lib/python3
 .14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/WHEEL /usr
 /lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/REQUESTED /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-
 info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/WHEEL /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/top_level.txt /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/METADATA /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 80.9.0 [default] to 80.10.2 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "80.9.0" to "80.10.2"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_typing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/pylock.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__ was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/convert.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/pack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/tags.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__pycache__/unpack.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/_metadata.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/overlay.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/__pycache__/py313.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/__pycache__/_functools.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__pycache__/py38.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/__pycache__/context.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/__pycache__/typing_extensions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_checkers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_functions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_importhook.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_memo.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_pytest_plugin.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_suppression.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_union_transformer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__pycache__/_utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/convert.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/pack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__pycache__/unpack.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/__pycache__/util.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_elffile.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_manylinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/markers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_musllinux.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_parser.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/requirements.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/specifiers.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_structures.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/tags.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/_tokenizer.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/utils.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__pycache__/version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__ was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-2534613/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.2.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/platformdirs-4.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools-80.10.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/autocommand-2.2.2.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.7.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata/_typing.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_context-6.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco_functools-4.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/INSTALLER was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/REQUESTED was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-4.0.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/.lock was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.8.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/pylock.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.46.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/convert.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/__init__.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/pack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/tags.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_commands/unpack.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/_metadata.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.23.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/overlay.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/compat/py313.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp/_functools.py was added
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools-80.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/importlib_metadata-8.0.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect-7.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/compat/py38.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/inflect/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.collections-5.1.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/collections/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.context-5.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco/context.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.functools-4.0.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/REQUESTED was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/jaraco.text-3.12.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/more_itertools-10.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-24.2.dist-info/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/tomli-2.0.1.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard-4.3.0.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_checkers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_config.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_decorators.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_exceptions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_functions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_importhook.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_memo.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_pytest_plugin.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/py.typed was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_suppression.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_union_transformer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typeguard/_utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/INSTALLER was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions-4.12.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/typing_extensions.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel-0.45.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/convert.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/pack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/cli/unpack.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/util.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_elffile.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/__init__.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_manylinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/markers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_musllinux.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_parser.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/requirements.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/specifiers.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_structures.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/tags.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/_tokenizer.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/utils.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/packaging/version.py was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/wheel/vendored/vendor.txt was removed
  /usr/lib/python3.14/site-packages/setuptools/_vendor/zipp-3.19.2.dist-info/LICENSE was removed

--===============1474229413817946455==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-80.9.0-80.10.2.patch"

RnJvbSAxYjU3YWRmNGQ4YjZmMGRjYzYxMWMyYzk2NWEwMWU4ZWI1ODQwNDJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwOToyMzowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA4MC45LjAgLT4gODAuMTAuMgoKLS0tCiAuLi4xLV9k
aXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gg
fCAyICstCiAuLi50aG9uMy1zZXR1cHRvb2xzXzgwLjkuMC5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfODAuMTAuMi5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLXNldHVwdG9vbHNfODAuOS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184MC4xMC4yLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJs
ZS10by1zdWJzdGl0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJs
ZS10by1zdWJzdGl0ZS5wYXRjaAppbmRleCAzOTE1Mzg4M2IwLi5jZmM3NDMzZjI5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAx
LV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMv
MDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMmVhYjhjMjU0ZjE2YzQ2MWRlMjUxMjNmNjg1
OWI4YTE4ZGI1Y2Q4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkOTFhMjkwOGU5Nzg5
NGI3NTMzZDRiNWNlYzgyOTZhNzhhMDdjZTkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFdlZCwgMTEg
TWF5IDIwMjIgMjE6NDE6MTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gX2Rpc3R1dGlscy9zeXNj
b25maWcucHk6IG1ha2UgaXQgcG9zc2libGUgdG8gc3Vic3RpdGUgdGhlCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC45LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC4xMC4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgwLjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODAuMTAuMi5iYgppbmRleCA1
MzNkOGNlM2Q0Li45ZDM3ODMxNTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODAuMTAuMi5iYgpAQCAtMTEsNyArMTEs
NyBAQCBDVkVfUFJPRFVDVCA9ICJweXRob24zLXNldHVwdG9vbHMgcHl0aG9uOnNldHVwdG9vbHMi
CiBTUkNfVVJJICs9ICIgXAogICAgICAgICAgICAgZmlsZTovLzAwMDEtX2Rpc3R1dGlscy1zeXNj
b25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImYzNmI0NzQwMmVjZGU3NjhkYmZhZmM0NmU4ZTQyMDdiNDM2MGM2NTRmMWYz
YmI4NDQ3NWYwYTI4NjI4ZmIxOWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGIwZTlkMTBjNzg0
YmY3ZDI2MmM0ZTVlYzVkNGVjOTQxMjdjZTIwNmU4NzM4ZjI5YTQzNzk0NWZiYzIxOWI3MCIKIAog
REVQRU5EUyArPSAicHl0aG9uMyIKIAotLSAKMi40Ny4xCgo=

--===============1474229413817946455==--

