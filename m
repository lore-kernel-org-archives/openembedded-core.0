Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 88F43731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464793"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:55 +0200
Message-Id: <8f4cbcb2c2622391da0152be896d42881edeb935.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
References: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] libsecret: update to 0.18.3
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
X-List-Received-Date: Fri, 18 Dec 2015 15:43:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsecret/{libsecret_0.18.2.bb => libsecret_0.18.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.2.bb => libsecret_0.18.3.bb} (71%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.3.bb
similarity index 71%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.3.bb
index a1dcc78..5058427 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.3.bb
@@ -8,8 +8,8 @@ DEPENDS = "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
-SRC_URI[archive.md5sum] = "23cdf8267d11a26f88f0dbec1e2022ad"
-SRC_URI[archive.sha256sum] = "12fd288b012e1b2b1b54d586cd4c6507885715534644b4534b7ef7d7079ba443"
+SRC_URI[archive.md5sum] = "a21605644a64883ab685aec50d63253e"
+SRC_URI[archive.sha256sum] = "f2bf1d0c5ab4640664f3e3c7ef6b086c180e50ff415720b5e22f96750dbf84c9"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET = "arm"
-- 
2.6.2


