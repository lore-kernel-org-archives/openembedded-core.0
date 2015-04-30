Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A4F9B72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 11:19:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2015 04:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="687963526"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2015 04:19:11 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 14:18:48 +0300
Message-Id: <d5ec2c5d3534efc9e081757e78878216a8d9c609.1430379963.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430379963.git.jussi.kukkonen@intel.com>
References: <cover.1430379963.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] gnutls: Upgrade 3.3.12 -> 3.3.14
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
X-List-Received-Date: Thu, 30 Apr 2015 11:19:13 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/gnutls/{gnutls_3.3.12.bb => gnutls_3.3.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.3.12.bb => gnutls_3.3.14.bb} (51%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.3.12.bb b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
similarity index 51%
rename from meta/recipes-support/gnutls/gnutls_3.3.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.3.14.bb
index 0d6ec75..89057ba 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
@@ -3,5 +3,5 @@ require gnutls.inc
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://configure.ac-fix-sed-command.patch \
            "
-SRC_URI[md5sum] = "a37b20b4352a5f542367ded904729c90"
-SRC_URI[sha256sum] = "67ab3e92c5d48f3323b897d7c1aa0bb2af6f3a84f5bd9931cda163a7ff32299b"
+SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
+SRC_URI[sha256sum] = "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
-- 
2.1.4


