Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5A221734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851885"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:43 +0200
Message-Id: <bebc442d887c60110835aaa327192d94c0e1bdcb.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/12] libjpeg-turbo: fix upstream version check (sort of)
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:47 -0000

We prepend '8d' to the version and at the moment there is no way
to strip that out when doing upstream checks. But at least the latest
upstream version is reported correctly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
index da1923f..4859431 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_8d+1.4.2.bb
@@ -14,6 +14,8 @@ BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
 SRC_URI[md5sum] = "86b0d5f7507c2e6c21c00219162c3c44"
 SRC_URI[sha256sum] = "521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e"
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
+UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${BPN}-${BASEPV}"
 
-- 
2.6.4


