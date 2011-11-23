Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RT5uc-0004AR-BJ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:02:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 21:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79068638"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2011 21:55:54 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 21:55:51 -0800
Message-Id: <5e73d02ebed4bf5666fbd745b92c56a4643777c8.1322027494.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
References: <4d677dc2f3f0ea0448298b513735e123a1ed6535.1322027494.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322027494.git.nitin.a.kamble@intel.com>
References: <cover.1322027494.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] site/x86_64-linux: add cvs config variables
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
X-List-Received-Date: Wed, 23 Nov 2011 06:02:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

configure of cvs packages was failing on the meta-toolchain for a x86_64 target.

Configure error reported:
checking whether printf supports %p... configure: error: cannot run test program while cross compiling

This fixes [YOCTO #1781]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/site/x86_64-linux |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 3fa8f1e..a0a9362 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -118,3 +118,6 @@ ac_cv_func___lshrdi3=no
 ac_cv_func___trampoline_setup=no
 ac_cv_func___ucmpdi2=no
 ac_cv_func__restgpr_14_x=no
+
+# cvs
+cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
-- 
1.7.6.4



