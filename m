Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Jan 2017 19:43:53 UTC
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5DB71997
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 19:43:53 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 01/04/2017 2:26:50 PM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 12/13/2016 5:18:17 PM UTC (2.6.9.19)
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-59/SG:1 1/4/2017 2:26:12 PM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.526169 p=-1 Source White
X-Signature-Violations: 0-0-0-9611-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G273 G274 G275 G276 G280 G281 G408 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 100287932; Wed, 04 Jan 2017 14:26:50 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cOrEx-000Bi2-Ib; Wed, 04 Jan 2017 19:28:51 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cOrEx-0003ZP-Hm; Wed, 04 Jan 2017 19:28:51 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 19:28:46 +0000
Message-Id: <1483558126-13685-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] mtd-utils: Upgrade to 2.0.0
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
X-List-Received-Date: Wed, 04 Jan 2017 19:43:55 -0000

Upstream has started using automake which means that the recipe must now
inherit from autotools and pkgconfig.

The source tree has been reorganised too which requires the paths in the
patches to be modified. None of the patches appear to have been applied
upstream.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch  | 4 ++--
 .../mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch           | 2 +-
 meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch  | 4 ++--
 ...-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch | 4 ++--
 meta/recipes-devtools/mtd/mtd-utils_git.bb                          | 6 ++++--
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
index 305be52..6a9bd1c 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
@@ -14,8 +14,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
 index f09c0b2..ed2dc43 100644
---- a/mkfs.jffs2.c
-+++ b/mkfs.jffs2.c
+--- a/jffsX-utils/mkfs.jffs2.c
++++ b/jffsX-utils/mkfs.jffs2.c
 @@ -72,6 +72,7 @@
  #include <byteswap.h>
  #include <crc32.h>
diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
index 57d6a30..0e3776a 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending
 
 --- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
-+++ git/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
++++ git/jffsX-utils/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
 @@ -100,6 +100,11 @@
  	struct rb_node hardlink_rb;
  };
diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
index 05f1629..a279d84 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
@@ -8,8 +8,8 @@ Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
 
 diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h
 index d3a02d4..e7e9218 100644
---- a/mkfs.ubifs/key.h
-+++ b/mkfs.ubifs/key.h
+--- a/ubifs-utils/mkfs.ubifs/key.h
++++ b/ubifs-utils/mkfs.ubifs/key.h
 @@ -141,10 +141,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
   */
  static inline void key_write(const union ubifs_key *from, void *to)
diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
index 7207cfc..0f42e73 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
@@ -49,8 +49,8 @@ v2 : get length of availble freeoob bytes from oobinfo information,
 
 diff --git a/flash_erase.c b/flash_erase.c
 index 933373a..4b9d84b 100644
---- a/flash_erase.c
-+++ b/flash_erase.c
+--- a/misc-utils/flash_erase.c
++++ b/misc-utils/flash_erase.c
 @@ -99,6 +99,7 @@ int main(int argc, char *argv[])
  	bool isNAND;
  	int error = 0;
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8a3afaf..d09ac84 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -5,11 +5,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
+inherit autotools pkgconfig
+
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 
-PV = "1.5.2"
+PV = "2.0.0"
 
-SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
+SRCREV = "1bfee8660131fca7a18f68e9548a18ca6b3378a0"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://fix-armv7-neon-alignment.patch \
-- 
2.1.4


