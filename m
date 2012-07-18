Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5T-0004Vz-Ks
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736826"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:43:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:45 -0700
Message-Id: <e2e29bab7f404f5739fdd78a4f28f13cccc3820d.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/18] fix my typos in patch headers
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
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
1.7.7.6



