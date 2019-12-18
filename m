Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEC097FFF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701745"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:52 +0800
Message-Id: <a15884baf69a8f67ad5adf565926027d3bb593f4.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 4/9] openssl: Whitelist CVE-2019-0190
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:07 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

This is only a problem with older Apache versions.

(From OE-Core rev: 492d43296b15514ec72dfb15f37c6d2ab1fbbae3)

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 9fe80e5fd2..458ae7daf4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -203,3 +203,7 @@ RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
+# Apache in meta-webserver is already recent enough
+CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.21.0


