Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E563360116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 21:54:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2017 14:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,475,1500966000"; d="scan'208";a="1178295807"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2017 14:54:14 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 14:54:12 -0700
Message-Id: <1507067652-27633-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: marex@denx.de, jurobystricky@hotmail.com, yau.wai.gan@intel.com
Subject: [PATCH v2] siteinfo: nios2-linux - remove wrong mutex info
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
X-List-Received-Date: Tue, 03 Oct 2017 21:54:14 -0000

With the commit f4e8e9242c5df095b52688b083df3c9d36e7144b some nios2 builds
(uboot, core-image-minimal, etc) were broken due to db trying to use ARM instructions
in mutexes. The reason was db "configure" used the cached entry from nios2-linux
(which was incorrect). So the remedy was to remove the incorrect cached entry
and let db "configure" figure out which is the proper mutex to use.

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


