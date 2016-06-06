Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E77EC771D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 09:13:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 02:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,426,1459839600"; d="scan'208";a="116749210"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2016 02:13:17 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 012406A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 03:00:42 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 12:13:41 +0300
Message-Id: <1465204421-22556-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1465204421-22556-1-git-send-email-maxin.john@intel.com>
References: <1465204421-22556-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] db: add RECIPE_NO_UPDATE_REASON
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
X-List-Received-Date: Mon, 06 Jun 2016 09:13:16 -0000

db-6.2.23 does not work with RPM-5.x due to changes in locking semantics

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/db/db_6.0.30.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 50a469b..018dd58 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -122,3 +122,4 @@ INSANE_SKIP_${PN}-cxx = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
 
+RECIPE_NO_UPDATE_REASON = "latest db does not work with RPM-5.x due to changes in locking semantics"
-- 
2.4.0


