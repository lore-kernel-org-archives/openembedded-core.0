Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0725E7690B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 20:00:37 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so77001002igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qt+Awtmh+Urds72TCrw8rC8fW5f+tPUAF8YNiVrMvak=;
	b=zV3fihQdk0ZjammJJnwv79lhzmt+cA/bU99/dM2ygjm3EXj+SvCFVAhYLBTVXjJ97W
	8BF8rzy7fOZ0FHFQOr4dWYBOSFDpYg4AWn751YyIt4ohL8qQCsk3Kzf1+wj901DclT03
	/1d592aQoFyC5WrLlujme1oliMJT+g4m5cM2YYg1BAAP82j4jUOIaC95YKkN2zt9El/f
	Ae8Tkko6KrbH/7w36mG7XFmgjzE4i0IXENpjgVLNORGQOlQwfQK80Wj6RYfIWc/KlaFi
	6oo8ypCPrjsumMvH2MW97Hpiy3Ng9P4ZW+gjxM506bLvh855L41BpwFZQzpde+rjgdLj
	6soA==
X-Received: by 10.50.62.243 with SMTP id b19mr13325405igs.88.1439236838216;
	Mon, 10 Aug 2015 13:00:38 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	i13sm13857273ioe.4.2015.08.10.13.00.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Aug 2015 13:00:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 13:00:24 -0700
Message-Id: <1439236824-13191-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439236824-13191-1-git-send-email-armccurdy@gmail.com>
References: <1439236824-13191-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] local.conf.sample.extended: fix trailing whitespace
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
X-List-Received-Date: Mon, 10 Aug 2015 20:00:38 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/local.conf.sample.extended | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index ccdd326..3b840c1 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -57,7 +57,7 @@
 
 # The following are used to control options related to debugging.
 #
-# Uncomment this to change the optimization to make debugging easer, at the 
+# Uncomment this to change the optimization to make debugging easer, at the
 # possible cost of performance.
 # DEBUG_BUILD = "1"
 #
@@ -131,9 +131,9 @@
 # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
 #
 # Pseudo will attempt to determine if a 32-bit wrapper is necessary, but
-# it doesn't always guess properly.  If you have 32-bit executables on 
-# your 64-bit build system, you likely want to set this to "0", 
-# otherwise you could end up with incorrect file attributes on the 
+# it doesn't always guess properly.  If you have 32-bit executables on
+# your 64-bit build system, you likely want to set this to "0",
+# otherwise you could end up with incorrect file attributes on the
 # target filesystem.
 #
 # Default is to not build 32 bit libs on 64 bit systems, uncomment this
@@ -262,7 +262,7 @@
 
 #
 # GCC/LD FLAGS to enable more secure code generation
-# 
+#
 # By including the security_flags include file you enable flags
 # to the compiler and linker that cause them to generate more secure
 # code, this is enabled by default in the poky-lsb distro.
-- 
1.9.1


