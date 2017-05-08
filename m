Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D22BA71BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:46:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 03:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="84861080"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 08 May 2017 03:46:20 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 4BEFB6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 03:46:06 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 13:46:51 +0300
Message-Id: <1494240411-22597-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
References: <1494240411-22597-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] ofono: drop unmaintained _git recipe
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
X-List-Received-Date: Mon, 08 May 2017 10:46:30 -0000

Similar to gstreamer _git recipes, this recipe wasn't kept upto date
or tested regularly.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_git.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_git.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
deleted file mode 100644
index beafb77..0000000
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ofono.inc
-
-S	 = "${WORKDIR}/git"
-SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
-PV	 = "0.12-git${SRCPV}"
-PR = "r5"
-
-SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git \
-	    file://ofono"
-
-do_configure_prepend () {
-  ${S}/bootstrap
-}
-
-- 
2.4.0


