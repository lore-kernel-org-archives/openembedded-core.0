Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E6A34782F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:30:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 07:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="980274648"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 13 Jun 2017 07:30:19 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id AFCA858010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:30:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:29:51 +0300
Message-Id: <1497364193-519-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1497364193-519-1-git-send-email-maxin.john@intel.com>
References: <1497364193-519-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/7] libglu: switch from ftp to https
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
X-List-Received-Date: Tue, 13 Jun 2017 14:30:18 -0000

For the same reasons as Debian:
https://www.debian.org/News/2017/20170425

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/mesa/libglu_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
index 8b94613..eeb898f 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 PE = "2"
 PR = "0"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/glu/glu-${PV}.tar.bz2"
+SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "be9249132ff49275461cf92039083030"
 SRC_URI[sha256sum] = "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12"
-- 
2.4.0


