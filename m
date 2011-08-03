Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjr-0004Tp-8U
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912971"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:16 -0700
Message-Id: <14cd449cbc9d594c4ed303186081fa251a8e2c9e.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 32/33] siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to uclibc
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:58 -0000

From: Tom Rini <tom_rini@mentor.com>

This comes from oe.dev and while at this, drop from powerpc-linux as the
common-libc files set them.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/common-uclibc |    5 +++++
 meta/site/powerpc-linux |    1 -
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 178015f..bdad0e9 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -33,3 +33,8 @@ ac_cv_va_copy=${ac_cv_va_copy=yes}
 ac_cv___va_copy=${ac_cv___va_copy=yes}
 ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
 ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
+
+# posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
index ac681b2..a9f89cb 100644
--- a/meta/site/powerpc-linux
+++ b/meta/site/powerpc-linux
@@ -8,7 +8,6 @@ lf_cv_sane_realloc=yes
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 
 # lftp
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-- 
1.7.3.4



