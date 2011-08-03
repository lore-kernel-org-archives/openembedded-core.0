Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojjj-0004Tp-Ch
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912960"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:10 -0700
Message-Id: <87ffe261065b6e5e1cff5a4bf0af32a6b3e0e624.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 26/33] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:23 -0000

From: Tom Rini <tom_rini@mentor.com>

This comes from oe.dev which had this set for arm-linux only.  Bump PR
since this changes how builds happen.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/common-linux |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 14d671b..fd46d62 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -34,3 +34,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 # mysql
 ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
 ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
+
+# TCL
+tcl_cv_api_serial=${tcl_cv_api_serial=termios}
-- 
1.7.3.4



