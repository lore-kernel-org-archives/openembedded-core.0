Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 May 2019 06:53:01 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B0ED67E400
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:53:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2019 23:45:57 -0700
X-ExtLoop1: 1
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.188.5])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2019 23:45:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 14:45:51 +0800
Message-Id: <20190523064551.3865-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libva: upgrade 2.4.0 -> 2.4.1
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
X-List-Received-Date: Thu, 23 May 2019 06:53:01 -0000
Content-Transfer-Encoding: 8bit

Changes in this release:

979a351 [common] Add A2RGB10 fourcc definition
22cba79 build: meson: enables va messaging and visibility
b89f6ec va/va_trace: add trace support for RIR(rolling intra refresh).
844b90c va/va_trace: add trace support for ROI(region of interest).

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/libva/{libva_2.4.0.bb => libva_2.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.4.0.bb => libva_2.4.1.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.4.0.bb b/meta/recipes-graphics/libva/libva_2.4.1.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.4.0.bb
rename to meta/recipes-graphics/libva/libva_2.4.1.bb
index ffa1ab8f7b..525721f0ae 100644
--- a/meta/recipes-graphics/libva/libva_2.4.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.4.1.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "cfc69c2a5f526dd1858e098fb8eebfa6"
-SRC_URI[sha256sum] = "99263056c21593a26f2ece812aee6fe60142b49e6cd46cb33c8dddf18fc19391"
+SRC_URI[md5sum] = "5b5ace9de3f07cb7b8f4d19b6979adf0"
+SRC_URI[sha256sum] = "e9e053908591b121793eaa5d8aa37675b4cd3af4b12f1f377dff4767f39cee70"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.20.1


