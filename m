Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 347B977114
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143975"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:11:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:24 +0200
Message-Id: <cb6a7019536afc2e0ae5bc9dd59f6e81d73b4f2d.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/16] waffle: update to 1.5.2
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb} (91%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.5.1.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
similarity index 91%
rename from meta/recipes-graphics/waffle/waffle_1.5.1.bb
rename to meta/recipes-graphics/waffle/waffle_1.5.2.bb
index 6e77948..f7db1bc 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
 SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
            file://0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch \
           "
-SRC_URI[md5sum] = "c0d802bc3d0aba87c51e423a3a8bdd69"
-SRC_URI[sha256sum] = "cbab0e926515064e818bf089a5af04be33307e5f40d07659fb40d59b2bfe20aa"
+SRC_URI[md5sum] = "c669c91bf2f7e13a5d781c3dbb30fd8c"
+SRC_URI[sha256sum] = "d2c096cf654bf0061323a4b9231a1ef5b749a1e5c7c5bfe067e964219c2a851c"
 
 UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
 
-- 
2.7.0.rc3


