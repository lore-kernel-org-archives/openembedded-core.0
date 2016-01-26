Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4341176A51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 19:16:30 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id cy9so102134487pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P3Tg7pI/Uvph4XWr1YUWvgC00ZwCzbadGY6WdMS8NhA=;
	b=ANVZgetNxlmEWdWoBblSFU7Sb4UwzM7iO1DAbmoQ1iI0MkM51+5CKBLUbbrTUgIjV7
	R/DdyJu6Snfkl+wRk53E6iUwYJfdPqz/cZ/g5ef4FMq8H9qrGyHE9aVbcZLRz2s3AXyT
	CO9Btc8JYqWq2RG8CLQVYzWzyw9II3X4ZlzkuRN6AQcPCNEVvwVt7W2CAXDIGhfav4rP
	9NbyT+bMXk7IZEJFPgTc9Q6bB/gvnvpK4loqoxqphs/dNcqC9rR4M45KgtJkQ22azu+z
	w3s3UmNUICHGnryRgyPmwAQ2lLCQyhDFSs1D9ZwEIQs0cnW8ct2F5zOMReluafMY2qDP
	Uhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P3Tg7pI/Uvph4XWr1YUWvgC00ZwCzbadGY6WdMS8NhA=;
	b=dXnrsVm+ZvxL/x/9CIN801JNHZkrQXO+FDYhxgmlmC58sH6J+5Lu0tUyzUlVMZWuzq
	FhUj4wJyvMRD8aRBQknVwrwDUYFEjbVjEz1krvHQ/xVcKxS3haTehBSVGpDQLygDVJYY
	nWYPIkXZ5vDmlt5v3hivv2wN/2HreHwzR9ZoPaUyGMGf/mH8qMfhT4DTbwKnffddMVnN
	3fUqXyy07GVEroD1q684jTHHfYMktmL0ymdW6LTc2dE5zNADh/RJyQCMwUvFJwFlW1uR
	tWrgG+cGI7AyS3DlMsbGDLLxqpymOTZj1SpRoMnKmNi7ELGupJutR0VoVd0bxFtvzIdg
	FdMA==
X-Gm-Message-State: AG10YOSqVNuMCoc8k/fwEBWSdCcRC6KaqVr/z2BEAO8dkFCaOnMNnFKT+eIwI4uzcPMWjg==
X-Received: by 10.66.216.69 with SMTP id oo5mr35506366pac.126.1453835791647;
	Tue, 26 Jan 2016 11:16:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	tp6sm3525799pab.25.2016.01.26.11.16.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:16:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 11:16:24 -0800
Message-Id: <1453835784-14884-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: fix stop -vs- start typo in rcS script
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
X-List-Received-Date: Tue, 26 Jan 2016 19:16:33 -0000

Also make the rcS and rcK comments match the code.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/files/rcK | 5 +++--
 meta/recipes-core/busybox/files/rcS | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/files/rcK b/meta/recipes-core/busybox/files/rcK
index 050086e..f8a63e1 100644
--- a/meta/recipes-core/busybox/files/rcK
+++ b/meta/recipes-core/busybox/files/rcK
@@ -1,9 +1,10 @@
 #!/bin/sh
 
-# Stop all init scripts in /etc/init.d
-# executing them in reversed numerical order.
+# Stop all init scripts in /etc/rc6.d
+# executing them in numerical order.
 #
 for i in /etc/rc6.d/K??*; do
+
      # Ignore dangling symlinks (if any).
      [ ! -f "$i" ] && continue
 
diff --git a/meta/recipes-core/busybox/files/rcS b/meta/recipes-core/busybox/files/rcS
index d18c26b..bb03eb6 100644
--- a/meta/recipes-core/busybox/files/rcS
+++ b/meta/recipes-core/busybox/files/rcS
@@ -1,10 +1,11 @@
 #!/bin/sh
 
-# Stop all init scripts in /etc/init.d
-# executing them in reversed numerical order.
+# Start all init scripts in /etc/rcS.d and /etc/rc5.d
+# executing them in numerical order.
 #
 
 for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
+
      # Ignore dangling symlinks (if any).
      [ ! -f "$i" ] && continue
 
@@ -13,7 +14,7 @@ for i in /etc/rcS.d/S??* /etc/rc5.d/S??* ;do
 	    # Source shell script for speed.
 	    (
 		trap - INT QUIT TSTP
-		set stop
+		set start
 		. $i
 	    )
 	    ;;
-- 
1.9.1


