Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXGGH-0001Zw-35
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 19:21:45 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D155A3051B;
	Thu, 16 Jun 2011 13:18:14 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 10:18:07 -0700
Message-Id: <fa0a4b136599ac34499bb989f52610bbd7a795ac.1308244596.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308244596.git.scott.a.garman@intel.com>
References: <cover.1308244596.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308244596.git.scott.a.garman@intel.com>
References: <cover.1308244596.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D155A3051B.D004D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/2] mtools: upgrade to v4.0.16
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
X-List-Received-Date: Thu, 16 Jun 2011 17:21:45 -0000

Also added Upstream-Status: tag to a patch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../mtools/mtools/no-x11.gplv3.patch               |    9 ++++++---
 .../mtools/{mtools_4.0.15.bb => mtools_4.0.16.bb}  |    4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.15.bb => mtools_4.0.16.bb} (80%)

diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch b/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
index 7d1f545..9cb3e39 100644
--- a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
+++ b/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
@@ -1,6 +1,9 @@
-# Disable building with X11 support.
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Disable building with X11 support.
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN mtools-4.0.15.orig//Makefile.in mtools-4.0.15//Makefile.in
 --- mtools-4.0.15.orig//Makefile.in	2010-10-17 08:41:09.000000000 -0700
 +++ mtools-4.0.15//Makefile.in	2010-11-23 13:59:49.258258374 -0800
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.15.bb b/meta/recipes-devtools/mtools/mtools_4.0.16.bb
similarity index 80%
rename from meta/recipes-devtools/mtools/mtools_4.0.15.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.16.bb
index 08f42cc..f5dca26 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.15.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.16.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
            file://no-x11.gplv3.patch"
 
-SRC_URI[md5sum] = "b7550b649af77812cb696a780e853f47"
-SRC_URI[sha256sum] = "290defca107cc183a17c98d3f7d00db02228b724084a2a818f1dd6ea86973899"
+SRC_URI[md5sum] = "e9b07f35272210f407012abaf5d1b9b5"
+SRC_URI[sha256sum] = "7c9e337786d142399d37202ff2002f95bfb3f4e96620223a18d7206708ad2ed5"
 
 inherit autotools
 
-- 
1.7.1



