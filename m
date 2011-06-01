Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRern-000421-Fq
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203806"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:39 -0700
Message-Id: <937ab8072370293ac6caba070bb2be1e3d5f1039.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/32] libiconv: update to 1.13.1
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:20 -0000

Add Upstream-Status tags to patches

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../autoconf.patch                                 |    2 ++
 .../shared_preloadable_libiconv_linux.patch        |    2 ++
 .../{libiconv_1.11.1.bb => libiconv_1.13.1.bb}     |    0
 3 files changed, 4 insertions(+), 0 deletions(-)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => libiconv-1.13.1}/shared_preloadable_libiconv_linux.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv_1.11.1.bb => libiconv_1.13.1.bb} (100%)

diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
similarity index 98%
rename from meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
rename to meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
index 2b24894..3cbf549 100644
--- a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
+++ b/meta/recipes-support/libiconv/libiconv-1.13.1/autoconf.patch
@@ -2,6 +2,8 @@ It adds the variables that are needed
 for autoconf 2.65 to reconfigure libiconv and defines the m4 macros 
 directory. Its imported from OE.
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/configure.ac
diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
similarity index 98%
rename from meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
rename to meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
index a913dad..fb07f73 100644
--- a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
+++ b/meta/recipes-support/libiconv/libiconv-1.13.1/shared_preloadable_libiconv_linux.patch
@@ -4,6 +4,8 @@ Its more enforced by libtool 2.4. I have not checked it with older libtool
 libiconv 1.11.x is relatively old release and libtool 2.4 did not exist when it
 was released these kind of problem are more likely
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: libiconv-1.11.1/lib/Makefile.in
diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.13.1.bb
similarity index 100%
rename from meta/recipes-support/libiconv/libiconv_1.11.1.bb
rename to meta/recipes-support/libiconv/libiconv_1.13.1.bb
-- 
1.7.3.4



