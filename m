Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B477C2BA16
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1112.1714579216266863046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TlGIYTKv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uGKY42/z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e2946e-f6f607d4-267f-44fe-aaf3-efd145b43a74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xmydMMkzjvmgh7NT4PVDapDUk7/Ps1icmjfbxrjtO9c=;
	b=TlGIYTKv437108l2Kty6n2Vi6MocZ2j5otW2sBmEhaZVyyh3uqOb5KBbNquQ95Ut
	KzUST8a+EDtYqbQzCru3oGRlcrHpbPtq5mx0XxM4gXw5jfs4hLm4VrOMM1Fd2Gfgi1Z
	NakbAVTGwk8F69m1YOfAfgGJFNqfdW/MWlT8hgCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xmydMMkzjvmgh7NT4PVDapDUk7/Ps1icmjfbxrjtO9c=;
	b=uGKY42/zWNgNViz06iCU1S/QDfWZG3ztcvZXg6cz37l9CgCkmjcEz3evovAZK46l
	nAAktl2P9EqikIb+/mLN7ouXzrE5L+5D1tgOgysW9ehNwDowjvblkcZ7xcKdh9UP5US
	umf/Ok5BCzSlIEN+m6MRSaHd50pwylR7hHwXfvUc=
Content-Type: multipart/mixed; boundary="===============2252816959726819798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.8 SUCCEEDED
Message-ID: <0101018f34e2946e-f6f607d4-267f-44fe-aaf3-efd145b43a74-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198837

--===============2252816959726819798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.7-2.4.8.patch
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

-- >8 --
From 843192d143bcd7577b5711102e4dc1b7c0fd63e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 08:50:28 +0000
Subject: [PATCH] cups: upgrade 2.4.7 -> 2.4.8

---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 meta/recipes-extended/cups/cups/libexecdir.patch |  5 ++---
 .../cups/{cups_2.4.7.bb => cups_2.4.8.bb}        |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.8.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..9116b8e781 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From e80a7f0aa247ea28e069fe90dccb647a47867ad2 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
-Subject: [PATCH 1/4] use echo only in init
+Subject: [PATCH] use echo only in init
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scheduler/cups.sh.in b/scheduler/cups.sh.in
-index 89ac36d..6618a0f 100644
+index 74cce18..c57f0db 100644
 --- a/scheduler/cups.sh.in
 +++ b/scheduler/cups.sh.in
-@@ -50,7 +50,7 @@ case "`uname`" in
+@@ -51,7 +51,7 @@ case "`uname`" in
  		ECHO_ERROR=:
  		;;
  
@@ -22,6 +22,3 @@ index 89ac36d..6618a0f 100644
  		IS_ON=/bin/true
  		if test -f /etc/init.d/functions; then
  			. /etc/init.d/functions
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 2bc26edbfc..27d4578add 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From f058c45a70e1536e4269dc41f28233c1582659a2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
-Subject: [PATCH 2/4] don't try to run generated binaries
+Subject: [PATCH] don't try to run generated binaries
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
 ---
