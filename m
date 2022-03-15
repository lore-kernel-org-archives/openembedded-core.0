Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BC0C35296
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.10486.1647349734701737647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=es4H1s/8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21c1a-7231ff51-b979-4217-bac1-79e1e3bbba5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UZNufCMMBTAjBShomHLoEljSqzDBXiKcGU1r/dBEDyA=;
	b=es4H1s/8836PcXrVpcS4XCIiRxUHX8Cg0X5qRYglCgvWoO60+P/b8DifbVeoxcLt
	oKWFMfrrVGTgVlf0iXh8s4FLtqnrNTS4GUx58xhDRs9SXjevui6wKtyAa6EJ+8VTxBd
	Kns5cXcmDi5nCxXphKQt+mfu7OYBAc2ADqmegZOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UZNufCMMBTAjBShomHLoEljSqzDBXiKcGU1r/dBEDyA=;
	b=QC1WAFroXBj0h0u941xdHoSyJAkp0yO1I3y4ZuNbBbesPVK7SuuT/tjO67KS0hfU
	SRvvvRKb8jvImtf0/B7HHp0XNtvSzaUzmiIS1J/YgIAjoBtXsH/DzCuosN/8y+2Svfv
	AImhQ6I9vL7nFGpsLxIW7T3dGP+txjLo3cg6cAB4=
Content-Type: multipart/mixed; boundary="===============7703793472538728584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 22.0.4 SUCCEEDED
Message-ID: 
 <0101017f8db21c1a-7231ff51-b979-4217-bac1-79e1e3bbba5d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163264

--===============7703793472538728584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *22.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-22.0.3-22.0.4.patch
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
--===============7703793472538728584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-22.0.3.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-22.0.4.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch"
packages/core2-32-poky-linux/python3-pip: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dbg: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-dev: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-doc: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-locale: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-src: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info -> /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info, added "/usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc /usr/lib/python3.1
 0/site-packages/pip/_vendor/distlib/_backport/tarfile.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 12183249 to 12431887 (+2%)
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "22.0.3" to "22.0.4"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__ was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py was added
Changes to packages/x86_64-linux/python3-pip-native (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py was added

--===============7703793472538728584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info -> /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info, added "/usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-310.pyc /usr/lib/python3.1
 0/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py"
Changes to packages/core2-32-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__ was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py was added
Changes to packages/x86_64-linux/python3-pip-native (sysroot):
  /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info moved to /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py was added
  /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py was added

--===============7703793472538728584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-22.0.3-22.0.4.patch"

From f4acf86f002551258090f0093c5e670013b4a32d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 08:17:23 +0000
Subject: [PATCH] python3-pip: upgrade 22.0.3 -> 22.0.4

---
 .../python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-pip_22.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.4.bb
index bfeeee789c..a8027845d4 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
+SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
 
 do_install:class-native() {
     python_pep517_do_bootstrap_install
-- 
2.27.0


--===============7703793472538728584==--

