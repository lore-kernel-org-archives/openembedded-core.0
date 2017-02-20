Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id 33A4271B50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:33:19 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 02/20/2017 5:33:19 AM
X-Policy: brightsign.biz  - brightsign.biz
X-Policy: brightsign.biz  - brightsign.biz
X-Primary: mcrowe@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Note: SecureTide Build: 9/27/2016 9:09:05 PM UTC
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-16/SG:1 2/20/2017 5:32:22 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.425302 p=-1 Source Normal
X-Signature-Violations: 0-0-0-4093-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->PRIVATE->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G273 G274 G275 G276 G280 G281 G409 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [213.210.30.29] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 114565512; Mon, 20 Feb 2017 05:33:19 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cflHS-0002cz-Dc; Mon, 20 Feb 2017 10:33:18 +0000
Received: from mac by chuckie with local (Exim 4.84_2)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1cflHS-0002Z0-D1; Mon, 20 Feb 2017 10:33:18 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 10:33:13 +0000
Message-Id: <1487586794-9815-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] ccache: Upgrade to v3.3.4
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
X-List-Received-Date: Mon, 20 Feb 2017 10:33:21 -0000

Only the copyright year has been updated in LICENSE.txt. The license text
itself has not changed.

This version fixes a bug with dependency output that could cause problems
when compiling kernels for different MACHINEs using a shared ccache. See
https://github.com/ccache/ccache/issues/158

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/ccache/ccache_3.3.3.bb | 12 ------------
 meta/recipes-devtools/ccache/ccache_3.3.4.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.3.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.3.4.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.3.bb b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
similarity index 48%
rename from meta/recipes-devtools/ccache/ccache_3.3.3.bb
rename to meta/recipes-devtools/ccache/ccache_3.3.4.bb
index ded7b30..45b2899 100644
--- a/meta/recipes-devtools/ccache/ccache_3.3.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
@@ -1,10 +1,10 @@
 require ccache.inc
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=938c02728101936f2a74a67d1d82ee25"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079"
 
-SRC_URI[md5sum] = "ea1f95303749b9ac136c617d1b333eef"
-SRC_URI[sha256sum] = "87a399a2267cfac3f36411fbc12ff8959f408cffd050ad15fe423df88e977e8f"
+SRC_URI[md5sum] = "61326f1edac7cd211a7018458dfe2d86"
+SRC_URI[sha256sum] = "1348b54e7c35dd2f8d17923389e03c546e599cfbde6459d2f31cf6f1521ec538"
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
-- 
2.1.4


