Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A6E6F6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020370"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:52 +0300
Message-Id: <f9a009736896fa5198b265e592a20a5c83b1d00f.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/6] libsecret: upgrade to 0.18.5
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
X-List-Received-Date: Thu, 26 May 2016 14:01:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsecret/{libsecret_0.18.4.bb => libsecret_0.18.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.4.bb => libsecret_0.18.5.bb} (84%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
similarity index 84%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
index beaaba0..e4d316b 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
-SRC_URI[archive.md5sum] = "5190da1ee686437046bc10068f120d1d"
-SRC_URI[archive.sha256sum] = "0f29b51698198e6999c91f4adce3119c8c457f546b133a85baea5ea9010a19ed"
+SRC_URI[archive.md5sum] = "2d688825921313da8731313b0a7f394c"
+SRC_URI[archive.sha256sum] = "9ce7bd8dd5831f2786c935d82638ac428fa085057cc6780aba0e39375887ccb3"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET = "arm"
-- 
2.8.1


