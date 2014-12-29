Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DAE6F72671
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2014 09:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,659,1413270000"; d="scan'208";a="654543753"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2014 09:23:35 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:08 -0600
Message-Id: <e2eb46e99e81dc84581ef4f92fa4e3dd3a1cf6f6.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
References: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1419873753.git.anibal.limon@linux.intel.com>
References: <cover.1419873753.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] acpid: Upgrade to 2.0.23
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
X-List-Received-Date: Mon, 29 Dec 2014 17:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.22.bb => acpid_2.0.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.22.bb => acpid_2.0.23.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.22.bb b/meta/recipes-bsp/acpid/acpid_2.0.23.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.22.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.23.bb
index 603fc2b..a5317a4 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.22.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.23.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "c8ba756030d1b21fc973ec3d640f27f1"
-SRC_URI[sha256sum] = "3d11454f4283c8f771d8dbd5eb6b5f2bbd9d94d9f77d68bab89e35d98b67ab31"
+SRC_URI[md5sum] = "d7bcdcdefcd53b03730e50ba842554ea"
+SRC_URI[sha256sum] = "4396aaec13510c3a1faa941a15a4b5335b6ae4fbec8438b9249b88c3b66187ee"
-- 
1.9.1


