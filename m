Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282CAC54742
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1358.1721071145708285884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Dpoi3tad;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FEu9lVfh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010190b7d5981a-5cdaf47e-cae3-479e-8b86-c152d46ba9ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RqQUiM/6PASkU2m1cld7QEvFSFpkNClZVhYeM1Ran84=;
	b=Dpoi3tadWN5I7SJPao7fp8uQebxwOPjGn+qk6wWvVRsi68d++JqCHgYqUeGseXk/
	KaVlZU+aXqQiemlotw4l97Q/5oluSKHcRzHOUkczXy8TyrqZm8OLmp6UA7fLj8hGu+l
	RWgeeuxpoussixfxC9OQ31nt+wR+uWhR5SGPWFnM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RqQUiM/6PASkU2m1cld7QEvFSFpkNClZVhYeM1Ran84=;
	b=FEu9lVfh1EtbLi4277nFveRAlsSc4FbLhoUt3342NuZyIxXp7Bo5ws3DwXx4i/52
	/rIdVewc5A4JOXOoUWeT21dal/mXBepaH08HskgzBs8hGHCryvjzggQ9aRkSJ0wgJLH
	aHyeDaloK7Wmcbm8pOqJezUGpjysEAB3yVM+Y9kc=
Content-Type: multipart/mixed; boundary="===============8964071225664297438=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.10 SUCCEEDED
Message-ID: <01010190b7d5981a-5cdaf47e-cae3-479e-8b86-c152d46ba9ea-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201994

--===============8964071225664297438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.9-2.4.10.patch
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
From 9b80203e733e6610a470e7592ee3e1e88614ecbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 12:17:16 +0000
Subject: [PATCH] cups: upgrade 2.4.9 -> 2.4.10

---
 .../cups/cups/0001-use-echo-only-in-init.patch   | 11 ++++-------
 ...002-don-t-try-to-run-generated-binaries.patch | 16 ++++++----------
 ...ups-fix-multilib-install-file-conflicts.patch | 12 ++++--------
 meta/recipes-extended/cups/cups/libexecdir.patch |  5 ++---
 .../cups/{cups_2.4.9.bb => cups_2.4.10.bb}       |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.9.bb => cups_2.4.10.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index 80bbad0a44..32ad2c1d36 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,7 +1,7 @@
-From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From 545f4b11df017cffc3597d081d93124e54079c98 Mon Sep 17 00:00:00 2001
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
index 2bc26edbfc..13cac94eb1 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,21 +1,20 @@
-From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
+From 003c7a27d553519ffdec83552f15631f4367a063 Mon Sep 17 00:00:00 2001
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
index bc9260307c..ed1fb93ce2 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,7 +1,7 @@
-From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From 32b362876b415e473c8e19bcfc85629cb82c617b Mon Sep 17 00:00:00 2001
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
index 7ccad94f0f..35dddb666f 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 5a713fd530d47b08c6fcaea406ea56c6a60a46f6 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/cups/cups_2.4.9.bb b/meta/recipes-extended/cups/cups_2.4.10.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.9.bb
rename to meta/recipes-extended/cups/cups_2.4.10.bb
index e0a3522004..e16ad47cf5 100644
--- a/meta/recipes-extended/cups/cups_2.4.9.bb
+++ b/meta/recipes-extended/cups/cups_2.4.10.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
+SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
-- 
2.44.0


