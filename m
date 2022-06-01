Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA5CCCA491
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.621.1654100323959444323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jCJQWRvG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200febad-c86b6277-68b0-429b-8d53-8056a021025f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gDztahS0YjmAY9kucAFulR6r7sJYSKevPfjBii8Iznw=;
	b=jCJQWRvGUeeGjEA4X1GVvCqRp+yfjC7fkVA5cpb21HZlfST1TT1NElJwL+bdNDbc
	bgUTGDPGJqM4M9FmQUZbdWKOMRTo4EAqjl3HpuKLzmrhJddHS/470vrfPelekH27333
	EfLweTufslkNY+DDfIlhBmIMCqjIet4hI0fJoiTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gDztahS0YjmAY9kucAFulR6r7sJYSKevPfjBii8Iznw=;
	b=haTpbybq/k5wtABelks5WsbMD01yczE/aa41suCg6G5pIwhYV9jPj5m+mfpoodc8
	22K9Dy95rtkOv1AI6wCWDixIvGb2wmO1/Zu9XSdk6HrHuS+2Hvx2Hn/SyVEkImmlAAs
	FBzuTIuZp1/GcTLZvZEOGfVFVSNsEOb22K7rM6Jo=
Content-Type: multipart/mixed; boundary="===============0910566537384736175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 5.0.0 SUCCEEDED
Message-ID: 
 <01010181200febad-c86b6277-68b0-429b-8d53-8056a021025f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166406

--===============0910566537384736175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *5.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-4.5.0-5.0.0.patch
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
--===============0910566537384736175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-4.5.0-5.0.0.patch"

From 4e19695c7fb6b74b853b2a989b6ca3a9bd680c7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 09:05:54 +0000
Subject: [PATCH] python3-sphinx: upgrade 4.5.0 -> 5.0.0

---
 .../python/{python3-sphinx_4.5.0.bb => python3-sphinx_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_4.5.0.bb => python3-sphinx_5.0.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb b/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
index f4d27f3275..93edd9db7e 100644
--- a/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "7bf8ca9637a4ee15af412d1a1d9689fec70523a68ca9bb9127c2f3eeb344e2e6"
+SRC_URI[sha256sum] = "464d9c1bd5613bcebe76b46658763f3f3dbb184da7406e632a84596d3cd8ee90"
 
 inherit setuptools3 pypi
 
-- 
2.31.1


--===============0910566537384736175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-4.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.0.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "4.5.0" to "5.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 13751917 to 13816540 (+0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/search/jssplitter.py /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/__pycache__/deprecated.cpython-310.pyc /usr/lib/python3.10/site-packages/sphinx/search/__pycache__/jssplitter.cpython-310.pyc /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.5.1.js /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/deprecated.py", added "/usr/lib/python3.10/site-packages/sphinx/themes/basic/static/_sphinx_javascript_frameworks_compat.js /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.6.0.js /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_ME
 SSAGES/sphinx.js"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 4.5.0 [default] to 5.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "4.5.0" to "5.0.0"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info
  /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.5.1.js moved to /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.6.0.js
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/_sphinx_javascript_frameworks_compat.js was added
  /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/deprecated.py was removed
  /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/__pycache__/deprecated.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/sphinx/search/jssplitter.py was removed
  /usr/lib/python3.10/site-packages/sphinx/search/__pycache__/jssplitter.cpython-310.pyc was removed

--===============0910566537384736175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.5.1.js /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/deprecated.py /usr/lib/python3.10/site-packages/sphinx/search/jssplitter.py /usr/lib/python3.10/site-packages/sphinx/search/__pycache__/jssplitter.cpython-310.pyc /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/__pycache__/deprecated.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.6.0.js /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/_sphinx_javascript_frameworks_compat.js /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_ME
 SSAGES/sphinx.js"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info
  /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.5.1.js moved to /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/jquery-3.6.0.js
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx/themes/basic/static/_sphinx_javascript_frameworks_compat.js was added
  /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/deprecated.py was removed
  /usr/lib/python3.10/site-packages/sphinx/ext/autodoc/__pycache__/deprecated.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/sphinx/search/jssplitter.py was removed
  /usr/lib/python3.10/site-packages/sphinx/search/__pycache__/jssplitter.cpython-310.pyc was removed

--===============0910566537384736175==--

