Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoiva-0002E7-NL
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056952"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:35 -0700
Message-Id: <526ca905db2890c43e09f2cdc3e1e09bc38a3213.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/33] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:39 -0000

From: Tom Rini <tom_rini@mentor.com>

This comes from oe.dev which had this set for arm-linux only.  Bump PR
since this changes how builds happen.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/common-glibc  |    2 ++
 meta/site/common-uclibc |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 8cfa695..baca5f8 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -69,3 +69,5 @@ gl_cv_func_mbrtowc_null_arg=${gl_cv_func_mbrtowc_null_arg=yes}
 gl_cv_func_mbrtowc_retval=${gl_cv_func_mbrtowc_retval=yes}
 gl_cv_func_mbrtowc_nul_retval=${gl_cv_func_mbrtowc_nul_retval=yes}
 
+# TCL
+tcl_cv_api_serial=${tcl_cv_api_serial=termios}
diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
index 093f60e..002a559 100644
--- a/meta/site/common-uclibc
+++ b/meta/site/common-uclibc
@@ -26,3 +26,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=no}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
+
+# TCL
+tcl_cv_api_serial=${tcl_cv_api_serial=termios}
-- 
1.7.3.4



