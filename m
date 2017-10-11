Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19B8E72F96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945794"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:16 +0300
Message-Id: <0996be3bb2f2d2a44e2bb4f10016b190e8ce2986.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/50] sysprof: update to 3.26.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:45 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/sysprof/{sysprof_3.24.1.bb => sysprof_3.26.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/sysprof/{sysprof_3.24.1.bb => sysprof_3.26.1.bb} (88%)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
similarity index 88%
rename from meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
index 79a27be804d..dbce3d74399 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.26.1.bb
@@ -8,14 +8,14 @@ inherit gnomebase gettext systemd upstream-version-is-even
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
+SRC_URI[archive.md5sum] = "6f9f947960ba79bb1269d8ee49b7db78"
+SRC_URI[archive.sha256sum] = "d8b9d5c2246696e4a3776a312731dc7c014fbd33478bb14d5512c6f1f35a3b11"
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-configure-Add-option-to-enable-disable-polkit.patch \
            file://0001-Disable-check-for-polkit-for-UI.patch \
            file://0001-Avoid-building-docs.patch \
           "
-SRC_URI[archive.md5sum] = "2b44ae1d8cd899417294a9c4509d7870"
-SRC_URI[archive.sha256sum] = "054eebe2afb6fe3c06ac8c46bc045c42f675d4fd64e6f16cbc602d5c7ce27bec"
 
 AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
-- 
2.14.1


