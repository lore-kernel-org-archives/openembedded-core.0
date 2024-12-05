Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F11E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:29:36 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.25783.1733441369022657610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TH2/A7r9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241205232924e513a1799d496f392c-jdazip@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241205232924e513a1799d496f392c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:29:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=cJANB1tiNicEDWHjAFFo62C+tIbdy1hNQX4b+CDDf4M=;
 b=TH2/A7r9kSvwwdniEDM7iFmczz6YojRtzcR04HRQcLltmoTrk0oN8p+1+GOQ2Sbnoaiaoj
 Gw1vxXqslD4AWdk6Vc1AcjCReT9BrwF+6OLzaa0B/B0JpL6avU/jTn2CDNlqaAvK2BMl+ZGx
 n2zRvdPHhdo3exy7DP0R4am44m65iFOR1Bv9z4E89+E1THfCj9II14q4GWutj6UOTFVr7XPZ
 RjpqtGI/AIT4F3O+XvAOEDCys3pPyHNKjsYQUcCQ06OhQBVQ5Aa+cZngSZ5nCtnAFaQw5r66
 h+IfcrYLWlm4HWVxLi6Kl48FgW/GIW1biVbM2oI5QaMZeabli1xzx1AQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead][PATCH 1/7] ghostscript: upgrade 10.03.1 -> 10.04.0
Date: Fri,  6 Dec 2024 00:28:38 +0100
Message-Id: <20241205232838.256268-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208391

From: Hitendra Prajapati <hprajapati@mvista.com>

avoid-host-contamination.patch
refreshed for 10.04.0

Changelog:
===========
- addresses CVEs: CVE-2024-46951, CVE-2024-46952, CVE-2024-46953, CVE-2024-46954, CVE-2024-46955, CVE-2024-46956
- add protection for device selection from PostScript input.
- efforts in code hygiene and maintainability continue.
- The usual round of bug fixes, compatibility changes, and incremental improvements.
- add the capability to build with the Tesseract OCR engine.

(From OE-Core rev: a0c802e9b1d8400589aede20e52f40d10a344314)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ghostscript/ghostscript/avoid-host-contamination.patch  | 6 +++---
 .../{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb}      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 67f14bd368..0546fdf8f0 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From b36713c8f1ba0e5755b78845a433354a63663b1a Mon Sep 17 00:00:00 2001
+From 095bb1db8b2e68cac40e985f347a7039573e1e80 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 186f704..88ab8c9 100644
+index a5dbc7a..27b55f2 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -397,7 +397,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
index 0504f5244f..546d734333 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447792d54db21a2e8ad"
+SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.30.2


