Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6F-0004F7-H5
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:02:37 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMn004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:54 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:52 -0700
Message-Id: <91cd36f9eb2700c6fb66051a46d692d0bafa2ec6.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 8/9] siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to uclibc
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
X-List-Received-Date: Wed, 27 Jul 2011 23:02:37 -0000

This comes from oe.dev and while at this, drop from powerpc-linux as the
common-libc files set them.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/common-uclibc |    5 +++++
 meta/site/powerpc-linux |    1 -
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index b4a313e..b77eec6 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -34,5 +34,10 @@ ac_cv___va_copy=${ac_cv___va_copy=yes}
 ac_cv_func_va_copy=${ac_cv_func_va_copy=yes}
 ac_cv_func___va_copy=${ac_cv_func___va_copy=yes}
 
+# posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
 # TCL
 tcl_cv_api_serial=${tcl_cv_api_serial=termios}
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
1.7.0.4



