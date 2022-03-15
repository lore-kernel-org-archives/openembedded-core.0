Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF377C4707F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.10640.1647349735281785044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=w0fDZd7w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017f8db21bc9-74c11249-3007-4dd5-b7e8-4dd86c632f8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yrn7kwYRbyibDssXmpN+Cdpbcm3RkGWZJZyyQCDbgDY=;
	b=w0fDZd7wX5/jXo4Y2EABJ1Qt66MwhTTPYh1kgPC+EW8WUWafd/9VJ6asDqjoLpkl
	aCYPNw/bfhHTlYe242Q00kAqQ8A9EapgM/O0EWV+qPse+8UPRZeanVQsmOyLGV/LqQv
	JIHfu1+u0v4N2N2VsUJ9rAI1amJc0dXoPAecw1s4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yrn7kwYRbyibDssXmpN+Cdpbcm3RkGWZJZyyQCDbgDY=;
	b=Uni0/fXyGLNhZ/s5m12yZnNnSgIrPkOIRIjQgecAXpbn7yNxVZfCEvPipE+lsLD4
	fSBEfdhO+GACWxJ++JlMQpmNbHHIRAoLwnJ9t4w7Fypu2mlic5DYTRV5l64sKpXlxqk
	4UGmVaeu1Z4QYz4y4Dx7nZSbK9QS8rZ+zrjfqWHI=
Content-Type: multipart/mixed; boundary="===============1287775236350016589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 4.11.3 SUCCEEDED
Message-ID: 
 <0101017f8db21bc9-74c11249-3007-4dd5-b7e8-4dd86c632f8a-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163261

--===============1287775236350016589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *4.11.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-4.11.2-4.11.3.patch
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
--===============1287775236350016589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.11.2.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.11.3.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "4.11.2" to "4.11.3"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 103601 to 104704 (+1%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 4.11.2 [default] to 4.11.3 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.10/site-packages/importlib_metadata-4.11.2.dist-info moved to /usr/lib/python3.10/site-packages/importlib_metadata-4.11.3.dist-info

--===============1287775236350016589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.10/site-packages/importlib_metadata-4.11.2.dist-info moved to /usr/lib/python3.10/site-packages/importlib_metadata-4.11.3.dist-info

--===============1287775236350016589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-4.11.2-4.11.3.patch"

From 6e32a050423dcdc70c02589e8ae904656287a1b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:48:21 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 4.11.2 -> 4.11.3

---
 ...-metadata_4.11.2.bb => python3-importlib-metadata_4.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.11.2.bb => python3-importlib-metadata_4.11.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
index 25be7e7fb6..b2da69b055 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
+SRC_URI[sha256sum] = "ea4c597ebf37142f827b8f39299579e31685c31d3a438b59f469406afd0f2539"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.27.0


--===============1287775236350016589==--

