Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05CFE600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:14:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2015 07:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,458,1427785200"; d="scan'208";a="728367710"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site.fi.intel.com)
	([10.237.68.142])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2015 07:14:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 May 2015 17:14:43 +0300
Message-Id: <1432044883-8257-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] testapps: remove old gst-meta-audio/video dependencies
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
X-List-Received-Date: Tue, 19 May 2015 14:14:23 -0000

Unnecessary because gst-player already pulls in correct gstreamer packages anyway.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 4177c45..95b3988 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -46,8 +46,6 @@ RDEPENDS_${PN} = "\
     ${KEXECTOOLS} \
     alsa-utils-amixer \
     alsa-utils-aplay \
-    gst-meta-video \
-    gst-meta-audio \
     ltp \
     connman-tools \
     connman-tests \
-- 
2.1.4


