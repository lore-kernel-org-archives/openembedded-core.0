Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5AAD72F4F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:43:58 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id o123so10989375pga.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 15:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Hbehc5rGQD8HmUHUu7+1BIFKNdydMxoFkE3mgQ49h+w=;
	b=DmaM/nJNnCyxO0dfLa+/+7RYH8ybGJpi5sQ3gG/PSGSulGfuupwhvxqGf6K/VqZmIE
	RQkJamuzssXBqwmoDbE6BfXPeIFbnAqty8+DuMLpOeNaqu59FzdYdNmKul6B6jftkFGe
	uvFwM+7easI5wknCZ1eP4on0rCTmakMQoLIVMy/61MjBESQUqd6GSgyybPNAHPtfHSxi
	X98/d/25ql8OKgrfla7Pg2e0xvHr/np569dHTHCKJSwnSQkQmB/lbk236usLWhUkv2Db
	KY6r4fRYEybyfkSFCVYBjrqlSS/EFZbFiiuLIOS48Ke9IoIOVtIxVkk+9AN9vBTEkH2L
	T8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hbehc5rGQD8HmUHUu7+1BIFKNdydMxoFkE3mgQ49h+w=;
	b=P6hWzWL9qfCQuB5zqRzIoU1CMEadvJvkJU61ptAnmu8Kc4buE5vQu2jBLxA1ReSPGt
	+401t7IFzxGB8z08MB5LuOVaK4gJa5ncsoQH7N4sor5qD/Bs51ihqHJVUQkRcVFkuUeR
	BOdDyOqk76gVXWAVtPPjechvz5vH9hAZsjw/LOm04EX7s9D6WDaUxgF2DXw5S6a8gQ9G
	OyvMDD1b8bBx/t0ClOg56iWlwcpwlN4GJ4JGjrPwsyIbYSdvRKtkSsIdGmLQYhgp7Ocd
	6UeGob5Q0xBpnlSQcYUDwGob5vvhxByhefjSoeE7l239qHECW+c44EwX+DThz6PEnB5R
	H5Aw==
X-Gm-Message-State: AFeK/H17r92Z43LBKY4hMWRTp8kj+AkrLe4j8AL9ryJ9FA3Ro6TLDIGuBQW3i3eU35ufJg==
X-Received: by 10.98.138.80 with SMTP id y77mr16261601pfd.183.1491518639720;
	Thu, 06 Apr 2017 15:43:59 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id f5sm5531272pgn.50.2017.04.06.15.43.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 15:43:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 15:43:53 -0700
Message-Id: <1491518633-30798-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mtd-utils: refresh patches now merged upstream
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
X-List-Received-Date: Thu, 06 Apr 2017 22:43:58 -0000

Update Upstream-Status tags and apply 010-fix-rpmatch.patch
unconditionally, since it's merged unconditionally upstream.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   | 15 ++++----
 .../mtd/mtd-utils/010-fix-rpmatch.patch            | 45 ++++++++++++++++++++--
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   | 21 +++++++---
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  3 +-
 4 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
index 6a9bd1c..bf3f98f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
@@ -1,19 +1,18 @@
-From e16fa28bc57c29923ab60af2ac343da83e1992d8 Mon Sep 17 00:00:00 2001
+From 4dab9bed1033f797ef9b482c77342fe3fe26d0be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Oct 2015 23:51:34 +0000
 Subject: [PATCH] Fix build with musl
 
-Upstream-Status: Pending
+Upstream-Status: Backport
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
 ---
- mkfs.jffs2.c  | 44 ++++++++++++++++++++++++++++++++++++++++++--
- recv_image.c  |  1 -
- serve_image.c |  1 -
- 3 files changed, 42 insertions(+), 4 deletions(-)
+ jffsX-utils/mkfs.jffs2.c | 1 +
+ 1 file changed, 1 insertion(+)
 
-diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
-index f09c0b2..ed2dc43 100644
+diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
+index 5446a16..ca5e0d5 100644
 --- a/jffsX-utils/mkfs.jffs2.c
 +++ b/jffsX-utils/mkfs.jffs2.c
 @@ -72,6 +72,7 @@