--===============8964071225664297438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cups/cups-dbg: PKGSIZE changed from 8116016 to 8116216 (+0%)
packages/core2-64-poky-linux/cups/cups-dbg: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-dbg: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-dev: PKGSIZE changed from 188704 to 188709 (+0%)
packages/core2-64-poky-linux/cups/cups-dev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-dev: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-doc: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-doc: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-lib: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-lib: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-libimage: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-libimage: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ca: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ca: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-cs: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-cs: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-da: PKGSIZE changed from 478934 to 478935 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-da: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-da: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-de: PKGSIZE changed from 424603 to 424604 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-de: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-de: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-en: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-en: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-es: PKGSIZE changed from 395645 to 395646 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-es: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-es: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGSIZE changed from 361012 to 361013 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-fr: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-fr: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-it: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-it: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGSIZE changed from 407728 to 407729 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ja: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ja: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGSIZE changed from 394263 to 394264 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-pt-br: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGSIZE changed from 416513 to 416514 (+0%)
packages/core2-64-poky-linux/cups/cups-locale-ru: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-ru: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-locale-zh-cn: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-src: PKGSIZE changed from 5972495 to 5972275 (-0%)
packages/core2-64-poky-linux/cups/cups-src: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-src: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-staticdev: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-staticdev: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups-webif: PKGSIZE changed from 1566146 to 1566162 (+0%)
packages/core2-64-poky-linux/cups/cups-webif: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups-webif: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups/cups: PKGSIZE changed from 7323921 to 7323922 (+0%)
packages/core2-64-poky-linux/cups/cups: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups/cups: PV changed from "2.4.9" to "2.4.10"
packages/core2-64-poky-linux/cups: SRC_URI changed from "https://github.com/OpenPrinting/cups/releases/download/v2.4.9/cups-2.4.9-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf" to "https://github.com/OpenPrinting/cups/releases/download/v2.4.10/cups-2.4.10-source.tar.gz file://0001-use-echo-only-in-init.patch file://0002-don-t-try-to-run-generated-binaries.patch file://libexecdir.patch file://0004-cups-fix-multilib-install-file-conflicts.patch file://volatiles.99_cups file://cups-volatiles.conf"
packages/core2-64-poky-linux/cups: PKGV changed from 2.4.9 [default] to 2.4.10 [default]
packages/core2-64-poky-linux/cups: PV changed from "2.4.9" to "2.4.10"

--===============8964071225664297438==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.9-2.4.10.patch"

