Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB986C0C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z19so1473242pgl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=acM9903GH7lpC4j7nlBmmc9ZcQhgGrON11UVfBwJQPw=;
	b=kMz2B23T9LbOukwmi4ulS1kU8vC/jccK8MUeWR017DEX1v37ENhGG6Y+t1a+NHWqCa
	I0m4X5nzXhJgQEeA7H5TvP0b2RpI8panTiF9OZ//Gtnql5iLKz9Wwxtzeee52bwNm9Vd
	//Oc2wCosxjs//TvkSRV18MYZlcjF7sJBkORR9peTkYwiXvV1rFv4Ai65x6dz2xQz1TE
	46yqUTrcAZ+djyWBwkPQgwURCEn57XGYKHQkhWGWxr91TFi077EVWXDmv9AhixGR2dr6
	cMsK4rDF2tImnbpTjjZOOOCAcumNmjdsZCwIH1JOABuHG2N6/10ie85MkEfEKYw20xQC
	3nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=acM9903GH7lpC4j7nlBmmc9ZcQhgGrON11UVfBwJQPw=;
	b=aGzVZpfjogzNQwJppiHg5MT9G92tKZ0wmd/0djmUYHzK0qJ0R1u+WMcB4eOHExgswU
	BfXB2GA9wFAtFod3xNtMx7e4O6guIR/y6Xr9zkUkUoyw7hbIRgulNZXN3gjHdR/p0sWD
	742CXagVEefh2O6a9C93JlMj4nHaJNH/yHjs0qvsrap8IqCaB6F+e29tF44zSpyxloXi
	+EwyNB4jM/DvzMKn2ZkeeiHUsXS91wTlVPuI+ExTlVrFPpyGeIWOmPverKxh2IeMM+0c
	AwL8zUZ0KtZqb1BybXl8rPto3An6W6OI81zcxity38zBpR9BBVGlXQqjubUTd08+4S28
	PEnA==
X-Gm-Message-State: APjAAAWNpCbRnRPuilRGln/tQ6SSBki8IkGWiyw7Hym7Ar7YS7S1tFEk
	wOCqGyTDBxkcuJ7Xoau/lqDo8dipVq8=
X-Google-Smtp-Source: APXvYqz/mz7XeBYwRd1ObYVv/QkyRlRsp6/Y+h5IqLyMeg4hyNFDQIU7DhU1biKwgO1HMJRUN9qJPg==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr3787273pgd.198.1561568022009;
	Wed, 26 Jun 2019 09:53:42 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:10 -0700
Message-Id: <3c76b6660fc21a987e960dedb2631dcd27b87d07.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 09/25] cups: upgrade to 2.2.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 16:53:41 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Source: OpenEmbedded.org
MR: 97351
Type: Integration
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended/cups?h=warrior&id=ee57d79aec06e9b160cf2713636cda650ba68d5a
ChangeID: ee57d79aec06e9b160cf2713636cda650ba68d5a
Description:

The following patch is rebased.

  0001-don-t-try-to-run-generated-binaries.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

