Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 48C7B73152
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302230"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:33 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:14 +0200
Message-Id: <8fb6639bb1924624d2e8c123594bdc44396c3b65.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/24] kbd: update to 2.0.4
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/kbd/{kbd_2.0.3.bb => kbd_2.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/kbd/{kbd_2.0.3.bb => kbd_2.0.4.bb} (92%)

diff --git a/meta/recipes-core/kbd/kbd_2.0.3.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
similarity index 92%
rename from meta/recipes-core/kbd/kbd_2.0.3.bb
rename to meta/recipes-core/kbd/kbd_2.0.4.bb
index 54d16835fce..acecfd049a6 100644
--- a/meta/recipes-core/kbd/kbd_2.0.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -15,8 +15,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
           "
 
-SRC_URI[md5sum] = "231b46e7142eb41ea3ae06d2ded3c208"
-SRC_URI[sha256sum] = "7a899de1c0eb75f3aea737095a736f2375e1cbfbe693fc14a3fe0bfb4649fb5e"
+SRC_URI[md5sum] = "c1635a5a83b63aca7f97a3eab39ebaa6"
+SRC_URI[sha256sum] = "5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
-- 
2.11.0


