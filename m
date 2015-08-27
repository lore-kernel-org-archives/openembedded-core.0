Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1B276DA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484365"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:19 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:06:02 +0300
Message-Id: <b1d0f3c6e1a55d88223456b6a57530fc0391aca8.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/6] gnutls: Upgrade 3.3.14 -> 3.3.17.1
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:33 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/gnutls/{gnutls_3.3.14.bb => gnutls_3.3.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.3.14.bb => gnutls_3.3.17.1.bb} (59%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb b/meta/recipes-support/gnutls/gnutls_3.3.17.1.bb
similarity index 59%
rename from meta/recipes-support/gnutls/gnutls_3.3.14.bb
rename to meta/recipes-support/gnutls/gnutls_3.3.17.1.bb
index f41d183..0185797 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.17.1.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
-SRC_URI[sha256sum] = "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
+SRC_URI[md5sum] = "8d01c7e7f2cbc5871fdca832d2260b6b"
+SRC_URI[sha256sum] = "b40f158030a92f450a07b20300a3996710ca19800848d9f6fd62493170c5bbb4"
-- 
2.1.4


