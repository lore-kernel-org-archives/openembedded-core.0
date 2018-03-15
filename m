Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EBE8078771
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:46:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 03:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; d="scan'208";a="24270058"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2018 03:46:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 12:39:46 +0200
Message-Id: <20180315103947.4303-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 1/2] distcc: remove UPSTREAM_VERSION_UNKNOWN
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
X-List-Received-Date: Thu, 15 Mar 2018 10:46:47 -0000

Upstream has finally released a new version.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index b6da65a582a..ea3d7c10be8 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -23,7 +23,6 @@ SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
            file://distcc.service"
 SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
 S = "${WORKDIR}/git"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
-- 
2.16.1


