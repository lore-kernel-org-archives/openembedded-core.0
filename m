Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B08077074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143914"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:52 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:15 +0200
Message-Id: <70d451eb80617f0e9ffc730e2de05536d65462a8.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/16] libsecret: update to 0.18.4
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsecret/{libsecret_0.18.3.bb => libsecret_0.18.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.3.bb => libsecret_0.18.4.bb} (71%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.3.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
similarity index 71%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.3.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
index 5058427..534caad 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.3.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
@@ -8,8 +8,8 @@ DEPENDS = "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
-SRC_URI[archive.md5sum] = "a21605644a64883ab685aec50d63253e"
-SRC_URI[archive.sha256sum] = "f2bf1d0c5ab4640664f3e3c7ef6b086c180e50ff415720b5e22f96750dbf84c9"
+SRC_URI[archive.md5sum] = "5190da1ee686437046bc10068f120d1d"
+SRC_URI[archive.sha256sum] = "0f29b51698198e6999c91f4adce3119c8c457f546b133a85baea5ea9010a19ed"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET = "arm"
-- 
2.7.0.rc3


