Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10C2C352A7
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10592.1647349735317736642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FKDKhFC1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21c53-cf64f771-4852-4a69-97b7-e95a284ddc2e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VLUgySSfxnQld0dNew2EYbVqmstzq+s/XGcjsn12j2c=;
	b=FKDKhFC1TPtUNcVdWQp6hxn/iak31QmPyOFuBZh8bcUaK3WPheqmetsqlPaNyBvv
	8fgg3URTVf00UF4uNaaxqfwoYFgISbuzX4V+NnriJoDuUpydRyebChTqzHh3Jxnq4jg
	nWfHWuIYnO/t7+Rzk64RcL71xUpqVr0pEJ316vdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VLUgySSfxnQld0dNew2EYbVqmstzq+s/XGcjsn12j2c=;
	b=Cwfb8FeB9MK5e1/EM8U4WoUrgfY3K7FDLg04n4SNrUXJHmezSyz/EAEaDECQ1r06
	44zGiN1gqOF99v1S/x7gpk24WIVgitwsiBUXCs1W4zXOZ9n2F9dJXyfjm7sPBFKY2VH
	x6DD2hidpvTjmvMj1BuvGBjJ16gt+iU5+Va+S46U=
Content-Type: multipart/mixed; boundary="===============3894578071172086501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.1.0 SUCCEEDED
Message-ID: 
 <0101017f8db21c53-cf64f771-4852-4a69-97b7-e95a284ddc2e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163260

--===============3894578071172086501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.0.1-7.1.0.patch
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
--===============3894578071172086501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.1.0.tar.gz"
packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.0.1" to "7.1.0"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 1886001 to 1882701 (-0%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pytest-7.0.1.dist-info -> /usr/lib/python3.10/site-packages/pytest-7.1.0.dist-info, removed "/usr/lib/python3.10/site-packages/pytest/__pycache__/collect.cpython-310.pyc /usr/lib/python3.10/site-packages/pytest/collect.py"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.10/site-packages/pytest-7.0.1.dist-info moved to /usr/lib/python3.10/site-packages/pytest-7.1.0.dist-info
  /usr/lib/python3.10/site-packages/pytest/collect.py was removed
  /usr/lib/python3.10/site-packages/pytest/__pycache__/collect.cpython-310.pyc was removed

--===============3894578071172086501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.0.1-7.1.0.patch"

From c6b5f6c1e68c0cdeade19552aca32f382b8382bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 08:20:06 +0000
Subject: [PATCH] python3-pytest: upgrade 7.0.1 -> 7.1.0

---
 .../python/{python3-pytest_7.0.1.bb => python3-pytest_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.0.1.bb => python3-pytest_7.1.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.0.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.1.0.bb
index ea6ba80300..2be78761dc 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
+SRC_URI[sha256sum] = "f1089d218cfcc63a212c42896f1b7fbf096874d045e1988186861a1a87d27b47"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.27.0


--===============3894578071172086501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.10/site-packages/pytest-7.0.1.dist-info -> /usr/lib/python3.10/site-packages/pytest-7.1.0.dist-info, removed "/usr/lib/python3.10/site-packages/pytest/collect.py /usr/lib/python3.10/site-packages/pytest/__pycache__/collect.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.10/site-packages/pytest-7.0.1.dist-info moved to /usr/lib/python3.10/site-packages/pytest-7.1.0.dist-info
  /usr/lib/python3.10/site-packages/pytest/collect.py was removed
  /usr/lib/python3.10/site-packages/pytest/__pycache__/collect.cpython-310.pyc was removed

--===============3894578071172086501==--

