Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E71BE6FF93
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:34:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Jul 2016 07:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,346,1464678000"; d="scan'208";a="1004642494"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2016 07:34:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 17:33:51 +0300
Message-Id: <1468247633-24172-6-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1468247633-24172-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] python-scons: fix upstream version check
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
X-List-Received-Date: Mon, 11 Jul 2016 14:34:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-scons_2.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-scons_2.5.0.bb b/meta/recipes-devtools/python/python-scons_2.5.0.bb
index c0a1cd4..8543c41 100644
--- a/meta/recipes-devtools/python/python-scons_2.5.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.5.0.bb
@@ -10,7 +10,6 @@ SRC_URI[md5sum] = "bda5530a70a41a7831d83c8b191c021e"
 SRC_URI[sha256sum] = "01f1b3d6023516a8e1b5e77799e5a82a23b32953b1102d339059ffeca8600493"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
-UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.8.1


