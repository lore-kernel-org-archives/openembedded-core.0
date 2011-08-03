Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoive-0002CA-6t
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056982"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:41 -0700
Message-Id: <96fec488b295a646a4d3da1096e4297a92018cf8.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/33] siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to uclibc
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:40 -0000

From: Tom Rini <tom_rini@mentor.com>

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
1.7.3.4



