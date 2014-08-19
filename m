Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63CE465DD6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283374"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:07 -0700
Message-Id: <a244cd5e281c3e5e432847b3516c5700e3460ba1.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 1/7] cups: Upgrade to 1.7.5
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/{cups_1.7.4.bb => cups_1.7.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.7.4.bb => cups_1.7.5.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_1.7.4.bb b/meta/recipes-extended/cups/cups_1.7.5.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_1.7.4.bb
rename to meta/recipes-extended/cups/cups_1.7.5.bb
index 9dae986..5538cec 100644
--- a/meta/recipes-extended/cups/cups_1.7.4.bb
+++ b/meta/recipes-extended/cups/cups_1.7.5.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
 
-SRC_URI[md5sum] = "1a2295c2b2d2f422db2e50f40ed2fb99"
-SRC_URI[sha256sum] = "358fc7f22395a9ba07efcfc0d34a057ab5e9182b6e3297f71263a6b68fb41378"
+SRC_URI[md5sum] = "5d893edc2957005f78e2b2423fdace2e"
+SRC_URI[sha256sum] = "18cb4c6847dbaaaa05c8b35af787f19dd5c7686970b46548e72c711c6f26bd02"
-- 
1.8.3.1


