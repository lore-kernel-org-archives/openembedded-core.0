Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C07B578A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:03 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w77so18114422wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CQdqh1AqpXcNUpkEzNldMRh62U1kvWRXrQV08Kh2Zrw=;
	b=icaiI2I/ZcsNWHQNlHx67vU85jfS7TUpDnIeqwhQ7W4G5NMbz6tCS6dgbW7duUSIKn
	P0wbxfmjxIdRFW7B9aqLQn8dz8sp7+9kZ8SNFggVx56uaf/UHyihlQXVdSegdAJD/Oxk
	bxvn+G9iSN+vgd18p9qf3rl6H6A7wQRU1ACTOtcAVcoYG9vFssXKeIW2msLPmxC1Rqky
	zHdvzE/xHZaB2+FHz51pRQWUKclZTxLJ02nmH8UpsO9A403OQWpuan44QImjXW0fdn1i
	LOD8gXiaE2o+b0J6qON7hsdT6tPOMi6vxxC+OV8xSzMeM2BbKPyNvvi0IxnXiVbkisKs
	hfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CQdqh1AqpXcNUpkEzNldMRh62U1kvWRXrQV08Kh2Zrw=;
	b=DvWbZ2uVBYl58lixni60eQ8K7C343sEQiVYbmhpY4uwyPruD8rVPEOngWkIr4GHSqy
	f5yClbK4gToxSUR4B+LTHx+a2Btvyr8o3jAikyV98jCZ5H4hYYbbDmzaYsQo4fRA1F81
	bCL7vX/GrT9Qic8NDwdJXeOzQ4mKXBZ4QlbAPBT44ES2UrOyC2093tab8YjXgfQ5aliq
	t1sUiO67OsblVGbc5x0wuhFqnTCZiorcunuqhaPq8NBZal8Ydlj9sdOV8TvVu7I7/d0E
	btkHM2ZMY2Z6jLWHtT6jTIjhRu6T7EXzyohU7YCY3ZRYAQ06KoK0apxDzPE6Vsw3/nGv
	aYyA==
X-Gm-Message-State: APf1xPDJGmECuKX3hhFjdRkenpQ+UU4o5Jf+DtRvfkfwubfx89p6M9sD
	plqPdwle4AX5YhSftn9qSP4woqpO
X-Google-Smtp-Source: AG47ELvs554V1r3mazacygPamhf97e/WgDZNhhqOY7grocEQWXxBexCZfbeMHufkmZfDLyHuogRhJw==
X-Received: by 10.223.135.136 with SMTP id b8mr13131745wrb.72.1520270464699;
	Mon, 05 Mar 2018 09:21:04 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:04 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:30 +0000
Message-Id: <20180305172046.21729-13-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 13/29] mtools: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:04 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mtools/mtools/mtools-makeinfo.patch              | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 2e2873a4fa1..8ceb0af136a 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Inappropriate [licensing]
 
---- mtools-3.9.9/configure.in.orig	2006-04-14 16:05:54.337655192 -0600
-+++ mtools-3.9.9/configure.in	2006-04-14 16:12:29.736545424 -0600
-@@ -21,6 +21,33 @@
+Index: mtools-4.0.18/configure.in
+===================================================================
+--- mtools-4.0.18.orig/configure.in
++++ mtools-4.0.18/configure.in
+@@ -35,6 +35,33 @@ AC_CANONICAL_SYSTEM
  AC_C_CONST
  AC_C_INLINE
  
@@ -36,9 +38,11 @@ Upstream-Status: Inappropriate [licensing]
  
  dnl Check for configuration options
  dnl Enable OS/2 extended density format disks
---- mtools-3.9.9/Makefile.in.sav	2006-04-14 15:56:19.000000000 -0600
-+++ mtools-3.9.9/Makefile.in	2006-04-14 16:15:29.315245312 -0600
-@@ -11,10 +11,11 @@
+Index: mtools-4.0.18/Makefile.in
+===================================================================
+--- mtools-4.0.18.orig/Makefile.in
++++ mtools-4.0.18/Makefile.in
+@@ -26,10 +26,11 @@ USERCFLAGS =
  USERLDFLAGS =
  USERLDLIBS =
  
@@ -54,7 +58,7 @@ Upstream-Status: Inappropriate [licensing]
  
  
  # do not edit below this line
-@@ -181,7 +182,7 @@
+@@ -198,7 +199,7 @@ dvi: mtools.dvi
  
  ps: mtools.ps
  %.ps: %.dvi
@@ -62,4 +66,4 @@ Upstream-Status: Inappropriate [licensing]
 +	$(DVI2PS) -f < $< > $@
  
  pdf: mtools.pdf
- %.pdf: %.texi
+ %.pdf: %.texi sysconfdir.texi
-- 
2.11.0


