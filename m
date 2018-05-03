Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 96E556011F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 06:43:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2018 23:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="46407083"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 02 May 2018 23:43:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 09:37:32 +0300
Message-Id: <20180503063733.26270-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 1/2] ifupdown: correct the repository location
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
X-List-Received-Date: Thu, 03 May 2018 06:43:27 -0000

The old repo is gone.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
index 5654528ae87..e9f3a2aee9b 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
@@ -6,7 +6,7 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://anonscm.debian.org/git/collab-maint/ifupdown.git \
+SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
 	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
 	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
-- 
2.16.1


