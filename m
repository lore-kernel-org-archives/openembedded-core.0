Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 166077873D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:32:15 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 08:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; d="scan'208";a="179367918"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2017 08:32:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 18:32:31 +0200
Message-Id: <20171122163233.10292-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
References: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] opkg-utils: fix upstream version check
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
X-List-Received-Date: Wed, 22 Nov 2017 16:32:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
index 646cc8ff9a8..514ba7912a3 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
+UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
+
 
 SRC_URI[md5sum] = "a19e09c79bf1152aac62e8a120d679ff"
 SRC_URI[sha256sum] = "7f4b08912e26a3f4f6f423f3b4e7157a73b1f3a7483fc59b216d1a80b50b0c38"
-- 
2.15.0


