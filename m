Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CA511784D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279571"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:42 +0300
Message-Id: <d52b19f69468b83fd82025f393007b15a2aabfa0.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/32] uninative-flags.inc: do not default to old C++ ABI
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:28 -0000

This was needed for interoperability between code compiled with gcc 4 and 5;
there should be now a different fix for the issue:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=c21cec84886d9c70396e9be0ceb9a8ef300b54be

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/uninative-flags.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/distro/include/uninative-flags.inc b/meta/conf/distro/include/uninative-flags.inc
index b6a944ef63b..f5b15471a4b 100644
--- a/meta/conf/distro/include/uninative-flags.inc
+++ b/meta/conf/distro/include/uninative-flags.inc
@@ -1,9 +1,3 @@
-# https://wiki.debian.org/GCC5
-# We may see binaries built with gcc5 run or linked into gcc4 environment
-# so use the older libstdc++ standard for now until we don't support gcc4
-# on the host system.
-BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
-
 # icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
 # therefore pass one
 BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
-- 
2.11.0


