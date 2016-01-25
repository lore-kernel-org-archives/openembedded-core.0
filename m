Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 89064770EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143961"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:11:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:22 +0200
Message-Id: <b952805d5873e8331c7e8b907a7cf753a5cd08fb.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/16] libsoup-2.4: update to 2.52.2
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:47 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsoup/{libsoup-2.4_2.52.1.bb => libsoup-2.4_2.52.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.52.1.bb => libsoup-2.4_2.52.2.bb} (86%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
similarity index 86%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index 5e66197..b342bbd 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -19,8 +19,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "b80f11674724ab38f96426875bc0e2e5"
-SRC_URI[sha256sum] = "0e19bca047ad50b28e8ed7663840f9e45a94909148822ca44dcb3e8cafb5cc48"
+SRC_URI[md5sum] = "e4757d09012ed93822b1ee41435fec24"
+SRC_URI[sha256sum] = "db55628b5c7d952945bb71b236469057c8dfb8dea0c271513579c6273c2093dc"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.7.0.rc3


