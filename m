Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B1CD374895
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599858"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:20 +0300
Message-Id: <20180404111321.10824-21-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/22] libsecret: update to 0.18.6
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsecret/{libsecret_0.18.5.bb => libsecret_0.18.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.5.bb => libsecret_0.18.6.bb} (80%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
similarity index 80%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
index 2b917ec517b..cdc41e762a8 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "2d688825921313da8731313b0a7f394c"
-SRC_URI[archive.sha256sum] = "9ce7bd8dd5831f2786c935d82638ac428fa085057cc6780aba0e39375887ccb3"
+SRC_URI[archive.md5sum] = "c6cf132a56bd346fbf49a43abb02e5c2"
+SRC_URI[archive.sha256sum] = "5efbc890ba41a323ffe0599cd260fd12bd8eb62a04aa1bd1b2762575d253d66f"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET = "arm"
-- 
2.16.1