- ppdc/Makefile | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
+ ppdc/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 32e2e0b..f1478d4 100644
+index e36ed11..3fe97e1 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -186,8 +186,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+@@ -187,8 +187,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a $(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
@@ -26,6 +25,3 @@ index 32e2e0b..f1478d4 100644
  
  
  #
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index bc9260307c..c1f48aa1e2 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From d58d7f245f0e4667c29501ec9929734b96f4e16b Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
-Subject: [PATCH 4/4] cups: fix multilib install file conflicts
+Subject: [PATCH] cups: fix multilib install file conflicts
 
 @CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
 conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
@@ -10,16 +10,15 @@ avoid the conflict.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  conf/cups-files.conf.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 4a78ba6..03c6582 100644
+index 93584a1..65b7052 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
@@ -28,6 +27,3 @@ index 4a78ba6..03c6582 100644
  
  # SSL/TLS keychain for the scheduler...
  #ServerKeychain @CUPS_SERVERKEYCHAIN@
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f..3e7ac48a55 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 9b219659be2f57e8d52c567cf961c5ac82f760b2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
diff --git a/meta/recipes-extended/cups/cups_2.4.7.bb b/meta/recipes-extended/cups/cups_2.4.8.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.7.bb
rename to meta/recipes-extended/cups/cups_2.4.8.bb
index f4b0282e4c..c0cddf7e99 100644
--- a/meta/recipes-extended/cups/cups_2.4.7.bb
+++ b/meta/recipes-extended/cups/cups_2.4.8.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
+SRC_URI[sha256sum] = "75c326b4ba73975efcc9a25078c4b04cdb4ee333caaad0d0823dbd522c6479a0"
-- 
2.44.0


--===============2252816959726819798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8283088 to 8303648 (+0%)
packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-dev: PKGSIZE changed from 188148 to 188711 (+0%)
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-doc: PKGSIZE changed from 225888 to 226027 (+0%)
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGSIZE changed from 340323 to 340366 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGSIZE changed from 299550 to 299593 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGSIZE changed from 478891 to 478934 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGSIZE changed from 424560 to 424603 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGSIZE changed from 387387 to 387430 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGSIZE changed from 395602 to 395645 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGSIZE changed from 359727 to 359770 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGSIZE changed from 342273 to 342316 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGSIZE changed from 407685 to 407728 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGSIZE changed from 394220 to 394263 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGSIZE changed from 343945 to 343988 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5944699 to 5969837 (+0%)
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1565612 to 1566146 (+0%)
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7306827 to 7315729 (+0%)
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.7" to "2.4.8"
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.7/cups-2.4.7-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.8/cups-2.4.8-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-64-poky-linux/cups: PV changed from "2.4.7" to "2.4.8"

--===============2252816959726819798==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.7-2.4.8.patch"

RnJvbSA4NDMxOTJkMTQzYmNkNzU3N2I1NzExMTAyZTRkYzFiN2MwZmQ2M2UwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwODo1MDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjcgLT4gMi40LjgKCi0tLQogLi4uL2N1cHMvY3Vwcy8wMDAxLXVzZS1l
Y2hvLW9ubHktaW4taW5pdC5wYXRjaCAgIHwgMTEgKysrKy0tLS0tLS0KIC4uLjAwMi1kb24tdC10
cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaCB8IDE2ICsrKysrKy0tLS0tLS0tLS0K
IC4uLnVwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaCB8IDEyICsr
KystLS0tLS0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBh
dGNoIHwgIDUgKystLS0KIC4uLi9jdXBzL3tjdXBzXzIuNC43LmJiID0+IGN1cHNfMi40LjguYmJ9
ICAgICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDI5IGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL3tjdXBzXzIuNC43
LmJiID0+IGN1cHNfMi40LjguYmJ9ICg1MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQucGF0
Y2gKaW5kZXggODBiYmFkMGE0NC4uOTExNmI4ZTc4MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1pbi1p
bml0LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBhM2Y0ZDhiYTk3ZjQ2NjlhOTU5NDNhN2U2
NWViNjFhYTQ0Y2U3OTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlODBhN2YwYWEy
NDdlYTI4ZTA2OWZlOTBkY2NiNjQ3YTQ3ODY3YWQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogVGh1LCAxMyBEZWMg
MjAxMiAxOTowMzo1MiAtMDgwMAotU3ViamVjdDogW1BBVENIIDEvNF0gdXNlIGVjaG8gb25seSBp
biBpbml0CitTdWJqZWN0OiBbUEFUQ0hdIHVzZSBlY2hvIG9ubHkgaW4gaW5pdAogCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CkBAIC0xMCwxMCAr
MTAsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9zY2hlZHVsZXIvY3Vwcy5zaC5pbiBiL3NjaGVkdWxlci9jdXBzLnNo
LmluCi1pbmRleCA4OWFjMzZkLi42NjE4YTBmIDEwMDY0NAoraW5kZXggNzRjY2UxOC4uYzU3ZjBk
YiAxMDA2NDQKIC0tLSBhL3NjaGVkdWxlci9jdXBzLnNoLmluCiArKysgYi9zY2hlZHVsZXIvY3Vw
cy5zaC5pbgotQEAgLTUwLDcgKzUwLDcgQEAgY2FzZSAiYHVuYW1lYCIgaW4KK0BAIC01MSw3ICs1
MSw3IEBAIGNhc2UgImB1bmFtZWAiIGluCiAgCQlFQ0hPX0VSUk9SPToKICAJCTs7CiAgCkBAIC0y
Miw2ICsyMiwzIEBAIGluZGV4IDg5YWMzNmQuLjY2MThhMGYgMTAwNjQ0CiAgCQlJU19PTj0vYmlu
L3RydWUKICAJCWlmIHRlc3QgLWYgL2V0Yy9pbml0LmQvZnVuY3Rpb25zOyB0aGVuCiAgCQkJLiAv
ZXRjL2luaXQuZC9mdW5jdGlvbnMKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1i
aW5hcmllcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24t
dC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAppbmRleCAyYmMyNmVkYmZjLi4y
N2Q0NTc4YWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAw
MDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJhdGVk
LWJpbmFyaWVzLnBhdGNoCkBAIC0xLDIxICsxLDIwIEBACi1Gcm9tIDNlOWE5NjVkY2Q2NWFiMmQ0
MGI3NTNiNmY3OTJhMWE0NTU5MTgyYWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYw
NThjNDVhNzBlMTUzNmU0MjY5ZGM0MWYyODIzM2MxNTgyNjU5YTIgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLb2VuIEtvb2kgPGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0PgogRGF0
ZTogU3VuLCAzMCBKYW4gMjAxMSAxNjozNzoyNyArMDEwMAotU3ViamVjdDogW1BBVENIIDIvNF0g
ZG9uJ3QgdHJ5IHRvIHJ1biBnZW5lcmF0ZWQgYmluYXJpZXMKK1N1YmplY3Q6IFtQQVRDSF0gZG9u
J3QgdHJ5IHRvIHJ1biBnZW5lcmF0ZWQgYmluYXJpZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogS29lbiBLb29p
IDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KLQogLS0tCi0gcHBkYy9NYWtlZmlsZSB8IDMy
ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQorIHBwZGMvTWFrZWZpbGUgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvcHBkYy9NYWtlZmlsZSBiL3BwZGMvTWFrZWZpbGUKLWluZGV4IDMyZTJlMGIuLmYxNDc4
ZDQgMTAwNjQ0CitpbmRleCBlMzZlZDExLi4zZmU5N2UxIDEwMDY0NAogLS0tIGEvcHBkYy9NYWtl
ZmlsZQogKysrIGIvcHBkYy9NYWtlZmlsZQotQEAgLTE4Niw4ICsxODYsOCBAQCBnZW5zdHJpbmdz
OgkJZ2Vuc3RyaW5ncy5vIGxpYmN1cHNwcGRjLmEgLi4vY3Vwcy8kKExJQkNVUFNTVEFUSUMpIFwK
K0BAIC0xODcsOCArMTg3LDggQEAgZ2Vuc3RyaW5nczoJCWdlbnN0cmluZ3MubyBsaWJjdXBzcHBk
Yy5hIC4uL2N1cHMvJChMSUJDVVBTU1RBVElDKSBcCiAgCSQoTERfQ1hYKSAkKEFSQ0hGTEFHUykg
JChBTExfTERGTEFHUykgLW8gZ2Vuc3RyaW5ncyBnZW5zdHJpbmdzLm8gXAogIAkJbGliY3Vwc3Bw
ZGMuYSAkKExJTktDVVBTU1RBVElDKQogIAkkKENPREVfU0lHTikgLXMgIiQoQ09ERV9TSUdOX0lE
RU5USVRZKSIgJEAKQEAgLTI2LDYgKzI1LDMgQEAgaW5kZXggMzJlMmUwYi4uZjE0NzhkNCAxMDA2
NDQKICAKICAKICAjCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZs
aWN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZp
eC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCmluZGV4IGJjOTI2MDMwN2Mu
LmMxZjQ4YWExZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMv
MDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1p
bnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA3ZGJkYTE4
ODdhYTE5YWI3MjBhZmYyMjMxMmY0Y2FmZjJkNTc1ZjYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkNThkN2YyNDVmMGU0NjY3YzI5NTAxZWM5OTI5NzM0Yjk2ZjRlMTZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBXZWQsIDMgT2N0IDIwMTggMDA6Mjc6MTEgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSCA0
LzRdIGN1cHM6IGZpeCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCitTdWJqZWN0OiBb
UEFUQ0hdIGN1cHM6IGZpeCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCiAKIEBDVVBT
X1NFUlZFUkJJTkAgaXMgJHtsaWJkaXJ9IHJlbGF0ZWQgdGhhdCBjYXVzZXMgbXVsdGlsaWIgaW5z
dGFsbCBmaWxlCiBjb25mbGljdC4gUmVtb3ZlIEBDVVBTX1NFUlZFUkJJTkAgZnJvbSB0aGUgY29t
bWVudCBsaW5lIG9mIGN1cHMtZmlsZXMuY29uZiB0bwpAQCAtMTAsMTYgKzEwLDE1IEBAIGF2b2lk
IHRoZSBjb25mbGljdC4KIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3BlY2lm
aWNdCiAKIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgot
CiAtLS0KICBjb25mL2N1cHMtZmlsZXMuY29uZi5pbiB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmYvY3Vwcy1m
aWxlcy5jb25mLmluIGIvY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4KLWluZGV4IDRhNzhiYTYuLjAz
YzY1ODIgMTAwNjQ0CitpbmRleCA5MzU4NGExLi42NWI3MDUyIDEwMDY0NAogLS0tIGEvY29uZi9j
dXBzLWZpbGVzLmNvbmYuaW4KICsrKyBiL2NvbmYvY3Vwcy1maWxlcy5jb25mLmluCi1AQCAtNzMs
NyArNzMsNyBAQCBQYWdlTG9nIEBDVVBTX0xPR0RJUkAvcGFnZV9sb2cKK0BAIC02Nyw3ICs2Nyw3
IEBAIFBhZ2VMb2cgQENVUFNfTE9HRElSQC9wYWdlX2xvZwogICNSZXF1ZXN0Um9vdCBAQ1VQU19S
RVFVRVNUU0AKICAKICAjIExvY2F0aW9uIG9mIGhlbHBlciBwcm9ncmFtcy4uLgpAQCAtMjgsNiAr
MjcsMyBAQCBpbmRleCA0YTc4YmE2Li4wM2M2NTgyIDEwMDY0NAogIAogICMgU1NML1RMUyBrZXlj
aGFpbiBmb3IgdGhlIHNjaGVkdWxlci4uLgogICNTZXJ2ZXJLZXljaGFpbiBAQ1VQU19TRVJWRVJL
RVlDSEFJTkAKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBz
L2N1cHMvbGliZXhlY2Rpci5wYXRjaAppbmRleCA3Y2NhZDk0ZjBmLi4zZTdhYzQ4YTU1IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAxNzI0ZjdiY2RiY2ZkYjQ0NTc3OGY4YTJlNTMwYzVjMDk0YzE4
YzEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5YjIxOTY1OWJlMmY1N2U4ZDUyYzU2
N2NmOTYxYzVhYzgyZjc2MGIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUdWUsIDEzIEp1bCAyMDIxIDEyOjU2
OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAkbGliZXhlY2RpciBpbnN0ZWFkIG9mIGhh
cmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhpcwpAQCAtNiwxMyArNiwxMiBAQCBTdWJqZWN0OiBb
UEFUQ0hdIFVzZSAkbGliZXhlY2RpciBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9saWIg
YXMgdGhpcwogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCiAtLS0KICBjb25maWctc2NyaXB0cy9jdXBz
LWRpcmVjdG9yaWVzLm00IHwgNCArKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGly
ZWN0b3JpZXMubTQgYi9jb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00Ci1pbmRleCAy
MDMzZDQ3Li4yMzAxNjZlIDEwMDY0NAoraW5kZXggMDY5ZWU3Yi4uMmY2N2U1YiAxMDA2NDQKIC0t
LSBhL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKICsrKyBiL2NvbmZpZy1zY3Jp
cHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKIEBAIC0yMzksNyArMjM5LDcgQEAgQUNfU1VCU1QoW0NV
UFNfUkVRVUVTVFNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vw
c18yLjQuNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjguYmIKc2lt
aWxhcml0eSBpbmRleCA1MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwc18yLjQuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18y
LjQuOC5iYgppbmRleCBmNGIwMjgyZTRjLi5jMGNkZGY3ZTk5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL2N1cHNfMi40LjguYmIKQEAgLTIsNCArMiw0IEBAIHJlcXVpcmUgY3Vwcy5pbmMK
IAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkZDU0MjI4ZGQ5MDM1
MjY0MjhjZTdlMzc5NjFhZmFlZDIzMGFkMzEwNzg4MTQxZGE3NWNlYmFhMDgzNjJjZjZjIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjc1YzMyNmI0YmE3Mzk3NWVmY2M5YTI1MDc4YzRiMDRjZGI0ZWUz
MzNjYWFhZDBkMDgyM2RiZDUyMmM2NDc5YTAiCi0tIAoyLjQ0LjAKCg==

--===============2252816959726819798==--

