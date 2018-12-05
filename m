Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA8266D7BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:34:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB58Xmuf027613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 00:33:58 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 00:33:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 16:40:44 +0800
Message-ID: <0c25da7d4f51df23da7de1535b7d96ece513a852.1543996242.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543996242.git.Qi.Chen@windriver.com>
References: <cover.1543996242.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] cups: upgrade to 2.2.9
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
X-List-Received-Date: Wed, 05 Dec 2018 08:34:07 -0000
Content-Type: text/plain

The following patch is rebased.

  0001-don-t-try-to-run-generated-binaries.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
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
1.9.1


