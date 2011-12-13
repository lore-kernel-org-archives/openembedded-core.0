Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbr-0007YW-7p
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612759"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:14:05 -0800
Message-Id: <94208f209b4ad15a88e9ebcc5d3675b6f9f93407.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
Subject: [PATCH 06/10] gzip: Add SRC_URI Checksums for GPLv2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 08:21:11 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/gzip/gzip_1.3.12.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/gzip/gzip_1.3.12.bb b/meta/recipes-extended/gzip/gzip_1.3.12.bb
index f0752e4..2836942 100644
--- a/meta/recipes-extended/gzip/gzip_1.3.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.3.12.bb
@@ -13,6 +13,9 @@ SRC_URI = "${GNU_MIRROR}/gzip/gzip-${PV}.tar.gz \
            file://m4-extensions-fix.patch \
            file://dup-def-fix.patch"
 
+SRC_URI[md5sum] = "b5bac2d21840ae077e0217bc5e4845b1"
+SRC_URI[sha256sum] = "3f565be05f7f3d1aff117c030eb7c738300510b7d098cedea796ca8e4cd587af"
+
 PR = "r0"
 
 inherit autotools
-- 
1.7.6.4



