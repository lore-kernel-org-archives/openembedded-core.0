Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SrMRF-0006rA-Pi
	for Openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 07:04:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 21:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169685140"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2012 21:53:04 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 21:52:49 -0700
Message-Id: <5b014eae151a1584df4e3d3b96d18f9df3e55665.1342500638.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1342500638.git.nitin.a.kamble@intel.com>
References: <cover.1342500638.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] fix my typos in patch headers
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
X-List-Received-Date: Wed, 18 Jul 2012 05:04:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   10 +++++-----
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   10 +++++-----
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |    2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
index d3a9211..3476bb9 100644
--- a/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -1,11 +1,11 @@
-Upsteam-Status: Inappropriate 
+Upstream-Status: Inappropriate 
 
-automake 1.12.x has depricated AM_PROG_MKDIR_P , and throws a warning for that,
-and the warnings are treated as errors becuase of the -Werror parameter.
+automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
+and the warnings are treated as errors because of the -Werror parameter.
 
 These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
-eliminated these depricated macros yet. So disable the treatment of warnings
-as errors until gettext is updeated to remove the depricated macros.
+eliminated these deprecated macros yet. So disable the treatment of warnings
+as errors until gettext is updated to remove the deprecated macros.
 
 Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/10
diff --git a/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch b/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
index dde683f..479596e 100644
--- a/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
+++ b/meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
@@ -1,11 +1,11 @@
-Upsteam-Status: Inappropriate 
+Upstream-Status: Inappropriate 
 
-automake 1.12.x has depricated AM_PROG_MKDIR_P , and throws a warning for that,
-and the warnings are treated as errors becuase of the -Werror parameter.
+automake 1.12.x has deprecated AM_PROG_MKDIR_P , and throws a warning for that,
+and the warnings are treated as errors because of the -Werror parameter.
 
 These AM_PROG_MKDIR_P are coming from gettext, and the latest gettext code has not 
-eliminated these depricated macros yet. So disable the treatment of warnings
-as errors until gettext is updeated to remove the depricated macros.
+eliminated these deprecated macros yet. So disable the treatment of warnings
+as errors until gettext is updated to remove the deprecated macros.
 
 Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/07/09
diff --git a/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch b/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
index 1625255..c742e6c 100644
--- a/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
+++ b/meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
@@ -1,4 +1,4 @@
-Upsteam-Status: Pending
+Upstream-Status: Pending
 
 Avoids these kind of warnings:
 Warning: 'libgnutls.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
-- 
1.7.3.4



