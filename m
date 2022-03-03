Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D84DC4707E
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13795.1646329345342984659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=0ARh1t7p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f50e030fe-91fd5a98-a06a-4bf4-a673-b0fbd588c7c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ls1dsaa7dfz/A1fylDbynVfoJ8NUKoZpITp0hUsphqg=;
	b=0ARh1t7p7iY0emCMHuOhu8knf5LXAYVMdRDjS680tPNUFLS82nEgeEagQLoX8aqj
	LzHrMVmBZgjIE+N7Kq51u1MepJKgd3fOG3c/3xgPKel+FJBFS3NhbvOp3T1wawgWDGR
	nbVgV66ALNUJ48hhJ19IkPlAQHCBjr8Idv57fK2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ls1dsaa7dfz/A1fylDbynVfoJ8NUKoZpITp0hUsphqg=;
	b=BxFUmjxqVfxRVBzwv6NWQb+D2INc4LQb/kvjuBkkgJ0fM4zMCryfkFFyqjBj46eY
	nEsvcJ+KlGtgp/Pmuz8DN6WHLfMxrfyl7MQuasMZFqH+hfw9W2i50UXg8LFajvFvjX8
	2K0LE0ll6H3RL5vZQtprYTCcNJd0Oqx4ppYQUHLA=
Content-Type: multipart/mixed; boundary="===============0969846494765263726=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] asciidoc: upgrading to 10.1.4 SUCCEEDED
Message-ID: 
 <0101017f50e030fe-91fd5a98-a06a-4bf4-a673-b0fbd588c7c2-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162690

--===============0969846494765263726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *asciidoc* to *10.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-asciidoc-upgrade-10.1.3-10.1.4.patch
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
--===============0969846494765263726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/asciidoc/asciidoc-dbg: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-dbg: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc-dev: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-dev: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc-doc: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-doc: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc-locale: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-locale: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc-src: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-src: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc-staticdev: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc-staticdev: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc/asciidoc: FILELIST: directory renamed /usr/lib/python3.10/site-packages/asciidoc-10.1.3.dist-info -> /usr/lib/python3.10/site-packages/asciidoc-10.1.4.dist-info, added "/usr/lib/python3.10/site-packages/asciidoc/attrs.py /usr/lib/python3.10/site-packages/asciidoc/__pycache__/attrs.cpython-310.pyc"
packages/core2-32-poky-linux/asciidoc/asciidoc: PV changed from "10.1.3" to "10.1.4"
packages/core2-32-poky-linux/asciidoc/asciidoc: PKGSIZE changed from 1082433 to 1081650 (-0%)
packages/core2-32-poky-linux/asciidoc: PKGV changed from 10.1.3 [default] to 10.1.4 [default]
packages/core2-32-poky-linux/asciidoc: PV changed from "10.1.3" to "10.1.4"
Changes to packages/core2-32-poky-linux/asciidoc (sysroot):
  /usr/lib/python3.10/site-packages/asciidoc-10.1.3.dist-info moved to /usr/lib/python3.10/site-packages/asciidoc-10.1.4.dist-info
  /usr/lib/python3.10/site-packages/asciidoc/attrs.py was added
  /usr/lib/python3.10/site-packages/asciidoc/__pycache__/attrs.cpython-310.pyc was added

--===============0969846494765263726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/asciidoc/asciidoc: FILELIST: directory renamed /usr/lib/python3.10/site-packages/asciidoc-10.1.3.dist-info -> /usr/lib/python3.10/site-packages/asciidoc-10.1.4.dist-info, added "/usr/lib/python3.10/site-packages/asciidoc/__pycache__/attrs.cpython-310.pyc /usr/lib/python3.10/site-packages/asciidoc/attrs.py"
Changes to packages/core2-32-poky-linux/asciidoc (sysroot):
  /usr/lib/python3.10/site-packages/asciidoc-10.1.3.dist-info moved to /usr/lib/python3.10/site-packages/asciidoc-10.1.4.dist-info
  /usr/lib/python3.10/site-packages/asciidoc/attrs.py was added
  /usr/lib/python3.10/site-packages/asciidoc/__pycache__/attrs.cpython-310.pyc was added

--===============0969846494765263726==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-asciidoc-upgrade-10.1.3-10.1.4.patch"

From 80545d153f81d1318706c40ec81584ae94b1a14b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 14:39:35 +0000
Subject: [PATCH] asciidoc: upgrade 10.1.3 -> 10.1.4

---
 ...{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} (50%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
similarity index 50%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
index 34bf2550f5..3f65dc459c 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
@@ -1,3 +1,23 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYRIGHT
+# +++ COPYRIGHT
+# @@ -1,5 +1,5 @@
+#  Copyright (C) 2000-2013 Stuart Rackham
+# -Copyright (C) 2013-2020 AsciiDoc Contributors
+# +Copyright (C) 2013-2022 AsciiDoc Contributors
+#  
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "Tool for creating HTML, PDF, EPUB, man pages"
 DESCRIPTION = "AsciiDoc is a text document format for writing short documents, \
 articles, books and UNIX man pages."
@@ -5,11 +25,12 @@ articles, books and UNIX man pages."
 HOMEPAGE = "http://asciidoc.org/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
-                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
+                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
-SRCREV = "342639edbbc0dcc64354a0291d2214d4d5e65cab"
+SRCREV = "c724bbf95b1840b04bb298a61a72b6a5ea94c2ef"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.27.0


--===============0969846494765263726==--

