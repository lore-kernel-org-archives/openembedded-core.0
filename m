Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 12C55731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:07:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Jul 2016 07:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,352,1464678000"; d="scan'208";a="1005316915"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 07:07:58 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4AC6B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:07:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 17:07:41 +0300
Message-Id: <1468332463-4154-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/8] packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Tue, 12 Jul 2016 14:07:57 -0000

Replace pointercal with pointercal-xinput since we removed pointercal recipe.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index db3dfe3..6e8e50d 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
     dbus \
-    pointercal \
+    pointercal-xinput \
     matchbox-terminal \
     matchbox-wm \
     mini-x-session \
-- 
2.4.0


