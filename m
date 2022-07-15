Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4853AC2BBEB
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.919.1657900667876003910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bXSjyumH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182029492a5-ad99684e-2a26-42e0-859e-c97da307cb9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/rzJLsP1gs3dMlB5laFw21D3sjht2YtqOJMM0qYnSQw=;
	b=bXSjyumHJMMEB1rBBmQfamKgsti+RPnjHoFtH+dF0SLKyynJiRUMRezqOYFgWkVi
	+dL0T3O9xQUK5hXL51EHBskw5TKViNcAGAj/feD7SPpReQ2X3RfV0QLtuWkBwJElhmQ
	joa8tM5bgxzwv5p2/ymGc9XubIZt0e4PkebtXoEA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/rzJLsP1gs3dMlB5laFw21D3sjht2YtqOJMM0qYnSQw=;
	b=OEHUmU6pc39yqNAb9CSmsFUL5DvmTdkw55mnwTyUT3t59GRLLPjaV4r+Q1GNF/H1
	yjVyEh3fidQXVzZ9XSJY54TZhAC8njvJpw0IgrW5EZVHq02PNDekuhBQyTPL3G/P+Fz
	vZe1l2lXPUV3MGaeP3sC0Fp64/kBpYv8sT24xTuA=
Content-Type: multipart/mixed; boundary="===============0594096086698361226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 7.0.5 SUCCEEDED
Message-ID: 
 <01010182029492a5-ad99684e-2a26-42e0-859e-c97da307cb9e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168080

--===============0594096086698361226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *7.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-7.0.3-7.0.5.patch
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
--===============0594096086698361226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-7.0.3-7.0.5.patch"

From 045050a407698784a670c40510f33631a8f141cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 08:29:51 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 7.0.3 -> 7.0.5

---
 ...-setuptools-scm_7.0.3.bb => python3-setuptools-scm_7.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_7.0.3.bb => python3-setuptools-scm_7.0.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
index 72529353e5..a1e719f54b 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.5.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d"
+SRC_URI[sha256sum] = "031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
-- 
2.31.1


--===============0594096086698361226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-7.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-7.0.5.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-scm: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 193065 to 193775 (+0%)
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "7.0.3" to "7.0.5"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 7.0.3 [default] to 7.0.5 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_scm-7.0.3.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_scm-7.0.5.dist-info

--===============0594096086698361226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_scm-7.0.3.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_scm-7.0.5.dist-info

--===============0594096086698361226==--

