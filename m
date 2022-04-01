Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A6CC4167E
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.10615.1648819420831433197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=8l/kJ2Uy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017fe54bbc25-f2058755-f9e8-4e09-9abd-f082b9a0840e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oNfC3kHd1pimWxDjrcExMfxeOfj231YmsFG9p2q3YIY=;
	b=8l/kJ2UyRjolMqWmhAJjSF2c3V7sa5CJVpv/xko3YaE3Vx5b2eVaAw1RlHXaQpOn
	K7R8zd2vpMga05FjAfOruvzLY+0y1aT6R8pydCHE26bag9O5sAJXrrAO9BVkh60B2at
	HLdx4HCebAB/sd0oO3NNAWSADQyGrOP7MX5F6ISY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oNfC3kHd1pimWxDjrcExMfxeOfj231YmsFG9p2q3YIY=;
	b=YLlqYlBrLEqLT1BnH8mwF0OeNHvJamJxPepyu39bFrN4FqORyb/7fgYItkUAuOc6
	0CSkLevGpIJ2AjyuMlYbU60uQnMXeH4hSV8hp1UBKNgNdszY7cPQYNsulOP4ti4JwvH
	TEZMgmprkPxgikI3NDasZuLbbxX9tCGSMYcH6ncA=
Content-Type: multipart/mixed; boundary="===============4257743903127951383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 1.0.0 SUCCEEDED
Message-ID: 
 <0101017fe54bbc25-f2058755-f9e8-4e09-9abd-f082b9a0840e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163898

--===============4257743903127951383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx-rtd-theme* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-0.5.0-1.0.0.patch
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
--===============4257743903127951383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-0.5.0-1.0.0.patch"

From f866cf73c790b061ce63b43b6fd97ebcf04733bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 07:43:55 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 0.5.0 -> 1.0.0

---
 ...inx-rtd-theme_0.5.0.bb => python3-sphinx-rtd-theme_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_0.5.0.bb => python3-sphinx-rtd-theme_1.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
index fa375055a1..df34e11bb7 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "python3-sphinx"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "22c795ba2832a169ca301cd0a083f7a434e09c538c70beb42782c073651b707d"
+SRC_URI[sha256sum] = "eec6d497e4c2195fa0e8b2016b337532b8a699a68bcb22a512870e16925c6a5c"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.27.0


--===============4257743903127951383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info -> /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info, added "/usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sp
 hinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po"
Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info moved to /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.po was added

--===============4257743903127951383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-0.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-1.0.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info -> /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info, added "/usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sp
 hinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3534569 to 3593805 (+2%)
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info moved to /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.po was added

--===============4257743903127951383==--

