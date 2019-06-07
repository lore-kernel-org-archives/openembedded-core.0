Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F3FF27E517
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 17:53:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so3039999wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rpZRE8oOMDIzLWnwL/DdHwCIld5WXgqyT9RYWcNYnP4=;
	b=tHM6HouptrY243O4M4oxUnhudrxLJrJ4XVdDeh66AUXMyrnPMDh1Q7b705OfqeZzc8
	fl9p84kTmBhAOvUrFoD/DjARY/12P0YTQOmKPHU5k/eexA4jr8ineS6o/7eO7ZcqKgIk
	Wexdz2HeDkp+dRvwhoQUQA16eTut3mp/0w72JIUuxxvWs9kK2k3viMRImnJ34qyQVwtr
	CBcF1kcD+LIg9ILr4m7ybBrrE3QjG5jXoh0dmEgT3BUy4xpd1+POG5aQGXW0PDbLXRG2
	UD7Enj3Pbh3b/lgpspdpESIQ8MJpIJN3qWNH/480rqjXGxteLtaH2mviw6d8O8AzlY7A
	xc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rpZRE8oOMDIzLWnwL/DdHwCIld5WXgqyT9RYWcNYnP4=;
	b=gZkgfo/Ed7REJYEVAR8g3O8FLV7ysKjIai7T2e6CjGbFfEbZc8LY+uBdCdb77PlXB+
	IbcpBLN6jylck0K0r3uxV/dcSVpHYagq+E1u05quD8yopkDxrxjj1S3P3FRuLS7/bWIt
	OP63CYWIeZdXEI85SQLj6GuYWbzr36LZ40B0Rghn4sTHmWb9ZWexS59E3trTbUvtX0ih
	lqFwqwbWlG2qCrHBiXImSeL1R7uMCOT7/RIP/Z8Fr8nJGDZekuLEnIzxZ/rJYdkCXH7/
	5Qwz1l53RsT3/JrwJeVkzM2L6nuRE2NU2vlNYykdqpVCGICnXDXJ9ArGdoJ3alI/ughI
	N79w==
X-Gm-Message-State: APjAAAXN59oaq8Nwi4PIOKkQj2h9L8eeDh74PBxJhK12OVGhKEtp8nfu
	IgNnQs5SarW4rkZy3UyYp4amZQDr1Do=
X-Google-Smtp-Source: APXvYqw53lSgREnEOfXCAaPpCTnZeFq2CXhTMN5YzfnKdlpLnr/tXvNF12P8v/AtiIAM8xAogJdTiQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr14569290wrw.56.1559930036426; 
	Fri, 07 Jun 2019 10:53:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o13sm3495085wra.92.2019.06.07.10.53.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 10:53:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 18:53:48 +0100
Message-Id: <20190607175348.9666-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607175348.9666-1-ross.burton@intel.com>
References: <20190607175348.9666-1-ross.burton@intel.com>
Subject: [PATCH 3/3] parted: drop patch for linux <2.6.20 support
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
X-List-Received-Date: Fri, 07 Jun 2019 17:53:56 -0000

We don't really care about kernels this old anymore, so drop the patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/parted/files/syscalls.patch | 55 -----------------------
 meta/recipes-extended/parted/parted_3.2.bb        |  1 -
 2 files changed, 56 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/syscalls.patch

diff --git a/meta/recipes-extended/parted/files/syscalls.patch b/meta/recipes-extended/parted/files/syscalls.patch
deleted file mode 100644
index 93205a0a804..00000000000
--- a/meta/recipes-extended/parted/files/syscalls.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Pending
-
----
- libparted/arch/linux.c |   13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-Index: parted-3.2/libparted/arch/linux.c
-===================================================================
---- parted-3.2.orig/libparted/arch/linux.c
-+++ parted-3.2/libparted/arch/linux.c
-@@ -17,6 +17,8 @@
- 
- #define PROC_DEVICES_BUFSIZ 16384
- 
-+#include <linux/version.h>
-+
- #include <config.h>
- #include <arch/linux.h>
- #include <linux/blkpg.h>
-@@ -1696,12 +1698,14 @@ linux_refresh_close (PedDevice* dev)
- 
- #if SIZEOF_OFF_T < 8
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
- static _syscall5(int,_llseek,
-                  unsigned int, fd,
-                  unsigned long, offset_high,
-                  unsigned long, offset_low,
-                  loff_t*, result,
-                  unsigned int, origin)
-+#endif
- 
- loff_t
- llseek (unsigned int fd, loff_t offset, unsigned int whence)
-@@ -1709,11 +1713,20 @@ llseek (unsigned int fd, loff_t offset,
-         loff_t result;
-         int retval;
- 
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
-         retval = _llseek(fd,
-                          ((unsigned long long)offset) >> 32,
-                          ((unsigned long long)offset) & 0xffffffff,
-                          &result,
-                          whence);
-+#else
-+ 	retval = syscall(__NR__llseek, fd,
-+			 ((unsigned long long)offset) >> 32,
-+                         ((unsigned long long)offset) & 0xffffffff,
-+                          &result,
-+			 whence);
-+#endif
-+
-         return (retval==-1 ? (loff_t) retval : result);
- }
- 
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 63f9f204e73..13d7d6676c7 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -8,7 +8,6 @@ PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
-           file://syscalls.patch \
            file://fix-doc-mandir.patch \
            file://fix-compile-failure-while-dis.patch \
            file://0001-Include-fcntl.h-in-platform_defs.h.patch \
-- 
2.11.0


