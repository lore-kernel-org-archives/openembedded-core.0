Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B5B576D063
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:30 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506432"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:16 -0700
Message-Id: <2f131da84976515ca8b22983154e0e1811314424.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 10/18] file: Update to 5.15
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:31 -0000

(From OE-Core rev: 562bde3d91dcd7b290ec708607e9bb2d3415077a)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/file/{file_5.14.bb => file_5.15.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/file/{file_5.14.bb => file_5.15.bb} (85%)

diff --git a/meta/recipes-devtools/file/file_5.14.bb b/meta/recipes-devtools/file/file_5.15.bb
similarity index 85%
rename from meta/recipes-devtools/file/file_5.14.bb
rename to meta/recipes-devtools/file/file_5.15.bb
index c8b902c..5589efa 100644
--- a/meta/recipes-devtools/file/file_5.14.bb
+++ b/meta/recipes-devtools/file/file_5.15.bb
@@ -10,14 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_class-native = "zlib-native"
-PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "c26625f1d6773ad4bc5a87c0e315632c"
-SRC_URI[sha256sum] = "461ba01dd0900a3b7c2dcd901b04903192c07887a9c1928af0be507572c77fe4"
+SRC_URI[md5sum] = "3f99565532f548d7540912c4642d1ede"
+SRC_URI[sha256sum] = "4bd52cc614d6488127c0bddc208a2855481744d76ff0878d9c173d2a6ed564e4"
 
 inherit autotools
 
-- 
1.8.3.1


