Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08810C388F3
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.11724.1650052687027043254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yB5LZ+rd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecde5de-6fb4fd45-d2b3-4eee-8af3-0682fa9c23c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V2slE1RIh+Xr5+1TpHNGXc2PIRuNMgiEFGaijvcIDE0=;
	b=yB5LZ+rdhB/RAiuONoqW9GnyB4Y7U2L5n2oUM6kC3ZOpEizChSCvrcLumAFv7LAX
	NtP6HAxGTxStgUFm5uCl/0/XnaGc7cE/GWhFA4OAECJ9VRBzy29T9c+M0kJTq/2nBYz
	2SBz0+3HGMqrwto/kIhpStnMIEX010xf4LpCs9gI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V2slE1RIh+Xr5+1TpHNGXc2PIRuNMgiEFGaijvcIDE0=;
	b=DJTvvACWT+vKiiphfac9QjIPlHsMVzjoOdZb2BfRwvhqArTR8Pbf69r4gOrkbPDG
	6qIoWv8UMOY+6zElbRZ/DIobOy6EwMNCAkb0VimDiRkCymJWbrX8yYozPknYoxwapSt
	+gHm7BnILnHoaiI/h8tyrnS7WRsRzStcnbfQ7Bis=
Content-Type: multipart/mixed; boundary="===============7233320570546612895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 4.5.0 SUCCEEDED
Message-ID: 
 <010101802ecde5de-6fb4fd45-d2b3-4eee-8af3-0682fa9c23c5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164466

--===============7233320570546612895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *4.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-4.4.0-4.5.0.patch
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
--===============7233320570546612895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-4.4.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info

--===============7233320570546612895==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-4.4.0-4.5.0.patch"

From 4058e1801dc4c916a4f9965bccc869112b26aa6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:39:37 +0000
Subject: [PATCH] python3-sphinx: upgrade 4.4.0 -> 4.5.0

---
 ...phinx_4.4.0.bb => python3-sphinx_4.5.0.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_4.4.0.bb => python3-sphinx_4.5.0.bb} (50%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
similarity index 50%
rename from meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
index 97ec2619cb..ac986c2813 100644
--- a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
@@ -1,12 +1,34 @@
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
+# @@ -1,5 +1,8 @@
+#  License for Sphinx
+#  ==================
+# +
+# +Unless otherwise indicated, all code in the Sphinx project is licenced under the
+# +two clause BSD licence below.
+#  
+#  Copyright (c) 2007-2022 by the Sphinx team (see AUTHORS file).
+#  All rights reserved.
+# 
+#
+
 DESCRIPTION = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de4349dda741c550eb8b20f6b92f38d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "6caad9786055cb1fa22b4a365c1775816b876f91966481765d7d50e9f0dd35cc"
+SRC_URI[sha256sum] = "7bf8ca9637a4ee15af412d1a1d9689fec70523a68ca9bb9127c2f3eeb344e2e6"
 
 inherit setuptools3 pypi
 
-- 
2.27.0


--===============7233320570546612895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-4.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-4.5.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "4.4.0" to "4.5.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 4.4.0 [default] to 4.5.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 13755565 to 13751920 (-0%)
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-4.4.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-4.5.0.dist-info

--===============7233320570546612895==--

