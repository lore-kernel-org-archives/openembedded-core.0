Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07786C38162
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.18885.1652634913434779649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HQboc9O7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180c8b786ec-96ad2c7d-8ccd-4160-8b33-013336a023ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OumT03Kovpdim6r3ooDHQ6jDuIom+YtnI9I5t1Rr/6g=;
	b=HQboc9O776VJPDS9xCSr7XMLo4UWV8aVKY5SbBfO3E3mZz8A7ADLiUiOwaWFsRD0
	PiNyqFxjhZxNA9BSv/anNQtwm8zkSXbXs7t1wv+vYZzLq63APM7hQ37tp6N4+1MKb5h
	TXk+pVUFHnhfqRqv4fykQz6xFwZGrVB5FE66uxhY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OumT03Kovpdim6r3ooDHQ6jDuIom+YtnI9I5t1Rr/6g=;
	b=hyWXawayTA2K4k8UjWeINqzMJ5m5UNSI5lwfaVInsPZF+RwJYWQmYd8vgg5N/mfF
	P9sx0akwasoswHpBL1BpjNqpvVbCXOs+a8tkEAofbzxnY8agEbSo3tLgpsYHsbNAPJ9
	oDiJkatN1IjAM83tb5bnETrweoz4/EHa1BfP8dbM=
Content-Type: multipart/mixed; boundary="===============2589070365412608081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.3.7 SUCCEEDED
Message-ID: 
 <01010180c8b786ec-96ad2c7d-8ccd-4160-8b33-013336a023ad-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165618

--===============2589070365412608081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.3.6-3.3.7.patch
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
--===============2589070365412608081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markdown: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.3.6.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.3.7.tar.gz"
packages/core2-32-poky-linux/python3-markdown: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PV changed from "3.3.6" to "3.3.7"
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 519402 to 519394 (-0%)
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.3.6 [default] to 3.3.7 [default]
Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.10/site-packages/Markdown-3.3.6.dist-info moved to /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info

--===============2589070365412608081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.10/site-packages/Markdown-3.3.6.dist-info moved to /usr/lib/python3.10/site-packages/Markdown-3.3.7.dist-info

--===============2589070365412608081==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.3.6-3.3.7.patch"

From 1cfddd42f1c0c4bdf0cbf0c1be455541412e6f89 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:53:34 +0000
Subject: [PATCH] python3-markdown: upgrade 3.3.6 -> 3.3.7

---
 .../{python3-markdown_3.3.6.bb => python3-markdown_3.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.3.6.bb => python3-markdown_3.3.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb b/meta/recipes-devtools/python/python3-markdown_3.3.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-markdown_3.3.6.bb
rename to meta/recipes-devtools/python/python3-markdown_3.3.7.bb
index 5ce9fef7dd..c456cecc78 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed1ecdb1e8cefc7006"
+SRC_URI[sha256sum] = "cbb516f16218e643d8e0a95b309f77eb118cb138d39a4f27851e6a63581db874"
 
 BBCLASSEXTEND = "native"
 
-- 
2.31.1


--===============2589070365412608081==--

