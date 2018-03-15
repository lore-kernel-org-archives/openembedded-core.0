Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10C6178842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:46:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 03:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,310,1517904000"; d="scan'208";a="24270059"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2018 03:46:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 12:39:47 +0200
Message-Id: <20180315103947.4303-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180315103947.4303-1-alexander.kanavin@linux.intel.com>
References: <20180315103947.4303-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] libpng: fix upstream version check
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

Sourceforge for some reason claims an older version is 'the latest'.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.34.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
index 88ea586bdbc..e52d032289d 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.34.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "2f1e960d92ce3b3abd03d06dfec9637dfbd22febf107a536b44f7a47c6
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
+UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
+
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
2.16.1


