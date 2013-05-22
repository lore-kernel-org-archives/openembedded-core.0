Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47948608CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405593"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:21 -0700
Message-Id: <4aeebf8379e70c2da1693a21b34b53fc7009c9f3.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] mklibs: Update to 0.1.37
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mklibs/{mklibs-native_0.1.35.bb => mklibs-native_0.1.37.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.35.bb => mklibs-native_0.1.37.bb} (80%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.35.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb
similarity index 80%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.35.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb
index b9cbd84..c37ea87 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.35.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.37.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.g
 	file://fix_STT_GNU_IFUNC.patch\
 "
 
-SRC_URI[md5sum] = "3d2a4bd0bbf5ba964b0a1ecdafd1ea9a"
-SRC_URI[sha256sum] = "ccb1023dc1729c5a37ca6c3eca8e4bac3491116763c8820dfce8eea4845c8567"
+SRC_URI[md5sum] = "099cc99d51f09ea51e58a56e62a46af7"
+SRC_URI[sha256sum] = "9b2ef35618b1c2def1ca7a0a92c2b3029ef7f2080d894b6d1dbb3f313684d3a3"
 
 inherit autotools gettext native pythonnative
 
-- 
1.8.1.4


