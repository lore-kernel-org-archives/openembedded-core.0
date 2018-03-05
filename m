Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA97878A50
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h21so17426272wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zNNhVihUlCLSoyBuecLu7ZmmfTqm5e3ESkZqnkxp7sY=;
	b=zIo3dgFEM+hBpVQEgzrm2cl43QAiS0pYsN76aRTp6PSfrEt1EsUHFhiG0Q57RlERmK
	8MimcL6RlwMJSMoqmhwHdDcAuWpYexPjW47VDcaUSqvJEQXCThm46KLdHFTKcDeIEIAv
	KOQyAT75nq62ulJGXq/b3tlgBl69gCn/Qt2uiJu4k9S/xNrBF3ZbT3B7ZU5n1mU1Hnfr
	wnbKmTQfZtt9g+MP4uiVGWysOrfAZEOq//yDXq8I3vMbF+24D3A1OxtQvp94EC9kpdtJ
	dgIXy9Ob5jRyFxjWj6vkHButQwKqPZkq9b9KCHAE9aOuOK2ZUkQkNo35KBPoOTcHsgTA
	cYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zNNhVihUlCLSoyBuecLu7ZmmfTqm5e3ESkZqnkxp7sY=;
	b=oLgQ8Lh2hVHuv1tm0LPIJT0MNUFnEFNh0d4+j9C8vTRIEqfSDpxf4E9kjlbmA629VX
	SQo/iLIabVJAffZmEpBzrxrbE2idA+aIrIlfjeJOjxNoO+fh6yAuCzmN3hnRTF8V7XqB
	pRxpYRPNnmCBpi48+N2Khvk+I1MAPjSD5LxPNk8TF3taV5EsHwtRe11NX4+OiaQAQ/jM
	ee4QF0bPXUIvvc+Qgfa8HsbOmPHc1li6jZncOgNRYss9IHSnaiyv285WghrQIynOzihq
	blRJdPvYURyMZUE1mnIBe2DQc45Bwu5TijPbU93l+e3e1E2a77JgoxsHGWXBUxgYPvAs
	ctTg==
X-Gm-Message-State: AElRT7Fe5ccg/BJxurjaPN7UxwAXBqaTigtF9buxC4ZtwADdgKvH8HZQ
	E3oRUm4zUpB/hs1sLqhNwTWRawX8
X-Google-Smtp-Source: AG47ELsCPnCFSNJDyEypK/65PW6hGhIiEBF6Ph5UXQDW3/+6MWHhCCfyHuQOkI8swXE4yvh9FrLGkQ==
X-Received: by 10.28.125.197 with SMTP id y188mr8656415wmc.150.1520270473105; 
	Mon, 05 Mar 2018 09:21:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:38 +0000
Message-Id: <20180305172046.21729-21-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 21/29] sysstat: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Include-needed-headers-explicitly.patch   | 29 ++++++++++------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch b/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
index c12652307c1..5fc26fbc270 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
@@ -21,10 +21,10 @@ Upstream-Status: Pending
  sa_common.c | 1 +
  3 files changed, 3 insertions(+)
 
-diff --git a/common.c b/common.c
-index a23155b..ad86446 100644
---- a/common.c
-+++ b/common.c
+Index: sysstat-11.5.7/common.c
+===================================================================
+--- sysstat-11.5.7.orig/common.c
++++ sysstat-11.5.7/common.c
 @@ -20,6 +20,7 @@
   */
  
@@ -32,11 +32,11 @@ index a23155b..ad86446 100644
 +#include <limits.h>
  #include <string.h>
  #include <stdlib.h>
- #include <time.h>
-diff --git a/ioconf.c b/ioconf.c
-index 7d88c5d..6d67691 100644
---- a/ioconf.c
-+++ b/ioconf.c
+ #include <stdarg.h>
+Index: sysstat-11.5.7/ioconf.c
+===================================================================
+--- sysstat-11.5.7.orig/ioconf.c
++++ sysstat-11.5.7/ioconf.c
 @@ -27,6 +27,7 @@
  #include <errno.h>
  #include <dirent.h>
@@ -45,10 +45,10 @@ index 7d88c5d..6d67691 100644
  
  #include "ioconf.h"
  #include "common.h"
-diff --git a/sa_common.c b/sa_common.c
-index b7351d9..c9e3299 100644
---- a/sa_common.c
-+++ b/sa_common.c
+Index: sysstat-11.5.7/sa_common.c
+===================================================================
+--- sysstat-11.5.7.orig/sa_common.c
++++ sysstat-11.5.7/sa_common.c
 @@ -20,6 +20,7 @@
   */
  
@@ -57,6 +57,3 @@ index b7351d9..c9e3299 100644
  #include <string.h>
  #include <stdlib.h>
  #include <time.h>
--- 
-2.5.2
-
-- 
2.11.0


