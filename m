Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54F62766B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2015 03:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726360"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:28 +0300
Message-Id: <0c4f2d662d75cd9a91d77fdd7a9cdd68c29a6945.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/22] libsecret: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:07 -0000

libsecret is a dependency of webkit

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
new file mode 100644
index 0000000..cebc83b
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
+
+inherit gnomebase gtk-doc
+
+DEPENDS = "glib-2.0 libgcrypt"
+
+EXTRA_OECONF += "--disable-manpages"
+
+SRC_URI[archive.md5sum] = "23cdf8267d11a26f88f0dbec1e2022ad"
+SRC_URI[archive.sha256sum] = "12fd288b012e1b2b1b54d586cd4c6507885715534644b4534b7ef7d7079ba443"
-- 
2.1.4


