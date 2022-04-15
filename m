Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D6FC4708A
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.11558.1650052685921310331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yGuisPZg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101802ecde5b7-c5a7c7df-3e14-44a1-b4d0-f2e8fef88ed6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pFmuY3IRESZAuCqiFmZpQAkoOQdiZYMA+gLETeiD254=;
	b=yGuisPZg1qPGsxAHAaJiK9ZcCKPTovlbtxwEVbKtNlIhVfsECikeDiuHKWpuBitu
	DV7L+KuYh4OlG4kk+oAuQz5oSsTT/EO2burZ+yrjWCVxZTPuOJc+SWOAbbirVRWINiR
	5fS46Ewue5obmC1KzEpAovoSsvKSMiT2hdHmRn7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pFmuY3IRESZAuCqiFmZpQAkoOQdiZYMA+gLETeiD254=;
	b=MassLv0CAY8EgDP5HVul4wl/6ukegq9FoYFDimPuk8AK1Ms5+beAvPVN/jZtwm+s
	HdY2IGUy40B800YbcOn7Y1M/W8B+B0abTGgd9dNtmClagQZbUkBf/zm65dXIwWQDH5h
	8Ic7nVNntJPtIUqek7dJQziMjqmKvQ4kK9RGbH10=
Content-Type: multipart/mixed; boundary="===============5368660135239416126=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 1.0.0 SUCCEEDED
Message-ID: 
 <010101802ecde5b7-c5a7c7df-3e14-44a1-b4d0-f2e8fef88ed6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164462

--===============5368660135239416126==
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
--===============5368660135239416126==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-0.5.0-1.0.0.patch"

From 3fffb9d02729e72581ed8fea221a6c7f103323e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:27:01 +0000
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


--===============5368660135239416126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info -> /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info, added "/usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sp
 hinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo"
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

--===============5368660135239416126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PV changed from "0.5.0" to "1.0.0"
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
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3534569 to 3593805 (+2%)
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "0.5.0" to "1.0.0"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 0.5.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: FILELIST: directory renamed /usr/lib/python3.10/site-packages/sphinx_rtd_theme-0.5.0.dist-info -> /usr/lib/python3.10/site-packages/sphinx_rtd_theme-1.0.0.dist-info, added "/usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/lt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pl/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/pt/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/it/LC_MESSAGES/sphin
 x.po /usr/lib/python3.10/site-packages/sphinx_rtd_theme/locale/fa_IR/LC_MESSAGES/sphinx.po"
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

--===============5368660135239416126==--

