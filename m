Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 937C16A45E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 04:03:06 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj3so4537327pad.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 21:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sU5on9O2ddGPqseswjYian62J4xMOo5wHnuW/BYfUTY=;
	b=AK9QrW0MpwMR7Zk7Eg+XT0obLB8MbsenI1hPcm3VkLWmjzUFY1wqHZ2TE73CxvRt18
	z/jZqc3i5URR1TiY/YcrZO6Dz3vWNWeoAK1/HfsB16IvKibuiMIyXzhQUfcIepZgX/u0
	AUUTkN3asMUAuIaW1/YWXvEaar1tdhKY35AI8yR4oGMtvbalBu8t9waCjwHLMkWh6CM7
	OINaTbpmRvq2Ny8GN3lwrUXgDWeJF9mN+ZVCAPL2/5Koap3P4w9edwJjgR1mQAQe7mN7
	EdH+w1A48qlyktGCfqmVk6ycs9yy/epvz3W7yXN1IUsP5VXap/YqPda4AFfstlNa+nIs
	dVRA==
X-Received: by 10.68.135.35 with SMTP id pp3mr22061515pbb.116.1372651387979;
	Sun, 30 Jun 2013 21:03:07 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	fp2sm19985171pbb.36.2013.06.30.21.03.06 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 21:03:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2013 21:02:44 -0700
Message-Id: <549b5bd2730955c472bb4c4203768530c9571c9e.1372651136.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <25a3b549c1a24505f8d1f392c04ceb8af5f0ef32.1372651136.git.raj.khem@gmail.com>
References: <25a3b549c1a24505f8d1f392c04ceb8af5f0ef32.1372651136.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372651136.git.raj.khem@gmail.com>
References: <cover.1372651136.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] bison: Delete unused patch
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
X-List-Received-Date: Mon, 01 Jul 2013 04:03:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch

diff --git a/meta/recipes-devtools/bison/bison/remove-gets.patch b/meta/recipes-devtools/bison/bison/remove-gets.patch
deleted file mode 100644
index 2dfa00f..0000000
--- a/meta/recipes-devtools/bison/bison/remove-gets.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-gets has been removed from eglibc 2.16
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: bison-2.5/lib/stdio.in.h
-===================================================================
---- bison-2.5.orig/lib/stdio.in.h	2012-07-04 09:09:48.336532195 -0700
-+++ bison-2.5/lib/stdio.in.h	2012-07-04 09:10:22.868533884 -0700
-@@ -180,8 +180,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
-- 
1.7.9.5


