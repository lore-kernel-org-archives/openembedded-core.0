Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RT5ub-0004AK-MW
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:02:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 21:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79068637"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2011 21:55:54 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 21:55:50 -0800
Message-Id: <ca4c90c9503d33abeb7058f084f38d97298362a8.1322027494.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
References: <4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322027494.git.nitin.a.kamble@intel.com>
References: <cover.1322027494.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] at: update the upstream-status of patches
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
X-List-Received-Date: Wed, 23 Nov 2011 06:02:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../at/at-3.1.12/configure-add-enable-pam.patch    |    5 +++++
 meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |    3 +++
 .../at/files/file_replacement_with_gplv2.patch     |    2 ++
 .../at/files/nonstripbinaries.patch                |    1 +
 meta/recipes-extended/at/files/use-ldflags.patch   |    5 +++++
 5 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
index 1f73cdd..a6b7969 100644
--- a/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
+++ b/meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Pending
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/11/21
+
 --- at-3.1.12/configure.ac	2011-06-23 14:51:03.653572945 +0800
 +++ at-3.1.12/configure.ac.new	2011-06-27 16:12:14.903572945 +0800
 @@ -81,10 +81,18 @@
diff --git a/meta/recipes-extended/at/at-3.1.12/pam.conf.patch b/meta/recipes-extended/at/at-3.1.12/pam.conf.patch
index dfe76d7..f616cea 100644
--- a/meta/recipes-extended/at/at-3.1.12/pam.conf.patch
+++ b/meta/recipes-extended/at/at-3.1.12/pam.conf.patch
@@ -2,6 +2,9 @@ oe doesn't support "@include", use the concrete directive instead.
 
 Upstream-Status: Pending
 
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/11/21
+
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 --- at-3.1.12/pam.conf.orig	2009-11-23 23:11:52.000000000 +0800
 +++ at-3.1.12/pam.conf	2011-07-15 11:14:04.132818950 +0800
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
index 7d3d91a..b533598 100644
--- a/meta/recipes-extended/at/files/use-ldflags.patch
+++ b/meta/recipes-extended/at/files/use-ldflags.patch
@@ -1,6 +1,11 @@
+Upstream-Status: Pending
+
 # Ensure use of $LDFLAGS during build
 # Derived from an OE patch for at-3.1.8
 
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/11/21
+
 --- at-3.1.12.orig/Makefile.in	2009-11-23 07:11:52.000000000 -0800
 +++ at-3.1.12/Makefile.in	2010-07-20 16:28:04.000000000 -0700
 @@ -65,13 +65,13 @@
-- 
1.7.6.4



