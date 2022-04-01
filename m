Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8B4C46467
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.10617.1648819421017693461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7MRO9Sz6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bbba2-6269d2fe-aea7-4b1f-a6d9-96cd9f01d702-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N2gsJ8lcz9Vr5aa6rguq5jXXVkBvjd1YO06pF7BHJPY=;
	b=7MRO9Sz6JgXvYvs1uUhmWSDCQFKNEZ0fh/LNCL78Lt8Pgn2WKgrhn1k1d5UTw4QL
	LvIIzC7Ymw5ml5AYlbqVwCb2Tv08G3DsjZgSZPKHfvifj2PXJ3jbJNbXAHVEQD5xQO/
	x/HjZMPdr6n1U14mfpXeetDBkt1I326WGcnaSxt4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N2gsJ8lcz9Vr5aa6rguq5jXXVkBvjd1YO06pF7BHJPY=;
	b=e6Yy36W4vGD8IFFoyeV9olVU6gysasK0UD58mzRmgeBbgYJw/fiB+2GMdx9fUjC2
	hGW82/SeUzDiwri7LYzMP+/mMEySQO0X0Fpr105PcN3v9tkoRutqgTaXVR0Ixx3Bx0s
	PRt5ZEhBEdBm8gdmLbM92CQ6/BZaRe1zxK30/484=
Content-Type: multipart/mixed; boundary="===============0755477546040965854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 22.0.4 SUCCEEDED
Message-ID: 
 <0101017fe54bbba2-6269d2fe-aea7-4b1f-a6d9-96cd9f01d702-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163906

--===============0755477546040965854==
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
--===============0755477546040965854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info -> /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info, added "/usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py /usr/lib/python3.10/
 site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py"
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

--===============0755477546040965854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-22.0.3.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-22.0.4.tar.gz file://0001-change-shebang-to-python3.patch file://no_shebang_mangling.patch file://reproducible.patch"
packages/core2-32-poky-linux/python3-pip: PKGV changed from 22.0.3 [default] to 22.0.4 [default]
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
packages/core2-32-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pip-22.0.3.dist-info -> /usr/lib/python3.10/site-packages/pip-22.0.4.dist-info, added "/usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.cfg /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/misc.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/shutil.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/__init__.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/tarfile.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__init__.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/tarfile.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/shutil.cpython-310.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/__pycache__/sysconfig.cpython-3
 10.pyc /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/misc.py /usr/lib/python3.10/site-packages/pip/_vendor/distlib/_backport/sysconfig.py"
packages/core2-32-poky-linux/python3-pip/python3-pip: PV changed from "22.0.3" to "22.0.4"
packages/core2-32-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 12161193 to 12409598 (+2%)
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

--===============0755477546040965854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-22.0.3-22.0.4.patch"

From 63a81f51be06457059d9adbd10ba907cd88909b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 07:40:34 +0000
Subject: [PATCH] python3-pip: upgrade 22.0.3 -> 22.0.4

---
 .../python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pip_22.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.4.bb
index ee3e578b2c..462d2ce71f 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
+SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.27.0


--===============0755477546040965854==--

