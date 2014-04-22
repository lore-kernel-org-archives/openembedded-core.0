Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E9EC860DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712228"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:24 -0700
Message-Id: <c27fe042314dc26229b64ddd512f0c03667edba9.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 02/10] cups: update to 1.7.2
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/{cups_1.7.1.bb => cups_1.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.7.1.bb => cups_1.7.2.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_1.7.1.bb b/meta/recipes-extended/cups/cups_1.7.2.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_1.7.1.bb
rename to meta/recipes-extended/cups/cups_1.7.2.bb
index 9854a4d..5d19fff 100644
--- a/meta/recipes-extended/cups/cups_1.7.1.bb
+++ b/meta/recipes-extended/cups/cups_1.7.2.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
 
-SRC_URI[md5sum] = "55277c40fd4b7183dc3671d39c5c42b7"
-SRC_URI[sha256sum] = "f52bec893d9daf92b6029be79c07e6c516b4c85ffae3e6e01885cc85e9081681"
+SRC_URI[md5sum] = "f06a997d4b71b81b23324e27174f93e7"
+SRC_URI[sha256sum] = "315cdff436924c4efe04cb110b145fb1a6e038e2eed8445359052f86e9e95676"
-- 
1.8.3.1