diff --git a/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch b/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
index 7d783e7..853de6a 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
@@ -1,11 +1,48 @@
-Replace rpmatch() usage with checking first character of line
+From 82839c3c0371ca2a1643a99d7d01f5bc1c850b28 Mon Sep 17 00:00:00 2001
+From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Date: Thu, 2 Mar 2017 11:40:36 +0100
+Subject: [PATCH] Replace rpmatch() usage with checking first character of line
+
+This is based on the patch from Khem Raj used by openembedded. In
+addition to the original patch, this also removes the fallback
+implementation that was provided for C libraries that don't implement
+rpmatch.
+
+Upstream-Status: Backport
 
-Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+---
+ include/common.h | 25 ++++++-------------------
+ 1 file changed, 6 insertions(+), 19 deletions(-)
 
+diff --git a/include/common.h b/include/common.h
+index d0c706d..d609257 100644
 --- a/include/common.h
 +++ b/include/common.h
-@@ -122,10 +122,12 @@
+@@ -129,21 +129,6 @@ extern "C" {
+ 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
+ } while(0)
+ 
+-/* uClibc versions before 0.9.34 and musl don't have rpmatch() */
+-#if defined(__UCLIBC__) && \
+-		(__UCLIBC_MAJOR__ == 0 && \
+-		(__UCLIBC_MINOR__ < 9 || \
+-		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))) || \
+-	!defined(__GLIBC__)
+-#undef rpmatch
+-#define rpmatch __rpmatch
+-static inline int __rpmatch(const char *resp)
+-{
+-    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
+-	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
+-}
+-#endif
+-
+ /**
+  * prompt the user for confirmation
+  */
+@@ -164,10 +149,12 @@ static inline bool prompt(const char *msg, bool def)
  		}
  
  		if (strcmp("\n", line) != 0) {
@@ -22,3 +59,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				puts("unknown response; please try again");
  				continue;
  			}
+-- 
+2.6.1
diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
index a279d84..6fc594f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
@@ -1,16 +1,25 @@
-Upstream-Status: Pending
+From 7d026a85946a08b8167dcd792ea6660bf6a49e08 Mon Sep 17 00:00:00 2001
+From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+Date: Thu, 2 Mar 2017 10:43:56 +0100
+Subject: [PATCH] Fix alignment trap triggered by NEON instructions
 
 NEON instruction VLD1.64 was used to copy 64 bits data after type
 casting, and they will trigger alignment trap.
 This patch uses memcpy to avoid alignment problem.
 
+Upstream-Status: Backport
+
 Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+---
+ ubifs-utils/mkfs.ubifs/key.h | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
 
-diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h
-index d3a02d4..e7e9218 100644
+diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
+index 39379fd..118858b 100644
 --- a/ubifs-utils/mkfs.ubifs/key.h
 +++ b/ubifs-utils/mkfs.ubifs/key.h
-@@ -141,10 +141,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
+@@ -159,10 +159,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
   */
  static inline void key_write(const union ubifs_key *from, void *to)
  {
@@ -26,7 +35,7 @@ index d3a02d4..e7e9218 100644
  	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
  }
  
-@@ -156,10 +158,12 @@ static inline void key_write(const union ubifs_key *from, void *to)
+@@ -174,10 +176,12 @@ static inline void key_write(const union ubifs_key *from, void *to)
   */
  static inline void key_write_idx(const union ubifs_key *from, void *to)
  {
@@ -42,3 +51,5 @@ index d3a02d4..e7e9218 100644
  }
  
  /**
+-- 
+2.6.1
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 30cf13c..4fbc54f 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -17,10 +17,9 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://fix-armv7-neon-alignment.patch \
            file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
            file://0001-Fix-build-with-musl.patch \
+           file://010-fix-rpmatch.patch \
 "
 
-SRC_URI_append_libc-musl = " file://010-fix-rpmatch.patch "
-
 S = "${WORKDIR}/git/"
 
 # xattr support creates an additional compile-time dependency on acl because
-- 
2.6.1


