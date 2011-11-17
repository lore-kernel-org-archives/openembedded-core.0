Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RRBFh-0002Pr-7A
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 00:20:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Nov 2011 15:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,529,1315206000"; d="scan'208";a="76374107"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 17 Nov 2011 15:13:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 15:13:41 -0800
Message-Id: <8e563b55bf1b0e9eaaf5becd4fb23440ddd1691c.1321560182.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321560182.git.nitin.a.kamble@intel.com>
References: <cover.1321560182.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] at: update the upstream-status of patches
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
X-List-Received-Date: Thu, 17 Nov 2011 23:20:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../at/at-3.1.12/configure-add-enable-pam.patch    |    2 ++
 .../at/files/file_replacement_with_gplv2.patch     |    2 ++
 .../at/files/nonstripbinaries.patch                |    1 +
 meta/recipes-extended/at/files/use-ldflags.patch   |    2 ++
 4 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
index 1f73cdd..1e5efef 100644
--- a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
+++ b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- at-3.1.12/configure.ac	2011-06-23 14:51:03.653572945 +0800
 +++ at-3.1.12/configure.ac.new	2011-06-27 16:12:14.903572945 +0800
 @@ -81,10 +81,18 @@
diff --git a/meta/recipes-extended/at/files/file_replacement_with_gplv2.patch b/meta/recipes-extended/at/files/file_replacement_with_gplv2.patch
index 249902c..d5ef003 100644
--- a/meta/recipes-extended/at/files/file_replacement_with_gplv2.patch
+++ b/meta/recipes-extended/at/files/file_replacement_with_gplv2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 posixtm.[ch] files are replaced with gplv2 version from these locations:
 
 http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/posixtm.c;hb=5661ab9d49512b4cf3c19caa11bb581d8ce561ba
diff --git a/meta/recipes-extended/at/files/nonstripbinaries.patch b/meta/recipes-extended/at/files/nonstripbinaries.patch
index a1aee5f..2b251db 100644
--- a/meta/recipes-extended/at/files/nonstripbinaries.patch
+++ b/meta/recipes-extended/at/files/nonstripbinaries.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 #Because remove nonrootinstall patch, the stripping of the binaries can not
 #be handled.
 #This patch is to handle the stripping of the binaries.
diff --git a/meta/recipes-extended/at/files/use-ldflags.patch b/meta/recipes-extended/at/files/use-ldflags.patch
index 7d3d91a..fdd1908 100644
--- a/meta/recipes-extended/at/files/use-ldflags.patch
+++ b/meta/recipes-extended/at/files/use-ldflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # Ensure use of $LDFLAGS during build
 # Derived from an OE patch for at-3.1.8
 
-- 
1.7.6.4



