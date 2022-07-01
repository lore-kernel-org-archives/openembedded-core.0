Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73E2C2BBE6
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.39381.1656687063120417081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FNO5+tJk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010181ba3e6ca2-5cc7d67a-f958-4bae-bfff-e7dce4a7c93f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zJzqDgtPOPS3HUybURNSCIXfoAF24Wj4ib8HnXtyiBg=;
	b=FNO5+tJkEcYKXkALIsj08tIPOH4J8HpWY/EfgVaCo9fPUGmbKxYen4hmV39/FqeE
	AIjfhRrjAZ/qQoKlNL5/TAF0c64haOuZssvavtdAmlCsXdj4S0ag2ExdJxS4e1rbqJo
	pSKHJIv/U9OBvVtx1Y4GIhVVhLYI3PSl2bs3KayI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zJzqDgtPOPS3HUybURNSCIXfoAF24Wj4ib8HnXtyiBg=;
	b=YymHtdtaGFLfuyO7URCPJOlrPP2RE+HCwJBYFzhRsT9sGpGMkFoT2S5V39LmUDp4
	+XSjEymqvD44IavxcZGIvctDu58EJfUFPN+3XPusOS/oJ0o/qrt9RlaznP93FWRlfB7
	gfO/iSX2/VOAV4+zBZP7QjjBdsAWEleHFLTDKoZY=
Content-Type: multipart/mixed; boundary="===============7467280273097204325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6ca2-5cc7d67a-f958-4bae-bfff-e7dce4a7c93f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167490

--===============7467280273097204325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.0-1.2.1.patch
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
--===============7467280273097204325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.1.tar.gz"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 505980 to 507554 (+0%)
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.1.dist-info

--===============7467280273097204325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.0-1.2.1.patch"

From 5580f2398447f9afa02a705c7b96f85cd76c5b88 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:48:30 +0000
Subject: [PATCH] python3-mako: upgrade 1.2.0 -> 1.2.1

---
 ...n3-mako_1.2.0.bb => python3-mako_1.2.1.bb} | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.0.bb => python3-mako_1.2.1.bb} (27%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.0.bb b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
similarity index 27%
rename from meta/recipes-devtools/python/python3-mako_1.2.0.bb
rename to meta/recipes-devtools/python/python3-mako_1.2.1.bb
index 11e5f326bd..8540b9b7a5 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.2.1.bb
@@ -1,14 +1,38 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright 2006-2021 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2022 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# @@ -16,4 +16,4 @@
+#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# -SOFTWARE.+SOFTWARE.
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
+SRC_URI[sha256sum] = "f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.31.1


--===============7467280273097204325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.0.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.1.dist-info

--===============7467280273097204325==--

