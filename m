Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0D677172
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917666"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:42 +0200
Message-Id: <5c670d1c9cafba52baa25a5527051438ac307344.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/29] libsoup-2.4: enable gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
index 044db31..a409da3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "1e01365ac4af3817187ea847f9d3588c27eee01fc519a5a7cb212bb78b
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig gobject-introspection
 
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
-- 
2.1.4


