Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92089C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.13920.1646329345066833866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yarWghef;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f50e02f0f-9368a690-6596-49a1-988c-96ba9104bf0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Oxzq85gTEt0IyprVX+D5tTcZQmvaPmgpCiDdX338T+E=;
	b=yarWghefGb1RAQTQvxiJS9qPLmxRAXEpjmvzfdySVb8hzbn0iy7dXwBjYW2O9SNn
	XuMCsbylBnUaAcJ0viL9PCO10C7Koqy6XEQx0RYjY2Vo1HygOseYbVLfWUXDFtwAvNc
	Rt+aHJSktn/qtdw3Ts9czkudJL0nxHN0Z3rL2Hgc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Oxzq85gTEt0IyprVX+D5tTcZQmvaPmgpCiDdX338T+E=;
	b=QwVx9kNKYQis04SCY7L3U5X6WM+d8OOLu7y21fSeKdW/+LJYILIXearqon8xSkA0
	ytBO4DqcCHO6BWOsbGx2JEeil9rBBahWYRAxMOJIYvlY7g/4WImGtSRi7OpjnmS8PtB
	rr7nzWLY2QDvjTspxeKPpoe47on45/CGGsGEmOCk=
Content-Type: multipart/mixed; boundary="===============8701630661391069082=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.28 SUCCEEDED
Message-ID: 
 <0101017f50e02f0f-9368a690-6596-49a1-988c-96ba9104bf0b-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162686

--===============8701630661391069082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.27-0.29.28.patch
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
--===============8701630661391069082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.27.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.28.tar.gz"
packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7042460 to 7042468 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8530787 to 8532726 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.27" to "0.29.28"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 8521879 to 8522152 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.27 [default] to 0.29.28 [default]
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.10/site-packages/Cython-0.29.27.dist-info moved to /usr/lib/python3.10/site-packages/Cython-0.29.28.dist-info

--===============8701630661391069082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.10/site-packages/Cython-0.29.27.dist-info moved to /usr/lib/python3.10/site-packages/Cython-0.29.28.dist-info

--===============8701630661391069082==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.27-0.29.28.patch"

From d6fe9f072d0fb69ce7fd4a1719d0784be29d4e55 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 14:19:33 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.27 -> 0.29.28

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.27.bb => python3-cython_0.29.28.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.27.bb => python3-cython_0.29.28.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index aeff3e77ef..5050dfd427 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2"
+SRC_URI[sha256sum] = "d6fac2342802c30e51426828fe084ff4deb1b3387367cf98976bb2e64b6f8e45"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.27.bb b/meta/recipes-devtools/python/python3-cython_0.29.28.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.27.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.28.bb
-- 
2.27.0


--===============8701630661391069082==--

