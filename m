Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E6FB27267A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2014 09:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,659,1413270000"; d="scan'208";a="654543759"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2014 09:23:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:09 -0600
Message-Id: <714f70fb5bb7dd6ff7a464f1223765a92cb52eaa.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
References: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1419873753.git.anibal.limon@linux.intel.com>
References: <cover.1419873753.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] lsof: Upgrade to 4.88
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
 meta/recipes-extended/lsof/{lsof_4.87.bb => lsof_4.88.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.87.bb => lsof_4.88.bb} (91%)

diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.88.bb
similarity index 91%
rename from meta/recipes-extended/lsof/lsof_4.87.bb
rename to meta/recipes-extended/lsof/lsof_4.88.bb
index e7a1eb2..a96b06e 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.88.bb
@@ -6,8 +6,8 @@ LICENSE = "BSD"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
-SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
+SRC_URI[md5sum] = "1b29c10db4aa88afcaeeaabeef6790db"
+SRC_URI[sha256sum] = "fe6f9b0e26b779ccd0ea5a0b6327c2b5c38d207a6db16f61ac01bd6c44e5c99b"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
-- 
1.9.1


