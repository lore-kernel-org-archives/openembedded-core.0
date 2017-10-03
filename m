Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D0B8177B20
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:51:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 03 Oct 2017 12:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,475,1500966000"; d="scan'208";a="134796931"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 03 Oct 2017 12:51:37 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 12:51:35 -0700
Message-Id: <1507060295-34074-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: marex@denx.de, jurobystricky@hotmail.com, yau.wai.gan@intel.com
Subject: [PATCH] siteinfo: nios2-linux - remove wrong mutex info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 19:51:37 -0000

This fixes broken nios2 builds that involve db recipes.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/site/nios2-linux | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 2f4e570..5bae748 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -33,7 +33,6 @@ db_cv_path_sh=${db_cv_path_sh=/bin/sh}
 db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=ARM/gcc-assembly}
 db_cv_posixmutexes=${db_cv_posixmutexes=no}
 db_cv_uimutexes=${db_cv_uimutexes=no}
 
-- 
2.7.4


