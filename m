Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 35B497894F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:27:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2018 00:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,339,1517904000"; d="scan'208";a="39277462"
Received: from anmitta2-mobl1.png.intel.com ([10.221.17.154])
	by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2018 00:27:26 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 15:27:18 +0800
Message-Id: <1521617238-23436-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] librepo: disable building of tests and docs
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
X-List-Received-Date: Wed, 21 Mar 2018 07:27:26 -0000

Also remove libcheck dependency which was required only for tests.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/librepo/librepo_1.8.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/librepo/librepo_1.8.1.bb b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
index 0324104..4569885 100644
--- a/meta/recipes-devtools/librepo/librepo_1.8.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.8.1.bb
@@ -11,11 +11,11 @@ SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "curl expat glib-2.0 openssl attr libcheck gpgme"
+DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
 
 inherit cmake distutils3-base pkgconfig
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


