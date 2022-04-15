Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50118C47095
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.11585.1650052688785064273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YdGOp+AL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101802ecde8ac-9e834354-a5a1-400b-8fef-f814e53a60cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q+PuwU1Ht67GWi/L39FkZcrD/r1C+qj5xxOnJrLMmes=;
	b=YdGOp+ALDnwvCc7EFCA+2sJo5yhmgJlxaxlK3tx/oi1RspMm++iiaj+A/7Pfr8SX
	x1RfhIM930dlfAqBFc97OREk27Psm3xR+5D9aSZa+hwT6r+VvsK5lMrqfTbmDlLgFpK
	glpGpV3y7FJ9esQB5wQb9sdkevSzZzlnNLBi9bio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q+PuwU1Ht67GWi/L39FkZcrD/r1C+qj5xxOnJrLMmes=;
	b=ca6HyA0Rgt8dQLUDzKC4qRww/x/n3QsBH88DgvyI4Agly+khl44+TMuffOxxy3Q+
	rpbCoO9Wj65AF5ULyrsZNJbf49yCb/msWqjFzCL4nrCcWNQ6UUj5myge1o+aoVfzBkW
	e9RWt+vueyCpdyZ81HXL+rrKDI8mdpnMQ5vGye5c=
Content-Type: multipart/mixed; boundary="===============7461786067259412563=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20220331 SUCCEEDED
Message-ID: 
 <010101802ecde8ac-9e834354-a5a1-400b-8fef-f814e53a60cc-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164485

--===============7461786067259412563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20220331* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20211217-20220331.patch
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
--===============7461786067259412563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============7461786067259412563==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20211217-20220331.patch"

From cd833802c5f8c9e5193ce89d2736311f63bb5cdf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 11:16:37 +0000
Subject: [PATCH] acpica: upgrade 20211217 -> 20220331

---
 ...{acpica_20211217.bb => acpica_20220331.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20211217.bb => acpica_20220331.bb} (65%)

diff --git a/meta/recipes-extended/acpica/acpica_20211217.bb b/meta/recipes-extended/acpica/acpica_20220331.bb
similarity index 65%
rename from meta/recipes-extended/acpica/acpica_20211217.bb
rename to meta/recipes-extended/acpica/acpica_20220331.bb
index d1727c1dab..6957aa64ea 100644
--- a/meta/recipes-extended/acpica/acpica_20211217.bb
+++ b/meta/recipes-extended/acpica/acpica_20220331.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -2,7 +2,7 @@
+#   *
+#   * 1. Copyright Notice
+#   *
+# - * Some or all of this work - Copyright (c) 1999 - 2021, Intel Corp.
+# + * Some or all of this work - Copyright (c) 1999 - 2022, Intel Corp.
+#   * All rights reserved.
+#   *
+#   * 2. License
+# 
+#
+
 SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
@@ -10,14 +32,14 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=41a76b4b1f816240f090cf010fefebf0"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
+SRC_URI[sha256sum] = "acaff68b14f1e0804ebbfc4b97268a4ccbefcfa053b02ed9924f2b14d8a98e21"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.27.0


--===============7461786067259412563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============7461786067259412563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 8806652 to 8814404 (+0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10496339 to 10522606 (+0%)
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2662992 to 2667612 (+0%)
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20211217 [default] to 20220331 [default]
packages/core2-32-poky-linux/acpica: PV changed from "20211217" to "20220331"
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20211217.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20220331.tar.gz"
packages/core2-32-poky-linux/acpica: PKGV changed from 20211217 [default] to 20220331 [default]

--===============7461786067259412563==--

