Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E3AC0787A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 09:24:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2018 02:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,251,1526367600"; d="scan'208";a="51085554"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 21 Jun 2018 02:24:34 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BF10058012D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 02:24:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 12:23:25 +0300
Message-Id: <1529573005-1656-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] piglit: upgrade to latest revision
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
X-List-Received-Date: Thu, 21 Jun 2018 09:24:39 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b936ad8..c186ca9 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-# From 2018-02-26
-SRCREV = "4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b"
+# From 2018-06-18
+SRCREV = "431bcc74ff54521ed1c498af9b13e629f949bda6"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.4.0


