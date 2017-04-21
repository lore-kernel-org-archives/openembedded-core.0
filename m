Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C03F577AA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:27 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889280"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:40:00 +0300
Message-Id: <0b1303a0844ebbcc66e39e74c608063b7f047810.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/11] acpica: fix upstream version check
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:27 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/acpica/acpica_20150515.bb    | 1 +
 meta/recipes-extended/acpica/acpitests_20140828.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-extended/acpica/acpica_20150515.bb b/meta/recipes-extended/acpica/acpica_20150515.bb
index b55f353241d..1326ebd59ec 100644
--- a/meta/recipes-extended/acpica/acpica_20150515.bb
+++ b/meta/recipes-extended/acpica/acpica_20150515.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     "
 SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
 SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
+UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
diff --git a/meta/recipes-extended/acpica/acpitests_20140828.bb b/meta/recipes-extended/acpica/acpitests_20140828.bb
index 409da5ccc41..45ac157e9a7 100644
--- a/meta/recipes-extended/acpica/acpitests_20140828.bb
+++ b/meta/recipes-extended/acpica/acpitests_20140828.bb
@@ -15,6 +15,7 @@ SRC_URI[acpitests.md5sum] = "db9d6fdaa8e3eb101d700ee5ba4938ed"
 SRC_URI[acpitests.sha256sum] = "e576c74bf1bf1c9f7348bf9419e05c8acfece7105abcdc052e66670c7af2cf00"
 SRC_URI[acpica.md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
 SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
+UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-- 
2.11.0


