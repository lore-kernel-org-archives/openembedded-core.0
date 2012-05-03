Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQY-0006gd-1z
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772195"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:35 -0700
Message-Id: <f108b73c57eb3630f12809708ed10f071024f863.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/36] tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
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
X-List-Received-Date: Thu, 03 May 2012 02:05:55 -0000

From: Christopher Larson <kergoth@gmail.com>

This is handled by IMAGE_LINGUAS, so hardcoding it here is at best unnecessary
duplication.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index aed82d1..4f5607f 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -19,10 +19,10 @@ CXXFLAGS += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "libsegfault \
 		     eglibc \
-    		     eglibc-dbg \
-    		     eglibc-dev \
-    		     eglibc-utils \
-    		     eglibc-thread-db \
+		     eglibc-dbg \
+		     eglibc-dev \
+		     eglibc-utils \
+		     eglibc-thread-db \
 		     ${@get_libc_locales_dependencies(d)}"
 
 LIBC_LOCALE_DEPENDENCIES = "\
@@ -30,9 +30,7 @@ LIBC_LOCALE_DEPENDENCIES = "\
 	eglibc-gconv-ibm850 \
 	eglibc-gconv-cp1252 \
 	eglibc-gconv-iso8859-1 \
-	eglibc-gconv-iso8859-15 \
-	locale-base-en-us \
-	locale-base-en-gb"
+	eglibc-gconv-iso8859-15"
 
 def get_libc_locales_dependencies(d):
     if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
-- 
1.7.7.6



