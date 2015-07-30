Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7C67648C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407414"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:32 +0300
Message-Id: <146f8d7f2da816123d4bfd8f4253938f51727d9d.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/26] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

Google Code is shutting down soon and distcc has moved to github.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index e4b9313..b598c77 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -17,13 +17,14 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/distcc/distcc.git \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
+SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
 
 SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
 SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
-- 
2.1.4


