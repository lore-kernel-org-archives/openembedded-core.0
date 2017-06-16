Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 028A27848D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279545"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:01 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:35 +0300
Message-Id: <4709aecee3ebdb16919120b85de83fd6eb8d1d88.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/32] speex: fix upstream version check
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:00 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/speex/speex_1.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
index fc020a2faa5..cc69bb50672 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
 DEPENDS = "libogg speexdsp"
 
 SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
+UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
 SRC_URI[sha256sum] = "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
-- 
2.11.0


