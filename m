Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DCA97728C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183834"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:16 -0800
Message-Id: <b1d8e4726ccb1a825d9338a718edb5a4d854a33c.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 06/12] json-c: Upgrade to 0.12
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:34 -0000

Added CFLAGS to prevent compiler error of unused size variable

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/json-c/{json-c_0.11.bb => json-c_0.12.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.11.bb => json-c_0.12.bb} (75%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
similarity index 75%
rename from meta/recipes-devtools/json-c/json-c_0.11.bb
rename to meta/recipes-devtools/json-c/json-c_0.12.bb
index 389e0f9..79cf6dc 100644
--- a/meta/recipes-devtools/json-c/json-c_0.11.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
-SRC_URI[sha256sum] = "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
+SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
+SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
 
 RPROVIDES_${PN} = "libjson"
 
@@ -19,3 +19,5 @@ do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
 }
+
+CFLAGS += "-Wno-error=unused-but-set-variable"
-- 
2.1.0