CUPS 2.2.9 is a bug fix release that addresses issues in the scheduler,
IPP Everywhere support, CUPS library, and USB printer support. Changes include:

    Localization changes (Issue #5348, Issue #5362, Issue #5408)
    Documentation updates (Issue #5369)
    The lpadmin command would create a non-working printer in some error cases
    (Issue #5305)
    The scheduler would crash if an empty AccessLog directive was specified
    (Issue #5309)
    Fixed a regression in the changes to ippValidateAttribute (Issue #5322,
    Issue #5330)
    Fixed a crash bug in the Epson dot matrix driver (Issue #5323)
    Automatic debug logging of job errors did not work with systemd (Issue #5337)
    The web interface did not list the IPP Everywhere "driver" (Issue #5338)
    The IPP Everywhere "driver" now properly supports face-up printers
    (Issue #5345)
    Fixed some typos in the label printer drivers (Issue #5350)
    Multi-file jobs could get stuck if the backend failed (Issue #5359,
    Issue #5413)
    The IPP Everywhere "driver" no longer does local filtering when printing to
    a shared CUPS printer (Issue #5361)
    The lpadmin command now correctly reports IPP errors when configuring an
    IPP Everywhere printer (Issue #5370)
    Fixed some memory leaks discovered by Coverity (Issue #5375)
    The PPD compiler incorrectly terminated JCL options (Issue #5379)
    The cupstestppd utility did not generate errors for missing/mismatched
    CloseUI/JCLCloseUI keywords (Issue #5381)
    The scheduler now reports the actual location of the log file (Issue #5398)
    Added a USB quirk rule (Issue #5420)
    The scheduler was being backgrounded on macOS, causing applications to spin
    (rdar://40436080)
    The scheduler did not validate that required initial request attributes were
    in the operation group (rdar://41098178)
    Authentication in the web interface did not work on macOS (rdar://41444473)
    Fixed an issue with HTTP Digest authentication (rdar://41709086)
    The scheduler could crash when job history was purged (rdar://42198057)
    Dropped non-working RSS subscriptions UI from web interface templates.
    Fixed a memory leak for some IPP (extension) syntaxes.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-don-t-try-to-run-generated-binaries.patch | 29 +++++++++++-----------
 .../cups/{cups_2.2.8.bb => cups_2.2.9.bb}          |  4 +--
 2 files changed, 17 insertions(+), 16 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.8.bb => cups_2.2.9.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
index db013cf..d6a69f2 100644
--- a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
@@ -1,20 +1,21 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-From 90069586167b930befce7303aea57078f04b4ed8 Mon Sep 17 00:00:00 2001
+From 1fb07162a9ed187cccf06e34c9bf841d15c6e64e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
 ---
- ppdc/Makefile |   30 +++++++++++++++---------------
- 1 files changed, 15 insertions(+), 15 deletions(-)
+ ppdc/Makefile | 32 ++++++++++++++++----------------
+ 1 file changed, 16 insertions(+), 16 deletions(-)
 
-Index: cups-2.2.6/ppdc/Makefile
-===================================================================
---- cups-2.2.6.orig/ppdc/Makefile
-+++ cups-2.2.6/ppdc/Makefile
-@@ -228,8 +228,8 @@ genstrings:		genstrings.o libcupsppdc.a
+diff --git a/ppdc/Makefile b/ppdc/Makefile
+index e563988..973dd3f 100644
+--- a/ppdc/Makefile
++++ b/ppdc/Makefile
+@@ -189,8 +189,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
  	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
  		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
@@ -25,10 +26,10 @@ Index: cups-2.2.6/ppdc/Makefile
  
  
  #
-@@ -246,9 +246,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cu
- 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
+@@ -209,9 +209,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) foo.drv foo-fr.po
  		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
+ 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Testing PPD compiler...
 -	./ppdc-static -l en,fr -I ../data foo.drv
 -	./ppdc-static -l en,fr -z -I ../data foo.drv
@@ -38,10 +39,10 @@ Index: cups-2.2.6/ppdc/Makefile
  
  
  #
-@@ -274,17 +274,17 @@ ppdi-static:		ppdc-static ppdi.o libcups
- 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdi-static ppdi.o libcupsppdc.a \
+@@ -240,17 +240,17 @@ ppdi-static:		ppdc-static ppdi.o libcupsppdc.a  ../cups/$(LIBCUPSSTATIC)
  		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
+ 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Testing PPD importer...
 -	$(RM) -r ppd ppd2 sample-import.drv
 -	./ppdc-static -l en -I ../data sample.drv
diff --git a/meta/recipes-extended/cups/cups_2.2.8.bb b/meta/recipes-extended/cups/cups_2.2.9.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.8.bb
rename to meta/recipes-extended/cups/cups_2.2.9.bb
index de1bd84..fcd96ef 100644
--- a/meta/recipes-extended/cups/cups_2.2.8.bb
+++ b/meta/recipes-extended/cups/cups_2.2.9.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "33150d08993a04c8e22176e93805a051"
-SRC_URI[sha256sum] = "3968fc1d26fc48727508db1c1380e36c6694ab90177fd6920aec5f6cc73af9e4"
+SRC_URI[md5sum] = "798e83bb1a240f5417a252903d83ae0c"
+SRC_URI[sha256sum] = "6d22d5da253b97643320da0bf95574acd85ff2abe3ec1a51d36093841d891156"
-- 
2.7.4


