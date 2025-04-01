Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45510C369BF
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.18073.1743511395133513718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L6LzJ/YW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e9s3vyJN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010195f1609855-2bb59cfe-f8c7-43b3-b7fc-9f1274c08d24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7tJm7gE/Nt4WI43hc323lFMQRcaqaIGXkBdjWmohS1A=;
	b=L6LzJ/YWY7cEEnG4PrIMzQ6vJDtlffyni0Nk/kcfLbMJ/VbcyDY8ZdptP7xXsyDV
	aIblVEUuraU8EDVGhkb7ai+PdW31Z1WUoMn5n3V8grCEFMgV+3NUD+PA5UQgJ0FcH+9
	iWqYoYmwDvSJFHSshdIbmBrdD1vTocFLLxgYzVDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7tJm7gE/Nt4WI43hc323lFMQRcaqaIGXkBdjWmohS1A=;
	b=e9s3vyJNTIG3t5aH8AwZ7xWWK8yIIzUnab3iWTNNIbhvwRBgYhP2MFZLyTUu3kuQ
	reaNni5nw+OJdKBKSDW0vbjEJJpXVF1xyOOxIcSRibjzV6rqMDgKNt87iVu4VGAoMwp
	8KhTVTS5XrZc8GnfC2V5++B620aPTj3/EMuvhyeA=
Content-Type: multipart/mixed; boundary="===============1640894369079237595=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.20.2 SUCCEEDED
Message-ID: <01010195f1609855-2bb59cfe-f8c7-43b3-b7fc-9f1274c08d24-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214056

--===============1640894369079237595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.20.0-0.20.2.patch
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
From 9d2ecf1ed9cb981d5a3b9917b5a79b30278bacae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 08:46:51 +0000
Subject: [PATCH] python3-beartype: upgrade 0.20.0 -> 0.20.2

---
 .../{python3-beartype_0.20.0.bb => python3-beartype_0.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.20.0.bb => python3-beartype_0.20.2.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.20.0.bb b/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.20.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.20.2.bb
index c047ed2026..9941b28fd8 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "599ecc86b88549bcb6d1af626f44d85ffbb9151ace5d7f9f3b493dce2ffee529"
+SRC_URI[sha256sum] = "38c60c065ad99364a8c767e8a0e71ba8263d467b91414ed5dcffb7758a2e8079"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============1640894369079237595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info, removed "/usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep3119.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_decornontype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdmain.py /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep3119.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py /usr/lib/python3.13/site-packages/b
 eartype/_util/cls/pep/__pycache__/utilpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep557.py", added "/usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdresolve.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep557.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdresolve.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep673.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep557.py /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep3119.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiltensordict.cpyth
 on-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/decornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decordescriptor.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep3119.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/decornontype.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiltensordict.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc /usr/lib/python3
 .13/site-packages/beartype/_decor/_nontype/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decordescriptor.py"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep673.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep673.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdresolve.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdresolve.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decordescriptor.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/decornontype.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decordescriptor.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/decornontype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiltensordict.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiltensordict.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep3119.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep3119.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdmain.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_decornontype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep3119.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep3119.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc was removed

--===============1640894369079237595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.20.0.tar.gz;downloadfilename=beartype-0.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.20.2.tar.gz;downloadfilename=beartype-0.20.2.tar.gz"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.20.0" to "0.20.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.20.0 [default] to 0.20.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdmain.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep3119.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep557.py /usr/li
 b/python3.13/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep3119.py /usr/lib/python3.13/site-packages/beartype/_decor/_decornontype.py", added "/usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep3119.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decordescriptor.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiltensordict.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decordescriptor.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.p
 yc /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdresolve.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiltensordict.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/decornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep3119.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/decornontype.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep557.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep673.py /usr
 /lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdresolve.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep673.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep557.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep557.cpython-313.pyc"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 5874545 to 5961433 (+1%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.20.0" to "0.20.2"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.20.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep673.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep673.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdresolve.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdresolve.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decordescriptor.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/decornontype.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decordescriptor.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/decornontype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiltensordict.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiltensordict.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep3119.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/clspep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep3119.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/clspep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/forward/fwdmain.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/forward/__pycache__/fwdmain.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_decornontype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decornontype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep3119.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/__pycache__/utilpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep3119.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/cls/pep/utilpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep673.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep673.cpython-313.pyc was removed

--===============1640894369079237595==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.20.0-0.20.2.patch"

RnJvbSA5ZDJlY2YxZWQ5Y2I5ODFkNWEzYjk5MTdiNWE3OWIzMDI3OGJhY2FlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwODo0Njo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4yMC4wIC0+IDAuMjAuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4yMC4wLmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4yMC4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMjAuMC5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjAuMi5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjAuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4yLmJiCmluZGV4IGMwNDdlZDIwMjYuLjk5
NDFiMjhmZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjIwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMjAuMi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2E1YmMwNWExMDlkMjM1OTEyZGE5N2EwNTNj
ZDdhNTgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1OTllY2M4NmI4ODU0OWJjYjZkMWFmNjI2
ZjQ0ZDg1ZmZiYjkxNTFhY2U1ZDdmOWYzYjQ5M2RjZTJmZmVlNTI5IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjM4YzYwYzA2NWFkOTkzNjRhOGM3NjdlOGEwZTcxYmE4MjYzZDQ2N2I5MTQxNGVkNWRj
ZmZiNzc1OGEyZTgwNzkiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIu
NDcuMQoK

--===============1640894369079237595==--

