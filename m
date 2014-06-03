Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B5A696FAB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2014 20:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786736"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:10 -0700
Message-Id: <09c414766f698e76aa99ac2b637596cd510814e5.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] cups: Update to 1.7.3
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/{cups_1.7.2.bb => cups_1.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.7.2.bb => cups_1.7.3.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_1.7.2.bb b/meta/recipes-extended/cups/cups_1.7.3.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_1.7.2.bb
rename to meta/recipes-extended/cups/cups_1.7.3.bb
index 5d19fff..2175ba7 100644
--- a/meta/recipes-extended/cups/cups_1.7.2.bb
+++ b/meta/recipes-extended/cups/cups_1.7.3.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
 
-SRC_URI[md5sum] = "f06a997d4b71b81b23324e27174f93e7"
-SRC_URI[sha256sum] = "315cdff436924c4efe04cb110b145fb1a6e038e2eed8445359052f86e9e95676"
+SRC_URI[md5sum] = "d498c3020acda0904ab0c13b6389a1ec"
+SRC_URI[sha256sum] = "fa989f856d1499169dc442fb2311053ea42fe455ca2721693ba5a9fe4b333e31"
-- 
1.8.3.1


