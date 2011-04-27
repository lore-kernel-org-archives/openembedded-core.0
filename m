Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEg-0005Qy-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550411"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:56 -0700
Message-Id: <a7ba0a46697308f7cec18fd2bf6d53bd42343cb4.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 14:58:04 -0700
Date: Wed, 27 Apr 2011  0:29:56 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 35/52] libsdl: add SRC_URI Checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:32:34 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libsdl/libsdl-nativesdk_1.2.11.bb              |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
index 2ef14b8..e64a62e 100644
--- a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
@@ -14,6 +14,9 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://kernel-asm-page.patch;patch=1 "
 S = "${WORKDIR}/SDL-${PV}"
 
+SRC_URI[md5sum] = "418b42956b7cd103bfab1b9077ccc149"
+SRC_URI[sha256sum] = "6985823287b224b57390b1c1b6cbc54cc9a7d7757fbf9934ed20754b4cd23730"
+
 inherit autotools binconfig pkgconfig nativesdk
 
 EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-threads --enable-timers --enable-endian \
-- 
1.7.1.1



