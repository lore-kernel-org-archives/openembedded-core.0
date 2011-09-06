Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R0let-0003yn-91
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 04:45:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2011 19:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,336,1312182000"; d="scan'208";a="49269094"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2011 19:39:57 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:36:13 +0800
Message-Id: <ec86a236ffdabf4c0b7c657bf515c04541c78d72.1315276240.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315276240.git.edwin.zhai@intel.com>
References: <cover.1315276240.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1315276240.git.edwin.zhai@intel.com>
References: <cover.1315276240.git.edwin.zhai@intel.com>
Subject: [PATCH 2/2] site/x86_64: Add entries to fix conf error on x86_64
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
X-List-Received-Date: Tue, 06 Sep 2011 02:45:07 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Add entries for ashldi3, bswapsi2... to fix autoconf error of grub on x86_64

[YOCTO #1434] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/site/x86_64-linux |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index f3a6ea1..3fa8f1e 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -108,3 +108,13 @@ lftp_cv_va_val_copy=${lftp_cv_va_val_copy=no}
 
 # slrn
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=no}
+
+# grub
+ac_cv_func___ashldi3=no
+ac_cv_func___ashrdi3=no
+ac_cv_func___bswapdi2=no
+ac_cv_func___bswapsi2=no
+ac_cv_func___lshrdi3=no
+ac_cv_func___trampoline_setup=no
+ac_cv_func___ucmpdi2=no
+ac_cv_func__restgpr_14_x=no
-- 
1.7.1



