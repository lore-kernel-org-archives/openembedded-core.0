Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DF8E2607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:03:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 06:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1024872077"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jul 2016 06:03:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 507F06A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:53 +0300
Message-Id: <1469624577-24972-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/9] dropbear: upgrade to 2016.74
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
X-List-Received-Date: Wed, 27 Jul 2016 13:03:44 -0000

2016.73 -> 2016.74

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/dropbear/dropbear_2016.73.bb | 7 -------
 meta/recipes-core/dropbear/dropbear_2016.74.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.73.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb

diff --git a/meta/recipes-core/dropbear/dropbear_2016.73.bb b/meta/recipes-core/dropbear/dropbear_2016.73.bb
deleted file mode 100644
index 71a36bd..0000000
--- a/meta/recipes-core/dropbear/dropbear_2016.73.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require dropbear.inc
-
-SRC_URI += "file://support-out-of-tree-builds.patch"
-
-SRC_URI[md5sum] = "8d6d78ce60ca52350ec04fcbd711ce9b"
-SRC_URI[sha256sum] = "5c61a4f69b093b688629cd365be38701485ff63cfb23642dab7a05ad250aefd7"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2016.74.bb b/meta/recipes-core/dropbear/dropbear_2016.74.bb
new file mode 100644
index 0000000..a702097
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2016.74.bb
@@ -0,0 +1,7 @@
+require dropbear.inc
+
+SRC_URI += "file://support-out-of-tree-builds.patch"
+
+SRC_URI[md5sum] = "9ad0172731e0f16623937804643b5bd8"
+SRC_URI[sha256sum] = "2720ea54ed009af812701bcc290a2a601d5c107d12993e5d92c0f5f81f718891"
+
-- 
2.4.0


