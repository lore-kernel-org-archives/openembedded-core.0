Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF13D47CC4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1476.1768526750130714605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YqXRJGN/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NIsGyt61;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc4689d14-b2b62e2d-48f5-40b2-b8fb-d1be33737645-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o+fCv7uHK/3c8D4lqVR2RkkPVKbTmmHHuFe+m8VO4ac=;
	b=YqXRJGN/0s6Qu7C6bRABoxgHBhAVO4VAmscNSFZqRdYnnvmUor4c9vLUHvS9lfwx
	Z8kOidNK0qw3YRpZ7csDKAOHJKJH15f5TSj51tPuMAN88M9x64ef8IlwprwV163C9Cw
	S7OGJh+kwDacLs5npogZF3LKmLgMvvOaxvfdnIc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o+fCv7uHK/3c8D4lqVR2RkkPVKbTmmHHuFe+m8VO4ac=;
	b=NIsGyt61TRq0vSPQV8UH0JgglzhhX8MR0KIasXlJSougITVQl56YVO/5cCOnGDRH
	pjVma/mSRceOyNm7SuizqbK5xwFApFldxO442g8ADmYt3UcbrlqEkd6X+h74ofAezXt
	qbCCPEpuS6qSWOfS5ME7zQLKI0ziDRha1k3ZFebQ=
Content-Type: multipart/mixed; boundary="===============7845968602653252909=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 1.0.3 SUCCEEDED
Message-ID: <0101019bc4689d14-b2b62e2d-48f5-40b2-b8fb-d1be33737645-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229474

--===============7845968602653252909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pathspec* to *1.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.12.1-1.0.3.patch
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
From 33c3dbe8b763213175054e00a9dc68adb32f1a1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:44:43 +0000
Subject: [PATCH] python3-pathspec: upgrade 0.12.1 -> 1.0.3

---
 .../{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_0.12.1.bb => python3-pathspec_1.0.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
index 2c80b24c28..58651bced2 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712"
+SRC_URI[sha256sum] = "bac5cf97ae2c2876e2d25ebb15078eb04d76e4b98921ee31c6f85ade8b59444d"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============7845968602653252909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info -> /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pathspec/__pycache__/_typing.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/basic.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/_base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/base.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/spec.cpython-3
 13.pyc /usr/lib/python3.13/site-packages/pathspec/_typing.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/gitignore.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/gitignore.py /usr/lib/python3.13/site-packages/pathspec/backend.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/base.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/spec.py /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/gitignore.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/simpl
 e/gitignore.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/_base.py /usr/lib/python3.13/site-packages/pathspec/_backends/agg.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/gitignore.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/gitignore.py /usr/lib/python3.13/site-packages/pathspec/_version.py /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/_base.py /usr/lib/python3.13/site-packages/pathspec/__pycache__/backend.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__init__.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/hype
 rscan/pathspec.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/agg.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/basic.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/_base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/simple/pathspec.py /usr/lib/python3.13/site-packages/pathspec/__pycache__/_version.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/base.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec
 /_backends/re2/pathspec.py /usr/lib/python3.13/site-packages/pathspec/_backends/_utils.py"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 171034 to 287288 (+68%)
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pathspec/backend.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/agg.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/_base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/agg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2 was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/_base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/_utils.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/basic.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/basic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/spec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/spec.py was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/backend.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/_typing.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/_version.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_typing.py was added
  /usr/lib/python3.13/site-packages/pathspec/_version.py was added
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/WHEEL was removed

--===============7845968602653252909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pathspec: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.12.1.tar.gz;downloadfilename=pathspec-0.12.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-1.0.3.tar.gz;downloadfilename=pathspec-1.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pathspec: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 171034 to 287288 (+68%)
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.12.1" to "1.0.3"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info -> /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__init__.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/base.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/base.py /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/_base.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/__init__.
 cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/simple/pathspec.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/pathspec.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/spec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/gitignore.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/base.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/gitignore.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/_utils.py /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/_base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/spec.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/__init__.cp
 ython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/__pycache__/backend.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/simple/gitignore.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/gitignore.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__init__.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/basic.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/pathspec.py /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/basic.py /usr/lib/python3.13/site-packages/pathspec/_typing.py /usr/lib/python3.13/site-packages/pathspec/backend.py /usr/lib/python3.13/site-packages/pathspec/_ba
 ckends/__pycache__/agg.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/_base.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/__init__.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/_base.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/__pycache__/_typing.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_version.py /usr/lib/python3.13/site-packages/pathspec/_backends/re2/gitignore.py /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/pathspec.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/__pycache__/_version.cpython-313.pyc /usr/lib/python3.13/site-packages/pathspec/_backends/agg.py /usr/
 lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/gitignore.cpython-313.pyc"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.12.1 [default] to 1.0.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pathspec-1.0.3.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pathspec/backend.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/agg.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/_base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/hyperscan/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/agg.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2 was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/_base.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/re2/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/gitignore.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/pathspec.py was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/gitignore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/simple/__pycache__/pathspec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_backends/_utils.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/base.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/basic.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__init__.py was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__ was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/basic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/__pycache__/spec.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/patterns/gitignore/spec.py was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/backend.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/_typing.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/__pycache__/_version.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pathspec/_typing.py was added
  /usr/lib/python3.13/site-packages/pathspec/_version.py was added
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pathspec-0.12.1.dist-info/WHEEL was removed

--===============7845968602653252909==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.12.1-1.0.3.patch"

RnJvbSAzM2MzZGJlOGI3NjMyMTMxNzUwNTRlMDBhOWRjNjhhZGIzMmYxYTFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6NDQ6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhdGhzcGVjOiB1cGdyYWRlIDAuMTIuMSAtPiAxLjAuMwoKLS0tCiAuLi4ve3B5dGhv
bjMtcGF0aHNwZWNfMC4xMi4xLmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMS4wLjMuYmJ9ICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhdGhzcGVjXzAuMTIuMS5i
YiA9PiBweXRob24zLXBhdGhzcGVjXzEuMC4zLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18wLjEyLjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMS4wLjMuYmIKc2ltaWxh
cml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBhdGhzcGVjXzAuMTIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzEuMC4zLmJiCmluZGV4IDJjODBiMjRjMjguLjU4NjUx
YmNlZDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
YXRoc3BlY18wLjEyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXBhdGhzcGVjXzEuMC4zLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5
dGhvbiIKIExJQ0VOU0UgPSAiTVBMLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTgxNWNhNTk5YzlkZjI0N2EwYzdmNjE5YmFiMTIzZGFkIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiYTQ4MmQ1MTUwM2ExYWIzM2IxYzY3YTZjMzgxM2EyNjk1M2RiZGM3MWMzMWRh
Y2FlZjlhODM4YzRlMjlmNTcxMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYWM1Y2Y5N2FlMmMy
ODc2ZTJkMjVlYmIxNTA3OGViMDRkNzZlNGI5ODkyMWVlMzFjNmY4NWFkZThiNTk0NDRkIgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============7845968602653252909==--

