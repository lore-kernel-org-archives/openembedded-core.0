Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A93017061D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUhl011074; Wed, 16 Jul 2014 17:26:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jh9ADkp8eclY; Wed, 16 Jul 2014 17:26:31 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQR5F011040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:28 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S29-0004ND-Vb; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:03 +0100
Message-Id: <9485ee9409899d6d2acd5e6b4c73a0ddfb7ad6ed.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/19] gdb: Upgrade 7.7 -> 7.7.1
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:18 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/{gdb-7.7.inc => gdb-7.7.1.inc}              | 4 ++--
 .../gdb/{gdb-cross-canadian_7.7.bb => gdb-cross-canadian_7.7.1.bb}    | 0
 meta/recipes-devtools/gdb/{gdb-cross_7.7.bb => gdb-cross_7.7.1.bb}    | 0
 meta/recipes-devtools/gdb/{gdb_7.7.bb => gdb_7.7.1.bb}                | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.7.inc => gdb-7.7.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.bb => gdb-cross-canadian_7.7.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.7.bb => gdb-cross_7.7.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.7.bb => gdb_7.7.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.7.inc b/meta/recipes-devtools/gdb/gdb-7.7.1.inc
similarity index 70%
rename from meta/recipes-devtools/gdb/gdb-7.7.inc
rename to meta/recipes-devtools/gdb/gdb-7.7.1.inc
index 62adcaa..aa16d5a 100644
--- a/meta/recipes-devtools/gdb/gdb-7.7.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.7.1.inc
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "40051ff95b39bd57b14b1809e2c16152"
-SRC_URI[sha256sum] = "8814d98c2733639cb602b6ecd8d69e02498017e02b5724c9451c285b0e9ee173"
+SRC_URI[md5sum] = "45b07b53d81832d32ccd4829465d4886"
+SRC_URI[sha256sum] = "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317ea49c6bd6ba213eff"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.bb b/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.7.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.7.bb b/meta/recipes-devtools/gdb/gdb_7.7.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.7.bb
rename to meta/recipes-devtools/gdb/gdb_7.7.1.bb
-- 
1.9.2


