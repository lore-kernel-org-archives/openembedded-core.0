Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ECD58726AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2014 09:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,659,1413270000"; d="scan'208";a="654543763"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2014 09:23:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:10 -0600
Message-Id: <bcd9695b1024311a59acb2b79556f193e20c38e4.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
References: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1419873753.git.anibal.limon@linux.intel.com>
References: <cover.1419873753.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] mc: Upgrade to 4.8.13
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
 meta/recipes-extended/mc/{mc_4.8.12.bb => mc_4.8.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.12.bb => mc_4.8.13.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.12.bb b/meta/recipes-extended/mc/mc_4.8.13.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.12.bb
rename to meta/recipes-extended/mc/mc_4.8.13.bb
index bc462e3..ef5b1a2 100644
--- a/meta/recipes-extended/mc/mc_4.8.12.bb
+++ b/meta/recipes-extended/mc/mc_4.8.13.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://mc-CTRL.patch \
            "
 
-SRC_URI[md5sum] = "a64c426364bfaee56b628f6c0738aade"
-SRC_URI[sha256sum] = "1054fcc27a488771cbe5b85d7c10135fa1cd1b7682a19930d44b51a023e39396"
+SRC_URI[md5sum] = "12a521a50da6a86852177591b9623d5e"
+SRC_URI[sha256sum] = "22e1b809edba957eb9a392138bf87fea3877f7ca0b7463b7cc2eb94afa6f3e49"
 
 inherit autotools gettext pkgconfig
 
-- 
1.9.1


