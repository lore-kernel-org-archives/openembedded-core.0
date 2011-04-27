Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEA-0005KY-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550310"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:30 -0700
Message-Id: <79487322188fd3ad14c3dbf466ed89d2083186b2.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 15:22:26 +0800
Date: Wed, 27 Apr 2011  0:29:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 10/52] valgrind: upgrade to version 3.6.1
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:02 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../fix_issue_caused_by_ccache.patch               |    2 ++
 .../fixed-perl-path.patch                          |    2 ++
 .../{valgrind_3.6.0.bb => valgrind_3.6.1.bb}       |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.0 => valgrind-3.6.1}/fix_issue_caused_by_ccache.patch (94%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.0 => valgrind-3.6.1}/fixed-perl-path.patch (97%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.6.0.bb => valgrind_3.6.1.bb} (86%)

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.0/fix_issue_caused_by_ccache.patch b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_issue_caused_by_ccache.patch
similarity index 94%
rename from meta/recipes-devtools/valgrind/valgrind-3.6.0/fix_issue_caused_by_ccache.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_issue_caused_by_ccache.patch
index a5c273c..4658567 100644
--- a/meta/recipes-devtools/valgrind/valgrind-3.6.0/fix_issue_caused_by_ccache.patch
+++ b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_issue_caused_by_ccache.patch
@@ -3,6 +3,8 @@ The script does not expect use of ccache, hence fix it to recognise it.
 2010/08/17
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: valgrind-3.5.0/coregrind/link_tool_exe_linux.in
 ===================================================================
 --- valgrind-3.5.0.orig/coregrind/link_tool_exe_linux.in
diff --git a/meta/recipes-devtools/valgrind/valgrind-3.6.0/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fixed-perl-path.patch
similarity index 97%
rename from meta/recipes-devtools/valgrind/valgrind-3.6.0/fixed-perl-path.patch
rename to meta/recipes-devtools/valgrind/valgrind-3.6.1/fixed-perl-path.patch
index 2a0440a..b054d05 100644
--- a/meta/recipes-devtools/valgrind/valgrind-3.6.0/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind-3.6.1/fixed-perl-path.patch
@@ -9,6 +9,8 @@ a better fix would need:
 
 8/31/2010 - created by Qing He <qing.he@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
 index 9dc9565..cc4ef05 100644
 --- a/cachegrind/cg_annotate.in
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
similarity index 86%
rename from meta/recipes-devtools/valgrind/valgrind_3.6.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index a33a540..4dbc628 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.6.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
            file://fixed-perl-path.patch"
 
-SRC_URI[md5sum] = "b289c5f4ab8e39741602445f1dd09b34"
-SRC_URI[sha256sum] = "bc0f0153b5a47b986f1d8efa2c488e0aea85a1cf2c4b11c52be127903080285f"
+SRC_URI[md5sum] = "2c3aa122498baecc9d69194057ca88f5"
+SRC_URI[sha256sum] = "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.7.1.1



