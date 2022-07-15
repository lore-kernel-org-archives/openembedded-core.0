Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3F0C2BBF6
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.935.1657900667451541210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MTl7Gw1e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101018202948e13-fbb8d34d-5820-4be8-850e-939572080921-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CTsZwTHQJKosJKBQU5qtRGUCXWyni+DLAYESxZXtKtU=;
	b=MTl7Gw1e2U14M5hXvQz2sn2MzbGhG/VZ5Q14Amd5dTAC0hIb68TqVCL4sXKCVFVp
	vJhuoe2DRsrK3sG1Fconk8yBawbak4tFRf8ps9c9E8trEKvo0fdw4L4I1DGsFf4FJH1
	mYWS0+qwBCn85m+GGQ/qZrPHakTjp7kIBP6VMfnA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CTsZwTHQJKosJKBQU5qtRGUCXWyni+DLAYESxZXtKtU=;
	b=TppMzPX5C8hRrVtnlVb7OmWy5SGuUOmPtF7NKZI9OOaFpJYIHhLYRWWjav7IGmIm
	z4MpmT6Pv0BVD+VF/8ESSdO8Mrk5D32zLgopTMAgePUWm1bQDE3xSEjojBVQ0hr4arl
	IuP0wzHSftzOwo58fSf/cawmcUlVyHG8x58s0vL8=
Content-Type: multipart/mixed; boundary="===============2835327138987023952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2022.07 FAILED
Message-ID: 
 <0101018202948e13-fbb8d34d-5820-4be8-850e-939572080921-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168066

--===============2835327138987023952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2022.07* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2022.04-2022.07.patch
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
--===============2835327138987023952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/u-boot: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dev: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-doc: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGSIZE changed from 4611 to 4618 (+0%)
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.04-r0", added "/etc/u-boot-initial-env-qemux86-2022.07-r0"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-locale: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-src: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-src: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PV changed from "2022.04" to "2022.07"
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 711059 to 725071 (+2%)
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.04-r0.bin", added "/boot/u-boot-qemux86-2022.07-r0.bin"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2022.04 [default] to 2022.07 [default]
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2022.04" to "2022.07"

--===============2835327138987023952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2022.04-2022.07.patch"

From a33bcbcea2523c456eb426745296cf20564a2388 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 05:58:59 +0000
Subject: [PATCH] u-boot: upgrade 2022.04 -> 2022.07

---
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 ++--
 .../{u-boot_2022.04.bb => u-boot_2022.07.bb}  | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb} (20%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8fc33608d0..d7fd3c7227 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -7,12 +7,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
+SRCREV = "e092e3250270a1016c877da7bdd9384f14b1321e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta/recipes-bsp/u-boot/u-boot_2022.07.bb
similarity index 20%
rename from meta/recipes-bsp/u-boot/u-boot_2022.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.07.bb
index 0d2464d74b..843d9646fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.07.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Licenses/README
+# +++ Licenses/README
+# @@ -139,6 +139,7 @@
+#  
+#  Full name					SPDX Identifier	OSI Approved	File name		URI
+#  =======================================================================================================================================
+# +bzip2 and libbzip2 License v1.0.6		bzip2-1.0.6			bzip2-1.0.6.txt		https://spdx.org/licenses/bzip2-1.0.6.html
+#  GNU General Public License v2.0 only		GPL-2.0		Y		gpl-2.0.txt		http://www.gnu.org/licenses/gpl-2.0.txt
+#  GNU General Public License v2.0 or later	GPL-2.0+	Y		gpl-2.0.txt		http://www.gnu.org/licenses/gpl-2.0.txt
+#  GNU Library General Public License v2 or later	LGPL-2.0+	Y		lgpl-2.0.txt		http://www.gnu.org/licenses/old-licenses/lgpl-2.0.txt
+# 
+#
+
 require u-boot-common.inc
 require u-boot.inc
 
-- 
2.31.1


--===============2835327138987023952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.04-r0", added "/etc/u-boot-initial-env-qemux86-2022.07-r0"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.04-r0.bin", added "/boot/u-boot-qemux86-2022.07-r0.bin"

--===============2835327138987023952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 70 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

--===============2835327138987023952==--

