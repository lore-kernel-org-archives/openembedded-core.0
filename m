Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1A87687A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:07:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2015 05:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="780436015"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2015 05:07:00 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 15:08:24 +0300
Message-Id: <a06aed508d49597f70dbc799b9013a9df1ca2722.1439204506.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
References: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439204506.git.jussi.kukkonen@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/5] libepoxy: Upgrade 1.2 -> 1.3.1
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
X-List-Received-Date: Mon, 10 Aug 2015 12:07:31 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index 535af5d..ad17293 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://0002-add-an-option-to-disable-glx-support.patch \
     file://no-need-for-python3.patch \
 "
-SRCREV="20062c25e7612cab023cdef44d3277ba1bd0b2de"
-PV = "1.2+git${SRCPV}"
+SRCREV="e2c33af5bfcfc9d168f9e776156dd47c33f428b3"
+PV = "1.3.1"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


