Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO2-0005Br-Pu
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967547"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:29:18 -0700
Message-Id: <7e2c5d976d05c873ca949504e8c2416a34ac7f97.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 10:48:14 -0700
Date: Fri, 22 Apr 2011 23:29:18 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 24/37] git: upgrade from 1.7.3.4 to 1.7.4.3
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/git/files/autotools.patch    |    2 ++
 .../git/{git_1.7.3.4.bb => git_1.7.4.3.bb}         |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.7.3.4.bb => git_1.7.4.3.bb} (59%)

diff --git a/meta/recipes-devtools/git/files/autotools.patch b/meta/recipes-devtools/git/files/autotools.patch
index 1c69c22..cb21193 100644
--- a/meta/recipes-devtools/git/files/autotools.patch
+++ b/meta/recipes-devtools/git/files/autotools.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [configuration]
+
 Index: git-1.7.2.1/configure.ac
 ===================================================================
 --- git-1.7.2.1.orig/configure.ac	2010-07-28 18:03:43.000000000 +0100
diff --git a/meta/recipes-devtools/git/git_1.7.3.4.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
similarity index 59%
rename from meta/recipes-devtools/git/git_1.7.3.4.bb
rename to meta/recipes-devtools/git/git_1.7.4.3.bb
index 2765ef7..603d2fd 100644
--- a/meta/recipes-devtools/git/git_1.7.3.4.bb
+++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
@@ -6,5 +6,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
 
-SRC_URI[md5sum] = "3a2602016f98c529cda7b9fad1a6e216"
-SRC_URI[sha256sum] = "3e5e2b6547ee4aae82b4c5f589ff084996e9e6e0e2b52c92365e6baa1e4a0171"
+SRC_URI[md5sum] = "da6c8f4967393342a4397b955db72cb1"
+SRC_URI[sha256sum] = "44b3ebc87d83b34468718fb6fa424420877e1f66c190389d693d090662a3556d"
-- 
1.7.1.1