RnJvbSA5YjgwMjAzZTczM2U2NjEwYTQ3MGU3NTkyZWUzZTFlODg2MTRlY2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTI6MTc6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
dXBzOiB1cGdyYWRlIDIuNC45IC0+IDIuNC4xMAoKLS0tCiAuLi4vY3Vwcy9jdXBzLzAwMDEtdXNl
LWVjaG8tb25seS1pbi1pbml0LnBhdGNoICAgfCAxMSArKysrLS0tLS0tLQogLi4uMDAyLWRvbi10
LXRyeS10by1ydW4tZ2VuZXJhdGVkLWJpbmFyaWVzLnBhdGNoIHwgMTYgKysrKysrLS0tLS0tLS0t
LQogLi4udXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoIHwgMTIg
KysrKy0tLS0tLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIu
cGF0Y2ggfCAgNSArKy0tLQogLi4uL2N1cHMve2N1cHNfMi40LjkuYmIgPT4gY3Vwc18yLjQuMTAu
YmJ9ICAgICAgIHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjkg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMve2N1cHNfMi40
LjkuYmIgPT4gY3Vwc18yLjQuMTAuYmJ9ICg1MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS11c2UtZWNoby1vbmx5LWluLWluaXQu
cGF0Y2gKaW5kZXggODBiYmFkMGE0NC4uMzJhZDJjMWQzNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAxLXVzZS1lY2hvLW9ubHktaW4taW5pdC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDEtdXNlLWVjaG8tb25seS1p
bi1pbml0LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBhM2Y0ZDhiYTk3ZjQ2NjlhOTU5NDNh
N2U2NWViNjFhYTQ0Y2U3OTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1NDVmNGIx
MWRmMDE3Y2ZmYzM1OTdkMDgxZDkzMTI0ZTU0MDc5Yzk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogU2F1bCBXb2xkIDxzZ3dAbGludXguaW50ZWwuY29tPgogRGF0ZTogVGh1LCAxMyBE
ZWMgMjAxMiAxOTowMzo1MiAtMDgwMAotU3ViamVjdDogW1BBVENIIDEvNF0gdXNlIGVjaG8gb25s
eSBpbiBpbml0CitTdWJqZWN0OiBbUEFUQ0hdIHVzZSBlY2hvIG9ubHkgaW4gaW5pdAogCiBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmljXQogU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CkBAIC0xMCwx
MCArMTAsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9zY2hlZHVsZXIvY3Vwcy5zaC5pbiBiL3NjaGVkdWxlci9jdXBz
LnNoLmluCi1pbmRleCA4OWFjMzZkLi42NjE4YTBmIDEwMDY0NAoraW5kZXggNzRjY2UxOC4uYzU3
ZjBkYiAxMDA2NDQKIC0tLSBhL3NjaGVkdWxlci9jdXBzLnNoLmluCiArKysgYi9zY2hlZHVsZXIv
Y3Vwcy5zaC5pbgotQEAgLTUwLDcgKzUwLDcgQEAgY2FzZSAiYHVuYW1lYCIgaW4KK0BAIC01MSw3
ICs1MSw3IEBAIGNhc2UgImB1bmFtZWAiIGluCiAgCQlFQ0hPX0VSUk9SPToKICAJCTs7CiAgCkBA
IC0yMiw2ICsyMiwzIEBAIGluZGV4IDg5YWMzNmQuLjY2MThhMGYgMTAwNjQ0CiAgCQlJU19PTj0v
YmluL3RydWUKICAJCWlmIHRlc3QgLWYgL2V0Yy9pbml0LmQvZnVuY3Rpb25zOyB0aGVuCiAgCQkJ
LiAvZXRjL2luaXQuZC9mdW5jdGlvbnMKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1kb24tdC10cnktdG8tcnVuLWdlbmVyYXRl
ZC1iaW5hcmllcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMi1k
b24tdC10cnktdG8tcnVuLWdlbmVyYXRlZC1iaW5hcmllcy5wYXRjaAppbmRleCAyYmMyNmVkYmZj
Li4xM2NhYzk0ZWIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LzAwMDItZG9uLXQtdHJ5LXRvLXJ1bi1nZW5lcmF0ZWQtYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy8wMDAyLWRvbi10LXRyeS10by1ydW4tZ2VuZXJh
dGVkLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDIxICsxLDIwIEBACi1Gcm9tIDNlOWE5NjVkY2Q2NWFi
MmQ0MGI3NTNiNmY3OTJhMWE0NTU5MTgyYWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDAwM2M3YTI3ZDU1MzUxOWZmZGVjODM1NTJmMTU2MzFmNDM2N2EwNjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLb2VuIEtvb2kgPGtvZW5AZG9taW5pb24udGhydWhlcmUubmV0Pgog
RGF0ZTogU3VuLCAzMCBKYW4gMjAxMSAxNjozNzoyNyArMDEwMAotU3ViamVjdDogW1BBVENIIDIv
NF0gZG9uJ3QgdHJ5IHRvIHJ1biBnZW5lcmF0ZWQgYmluYXJpZXMKK1N1YmplY3Q6IFtQQVRDSF0g
ZG9uJ3QgdHJ5IHRvIHJ1biBnZW5lcmF0ZWQgYmluYXJpZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogS29lbiBL
b29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4KLQogLS0tCi0gcHBkYy9NYWtlZmlsZSB8
IDMyICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQorIHBwZGMvTWFrZWZpbGUgfCA0ICsrLS0K
KyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvcHBkYy9NYWtlZmlsZSBiL3BwZGMvTWFrZWZpbGUKLWluZGV4IDMyZTJlMGIuLmYx
NDc4ZDQgMTAwNjQ0CitpbmRleCBlMzZlZDExLi4zZmU5N2UxIDEwMDY0NAogLS0tIGEvcHBkYy9N
YWtlZmlsZQogKysrIGIvcHBkYy9NYWtlZmlsZQotQEAgLTE4Niw4ICsxODYsOCBAQCBnZW5zdHJp
bmdzOgkJZ2Vuc3RyaW5ncy5vIGxpYmN1cHNwcGRjLmEgLi4vY3Vwcy8kKExJQkNVUFNTVEFUSUMp
IFwKK0BAIC0xODcsOCArMTg3LDggQEAgZ2Vuc3RyaW5nczoJCWdlbnN0cmluZ3MubyBsaWJjdXBz
cHBkYy5hIC4uL2N1cHMvJChMSUJDVVBTU1RBVElDKSBcCiAgCSQoTERfQ1hYKSAkKEFSQ0hGTEFH
UykgJChBTExfTERGTEFHUykgLW8gZ2Vuc3RyaW5ncyBnZW5zdHJpbmdzLm8gXAogIAkJbGliY3Vw
c3BwZGMuYSAkKExJTktDVVBTU1RBVElDKQogIAkkKENPREVfU0lHTikgLXMgIiQoQ09ERV9TSUdO
X0lERU5USVRZKSIgJEAKQEAgLTI2LDYgKzI1LDMgQEAgaW5kZXggMzJlMmUwYi4uZjE0NzhkNCAx
MDA2NDQKICAKICAKICAjCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvY3Vwcy9jdXBzLzAwMDQtY3Vwcy1maXgtbXVsdGlsaWItaW5zdGFsbC1maWxlLWNv
bmZsaWN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBz
LWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCmluZGV4IGJjOTI2MDMw
N2MuLmVkMWZiOTNjZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwNC1jdXBzLWZpeC1tdWx0aWxp
Yi1pbnN0YWxsLWZpbGUtY29uZmxpY3RzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA3ZGJk
YTE4ODdhYTE5YWI3MjBhZmYyMjMxMmY0Y2FmZjJkNTc1ZjYyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAzMmIzNjI4NzZiNDE1ZTQ3M2M4ZTE5YmNmYzg1NjI5Y2I4MmM2MTdiIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBXZWQsIDMgT2N0IDIwMTggMDA6Mjc6MTEgKzA4MDAKLVN1YmplY3Q6IFtQQVRD
SCA0LzRdIGN1cHM6IGZpeCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCitTdWJqZWN0
OiBbUEFUQ0hdIGN1cHM6IGZpeCBtdWx0aWxpYiBpbnN0YWxsIGZpbGUgY29uZmxpY3RzCiAKIEBD
VVBTX1NFUlZFUkJJTkAgaXMgJHtsaWJkaXJ9IHJlbGF0ZWQgdGhhdCBjYXVzZXMgbXVsdGlsaWIg
aW5zdGFsbCBmaWxlCiBjb25mbGljdC4gUmVtb3ZlIEBDVVBTX1NFUlZFUkJJTkAgZnJvbSB0aGUg
Y29tbWVudCBsaW5lIG9mIGN1cHMtZmlsZXMuY29uZiB0bwpAQCAtMTAsMTYgKzEwLDE1IEBAIGF2
b2lkIHRoZSBjb25mbGljdC4KIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ugc3Bl
Y2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29t
PgotCiAtLS0KICBjb25mL2N1cHMtZmlsZXMuY29uZi5pbiB8IDIgKy0KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmYvY3Vw
cy1maWxlcy5jb25mLmluIGIvY29uZi9jdXBzLWZpbGVzLmNvbmYuaW4KLWluZGV4IDRhNzhiYTYu
LjAzYzY1ODIgMTAwNjQ0CitpbmRleCA5MzU4NGExLi42NWI3MDUyIDEwMDY0NAogLS0tIGEvY29u
Zi9jdXBzLWZpbGVzLmNvbmYuaW4KICsrKyBiL2NvbmYvY3Vwcy1maWxlcy5jb25mLmluCi1AQCAt
NzMsNyArNzMsNyBAQCBQYWdlTG9nIEBDVVBTX0xPR0RJUkAvcGFnZV9sb2cKK0BAIC02Nyw3ICs2
Nyw3IEBAIFBhZ2VMb2cgQENVUFNfTE9HRElSQC9wYWdlX2xvZwogICNSZXF1ZXN0Um9vdCBAQ1VQ
U19SRVFVRVNUU0AKICAKICAjIExvY2F0aW9uIG9mIGhlbHBlciBwcm9ncmFtcy4uLgpAQCAtMjgs
NiArMjcsMyBAQCBpbmRleCA0YTc4YmE2Li4wM2M2NTgyIDEwMDY0NAogIAogICMgU1NML1RMUyBr
ZXljaGFpbiBmb3IgdGhlIHNjaGVkdWxlci4uLgogICNTZXJ2ZXJLZXljaGFpbiBAQ1VQU19TRVJW
RVJLRVlDSEFJTkAKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9jdXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHMvbGliZXhlY2Rpci5wYXRjaAppbmRleCA3Y2NhZDk0ZjBmLi4zNWRkZGI2NjZmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzL2xpYmV4ZWNkaXIucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9saWJleGVjZGlyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNzI0ZjdiY2RiY2ZkYjQ0NTc3OGY4YTJlNTMwYzVjMDk0
YzE4YzEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YTcxM2ZkNTMwZDQ3YjA4YzZm
Y2FlYTQwNmVhNTZjNmE2MGE0NmY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUdWUsIDEzIEp1bCAyMDIxIDEy
OjU2OjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAkbGliZXhlY2RpciBpbnN0ZWFkIG9m
IGhhcmRjb2RpbmcgJHByZWZpeC9saWIgYXMgdGhpcwpAQCAtNiwxMyArNiwxMiBAQCBTdWJqZWN0
OiBbUEFUQ0hdIFVzZSAkbGliZXhlY2RpciBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgJHByZWZpeC9s
aWIgYXMgdGhpcwogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCiAtLS0KICBjb25maWctc2NyaXB0cy9j
dXBzLWRpcmVjdG9yaWVzLm00IHwgNCArKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy1zY3JpcHRzL2N1cHMt
ZGlyZWN0b3JpZXMubTQgYi9jb25maWctc2NyaXB0cy9jdXBzLWRpcmVjdG9yaWVzLm00Ci1pbmRl
eCAyMDMzZDQ3Li4yMzAxNjZlIDEwMDY0NAoraW5kZXggMDY5ZWU3Yi4uMmY2N2U1YiAxMDA2NDQK
IC0tLSBhL2NvbmZpZy1zY3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKICsrKyBiL2NvbmZpZy1z
Y3JpcHRzL2N1cHMtZGlyZWN0b3JpZXMubTQKIEBAIC0yMzksNyArMjM5LDcgQEAgQUNfU1VCU1Qo
W0NVUFNfUkVRVUVTVFNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMv
Y3Vwc18yLjQuOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjEwLmJi
CnNpbWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9j
dXBzL2N1cHNfMi40LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1
cHNfMi40LjEwLmJiCmluZGV4IGUwYTM1MjIwMDQuLmUxNmFkNDdjZjUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQuMTAuYmIKQEAgLTIsNCArMiw0IEBAIHJlcXVpcmUgY3Vw
cy5pbmMKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYz
ODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOGZiZjQ1
MzVhMTA1NTQxMTNlMDEzZDU0ZmVkZGEwM2VlODgwMDdlYTZhOTc2MWQ2MjZhMDRlMWU0NDg5ZThj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3NTc1N2MyYmMwZjdhMjhiMDJlZTRkNTJjYTllNGIx
YWExYmEyYWZmZTE2Yjk4NTg1NGY1MzM2OTQwZTVhZDciCi0tIAoyLjQ0LjAKCg==

--===============8964071225664297438==--

