Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF7171A34
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:28:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876319"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:28:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:20 +0200
Message-Id: <54f9402d4a75d8c569b0c769dab61a75e00a6e0d.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/13] boost: fix upstream version check
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
X-List-Received-Date: Tue, 01 Nov 2016 15:28:01 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/boost/boost-1.62.0.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
index cd99b0e..1e555e1 100644
--- a/meta/recipes-support/boost/boost-1.62.0.inc
+++ b/meta/recipes-support/boost/boost-1.62.0.inc
@@ -16,6 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
 SRC_URI[md5sum] = "5fb94629535c19e48703bdb2b2e9490f"
 SRC_URI[sha256sum] = "36c96b0f6155c98404091d8ceb48319a28279ca0333fba1ad8611eb90afb2ca0"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/boost/files/"
+
 PR = "r1"
 
 S = "${WORKDIR}/${BOOST_P}"
-- 
2.10.1


