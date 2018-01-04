Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A15EC78544
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 12:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="164250098"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2018 12:24:09 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:24:02 -0800
Message-Id: <1515097444-25092-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
References: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 3/5] attr-doc: improve reproducibility
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
X-List-Received-Date: Thu, 04 Jan 2018 20:24:08 -0000

Use gzip compression without timestamps in the metadata.
(Use gzip -n).

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index e6f4c72..1339ecc 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -17,7 +17,7 @@ EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('US
 EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
 
 do_install () {
-	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
+	oe_runmake install install-lib install-dev DIST_ROOT="${D}" ZIP="gzip -n"
 }
 
 do_install_append_class-native () {
-- 
2.7.4


