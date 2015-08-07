Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E7175767B1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724753"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:42 +0300
Message-Id: <4a887bbeef74190b705f505338811dc71de37e70.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:49 -0000

Google Code is shutting down soon and distcc has moved to github.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index e4b9313..f8879c8 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -17,16 +17,15 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/distcc/distcc.git \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-
-SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
-SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
+SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
-- 
2.1.4


