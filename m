Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 38B4E731C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:31 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so142175289pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rcg1WeisGPNTF9TdNP+mIfx7vhL5vqCMSyX7OvXk69I=;
	b=WMJfGqvLKsRiIAQOnYSDDfcPrEJYyIpFFX/CujsDFnAImdrwSqIBB7t6AYhpYkG+Ai
	D+oGSlYHpDfuVAYEUxSBJ6bDIlK6z4F3MgRIZzJRIVqpcX0vzW7Fi4nI4v82gZO31KaS
	KJLAncg7vjjJOcXE7mFpDHdd0K7LCVPmRhjX8gx1cTguW6QWBhg5UHv/4kgygqGplwHH
	t7g4uiL/jq5xErcbMalyO2fio+vp4rMNOKPBIcj+h2DZMMThNzFli3QhqNbHYZhg7JWq
	QlV58j6Qgu+FEbemA5QFVBa9rjBXpAZNuw06vLbCJmwouqkmCe4/WPotWY2F6X/quv1y
	RfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rcg1WeisGPNTF9TdNP+mIfx7vhL5vqCMSyX7OvXk69I=;
	b=C0pnotPvY6qdfU6JPAvFqm23I9xTaWYFfKQwf8k4q0/5zvK4IihITActFxunY1VlrC
	ZsPfWN4csHUoNRjUW0KezCA+Q5SaeV+8kFXP0+E6wXEtwSFlfUvyH3whcgmuQg8pWXsE
	ZXUsEjYmntRr3SAE/eSgyTSfHwjl4WrIOuK3LCdt08yB0wQi6bOXte63L8Y+p97j3yoG
	oeS/OsTkIM+lUkQqsTtceEULGjCDnVYvWo2Bq2Enaqy1hUzheZmc1qrEbkarGc1swYhB
	HYH3fJ5aY6QkIjvHn2FPw5L7H6ZCodFEDAXWZyUjJyUzcrtP0yjABPrhwemm0iXTLVgN
	8dUw==
X-Gm-Message-State: ALoCoQlkce36r7T7GHUgQzrNcABr7J+oZXu2KLpYKVyrF834Cx05mTbPTjCT9huAjonKoHZzshWVdmVdOWoOlLQjDBSq9Xi7FQ==
X-Received: by 10.98.67.135 with SMTP id l7mr28720331pfi.148.1453030652286;
	Sun, 17 Jan 2016 03:37:32 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:08 -0800
Message-Id: <467729f751cbfa91f08647a40f075f8f1ddae146.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 35/73] rt-tests: Fix build with non-gcc compilers
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:31 -0000

Makery hard sets CC to be some form of gcc, make it set only if CC
variable is absent in environment.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch | 30 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_0.96.bb          |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
new file mode 100644
index 0000000..00fcc7d
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
@@ -0,0 +1,30 @@
+From 9640dde4241e1314b8e8ea35b0c8dab0b30ae51f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Jan 2016 10:50:56 -0800
+Subject: [PATCH] Makefile: Set CC/AR variable only if it doesn't have a value
+
+This helps it compile with clang or any other compilers besides gcc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1e4b7d1..2c2d396 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 0.96
+-CC=$(CROSS_COMPILE)gcc
+-AR=$(CROSS_COMPILE)ar
++CC?=$(CROSS_COMPILE)gcc
++AR?=$(CROSS_COMPILE)ar
+ 
+ OBJDIR = bld
+ 
+-- 
+2.6.4
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb b/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
index 7d70392..2f96fea 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.96.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 require rt-tests.inc
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI += "file://0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch \
+            file://run-ptest \
             file://rt_bmark.py \
            "
 # Do not install hwlatdetect
-- 
2.7.0


