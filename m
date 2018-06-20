Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 284947555B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:07:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2018 07:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,247,1526367600"; d="scan'208";a="50852231"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 20 Jun 2018 07:07:24 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 11008580142
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:07:23 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 17:07:19 +0300
Message-Id: <1529503642-7158-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/5] piglit: upgrade to latest revision
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
X-List-Received-Date: Wed, 20 Jun 2018 14:07:25 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b936ad8..1a3e888 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
 UPSTREAM_CHECK_COMMITS = "1"
 
 # From 2018-02-26
-SRCREV = "4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b"
+SRCREV = "3aa8c1cfe1a9ddae40c60d9dc76fe8dce47b15cc"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.4.0


