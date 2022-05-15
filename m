Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F5BC3527A
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18724.1652634913234964414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ex4rPhjO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b7873a-b1d0f60b-c2e7-4f0f-b9a7-967929f224b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Enfa8AFtbPZKI9uESoupvt3pI/HYg3nPT7+68dfpFH0=;
	b=Ex4rPhjOMDyJyLJ+9TZAmsWVG7woYDiOho10b8Q4vZK390IkNID2zsWRy1hqP1CI
	uCoNJ2OWgOjXgAQ+kKZIKwylBSmAnqwrTXH4FHrX60+9NzWeaiUYeFkHxp+g4JcB1qI
	vDXG3nxO/soZs2y2idNJHMUuiJkz0XWROMd57+P4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Enfa8AFtbPZKI9uESoupvt3pI/HYg3nPT7+68dfpFH0=;
	b=UenHY4jAsWzJpB+CHcuelmbdhTAEf2UAG1/ZNTKywTfu816bTGi34JLurmleO318
	gnW690t9YXBqeJCId05JZQ5YvTvNyANeyAHNwi+BP+qSq9inE+pAvaXNpxiO2bYpUOK
	XciTpJEwFzHlRjmo7373uGQ3/6usK4EYsRM5QIXc=
Content-Type: multipart/mixed; boundary="===============6884534286422787241=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 8.13.0 SUCCEEDED
Message-ID: 
 <01010180c8b7873a-b1d0f60b-c2e7-4f0f-b9a7-967929f224b5-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165616

--===============6884534286422787241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *8.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-8.12.0-8.13.0.patch
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
--===============6884534286422787241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.12.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.13.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 195812 to 199119 (+2%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "8.12.0" to "8.13.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info -> /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info, removed all items "/usr/lib/python3.10/site-packages/more_itertools/more.pyi /usr/lib/python3.10/site-packages/more_itertools/recipes.py /usr/lib/python3.10/site-packages/more_itertools/recipes.pyi /usr/lib/python3.10/site-packages/more_itertools/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/more_itertools/__pycache__/recipes.cpython-310.pyc /usr/lib/python3.10/site-packages/more_itertools/__init__.pyi /usr/lib/python3.10/site-packages/more_itertools/__init__.py /usr/lib/python3.10/site-packages/more_itertools/py.typed /usr/lib/python3.10/site-packages/more_itertools/more.py /usr/lib/python3.10/site-packages/more_itertools/__pycache__/more.cpython-310.pyc"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 360339 to 1768 (-100%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 8.12.0 [default] to 8.13.0 [default]
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/more_itertools was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/more_itertools/__init__.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/__init__.pyi was removed
  /usr/lib/python3.10/site-packages/more_itertools/more.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/more.pyi was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__ was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/__init__.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/more.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/recipes.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/py.typed was removed
  /usr/lib/python3.10/site-packages/more_itertools/recipes.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/recipes.pyi was removed

--===============6884534286422787241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: FILELIST: directory renamed /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info -> /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info, removed all items "/usr/lib/python3.10/site-packages/more_itertools/__pycache__/more.cpython-310.pyc /usr/lib/python3.10/site-packages/more_itertools/__init__.pyi /usr/lib/python3.10/site-packages/more_itertools/recipes.pyi /usr/lib/python3.10/site-packages/more_itertools/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/more_itertools/py.typed /usr/lib/python3.10/site-packages/more_itertools/__init__.py /usr/lib/python3.10/site-packages/more_itertools/__pycache__/recipes.cpython-310.pyc /usr/lib/python3.10/site-packages/more_itertools/more.py /usr/lib/python3.10/site-packages/more_itertools/more.pyi /usr/lib/python3.10/site-packages/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 360339 to 1768 (-100%)
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/UNKNOWN-0.0.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/more_itertools was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/more_itertools-8.12.0.dist-info/WHEEL was removed
  /usr/lib/python3.10/site-packages/more_itertools/__init__.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/__init__.pyi was removed
  /usr/lib/python3.10/site-packages/more_itertools/more.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/more.pyi was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__ was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/__init__.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/more.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/__pycache__/recipes.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/more_itertools/py.typed was removed
  /usr/lib/python3.10/site-packages/more_itertools/recipes.py was removed
  /usr/lib/python3.10/site-packages/more_itertools/recipes.pyi was removed

--===============6884534286422787241==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-8.12.0-8.13.0.patch"

From 77a9c27e8fa81e1110113befd55ebb861a355194 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:58:01 +0000
Subject: [PATCH] python3-more-itertools: upgrade 8.12.0 -> 8.13.0

---
 ...ore-itertools_8.12.0.bb => python3-more-itertools_8.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.12.0.bb => python3-more-itertools_8.13.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
index c1e34b205d..0d6b87b905 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d247f6064"
+SRC_URI[sha256sum] = "a42901a0a5b169d925f6f217cd5a190e32ef54360905b9c39ee7db5313bfec0f"
 
 inherit pypi setuptools3 ptest
 
-- 
2.31.1


--===============6884534286422787241==--

